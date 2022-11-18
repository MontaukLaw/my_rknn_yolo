/*-------------------------------------------
                Includes
-------------------------------------------*/
#include <dlfcn.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <string>
#include <sys/time.h>
#include <vector>

#define _BASETSD_H

#define STB_IMAGE_IMPLEMENTATION
#include "stb/stb_image.h"
#define STB_IMAGE_RESIZE_IMPLEMENTATION
#include <stb/stb_image_resize.h>
#define STB_IMAGE_WRITE_IMPLEMENTATION
#include "stb/stb_image_write.h"

#undef cimg_display
#define cimg_display 0
#undef cimg_use_jpeg
#define cimg_use_jpeg 1
#undef cimg_use_png
#define cimg_use_png 1
#include "CImg/CImg.h"

#include "drm_func.h"
#include "postprocess.h"
#include "rga_func.h"
#include "rknn_api.h"

#define PERF_WITH_POST 1
#define COCO_IMG_NUMBER 5000
#define YOLO_INPUT_DATASIZE 1228800 // 640*640*3
using namespace cimg_library;
/*-------------------------------------------
                  Functions
-------------------------------------------*/
// Print RKNN tensor info like shape, type, quantization, etc.
static void printRKNNTensor(rknn_tensor_attr *attr) {
  printf("index=%d name=%s n_dims=%d dims=[%d %d %d %d] n_elems=%d size=%d "
         "fmt=%d type=%d qnt_type=%d fl=%d zp=%d scale=%f\n",
         attr->index, attr->name, attr->n_dims, attr->dims[3], attr->dims[2],
         attr->dims[1], attr->dims[0], attr->n_elems, attr->size, 0, attr->type,
         attr->qnt_type, attr->fl, attr->zp, attr->scale);
}
double __get_us(struct timeval t) { return (t.tv_sec * 1000000 + t.tv_usec); }

// Load data from file, just like inputstream in java
static unsigned char *load_data(FILE *fp, size_t ofst, size_t sz) {

  unsigned char *data;
  int ret;

  data = NULL;

  if (NULL == fp) {
    return NULL;
  }

  ret = fseek(fp, ofst, SEEK_SET);
  if (ret != 0) {
    printf("blob seek failure.\n");
    return NULL;
  }

  data = (unsigned char *)malloc(sz);
  if (data == NULL) {
    printf("buffer malloc failure.\n");
    return NULL;
  }
  ret = fread(data, 1, sz, fp);
  return data;
}

// Load image from file by file name
static unsigned char *load_model(const char *filename, int *model_size) {

  FILE *fp;
  unsigned char *data;

  // Read model file
  fp = fopen(filename, "rb");
  if (NULL == fp) {
    printf("Open file %s failed.\n", filename);
    return NULL;
  }

  fseek(fp, 0, SEEK_END);
  int size = ftell(fp);

  data = load_data(fp, 0, size);

  fclose(fp);

  *model_size = size;
  return data;
}

static int saveFloat(const char *file_name, float *output, int element_size) {
  FILE *fp;
  fp = fopen(file_name, "w");
  for (int i = 0; i < element_size; i++) {
    fprintf(fp, "%.6f\n", output[i]);
  }
  fclose(fp);
  return 0;
}

static unsigned char *load_image_optimized(const char *image_path,
                                           int *org_height, int *org_width,
                                           int *org_ch,
                                           rknn_tensor_attr *input_attr) {
  struct timeval start_time, stop_time;
  memset(&start_time, 0, sizeof(start_time));
  memset(&stop_time, 0, sizeof(stop_time));

  gettimeofday(&start_time, NULL);
  int req_height = 0;
  int req_width = 0;
  int req_channel = 0;

  req_height = input_attr->dims[1];
  req_width = input_attr->dims[0];
  req_channel = input_attr->dims[2];

  // printf("w=%d,h=%d,c=%d, fmt=%d\n", req_width, req_height, req_channel,
  // input_attr->fmt);

  int height = 0;
  int width = 0;
  int channel = 0;

  // Use image lib to load image as char*
  unsigned char *image_data =
      stbi_load(image_path, &width, &height, &channel, req_channel);
  if (image_data == NULL) {
    printf("load image-%s failed!\n", image_path);
    return NULL;
  }

  *org_width = width;
  *org_height = height;
  *org_ch = channel;

  gettimeofday(&stop_time, NULL);
  printf("load_image_optimized %f ms\n",
         (__get_us(stop_time) - __get_us(start_time)) / 1000);

  // image_data is a char * like java outputstream, but it's RGB format
  return image_data;
}

// Load image from file by file name, and trans to NCHW format as model input
// attribute is NCHW
static unsigned char *load_image(const char *image_path, int *org_height,
                                 int *org_width, int *org_ch,
                                 rknn_tensor_attr *input_attr) {
  int req_height = 0;
  int req_width = 0;
  int req_channel = 0;

  switch (input_attr->fmt) {
  case RKNN_TENSOR_NHWC:

    req_height = input_attr->dims[2];
    req_width = input_attr->dims[1];
    req_channel = input_attr->dims[0];
    break;
  case RKNN_TENSOR_NCHW:
    // This way
    req_height = input_attr->dims[1];
    req_width = input_attr->dims[0];
    req_channel = input_attr->dims[2];
    break;
  default:
    printf("meet unsupported layout\n");
    return NULL;
  }

  // printf("w=%d,h=%d,c=%d, fmt=%d\n", req_width, req_height, req_channel,
  // input_attr->fmt);

  int height = 0;
  int width = 0;
  int channel = 0;

  // Use image lib to load image as char*
  unsigned char *image_data =
      stbi_load(image_path, &width, &height, &channel, req_channel);
  if (image_data == NULL) {
    printf("load image-%s failed!\n", image_path);
    return NULL;
  }

  // If it's a gray pic, only 1 channel, extend to RGB
  if (channel == 1) {
    printf("image is grey, convert to RGB");
    void *rgb_data = malloc(width * height * 3);
    for (int i = 0; i < height; i++) {
      for (int j = 0; j < width; j++) {
        int offset = (i * width + j) * 3;
        ((unsigned char *)rgb_data)[offset] =
            ((unsigned char *)image_data)[offset];
        ((unsigned char *)rgb_data)[offset + 1] =
            ((unsigned char *)image_data)[offset];
        ((unsigned char *)rgb_data)[offset + 2] =
            ((unsigned char *)image_data)[offset];
      }
    }
    free(image_data);
    image_data = (unsigned char *)rgb_data;
    channel = 3;
  }

  // If image width size is not stride 4, resize it
  if (width % 4 != 0) {
    int new_width = width + (4 - width % 4);
    printf("%d is not pixel align, resize to %d, this will make the result "
           "shift slightly\n",
           width, new_width);
    void *resize_data = malloc(new_width * height * channel);
    stbir_resize_uint8(image_data, width, height, 0,
                       (unsigned char *)resize_data, new_width, height, 0,
                       channel);
    free(image_data);
    image_data = (unsigned char *)resize_data;
    *org_width = new_width;
  } else {
    *org_width = width;
  }

  *org_height = height;
  *org_ch = channel;

  // image_data is a char * like java outputstream, but it's RGB format
  return image_data;
}

void lib_test(void) { printf("here we are\n"); }

int input_img_height = 0;
int input_img_width = 0;
rga_context rga_ctx;
drm_context drm_ctx;
rknn_context ctx;
size_t actual_size = 0;
const float nms_threshold = 0.65;
const float conf_threshold = 0.6; // As request change to 0.8 0.2;
unsigned int handle;
int input_channel = 3;
int model_input_width = 0;
int model_input_height = 0;
rknn_input inputs[1];
rknn_input_output_num io_num = {0, 0};
rknn_output outputs[3];
rknn_tensor_attr output_attrs[3];
unsigned char *model_data = nullptr;
void *resize_buf = nullptr;
rknn_tensor_attr input_attrs[1];
int drm_fd = -1;
int img_channel = 0;
void *drm_buf = NULL;
int buf_fd = -1; // converted from buffer handle
char *image_name = (char *)"/mnt/tmp/input.jpg";
unsigned char *input_data = NULL;

int model_init(char *model_name, int inputImgHeight, int inputImgWidth) {

  printf("input_img_height=%d, input_img_width=%d\n", input_img_height,
         input_img_width);
  input_img_height = inputImgHeight;
  input_img_width = inputImgWidth;

  int status = 0;

  // converted from buffer handle

  int ret;

  memset(&rga_ctx, 0, sizeof(rga_context));
  memset(&drm_ctx, 0, sizeof(drm_context));

  printf("Loading model...\n");

  int model_data_size = 0;
  model_data = load_model(model_name, &model_data_size);
  ret = rknn_init(&ctx, model_data, model_data_size, 0);
  if (ret < 0) {
    printf("rknn_init error ret=%d\n", ret);
    return -1;
  }

  rknn_sdk_version version;
  ret = rknn_query(ctx, RKNN_QUERY_SDK_VERSION, &version,
                   sizeof(rknn_sdk_version));
  if (ret < 0) {
    printf("rknn_init error ret=%d\n", ret);
    return -1;
  }
  printf("sdk version: %s driver version: %s\n", version.api_version,
         version.drv_version);

  ret = rknn_query(ctx, RKNN_QUERY_IN_OUT_NUM, &io_num, sizeof(io_num));
  if (ret < 0) {
    printf("rknn_init error ret=%d\n", ret);
    return -1;
  }

  printf("model input num: %d, output num: %d\n", io_num.n_input,
         io_num.n_output);

  memset(input_attrs, 0, sizeof(input_attrs));

  for (int i = 0; i < io_num.n_input; i++) {
    input_attrs[i].index = i;
    ret = rknn_query(ctx, RKNN_QUERY_INPUT_ATTR, &(input_attrs[i]),
                     sizeof(rknn_tensor_attr));
    if (ret < 0) {
      printf("rknn_init error ret=%d\n", ret);
      return -1;
    }
    printRKNNTensor(&(input_attrs[i]));
  }

  memset(output_attrs, 0, sizeof(output_attrs));

  for (int i = 0; i < io_num.n_output; i++) {
    output_attrs[i].index = i;
    ret = rknn_query(ctx, RKNN_QUERY_OUTPUT_ATTR, &(output_attrs[i]),
                     sizeof(rknn_tensor_attr));
    printRKNNTensor(&(output_attrs[i]));
  }

  if (input_attrs[0].fmt == RKNN_TENSOR_NCHW) {
    printf("model is NCHW input fmt\n");
    model_input_width = input_attrs[0].dims[0];
    model_input_height = input_attrs[0].dims[1];
    // So the width and height is 640, 640
  } else {
    printf("model is NHWC input fmt\n");
    model_input_width = input_attrs[0].dims[1];
    model_input_height = input_attrs[0].dims[2];
  }

  printf("model input height=%d, width=%d, channel=%d\n", model_input_height,
         model_input_width, input_channel);

  memset(inputs, 0, sizeof(inputs));
  inputs[0].index = 0;
  inputs[0].type = RKNN_TENSOR_UINT8;
  inputs[0].size = model_input_width * model_input_height * input_channel;
  inputs[0].fmt = RKNN_TENSOR_NHWC; // Default format is NHWC
  inputs[0].pass_through = 0;

  memset(outputs, 0, sizeof(outputs));
  for (int i = 0; i < io_num.n_output; i++) {
    outputs[i].want_float = 0;
  }

#if 0
    resize_buf = malloc(input_img_height * input_img_width * input_channel);
    if (resize_buf == nullptr) {
        printf("malloc resize_buf failed\n");
        return -1;
    }
#endif

  // DRM alloc buffer
  drm_fd = drm_init(&drm_ctx);

  // drm_buf_alloc
  drm_buf = drm_buf_alloc(&drm_ctx, drm_fd, 640, 640, 3 * 8, &buf_fd, &handle,
                          &actual_size);
  printf("drm_buf=%p, buf_fd=%d, handle=%d, actual_size=%d\n", drm_buf, buf_fd,
         handle, actual_size);
  return 0;
}

int detect_by_buf(void *data) {
  int ret = 0;
  struct timeval start_time, stop_time;
  gettimeofday(&start_time, NULL);

  // memcpy(drm_buf, data, YOLO_INPUT_DATASIZE);
  // printf("Data been copied, size is %d\n", data_size);

  inputs[0].buf = data; // drm_buf;
  rknn_inputs_set(ctx, io_num.n_input, inputs);
  ret = rknn_run(ctx, NULL);
  ret = rknn_outputs_get(ctx, io_num.n_output, outputs, NULL);

  /* Post process */
  detect_result_group_t detect_result_group;
  std::vector<float> out_scales;
  std::vector<uint8_t> out_zps;

  for (int i = 0; i < io_num.n_output; ++i) {
    out_scales.push_back(output_attrs[i].scale);
    out_zps.push_back(output_attrs[i].zp);
  }

  post_process_u8((uint8_t *)outputs[0].buf, (uint8_t *)outputs[1].buf,
                  (uint8_t *)outputs[2].buf, model_input_height,
                  model_input_width, 0, 0, 1.0f, conf_threshold, nms_threshold,
                  out_zps, out_scales, &detect_result_group);

  bool ifFoundPerson = false;
  if (detect_result_group.count > 0) {
    for (int i = 0; i < detect_result_group.count; i++) {
      detect_result_t *det_result = &(detect_result_group.results[i]);
      printf("\n");
      printf("----------->>>>>>>> found target label @: %s\n",
             det_result->name);
      printf("(%d %d %d %d) %f\n", det_result->box.left, det_result->box.top,
             det_result->box.right, det_result->box.bottom, det_result->prop);
      if (det_result->class_index == 0) {
        ifFoundPerson = true;
      }
    }
  }

  gettimeofday(&stop_time, NULL);

  printf("whole detect used %f ms\n",
         (__get_us(stop_time) - __get_us(start_time)) / 1000);

  if (ifFoundPerson) {
    return 1;
  }
  return 0;
}

#ifndef __RKNN_YOLO_H_
#define __RKNN_YOLO_H_

#include <cstdio>
#include <cstdlib>
#include <cstdarg>
#include <cstring>
#include <cmath>
#include <cfloat>
#include <climits>
#include <ctime>
#include <exception>
#include <algorithm>

int model_init(char* model_name, int inputImgHeight, int inputImgWidth);

int detect_by_buf(void* data);

#endif

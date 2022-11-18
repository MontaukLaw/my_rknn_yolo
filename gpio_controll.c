#include <fcntl.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>

#define SYSFS_GPIO_EXPORT "/sys/class/gpio/export"
#define SYSFS_GPIO_CUSTM_PIN_VAL "27"
#define SYSFS_GPIO_CUSTM_PIN_DIR "/sys/class/gpio/gpio27/direction"
#define SYSFS_GPIO_CUSTM_PIN_DIR_VAL "OUT"
#define SYSFS_GPIO_CUSTM_VAL "/sys/class/gpio/gpio27/value"
#define SYSFS_GPIO_CUSTM_VAL_H "1"
#define SYSFS_GPIO_CUSTM_VAL_L "0"

#define MY_GPIO 27

void gpio_control(int value) {
  int fd;
  fd = open(SYSFS_GPIO_EXPORT, O_WRONLY);
  if (fd == -1) {
    printf("ERR: pin open error \n");
    return;
  }

  // try to export 80 gpio pin
  write(fd, SYSFS_GPIO_CUSTM_PIN_VAL, sizeof(SYSFS_GPIO_CUSTM_PIN_VAL));
  close(fd);

  // set pin direction
  fd = open(SYSFS_GPIO_CUSTM_PIN_DIR, O_WRONLY);
  if (fd == -1) {
    printf("ERR: pin direction open error \n");
    return;
  }
  write(fd, SYSFS_GPIO_CUSTM_PIN_DIR_VAL, sizeof(SYSFS_GPIO_CUSTM_PIN_DIR_VAL));
  close(fd);

  fd = open(SYSFS_GPIO_CUSTM_VAL, O_WRONLY);
  if (fd == -1) {
    printf("ERR: value fd open error \n");
    return;
  }

  if (value == 0) {
    // printf("LOW\n");
    write(fd, SYSFS_GPIO_CUSTM_VAL_L, sizeof(SYSFS_GPIO_CUSTM_VAL_L));
  } else {
    printf("HIGH\n");
    write(fd, SYSFS_GPIO_CUSTM_VAL_H, sizeof(SYSFS_GPIO_CUSTM_VAL_H));
  }

  close(fd);
}
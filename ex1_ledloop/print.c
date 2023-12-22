#define BITWIDTH 4
#include <stdio.h>
#include <unistd.h>
#include "svdpi.h"
extern "C"
void print(int a) {
    unsigned  b = (unsigned)a;
    printf("\r");  //移至行首
    printf("\033[K");  //清除光标后字符
    for (int i = 0; i < BITWIDTH; i++){
      if (b&1)
        printf("* ");
      else
        printf("  ");
      b = b >> 1;
    }
    fflush(stdout);
}

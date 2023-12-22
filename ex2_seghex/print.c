#define DIGIT_NUM 4
#include <stdio.h>
#include <stdbool.h>
#include <unistd.h>
#include "svdpi.h"
#include "print.h"

static inline void print(unsigned char data,int bit,char c) {
  if(data&(1<<bit)) putchar(c);
  else putchar(' ');
}

static inline void printu(unsigned char data, int b1, int b2, int b3)
{
  print(data,b1,'|') ;
  print(data,b2,'_') ;
  print(data,b3,'|') ;

}

void printd(unsigned char data){
  printf("\x1b[C");
  print(data,0,'_');
  printf("\x1b[B\x1b[2D");
  printu(data,5,6,1);
  printf("\x1b[B\x1b[3D");
  printu(data,4,3,2);
  print(data,7,'.');
}

void print(char sg, char sel) {
  unsigned char  seg = (unsigned char ) sg;
  static int init = 0;
  if (init == 0) {
    printf("\n\n\n");
    init = 1;
    printf("\x1b[?25l");
  }
  unsigned char c = sel;
  for(int i = 7; i >= 0; i--)
    if(sel&(1<<i)) {
      printf("\x1b[2A\x1b[%dG",(DIGIT_NUM-i-1)*4+1);
      printd(seg);
    }
  fflush(stdout);
}

/*  _
   |_|
   |_|. */

#include <8051.h>
#include "types.h"

#ifndef UTILS_H
#define UTILS_H

uchar lfsr(uchar x);
uchar xorshift(uchar x);
unsigned char random();
#endif
#include <8051.h>

#ifndef UTILS_H
#define UTILS_H

unsigned char lfsr(unsigned char x);
unsigned char xorshift(unsigned char x);
unsigned char random();
#endif
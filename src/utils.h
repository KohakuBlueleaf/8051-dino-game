#include <8051.h>
#include "types.h"

#ifndef UTILS_H
#define UTILS_H

uchar lfsr(uchar x);
uchar xorshift(uchar x);
uchar random(void);


// Debug utils, which can indicate the line of code.
// #define DEBUG
#ifdef DEBUG
    #define set_state(s, ss) {\
        state = s;\
        sub_state = ss;\
    }
#else
    #define set_state(s, ss) {}
#endif

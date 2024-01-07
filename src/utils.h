#include <8051.h>
#include "types.h"

#ifndef __UTILS_H__
#define __UTILS_H__

uchar lfsr(uchar x);
uchar xorshift(uchar x);
uchar random(void);


// Debug utils, which can indicate the line of code.
#define DEBUG
#ifdef DEBUG
    #define set_state(s, ss) {\
        state = s;\
        sub_state = ss;\
    }
#else
    #define set_state(s, ss) {}
#endif

#endif
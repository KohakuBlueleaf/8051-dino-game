#include<8051.h>
#include "types.h"
#include "static_globals.h"
#include "utils.h"



uchar lfsr(uchar x) {
    // XOR the bits at the tap positions (8, 6, 5, 4), using 0-indexing
    uchar new_bit = ((x >> 7) ^ (x >> 5) ^ (x >> 4) ^ (x >> 3)) & 1;
    // Shift and add the new bit
    return (x >> 1) | (new_bit << 7);
}


uchar xorshift(uchar x) {
    x |= x == 0;   // if x == 0, set x = 1 instead
    x ^= (x & 0x07) << 5;
    x ^= x >> 3;
    x ^= (x & 0x03) << 6;
    return x & 0xff;
}


uchar random(void) {
    random_number = xorshift(random_number);
    return random_number;
}
#include <8051.h>
#include "types.h"
#include "preemptive.h"
#include "dino.h"


// Define global variables for renderer and controler
__data __at(0x19) char row;
__data __at(0x1A) char col;
__data __at(0x1B) uchar res;
__data __at(0x1C) char key_char; // for game control to move the dinosaur
__data __at(0x1D) char last_key;
__data __at(0x1E) bool lcd_ready; 
__data __at(0x1F) bool rendered;

// Define global variables and game state
__data __at(0x21) char game_state; // 3 NOT START, 4 start, 5 over
__data __at(0x22) uchar score;
__data __at(0x23) char dino_position; // 0 upper, 1 lower
__data __at(0x24) char difficulty;
__data __at(0x25) char state;// state and sub_state are for debugging
__data __at(0x26) char sub_state;
__data __at(0x27) uchar random_number;
// Each bit represents whether there is a cactus at that position
// Dividing by 8 as there are 8 bits in a byte
__data __at(0x28) uchar map[MAP_HEIGHT][MAP_WIDTH / 8]; 
__data __at(0x70) char score_string[16];


// Define global variables for preemptive
// #define MAXTHREADS 4, defined in .h file
__data __at (0x30) char savedSP[MAXTHREADS];
__data __at (0x34) ThreadID curThread;
__data __at (0x35) char mask;
__data __at (0x36) ThreadID newThread;
__data __at (0x37) char i;
__data __at (0x38) char tmp;
__data __at (0x39) char tmp2;
__data __at (0x3A) char isAlive[MAXTHREADS];
__data __at (0x3E) uchar cnt0;
__data __at (0x3F) uchar stay;
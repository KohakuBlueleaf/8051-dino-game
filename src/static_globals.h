#include <8051.h>
#include "types.h"
#include "preemptive.h"
#include "dino.h"


// Define global variables for renderer
__data __at(0x18) char row;
__data __at(0x19) char col;
__data __at(0x1A) uchar res;
__data __at(0x1B) char keyChar; // for game control to move the dinosaur
__data __at(0x1C) char lastKeyState;
__data __at(0x1D) bool lcd_ready; 
__data __at(0x1E) bool rendered;
__data __at(0x1F) unsigned char random_number;

// Define global variables and game state
__data __at(0x21) char gameState; // 3 NOT START, 4 start, 5 over
__data __at(0x22) unsigned char score;
__data __at(0x23) char dinosaurPosition; // 0 upper, 1 lower
__data __at(0x24) char difficulty;       //
__data __at(0x25) char state;
__data __at(0x26) char sub_state;

// Each bit represents whether there is a cactus at that position
// Dividing by 8 as there are 8 bits in a byte
__data __at(0x27) uchar map[MAP_HEIGHT][MAP_WIDTH / 8]; 
__data __at(0x70) char score_string[16];


// Define global variables for preemptive
//#define MAXTHREADS 4, defined in .h file
__data __at (0x30) char savedSP[MAXTHREADS];
__data __at (0x34) ThreadID curThread;
__data __at (0x35) char mask;
__data __at (0x36) ThreadID newThread;
__data __at (0x37) char i;
__data __at (0x38) char tmp;
__data __at (0x39) char tmp2;
__data __at (0x3A) char isAlive[MAXTHREADS];
__data __at (0x3E) unsigned char cnt0;
__data __at (0x3F) unsigned char stay;
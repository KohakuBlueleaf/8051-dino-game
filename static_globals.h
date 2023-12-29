#include <8051.h>
#include "dino.h"


// Define global variables for renderer
__data __at(0x70) char timeSinceLastCactus;
__data __at(0x71) char nextCactusRow;
__data __at(0x72) char row;
__data __at(0x73) char col;
__data __at(0x74) char res;
__data __at(0x76) char keyChar; // for game control to move the dinosaur
__data __at(0x77) char lastKeyState;
__data __at(0x78) unsigned char lcd_ready; 
__data __at(0x79) char rendered;


// Define global variables and game state
__data __at(0x26) char gameState; // 3 NOT START, 4 start, 5 over
__data __at(0x27) unsigned char score;
__data __at(0x28) char dinosaurPosition; // 0 upper, 1 lower
__data __at(0x29) char difficulty;       //
__data __at(0x2A) char state;
__data __at(0x2B) char sub_state;
// Each bit represents whether there is a cactus at that position
// Dividing by 8 as there are 8 bits in a byte
__data __at(0x2C) unsigned char map[MAP_HEIGHT][MAP_WIDTH / 8]; 


// Define global variables for preemptive
//#define MAXTHREADS 4, defined in .h file
__data __at (0x30) char savedSP[MAXTHREADS];
__data __at (0x34) ThreadID curThread;
__data __at (0x35) char mask;
__data __at (0x36) ThreadID newThread;
__data __at (0x37) char i;
__data __at (0x38) char tmp;
__data __at (0x39) char tmp2;
// __data __at (0x3A) ThreadID nextProducerToSwitch;
__data __at (0x3A) char isAlive[MAXTHREADS];
__data __at (0x3E) unsigned char cnt0;
__data __at (0x3F) unsigned char stay;
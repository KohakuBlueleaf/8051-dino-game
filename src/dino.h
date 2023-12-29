#include <8051.h>
#include "lcdlib.h"
#include "keylib.h"
#include "preemptive.h"

#define MAP_HEIGHT 2  // assuming two rows as per your game
#define MAP_WIDTH 16  // or however wide your map is
#define BUFFER_SIZE 2 // or however many keys you want to statefer
#define INITIAL_DELAY '6'
#define MAX_SCORE 222

#define UP_KEY '2'
#define DOWN_KEY '8'
#define SIGN_KEY '#'

#define READY '3'
#define START '4'
#define GAMEOVER '5'
#define DINOSAUR '\1'
#define CACTUS '\2'


// Declare the function
void delayms(unsigned int time);
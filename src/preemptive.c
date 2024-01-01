/*
 * file: preemptive.c
 */

#include <8051.h>
#include "types.h"
#include "static_globals.h"
#include "utils.h"
#include "dino.h"
#include "preemptive.h"


#define SAVESTATE \
    { \
    __asm \
        push ACC \
        push B \
        push DPL \
        push DPH \
        push PSW \
    __endasm; \
    savedSP[curThread] = SP; \
    }


#define RESTORESTATE \
    { \
    SP = savedSP[curThread]; \
    __asm \
        pop PSW \
        pop DPH \
        pop DPL \
        pop B \
        pop ACC \
    __endasm; \
    }


/* 
  * we declare main() as an extern so we can reference its symbol
  * when creating a thread for it.
  */
extern void main(void);


/*
 * Bootstrap is jumped to by the startup code to make the thread for
 * main, and restore its context so the thread can run.
 */
void Bootstrap(void) {
    //------------------Timer 0------------------
    TMOD = 0x01;  // timer 1 mode 1(render), timer 0 mode 1(general)

    //Interrupt Enable Register
    // IE = 0x82;  // enable timer 0 interrupt; keep consumer polling
    // EA  -  ET2  ES  ET1  EX1  ET0  EX0
    ET0 = 1; // 啟動 Timer 0 中斷 
        
    TR0 = 1; // 啟動 Timer_0// set bit TR0 to start running timer 0
    EA = 1;
    
    TH0 = 0;
    TL0 = 0;
    cnt0 = 0;
    stay = 1;

    mask = 0b0000;
    isAlive[0] = 0b0001; 
    isAlive[1] = 0b0010; 
    isAlive[2] = 0b0100; 
    isAlive[3] = 0b1000;
    ThreadCreate(main);
    curThread = 0; 
    RESTORESTATE;
}


/*
 * ThreadCreate() creates a thread data structure so it is ready
 * to be restored (context switched in).
 * The function pointer itself should take no argument and should
 * return no argument.
 */
ThreadID ThreadCreate(FunctionPtr fp) {
    fp;
    if(mask == 0b1111) return -1;
    for(i = 0; i < MAXTHREADS; i++) {
        if(((mask) & (0b0001 << i)) == 0) {
            mask |= (0b0001 << i);
            newThread = i;
            break;
        }
    }

    tmp = SP; // tmp : old thread stack pointer
    SP = 0x3F + (i << 4); // SP: new thread stack pointer

    __asm
        push DPL
        push DPH
        mov A, #0
        push A
        push A
        push A
        push A
    __endasm;

    tmp2 = (i << 3);
    
    __asm
        push _tmp2 // thread selection register
    __endasm;
    
    savedSP[newThread] = SP;
    SP = tmp; // let the old thread continue
    return newThread;
}


/**
 * @brief Function to select next thread to run
 * Thread0 is the fixed_update thread, 
 * so we only change to it when cnt0 get the period
 * Otherwise we change between 2 and 1. (game_ctrl and render)
 */
static const uchar speed[] = {0, 1, 1, 1, 2, 2, 2, 3, 3, 3};
void ThreadYield(void) {
    set_state(10, 10);
    SAVESTATE;
    do {
        if(cnt0>(3-speed[difficulty]) && game_state==START){
            curThread=0;
            cnt0=0;
        }else{
            // If yield from ctrl thread or fixed update.
            // Enable render thread to display the changes.
            curThread = (curThread==2) ? 1 : 2;
        }
        if(mask & isAlive[curThread]) break;
    } while (1);
    RESTORESTATE;
}
void ThreadYieldSimple(void) {
    set_state(10, 10);
    SAVESTATE;
    do {
        curThread = (curThread+1)%MAXTHREADS;
        if(mask & isAlive[curThread]) break;
    } while (1);
    RESTORESTATE;
}


/**
 * @brief Just a counter
 */
void timer0_counter(void){
    cnt0++;
    __asm
        reti
    __endasm;
}
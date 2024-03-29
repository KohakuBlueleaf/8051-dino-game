/*
 * file: cooperative.h
 *
 * this is the include file for the cooperative multithreading
 * package.  It is to be compiled by SDCC and targets the EdSim51 as
 * the target architecture.
 *
 * CS 3423 Fall 2018
 */

#ifndef __PREEMPTIVE_H__
#define __PREEMPTIVE_H__

#define MAXTHREADS 4  /* not including the scheduler */
/* the scheduler does not take up a thread of its own */

typedef char ThreadID;
typedef char Semaphore;
typedef void (*FunctionPtr)(void);

ThreadID ThreadCreate(FunctionPtr);
void ThreadYieldSimple(void);
void ThreadYield(void);
void ThreadExit(void);

#define CNAME(s) _ ## s
#define LABEL(label) label ## $
#define SemaphoreCreate(s, n) s = n
#define SemaphoreWait(s) SemaphoreWaitBody(s, __COUNTER__)
#define SemaphoreSignal(s) \
    { \
        __asm \
            INC CNAME(s) \
        __endasm; \
    }
#define SemaphoreWaitBody(s, label) \
    { \
        __asm \
            LABEL(label): \
                MOV ACC, CNAME(s) \
                JZ LABEL(label) \
                JB ACC.7, LABEL(label) \
                DEC CNAME(s) \
        __endasm; \
    }


#endif // __PREEMPTIVE_H__

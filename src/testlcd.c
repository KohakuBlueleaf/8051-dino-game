
#include <8051.h>
#include "types.h"
#include "preemptive.h"
#include "buttonlib.h"
#include "lcdlib.h"
#include "keylib.h"


/* 
 * @@@ [2pt] 
 * declare your global variables here, for the shared buffer 
 * between the producer and consumer.  
 * Hint: you may want to manually designate the location for the 
 * variable.  you can use
 *        __data __at (0x30) type var; 
 * to declare a variable var of the type
 */ 
// Have some shared variable with Dino game
// Which are defined in seperated file:
#include "static_globals.h"
//19~1F for LCD renderer and key controler, 27~2B for Dino game, 30~3F for preemptive
__data __at(0x2C) char btn_char;
__data __at(0x2D) char last_btn;
__data __at(0x2E) bool rendered_btn;
__data __at(0x2F) bool rendered_key;


/* Instead of Producer() function, 
 * make Producer1() and Producer2() functions.  
 * Producer1 should output letters 'A' to 'Z' 
 * and repeat forever; 
 * Producer2 should output '0' to '9' and 
 * repeat forever.
 */
void ProducerButton(void) {
    while(1) {
        btn_char = ButtonToChar(); // Get the ASCII code of the button
        if (btn_char && !last_btn) { // If a button is pressed and it's a new press
            last_btn = btn_char; // Store the current state as the last state
            rendered_btn = false;
        }else if(!btn_char && last_btn) {
            //btn released
            last_btn = 0;
        }
        ThreadYieldSimple();
    }
}


void ProducerKey(void) {
    while(1) {
        key_char = KeyToChar();  // Get the current key character
        if (key_char && !last_key) {  // If a key is pressed and it's a new press
            last_key = key_char;  // Store the current state as the last state
            rendered_key = false;
        }else if(!key_char && last_key) {
            //key released
            last_key = 0;
        }
        ThreadYieldSimple();
    }
}


void ConsumerLCD(void) {
    char char_to_display; // To hold the character to display
    while(1) {
        if(!rendered_key) {
            char_to_display = last_key;
            rendered_key = true;
        } else if(!rendered_btn) {
            char_to_display = last_btn;
            rendered_btn = true;
        } else {
            char_to_display = 0;
        }
        // Check if the LCD is ready and display the character
        // Display the character on LCD, ensuring the LCD is ready for new characters
        if(char_to_display){
            while(!LCD_ready()) {}
            LCD_write_char(char_to_display); // Write the character to the LCD
            col += 1;
            if(col>=MAP_WIDTH){
                col = 0;
                row = !row;
                LCD_cursorGoTo(row, 0);
            }
        }
        char_to_display = 0;
        ThreadYieldSimple();
    }
    // Note: Typically, you don't exit an infinite loop in embedded system tasks unless there's a shutdown protocol
}


/* [5 pts for this function]
 * main() is started by the thread bootstrapper as thread-0.
 * It can create more thread(s) as needed:
 * one thread can acts as producer and another as consumer.
 */
void main(void) {
    LCD_Init();
    row = 0;
    col = 0;

    // spawn Producer1 first then Producer2
    ThreadCreate(ProducerButton);
    ThreadCreate(ProducerKey); 
    ConsumerLCD();
}

void _sdcc_gsinit_startup(void) {
    __asm
        ljmp  _Bootstrap
    __endasm;
}

void _mcs51_genRAMCLEAR(void) {}
void _mcs51_genXINIT(void) {}
void _mcs51_genXRAMCLEAR(void) {}

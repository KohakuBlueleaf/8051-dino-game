#include <8051.h>
#include "static_globals.h"
#include "lcdlib.h" 

/* @@@ change to a different location if needed. 
It just needs a bit, no need to be a char. */
#define DB7 P1_7
#define DB6 P1_6
#define DB5 P1_5
#define DB4 P1_4
#define DB  P1
#define RS P1_3
#define E P1_2


unsigned char LCD_ready(void) {
    return lcd_ready;
}


void LCD_Init(void) {
    LCD_functionSet();
    LCD_entryModeSet(1, 0); /* increment and no shift */
    LCD_displayOnOffControl(1, 0, 0); /* display on, cursor off and blinking off */
    lcd_ready = 1;
}


void LCD_IRWrite(char c) {
    lcd_ready = 0;
    DB = (c & 0xf0); // high nibble, keep RS low
    E = 1;  // pulse E
    E = 0;
    DB = (c << 4); // low nibble, keep RS low
    E = 1;
    E = 0;
    delay(DELAY_AMOUNT);
    lcd_ready = 1;
}


void LCD_functionSet(void) {
    lcd_ready = 0;
    // The high nibble for the function set is actually sent twice
    // because this is how 4-bit mode works for the HD44780 controller.
    DB = 0x20;  // DB<7:4> = 0010, <RS,E,x,x>=0
    E = 1;
    E = 0;
    delay(DELAY_AMOUNT);
    E = 1;
    E = 0;
    delay(DELAY_AMOUNT); // added, to ensure sufficient delay
    DB7 = 1; // 2-line model
    //------------------------------------------------------------------
    // 自己加的
    DB6 = 0; // 5x7 dots
    DB5 = 0; // 4-bit mode
    DB4 = 0; // 4-bit mode
    //------------------------------------------------------------------
    // DB6 defaults to 0 = 5x7, DB5, DB4 are don't-cares
    E = 1;
    E = 0;
    delay(DELAY_AMOUNT);
    lcd_ready = 1;
}


// --------------------------------------------------------------------
//* The consumer obtains any key that has been enqueued and displays it to the LCD
void LCD_write_char(char c) {
    lcd_ready = 0;
    RS = 1;
    DB = (c & 0xf0) | 0x08; //; keep the RS
    E = 1;
    E = 0;
    DB = (c << 4) | 0x08; // keep the RS
    E = 1;
    E = 0;
    delay(DELAY_AMOUNT);
    lcd_ready = 1;
}


// void LCD_write_string(char *line, unsigned char r, unsigned char c){
//     while(*line){
//         LCD_cursorGoTo(r, c);
//         LCD_write_char(*line);
//         line++;
//         c++;
//     }
// }


void delay(unsigned char n) {
    __asm
        dhere:
            djnz dpl, dhere
    __endasm;
}

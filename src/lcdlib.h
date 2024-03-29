#include "types.h"
#ifndef __LCDLIB_H__
#define __LCDLIB_H__
#define CLEAR_DISPLAY 1
#define RETURN_HOME   2
#define DEC_CURSOR    4
#define INC_CURSOR    6
#define SHIFT_DISPLAY_RIGHT 5
#define SHIFT_DISPLAY_LEFT  7
#define DISPLAY_OFF_CURSOR_OFF 8
#define DISPLAY_OFF_CURSOR_ON  0xA
#define DISPLAY_ON_CURSOR_OFF  0xC
#define DISPLAY_ON_CURSOR_BLINK 0xE
#define SHIFT_CURSOR_LEFT  0x10
#define SHIFT_CURSOR_RIGHT 0x14
#define SHIFT_ENTIRE_DISPLAY_LEFT 0x18
#define SHIFT_ENTIRE_DISPLAY_RIGHT 0x1C
#define FORCE_CURSOR_LINE_1_HEAD 0x80
#define FORCE_CURSOR_LINE_2_HEAD 0xC0
#define DISP_2_LINE_5x7_FONT  0x38
void LCD_Init(void);  /* initialize the LCD module */
void LCD_IRWrite(char c); /* writes to the instruction register */
// void LCD_Display(char *s); /* writes a string to the LCD */
void delay(unsigned char n) ;
#define DELAY_AMOUNT 40

#define LCD_entry_mode_set(id, s) \
    LCD_IRWrite(0x4 | ((id) << 1) | (s))

#define LCD_display_on_off_control(display, cursor, blinking) \
    LCD_IRWrite(0x8 | ((display)<<2) | ((cursor) <<1) | (blinking))
//! macros for LCD commands

//cursor back to 0,0
#define LCD_returnHome() \
    LCD_IRWrite(RETURN_HOME)

#define LCD_clearScreen() \
    LCD_IRWrite(CLEAR_DISPLAY)


// row, column
// row = 0,1, column = 0..f
#define LCD_cursorGoTo(row, col)\
    LCD_setDdRamAddress(((row)*0x40+(col)))

#define LCD_cursorOrDisplayShift(sc, rl) \
    LCD_IRWrite(0x10 | ((sc) << 3) | ((rl) << 2))

#define LCD_setDdRamAddress(addr) \
    LCD_IRWrite(0x80 | (addr))

#define LCD_setCgRamAddress(addr) \
    LCD_IRWrite(0x40 + (addr))


// code is the character generation memory 
// (CG RAM address for the bitmap. 
//  write '\1' for the dinosaur, '\2' for the cactus.
// you need to write all 8 bytes for each bitmap.
// of course, you could do it in a loop or do pointer arithmetic
#define LCD_set_symbol(code, symb) { \
    LCD_setCgRamAddress(code); \
    LCD_write_char(symb[0]); \
    LCD_write_char(symb[1]); \
    LCD_write_char(symb[2]); \
    LCD_write_char(symb[3]); \
    LCD_write_char(symb[4]); \
    LCD_write_char(symb[5]); \
    LCD_write_char(symb[6]); \
    LCD_write_char(symb[7]); \
}

void LCD_function_set(void) ;
void LCD_write_char(char c) ;
bool LCD_ready(void);

#define LCD_write_string(line, row) \
{ \
    LCD_cursorGoTo(row, 0); \
    for(col=0; col < MAP_WIDTH && line[col]; col++) { \
        LCD_write_char(line[col]); \
    } \
    for(; col<16; col++) { \
        LCD_write_char(' '); \
    }\
}
#endif // __LCDLIB_H__

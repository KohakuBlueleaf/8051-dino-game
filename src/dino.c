#include <8051.h>
#include "static_globals.h"
#include "lcdlib.h"
#include "keylib.h"
#include "preemptive.h"
#include "dino.h"
#include "utils.h"


char check_cactus(char map[MAP_HEIGHT][MAP_WIDTH / 8], int x, int y) {
    // Check if there's a cactus at position x, y
    res = map[x][y>>3] & (1 << (7 - y % 8));
    return res > 0;
}


// declare the bitmap data
const char dinosaur[] = {0x07, 0x05, 0x06, 0x07, 0x14, 0x17, 0x0E, 0x0A};// 0x10~0x17
const char cactus[] = {0x04, 0x05, 0x15, 0x15, 0x16, 0x0C, 0x04, 0x04}; // 0x20~0x27
const char number[] = "0123456789";
const unsigned char density[] = {0, 1, 2, 3, 1, 2, 3, 1, 2, 3};


void LCD_set_symbol(char code, const char symb[]) {
// or it could be defined as a macro.
// in any case, it takes the following calls:

    LCD_setCgRamAddress(code); // code is the character generation memory 
              // (CG RAM address for the bitmap. 
              //  write '\1' for the dinosaur, '\2' for the cactus.
    LCD_write_char(symb[0]);
    LCD_write_char(symb[1]);
    LCD_write_char(symb[2]);
    LCD_write_char(symb[3]);
    LCD_write_char(symb[4]);
    LCD_write_char(symb[5]);
    LCD_write_char(symb[6]);
    LCD_write_char(symb[7]);
   // you need to write all 8 bytes for each bitmap.
   // of course, you could do it in a loop or do pointer arithmetic
}


// copy paste this in every code
void delayms(unsigned int time)
{
    unsigned int n;
    while(time>0)
    {
        n = 120;
        while(n > 0)
            n--;
        time--;
    }
}


void game_init(){
    __critical {
        score = 0;
        rendered = 0;
        dinosaurPosition = 0;
        nextCactusRow = 0;
        map[0][0] = 0x06; // 0000_0111
        map[0][1] = 0x04; // 0000_0100 
        map[1][0] = 0x00; // 0000_0000 
        map[1][1] = 0x20; // 0010_0000
    }
}


/**
 * @brief Function to handle keypad input and control logic
 * Will not be limited by timer
 */
void ctrl_thread() {
    while(1) {
        __critical {
            state = 0;
            keyChar = KeyToChar();  // Get the current key character
            if ((keyChar >= '0' && keyChar <= '9') 
                || (keyChar == UP_KEY || keyChar == DOWN_KEY || keyChar== SIGN_KEY ) 
                && (lastKeyState == '\0')){
                lastKeyState = keyChar; 
            }
        }
        
        if((keyChar || lastKeyState) || (keyChar != lastKeyState)) {
            if(gameState==READY) {
                // Handle difficulty level setting
                // Wait for signal from keypad control thread for difficulty level
                __critical {
                    state=2;
                    sub_state=0;
                    if ((lastKeyState >= '0' && lastKeyState <= '9') && (keyChar==SIGN_KEY)) {
                        difficulty = lastKeyState - '0';
                        lastKeyState = '\0';
                        rendered = 0;
                        game_init();
                        gameState = START;
                    }
                    sub_state=1;
                }
            } else if (gameState==START) {
                // Main game loop
                // Handle dinosaur movement, cacti generation and movement
                __critical {
                    state=3;
                    sub_state=0;
                    if (lastKeyState == UP_KEY && dinosaurPosition>0 ) {
                        dinosaurPosition--;
                        rendered=0;
                    } else if (lastKeyState == DOWN_KEY && dinosaurPosition<1) {
                        dinosaurPosition++;
                        rendered=0;
                    }
                    lastKeyState = '\0';
                    sub_state=1;
                }
            } else if (gameState==GAMEOVER){
                if (lastKeyState == SIGN_KEY) {
                    gameState = READY;
                    rendered = 0 ;
                }
                lastKeyState = '\0';
                sub_state=1;
            }
        }
        __critical {
            sub_state=7;
        }
        ThreadYield();
    }
}


/*** 
 *  Function to divide two numbers
 *  @param a - dividend
 *  @param b - divisor
 *  @return - quotient
*/
unsigned char devide(unsigned char a, unsigned char b) {
    unsigned char result=0;
    while(a>=b){
        a-=b;
        result++;
    }
    return result;
}


/**
 * @brief Function to handle LCD updates and render the scene
 * Use "rendered" variable to check if we need to update the content
 * to reduce update frequency
 */
void render_thread() {
    /**
     * Note that LCD_write_string have some problem
     * so we manually maintain the loop for it
     */
    while(1) {
        __critical {
            state=1;
            if(!rendered){
                if(gameState == READY){
                    delayms(DELAY_AMOUNT);
                    for ( row = 0; row < MAP_HEIGHT; row++) {
                        for ( col = 0; col < MAP_WIDTH; col++) {
                            LCD_cursorGoTo(row, col);
                            if(row==0 && col<12) {
                                LCD_write_char(("Choose Level")[col]); 
                            }else if (row==1 && col<13) {
                                LCD_write_char(("To Start Game")[col]); 
                            }else{
                                LCD_write_char(' ');
                            }
                        }
                    }
                }else if(gameState == GAMEOVER){
                    delayms(DELAY_AMOUNT);
                    for ( row = 0; row < MAP_HEIGHT; row++) {
                        for ( col = 0; col < MAP_WIDTH; col++) {
                            LCD_cursorGoTo(row, col);
                            if(row==0 && col<11) {
                                if(score < MAX_SCORE)
                                    LCD_write_char(("Game Over! ")[col]);
                                else
                                    LCD_write_char(("Game Clear!")[col]);
                            }else if (row==1 && col<11) {
                                if(col<7){
                                    LCD_write_char(("Score: ")[col]); 
                                }else if(col==8){
                                    LCD_write_char(("0123456789")[devide(score, 100)]); 
                                }else if(col==9){
                                    LCD_write_char(("0123456789")[devide((score%100), 10)]); 
                                }else if(col==10){
                                    LCD_write_char(("0123456789")[(score%10)]); 
                                }
                            }else{
                                LCD_write_char(' ');
                            }
                        }
                    }
                }else if(gameState == START){
                    for ( row = 0; row < MAP_HEIGHT; row++) {
                        for ( col = 0; col < MAP_WIDTH; col++) {
                            LCD_cursorGoTo(row, col);
                            if(row==dinosaurPosition && col==0) {
                                LCD_write_char(DINOSAUR); 
                            }else if (check_cactus(map, row, col)) { // If there's a cactus at this position
                                // LCD_cursorGoTo(row, col);
                                LCD_write_char(CACTUS); // Assuming '\1' is mapped to cactus graphics
                            }else{
                                LCD_write_char(' ');
                            }
                        }
                    }
                }
                LCD_returnHome();
                rendered = 1;
            }
        }
        endjob:
        ThreadYield();
    }
}


/**
 * @brief Function to handle game logic
 * Is limited by timer, will only be enabled when cnt0 > period
 * period is defined by the difficulty
 */
void fixed_update() {
    while (1) {
        if (gameState==START) {
            __critical {
                state=3;
                sub_state=0;
                unsigned char new=0;
                unsigned char add1=0;
                unsigned char add2=0;
                if (!check_cactus(map, dinosaurPosition, 0)) {
                    new = random()%(5-density[difficulty])==0;
                    add1 = check_cactus(map, 0, 8);
                    add2 = new && random()%2 && !check_cactus(map, 1, 15) && !check_cactus(map, 0, 14);
                    map[0][0] = map[0][0] << 1;
                    map[0][0] += add1;
                    map[0][1] = map[0][1] << 1;
                    map[0][1] += add2;
                    
                    add1 = check_cactus(map, 1, 8);
                    add2 = (add2 ^ new) && !check_cactus(map, 0, 14) && !check_cactus(map, 1, 14);;
                    map[1][0] = map[1][0] << 1;
                    map[1][0] += add1;
                    map[1][1] = map[1][1] << 1;
                    map[1][1] += add2;
                }
                if (check_cactus(map, dinosaurPosition, 0) || score >= MAX_SCORE) {
                    gameState = GAMEOVER;
                }else if(check_cactus(map, !dinosaurPosition, 0)){
                    score++;
                }
                sub_state=2;
                rendered=0;
            }
        }
        ThreadYield();
    }
}


void main() {
    LCD_Init();          // Initialize LCD
    Init_Keypad();       // Initialize Keypad
    
    // Initialize game variables
    gameState = READY;
    score = 0;
    rendered = 0;
    difficulty = 0;
    dinosaurPosition = 0;
    nextCactusRow = 0;
    lastKeyState=0;
    state=0;
    sub_state=0;
    random_number=xorshift(1); //take 1 as seed

    LCD_set_symbol(0x08, dinosaur); // bitmap for dinosaur starts at 0x10
    LCD_set_symbol(0x10, cactus);   // bitmap for cactus starts at 0x20

    map[0][0] = 0x06; // 0000_0111
    map[0][1] = 0x04; // 0000_0100 
    map[1][0] = 0x00; // 0000_0000 
    map[1][1] = 0x20; // 0010_0000

    // Create threads
    ThreadCreate(ctrl_thread);
    ThreadCreate(render_thread);
    fixed_update();
}


void _sdcc_gsinit_startup(void) {
    __asm
        ljmp  _Bootstrap
    __endasm;
}


void _mcs51_genRAMCLEAR(void) {}
void _mcs51_genXINIT(void) {}
void _mcs51_genXRAMCLEAR(void) {}


void timer0_ISR(void) __interrupt(1) {
    __asm
        ljmp _myTimer0Handler
    __endasm;
}
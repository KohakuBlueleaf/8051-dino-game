#include <8051.h>
#include <string.h>
#include "types.h"
#include "static_globals.h"
#include "lcdlib.h"
#include "keylib.h"
#include "preemptive.h"
#include "dino.h"
#include "utils.h"


void game_init(){
    score = 121;
    rendered = 0;
    dino_position = 0;
    map[0][0] = 0x06; // 0000_0110
    map[0][1] = 0x04; // 0000_0100 
    map[1][0] = 0x00; // 0000_0000 
    map[1][1] = 0x20; // 0010_0000
}


bool check_cactus(uchar map[MAP_HEIGHT][MAP_WIDTH/8], uchar x, uchar y) {
    // Check if there's a cactus at position x, y
    res = map[x][y>>3] & (1 << (7 - y % 8));
    return res > 0;
}


/**
 * @brief Function to handle keypad input and control logic
 * Will not be limited by timer
 */
void ctrl_thread() {
    while(1) {
        set_state(1, 0);
        key_char = KeyToChar();  // Get the current key character
        if ((key_char >= '0' && key_char <= '9') 
            || key_char== SIGN_KEY
            && (last_key == '\0')
        ){
            last_key = key_char; 
        }
        set_state(1, 1);
        
        if((key_char || last_key) || (key_char != last_key)) {
            if(game_state==READY) {
                set_state(1, 2);
                // Handle difficulty level setting
                // Wait for signal from keypad control thread for difficulty level
                if ((last_key >= '0' && last_key <= '9') && (key_char==SIGN_KEY)) {
                    difficulty = last_key - '0';
                    last_key = '\0';
                    rendered = 0;
                    game_init();
                    game_state = START;
                }
            } else if (game_state==START) {
                // Main game loop
                // Handle dinosaur movement, cacti generation and movement
                set_state(1, 3);
                if (last_key == UP_KEY && dino_position>0 ) {
                    dino_position--;
                    rendered=0;
                } else if (last_key == DOWN_KEY && dino_position<1) {
                    dino_position++;
                    rendered=0;
                }
                last_key = '\0';
            } else if (game_state==GAMEOVER){
                set_state(1, 4);
                if (last_key == SIGN_KEY) {
                    game_state = READY;
                    rendered = 0 ;
                }
                last_key = '\0';
            }
        }
        set_state(1, 5);
        ThreadYield();
    }
}


/**
 * @brief Function to handle LCD updates and render the scene
 * Use "rendered" variable to check if we need to update the content
 * to reduce update frequency
 */
void render_thread() {
    while(1) {
        set_state(2, 0);
        if(!rendered){
            if(game_state == READY){
                set_state(2, 1);
                LCD_write_string("Choose a Level", 0);
                LCD_write_string("To start game!", 1);
            }else if(game_state == GAMEOVER){
                set_state(2, 2);
                if(score < MAX_SCORE){
                    LCD_write_string("Game Over!", 0);
                }else{
                    LCD_write_string("Game Clear!", 0);
                }
                score_string[7] = ('0'+score/100);
                score_string[8] = ('0'+(score%100)/10);
                score_string[9] = ('0'+(score%10));
                LCD_write_string(score_string, 1);
            }else if(game_state == START){
                // In game loop
                // No clean screen and return home to get more efficiency
                set_state(2, 3);
                for ( row = 0; row < MAP_HEIGHT; row++) {
                    for ( col = 0; col < MAP_WIDTH; col++) {
                        LCD_cursorGoTo(row, col);
                        if(row==dino_position && col==0) {
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
            rendered = 1;
        }
        set_state(2, 4);
        ThreadYield();
    }
}


/**
 * @brief Function to handle game logic
 * Is limited by timer, will only be enabled when cnt0 > period
 * period is defined by the difficulty
 */
const uchar density[] = {0, 1, 2, 3, 1, 2, 3, 1, 2, 3};
void fixed_update() {
    while (1) {
        if (game_state==START) {
            set_state(0, 1);
            uchar new=0;
            uchar add1=0;
            uchar add2=0;
            if (!check_cactus(map, dino_position, 0)) {
                set_state(0, 2);
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
            if (check_cactus(map, dino_position, 0) || score >= MAX_SCORE) {
                game_state = GAMEOVER;
            }else if(check_cactus(map, !dino_position, 0)){
                score++;
            }
            rendered=0;
        }
        set_state(0, 2);
        ThreadYield();
    }
}


// declare the bitmap data
const char dinosaur[] = {0x07, 0x05, 0x06, 0x07, 0x14, 0x17, 0x0E, 0x0A};// 0x10~0x17
const char cactus[] = {0x04, 0x05, 0x15, 0x15, 0x16, 0x0C, 0x04, 0x04}; // 0x20~0x27


void main() {
    set_state(0, 0);
    LCD_Init();          // Initialize LCD
    Init_Keypad();       // Initialize Keypad

    // Initialize game variables
    game_state = READY;
    difficulty = 0;
    random_number = xorshift(1);
    strcpy(score_string, "Score: 000");
    game_init();

    LCD_set_symbol(0x08, dinosaur); // bitmap for dinosaur starts at 0x08
    LCD_set_symbol(0x10, cactus); // bitmap for cactus starts at 0x10

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
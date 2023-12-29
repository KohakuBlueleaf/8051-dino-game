;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14549 (MINGW64)
;--------------------------------------------------------
	.module lcdlib
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _CY
	.globl _AC
	.globl _F0
	.globl _RS1
	.globl _RS0
	.globl _OV
	.globl _F1
	.globl _P
	.globl _PS
	.globl _PT1
	.globl _PX1
	.globl _PT0
	.globl _PX0
	.globl _RD
	.globl _WR
	.globl _T1
	.globl _T0
	.globl _INT1
	.globl _INT0
	.globl _TXD
	.globl _RXD
	.globl _P3_7
	.globl _P3_6
	.globl _P3_5
	.globl _P3_4
	.globl _P3_3
	.globl _P3_2
	.globl _P3_1
	.globl _P3_0
	.globl _EA
	.globl _ES
	.globl _ET1
	.globl _EX1
	.globl _ET0
	.globl _EX0
	.globl _P2_7
	.globl _P2_6
	.globl _P2_5
	.globl _P2_4
	.globl _P2_3
	.globl _P2_2
	.globl _P2_1
	.globl _P2_0
	.globl _SM0
	.globl _SM1
	.globl _SM2
	.globl _REN
	.globl _TB8
	.globl _RB8
	.globl _TI
	.globl _RI
	.globl _P1_7
	.globl _P1_6
	.globl _P1_5
	.globl _P1_4
	.globl _P1_3
	.globl _P1_2
	.globl _P1_1
	.globl _P1_0
	.globl _TF1
	.globl _TR1
	.globl _TF0
	.globl _TR0
	.globl _IE1
	.globl _IT1
	.globl _IE0
	.globl _IT0
	.globl _P0_7
	.globl _P0_6
	.globl _P0_5
	.globl _P0_4
	.globl _P0_3
	.globl _P0_2
	.globl _P0_1
	.globl _P0_0
	.globl _B
	.globl _ACC
	.globl _PSW
	.globl _IP
	.globl _P3
	.globl _IE
	.globl _P2
	.globl _SBUF
	.globl _SCON
	.globl _P1
	.globl _TH1
	.globl _TH0
	.globl _TL1
	.globl _TL0
	.globl _TMOD
	.globl _TCON
	.globl _PCON
	.globl _DPH
	.globl _DPL
	.globl _SP
	.globl _P0
	.globl _LCD_write_string_PARM_3
	.globl _LCD_write_string_PARM_2
	.globl _stay
	.globl _cnt0
	.globl _isAlive
	.globl _tmp2
	.globl _tmp
	.globl _i
	.globl _newThread
	.globl _mask
	.globl _curThread
	.globl _savedSP
	.globl _map
	.globl _sub_state
	.globl _state
	.globl _difficulty
	.globl _dinosaurPosition
	.globl _score
	.globl _gameState
	.globl _rendered
	.globl _lcd_ready
	.globl _lastKeyState
	.globl _keyChar
	.globl _res
	.globl _col
	.globl _row
	.globl _nextCactusRow
	.globl _timeSinceLastCactus
	.globl _LCD_ready
	.globl _LCD_Init
	.globl _LCD_IRWrite
	.globl _LCD_functionSet
	.globl _LCD_write_char
	.globl _LCD_write_string
	.globl _delay
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0	=	0x0080
_SP	=	0x0081
_DPL	=	0x0082
_DPH	=	0x0083
_PCON	=	0x0087
_TCON	=	0x0088
_TMOD	=	0x0089
_TL0	=	0x008a
_TL1	=	0x008b
_TH0	=	0x008c
_TH1	=	0x008d
_P1	=	0x0090
_SCON	=	0x0098
_SBUF	=	0x0099
_P2	=	0x00a0
_IE	=	0x00a8
_P3	=	0x00b0
_IP	=	0x00b8
_PSW	=	0x00d0
_ACC	=	0x00e0
_B	=	0x00f0
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0_0	=	0x0080
_P0_1	=	0x0081
_P0_2	=	0x0082
_P0_3	=	0x0083
_P0_4	=	0x0084
_P0_5	=	0x0085
_P0_6	=	0x0086
_P0_7	=	0x0087
_IT0	=	0x0088
_IE0	=	0x0089
_IT1	=	0x008a
_IE1	=	0x008b
_TR0	=	0x008c
_TF0	=	0x008d
_TR1	=	0x008e
_TF1	=	0x008f
_P1_0	=	0x0090
_P1_1	=	0x0091
_P1_2	=	0x0092
_P1_3	=	0x0093
_P1_4	=	0x0094
_P1_5	=	0x0095
_P1_6	=	0x0096
_P1_7	=	0x0097
_RI	=	0x0098
_TI	=	0x0099
_RB8	=	0x009a
_TB8	=	0x009b
_REN	=	0x009c
_SM2	=	0x009d
_SM1	=	0x009e
_SM0	=	0x009f
_P2_0	=	0x00a0
_P2_1	=	0x00a1
_P2_2	=	0x00a2
_P2_3	=	0x00a3
_P2_4	=	0x00a4
_P2_5	=	0x00a5
_P2_6	=	0x00a6
_P2_7	=	0x00a7
_EX0	=	0x00a8
_ET0	=	0x00a9
_EX1	=	0x00aa
_ET1	=	0x00ab
_ES	=	0x00ac
_EA	=	0x00af
_P3_0	=	0x00b0
_P3_1	=	0x00b1
_P3_2	=	0x00b2
_P3_3	=	0x00b3
_P3_4	=	0x00b4
_P3_5	=	0x00b5
_P3_6	=	0x00b6
_P3_7	=	0x00b7
_RXD	=	0x00b0
_TXD	=	0x00b1
_INT0	=	0x00b2
_INT1	=	0x00b3
_T0	=	0x00b4
_T1	=	0x00b5
_WR	=	0x00b6
_RD	=	0x00b7
_PX0	=	0x00b8
_PT0	=	0x00b9
_PX1	=	0x00ba
_PT1	=	0x00bb
_PS	=	0x00bc
_P	=	0x00d0
_F1	=	0x00d1
_OV	=	0x00d2
_RS0	=	0x00d3
_RS1	=	0x00d4
_F0	=	0x00d5
_AC	=	0x00d6
_CY	=	0x00d7
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
_timeSinceLastCactus	=	0x0070
_nextCactusRow	=	0x0071
_row	=	0x0072
_col	=	0x0073
_res	=	0x0074
_keyChar	=	0x0076
_lastKeyState	=	0x0077
_lcd_ready	=	0x0078
_rendered	=	0x0079
_gameState	=	0x0026
_score	=	0x0027
_dinosaurPosition	=	0x0028
_difficulty	=	0x0029
_state	=	0x002a
_sub_state	=	0x002b
_map	=	0x002c
_savedSP	=	0x0030
_curThread	=	0x0034
_mask	=	0x0035
_newThread	=	0x0036
_i	=	0x0037
_tmp	=	0x0038
_tmp2	=	0x0039
_isAlive	=	0x003a
_cnt0	=	0x003e
_stay	=	0x003f
_LCD_write_string_PARM_2:
	.ds 2
_LCD_write_string_PARM_3:
	.ds 2
;--------------------------------------------------------
; overlayable items in internal ram
;--------------------------------------------------------
	.area	OSEG    (OVR,DATA)
;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area ISEG    (DATA)
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	.area IABS    (ABS,DATA)
	.area IABS    (ABS,DATA)
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	.area BSEG    (BIT)
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; uninitialized external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; initialized external ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
	.area HOME    (CODE)
	.area GSINIT0 (CODE)
	.area GSINIT1 (CODE)
	.area GSINIT2 (CODE)
	.area GSINIT3 (CODE)
	.area GSINIT4 (CODE)
	.area GSINIT5 (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area CSEG    (CODE)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_ready'
;------------------------------------------------------------
;	lcdlib.c:16: unsigned char LCD_ready(void) {
;	-----------------------------------------
;	 function LCD_ready
;	-----------------------------------------
_LCD_ready:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	lcdlib.c:17: return lcd_ready;
	mov	dpl, _lcd_ready
;	lcdlib.c:18: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_Init'
;------------------------------------------------------------
;	lcdlib.c:21: void LCD_Init(void) {
;	-----------------------------------------
;	 function LCD_Init
;	-----------------------------------------
_LCD_Init:
;	lcdlib.c:22: LCD_functionSet();
	lcall	_LCD_functionSet
;	lcdlib.c:23: LCD_entryModeSet(1, 0); /* increment and no shift */
	mov	dpl, #0x06
	lcall	_LCD_IRWrite
;	lcdlib.c:24: LCD_displayOnOffControl(1, 0, 0); /* display on, cursor off and blinking off */
	mov	dpl, #0x0c
	lcall	_LCD_IRWrite
;	lcdlib.c:25: lcd_ready = 1;
	mov	_lcd_ready,#0x01
;	lcdlib.c:26: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_IRWrite'
;------------------------------------------------------------
;c                         Allocated to registers r7 
;------------------------------------------------------------
;	lcdlib.c:29: void LCD_IRWrite(char c) {
;	-----------------------------------------
;	 function LCD_IRWrite
;	-----------------------------------------
_LCD_IRWrite:
	mov	r7, dpl
;	lcdlib.c:30: lcd_ready = 0;
	mov	_lcd_ready,#0x00
;	lcdlib.c:31: DB = (c & 0xf0); // high nibble, keep RS low
	mov	a,#0xf0
	anl	a,r7
	mov	_P1,a
;	lcdlib.c:32: E = 1;  // pulse E
;	assignBit
	setb	_P1_2
;	lcdlib.c:33: E = 0;
;	assignBit
	clr	_P1_2
;	lcdlib.c:34: DB = (c << 4); // low nibble, keep RS low
	mov	a,r7
	swap	a
	anl	a,#0xf0
	mov	_P1,a
;	lcdlib.c:35: E = 1;
;	assignBit
	setb	_P1_2
;	lcdlib.c:36: E = 0;
;	assignBit
	clr	_P1_2
;	lcdlib.c:37: delay(DELAY_AMOUNT);
	mov	dpl, #0x28
	lcall	_delay
;	lcdlib.c:38: lcd_ready = 1;
	mov	_lcd_ready,#0x01
;	lcdlib.c:39: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_functionSet'
;------------------------------------------------------------
;	lcdlib.c:42: void LCD_functionSet(void) {
;	-----------------------------------------
;	 function LCD_functionSet
;	-----------------------------------------
_LCD_functionSet:
;	lcdlib.c:43: lcd_ready = 0;
	mov	_lcd_ready,#0x00
;	lcdlib.c:46: DB = 0x20;  // DB<7:4> = 0010, <RS,E,x,x>=0
	mov	_P1,#0x20
;	lcdlib.c:47: E = 1;
;	assignBit
	setb	_P1_2
;	lcdlib.c:48: E = 0;
;	assignBit
	clr	_P1_2
;	lcdlib.c:49: delay(DELAY_AMOUNT);
	mov	dpl, #0x28
	lcall	_delay
;	lcdlib.c:50: E = 1;
;	assignBit
	setb	_P1_2
;	lcdlib.c:51: E = 0;
;	assignBit
	clr	_P1_2
;	lcdlib.c:52: delay(DELAY_AMOUNT); // added, to ensure sufficient delay
	mov	dpl, #0x28
	lcall	_delay
;	lcdlib.c:53: DB7 = 1; // 2-line model
;	assignBit
	setb	_P1_7
;	lcdlib.c:56: DB6 = 0; // 5x7 dots
;	assignBit
	clr	_P1_6
;	lcdlib.c:57: DB5 = 0; // 4-bit mode
;	assignBit
	clr	_P1_5
;	lcdlib.c:58: DB4 = 0; // 4-bit mode
;	assignBit
	clr	_P1_4
;	lcdlib.c:61: E = 1;
;	assignBit
	setb	_P1_2
;	lcdlib.c:62: E = 0;
;	assignBit
	clr	_P1_2
;	lcdlib.c:63: delay(DELAY_AMOUNT);
	mov	dpl, #0x28
	lcall	_delay
;	lcdlib.c:64: lcd_ready = 1;
	mov	_lcd_ready,#0x01
;	lcdlib.c:65: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_write_char'
;------------------------------------------------------------
;c                         Allocated to registers r7 
;------------------------------------------------------------
;	lcdlib.c:70: void LCD_write_char(char c) {
;	-----------------------------------------
;	 function LCD_write_char
;	-----------------------------------------
_LCD_write_char:
	mov	r7, dpl
;	lcdlib.c:71: lcd_ready = 0;
	mov	_lcd_ready,#0x00
;	lcdlib.c:72: RS = 1;
;	assignBit
	setb	_P1_3
;	lcdlib.c:73: DB = (c & 0xf0) | 0x08; //; keep the RS
	mov	a,#0xf0
	anl	a,r7
	orl	a,#0x08
	mov	_P1,a
;	lcdlib.c:74: E = 1;
;	assignBit
	setb	_P1_2
;	lcdlib.c:75: E = 0;
;	assignBit
	clr	_P1_2
;	lcdlib.c:76: DB = (c << 4) | 0x08; // keep the RS
	mov	a,r7
	swap	a
	anl	a,#0xf0
	mov	r7,a
	mov	a,#0x08
	orl	a,r7
	mov	_P1,a
;	lcdlib.c:77: E = 1;
;	assignBit
	setb	_P1_2
;	lcdlib.c:78: E = 0;
;	assignBit
	clr	_P1_2
;	lcdlib.c:79: delay(DELAY_AMOUNT);
	mov	dpl, #0x28
	lcall	_delay
;	lcdlib.c:80: lcd_ready = 1;
	mov	_lcd_ready,#0x01
;	lcdlib.c:81: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_write_string'
;------------------------------------------------------------
;x                         Allocated with name '_LCD_write_string_PARM_2'
;y                         Allocated with name '_LCD_write_string_PARM_3'
;str                       Allocated to registers 
;------------------------------------------------------------
;	lcdlib.c:84: void LCD_write_string(char* str, int x, int y) {
;	-----------------------------------------
;	 function LCD_write_string
;	-----------------------------------------
_LCD_write_string:
	mov	r5, dpl
	mov	r6, dph
	mov	r7, b
;	lcdlib.c:85: while (*str) { // Check the character is not '\0'
	mov	r3,_LCD_write_string_PARM_3
	mov	r4,(_LCD_write_string_PARM_3 + 1)
00101$:
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	jz	00104$
;	lcdlib.c:86: LCD_cursorGoTo(x, y);
	mov	a,_LCD_write_string_PARM_2
	rr	a
	rr	a
	anl	a,#0xc0
	mov	r2,a
	mov	ar1,r3
	mov	a,r1
	add	a, r2
	orl	a,#0x80
	mov	dpl,a
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	push	ar3
	lcall	_LCD_IRWrite
	pop	ar3
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
;	lcdlib.c:87: LCD_write_char(*str); // Write the current character to LCD
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r2,a
	inc	dptr
	mov	r5,dpl
	mov	r6,dph
	mov	dpl, r2
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	push	ar3
	lcall	_LCD_write_char
	pop	ar3
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
;	lcdlib.c:88: str++; // Move to the next character
;	lcdlib.c:89: y++;
	inc	r3
	cjne	r3,#0x00,00101$
	inc	r4
	sjmp	00101$
00104$:
;	lcdlib.c:91: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'delay'
;------------------------------------------------------------
;n                         Allocated to registers 
;------------------------------------------------------------
;	lcdlib.c:94: void delay(unsigned char n) {
;	-----------------------------------------
;	 function delay
;	-----------------------------------------
_delay:
;	lcdlib.c:98: __endasm;
dhere:
	djnz	dpl, dhere
;	lcdlib.c:99: }
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)

;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14549 (MINGW64)
;--------------------------------------------------------
	.module dino
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _devide_PARM_2
	.globl _number
	.globl _cactus
	.globl _dinosaur
	.globl _timer0_ISR
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genXINIT
	.globl __mcs51_genRAMCLEAR
	.globl __sdcc_gsinit_startup
	.globl _main
	.globl _fixed_update
	.globl _render_thread
	.globl _devide
	.globl _ctrl_thread
	.globl _game_init
	.globl _LCD_set_symbol
	.globl _check_cactus
	.globl _ThreadYield
	.globl _ThreadCreate
	.globl _KeyToChar
	.globl _Init_Keypad
	.globl _LCD_write_char
	.globl _LCD_IRWrite
	.globl _LCD_Init
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
	.globl _LCD_set_symbol_PARM_2
	.globl _check_cactus_PARM_3
	.globl _check_cactus_PARM_2
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
	.globl _delayms
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
_check_cactus_PARM_2:
	.ds 2
_check_cactus_PARM_3:
	.ds 2
_LCD_set_symbol_PARM_2:
	.ds 3
;--------------------------------------------------------
; overlayable items in internal ram
;--------------------------------------------------------
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
_devide_PARM_2:
	.ds 1
;--------------------------------------------------------
; Stack segment in internal ram
;--------------------------------------------------------
	.area SSEG
__start__stack:
	.ds	1

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
_game_init_sloc0_1_0:
	.ds 1
_ctrl_thread_sloc0_1_0:
	.ds 1
_render_thread_sloc0_1_0:
	.ds 1
_fixed_update_sloc0_1_0:
	.ds 1
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
; interrupt vector
;--------------------------------------------------------
	.area HOME    (CODE)
__interrupt_vect:
	ljmp	__sdcc_gsinit_startup
	reti
	.ds	7
	ljmp	_timer0_ISR
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
	.globl __sdcc_gsinit_startup
	.globl __sdcc_program_startup
	.globl __start__stack
	.globl __mcs51_genXINIT
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genRAMCLEAR
	.area GSFINAL (CODE)
	ljmp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
__sdcc_program_startup:
	ljmp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'check_cactus'
;------------------------------------------------------------
;x                         Allocated with name '_check_cactus_PARM_2'
;y                         Allocated with name '_check_cactus_PARM_3'
;map                       Allocated to registers r5 r6 r7 
;------------------------------------------------------------
;	src/dino.c:9: char check_cactus(char map[MAP_HEIGHT][MAP_WIDTH / 8], int x, int y) {
;	-----------------------------------------
;	 function check_cactus
;	-----------------------------------------
_check_cactus:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
	mov	r5, dpl
	mov	r6, dph
	mov	r7, b
;	src/dino.c:11: res = map[x][y>>3] & (1 << (7 - y % 8));
	mov	a,_check_cactus_PARM_2
	add	a,_check_cactus_PARM_2
	mov	r3,a
	mov	a,(_check_cactus_PARM_2 + 1)
	rlc	a
	mov	r4,a
	mov	a,r3
	add	a, r5
	mov	r5,a
	mov	a,r4
	addc	a, r6
	mov	r6,a
	mov	r3,_check_cactus_PARM_3
	mov	a,(_check_cactus_PARM_3 + 1)
	swap	a
	rl	a
	xch	a,r3
	swap	a
	rl	a
	anl	a,#0x1f
	xrl	a,r3
	xch	a,r3
	anl	a,#0x1f
	xch	a,r3
	xrl	a,r3
	xch	a,r3
	jnb	acc.4,00111$
	orl	a,#0xffffffe0
00111$:
	mov	r4,a
	mov	a,r3
	add	a, r5
	mov	r5,a
	mov	a,r4
	addc	a, r6
	mov	r6,a
	mov	__modsint_PARM_2,#0x08
	mov	(__modsint_PARM_2 + 1),#0x00
	mov	dpl, _check_cactus_PARM_3
	mov	dph, (_check_cactus_PARM_3 + 1)
	push	ar7
	push	ar6
	push	ar5
	lcall	__modsint
	mov	r3, dpl
	pop	ar5
	pop	ar6
	pop	ar7
	mov	a,#0x07
	clr	c
	subb	a,r3
	mov	b,a
	inc	b
	mov	a,#0x01
	sjmp	00113$
00112$:
	add	a,acc
00113$:
	djnz	b,00112$
	mov	r4,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r5,a
	mov	a,r4
	anl	a,r5
	mov	_res,a
;	src/dino.c:12: return res > 0;
	mov	a,_res
	jz	00103$
	mov	r7,#0x01
	sjmp	00104$
00103$:
	mov	r7,#0x00
00104$:
	mov	dpl,r7
;	src/dino.c:13: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_set_symbol'
;------------------------------------------------------------
;symb                      Allocated with name '_LCD_set_symbol_PARM_2'
;code                      Allocated to registers r7 
;------------------------------------------------------------
;	src/dino.c:22: void LCD_set_symbol(char code, const char symb[]) {
;	-----------------------------------------
;	 function LCD_set_symbol
;	-----------------------------------------
_LCD_set_symbol:
	mov	r7, dpl
;	src/dino.c:26: LCD_setCgRamAddress(code); // code is the character generation memory 
	mov	a,#0x40
	add	a, r7
	mov	dpl,a
	lcall	_LCD_IRWrite
;	src/dino.c:29: LCD_write_char(symb[0]);
	mov	r5,_LCD_set_symbol_PARM_2
	mov	r6,(_LCD_set_symbol_PARM_2 + 1)
	mov	r7,(_LCD_set_symbol_PARM_2 + 2)
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	dpl,a
	push	ar7
	push	ar6
	push	ar5
	lcall	_LCD_write_char
	pop	ar5
	pop	ar6
	pop	ar7
;	src/dino.c:30: LCD_write_char(symb[1]);
	mov	a,#0x01
	add	a, r5
	mov	r2,a
	clr	a
	addc	a, r6
	mov	r3,a
	mov	ar4,r7
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	mov	dpl,a
	push	ar7
	push	ar6
	push	ar5
	lcall	_LCD_write_char
	pop	ar5
	pop	ar6
	pop	ar7
;	src/dino.c:31: LCD_write_char(symb[2]);
	mov	a,#0x02
	add	a, r5
	mov	r2,a
	clr	a
	addc	a, r6
	mov	r3,a
	mov	ar4,r7
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	mov	dpl,a
	push	ar7
	push	ar6
	push	ar5
	lcall	_LCD_write_char
	pop	ar5
	pop	ar6
	pop	ar7
;	src/dino.c:32: LCD_write_char(symb[3]);
	mov	a,#0x03
	add	a, r5
	mov	r2,a
	clr	a
	addc	a, r6
	mov	r3,a
	mov	ar4,r7
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	mov	dpl,a
	push	ar7
	push	ar6
	push	ar5
	lcall	_LCD_write_char
	pop	ar5
	pop	ar6
	pop	ar7
;	src/dino.c:33: LCD_write_char(symb[4]);
	mov	a,#0x04
	add	a, r5
	mov	r2,a
	clr	a
	addc	a, r6
	mov	r3,a
	mov	ar4,r7
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	mov	dpl,a
	push	ar7
	push	ar6
	push	ar5
	lcall	_LCD_write_char
	pop	ar5
	pop	ar6
	pop	ar7
;	src/dino.c:34: LCD_write_char(symb[5]);
	mov	a,#0x05
	add	a, r5
	mov	r2,a
	clr	a
	addc	a, r6
	mov	r3,a
	mov	ar4,r7
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	mov	dpl,a
	push	ar7
	push	ar6
	push	ar5
	lcall	_LCD_write_char
	pop	ar5
	pop	ar6
	pop	ar7
;	src/dino.c:35: LCD_write_char(symb[6]);
	mov	a,#0x06
	add	a, r5
	mov	r2,a
	clr	a
	addc	a, r6
	mov	r3,a
	mov	ar4,r7
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	mov	dpl,a
	push	ar7
	push	ar6
	push	ar5
	lcall	_LCD_write_char
	pop	ar5
	pop	ar6
	pop	ar7
;	src/dino.c:36: LCD_write_char(symb[7]);
	mov	a,#0x07
	add	a, r5
	mov	r5,a
	clr	a
	addc	a, r6
	mov	r6,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	dpl,a
;	src/dino.c:39: }
	ljmp	_LCD_write_char
;------------------------------------------------------------
;Allocation info for local variables in function 'delayms'
;------------------------------------------------------------
;time                      Allocated to registers 
;n                         Allocated to registers r4 r5 
;------------------------------------------------------------
;	src/dino.c:43: void delayms(unsigned int time)
;	-----------------------------------------
;	 function delayms
;	-----------------------------------------
_delayms:
	mov	r6, dpl
	mov	r7, dph
;	src/dino.c:46: while(time>0)
00104$:
	mov	a,r6
	orl	a,r7
	jz	00107$
;	src/dino.c:49: while(n > 0)
	mov	r4,#0x78
	mov	r5,#0x00
00101$:
	mov	a,r4
	orl	a,r5
	jz	00103$
;	src/dino.c:50: n--;
	dec	r4
	cjne	r4,#0xff,00137$
	dec	r5
00137$:
	sjmp	00101$
00103$:
;	src/dino.c:51: time--;
	dec	r6
	cjne	r6,#0xff,00138$
	dec	r7
00138$:
	sjmp	00104$
00107$:
;	src/dino.c:53: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'game_init'
;------------------------------------------------------------
;	src/dino.c:56: void game_init(){
;	-----------------------------------------
;	 function game_init
;	-----------------------------------------
_game_init:
;	src/dino.c:66: }
	setb	_game_init_sloc0_1_0
	jbc	ea,00103$
	clr	_game_init_sloc0_1_0
00103$:
;	src/dino.c:58: score = 0;
	mov	_score,#0x00
;	src/dino.c:59: rendered = 0;
	mov	_rendered,#0x00
;	src/dino.c:60: dinosaurPosition = 0;
	mov	_dinosaurPosition,#0x00
;	src/dino.c:61: nextCactusRow = 0;
	mov	_nextCactusRow,#0x00
;	src/dino.c:62: map[0][0] = 0x06; // 0000_0111
	mov	_map,#0x06
;	src/dino.c:63: map[0][1] = 0x04; // 0000_0100 
	mov	(_map + 0x0001),#0x04
;	src/dino.c:64: map[1][0] = 0x00; // 0000_0000 
	mov	(_map + 0x0002),#0x00
;	src/dino.c:65: map[1][1] = 0x20; // 0010_0000
	mov	(_map + 0x0003),#0x20
	mov	c,_game_init_sloc0_1_0
	mov	ea,c
;	src/dino.c:67: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ctrl_thread'
;------------------------------------------------------------
;	src/dino.c:74: void ctrl_thread() {
;	-----------------------------------------
;	 function ctrl_thread
;	-----------------------------------------
_ctrl_thread:
;	src/dino.c:75: while(1) {
00134$:
;	src/dino.c:84: }
	setb	_ctrl_thread_sloc0_1_0
	jbc	ea,00240$
	clr	_ctrl_thread_sloc0_1_0
00240$:
;	src/dino.c:77: state = 0;
	mov	_state,#0x00
;	src/dino.c:78: keyChar = KeyToChar();  // Get the current key character
	lcall	_KeyToChar
	mov	_keyChar,dpl
;	src/dino.c:79: if ((keyChar >= '0' && keyChar <= '9') 
	mov	a,#0x100 - 0x30
	add	a,_keyChar
	jnc	00107$
	mov	a,_keyChar
	add	a,#0xff - 0x39
	jnc	00101$
00107$:
;	src/dino.c:80: || (keyChar == UP_KEY || keyChar == DOWN_KEY || keyChar== SIGN_KEY ) 
	mov	a,#0x32
	cjne	a,_keyChar,00243$
	sjmp	00106$
00243$:
	mov	a,#0x38
	cjne	a,_keyChar,00244$
	sjmp	00106$
00244$:
	mov	a,#0x23
	cjne	a,_keyChar,00102$
00106$:
;	src/dino.c:81: && (lastKeyState == '\0')){
	mov	a,_lastKeyState
	jnz	00102$
00101$:
;	src/dino.c:82: lastKeyState = keyChar; 
	mov	_lastKeyState,_keyChar
00102$:
	mov	c,_ctrl_thread_sloc0_1_0
	mov	ea,c
;	src/dino.c:86: if((keyChar || lastKeyState) || (keyChar != lastKeyState)) {
	mov	a,_keyChar
	jnz	00129$
	mov	a,_lastKeyState
	jnz	00129$
	mov	a,_lastKeyState
	cjne	a,_keyChar,00250$
	ljmp	00130$
00250$:
00129$:
;	src/dino.c:87: if(gameState==READY) {
	mov	a,#0x33
	cjne	a,_gameState,00127$
;	src/dino.c:101: }
	setb	_ctrl_thread_sloc0_1_0
	jbc	ea,00253$
	clr	_ctrl_thread_sloc0_1_0
00253$:
;	src/dino.c:91: state=2;
	mov	_state,#0x02
;	src/dino.c:92: sub_state=0;
	mov	_sub_state,#0x00
;	src/dino.c:93: if ((lastKeyState >= '0' && lastKeyState <= '9') && (keyChar==SIGN_KEY)) {
	mov	a,#0x100 - 0x30
	add	a,_lastKeyState
	jnc	00109$
	mov	a,_lastKeyState
	add	a,#0xff - 0x39
	jc	00109$
	mov	a,#0x23
	cjne	a,_keyChar,00109$
;	src/dino.c:94: difficulty = lastKeyState - '0';
	mov	a,_lastKeyState
	add	a,#0xd0
	mov	_difficulty,a
;	src/dino.c:95: lastKeyState = '\0';
	mov	_lastKeyState,#0x00
;	src/dino.c:96: rendered = 0;
	mov	_rendered,#0x00
;	src/dino.c:97: game_init();
	lcall	_game_init
;	src/dino.c:98: gameState = START;
	mov	_gameState,#0x34
00109$:
;	src/dino.c:100: sub_state=1;
	mov	_sub_state,#0x01
	mov	c,_ctrl_thread_sloc0_1_0
	mov	ea,c
	sjmp	00130$
00127$:
;	src/dino.c:102: } else if (gameState==START) {
	mov	a,#0x34
	cjne	a,_gameState,00124$
;	src/dino.c:117: }
	setb	_ctrl_thread_sloc0_1_0
	jbc	ea,00260$
	clr	_ctrl_thread_sloc0_1_0
00260$:
;	src/dino.c:106: state=3;
	mov	_state,#0x03
;	src/dino.c:107: sub_state=0;
	mov	_sub_state,#0x00
;	src/dino.c:108: if (lastKeyState == UP_KEY && dinosaurPosition>0 ) {
	mov	a,#0x32
	cjne	a,_lastKeyState,00116$
	mov	a,_dinosaurPosition
	jz	00116$
;	src/dino.c:109: dinosaurPosition--;
	mov	a,_dinosaurPosition
	dec	a
	mov	_dinosaurPosition,a
;	src/dino.c:110: rendered=0;
	mov	_rendered,#0x00
	sjmp	00117$
00116$:
;	src/dino.c:111: } else if (lastKeyState == DOWN_KEY && dinosaurPosition<1) {
	mov	a,#0x38
	cjne	a,_lastKeyState,00117$
	mov	a,#0x100 - 0x01
	add	a,_dinosaurPosition
	jc	00117$
;	src/dino.c:112: dinosaurPosition++;
	mov	a,_dinosaurPosition
	inc	a
	mov	_dinosaurPosition,a
;	src/dino.c:113: rendered=0;
	mov	_rendered,#0x00
00117$:
;	src/dino.c:115: lastKeyState = '\0';
	mov	_lastKeyState,#0x00
;	src/dino.c:116: sub_state=1;
	mov	_sub_state,#0x01
	mov	c,_ctrl_thread_sloc0_1_0
	mov	ea,c
	sjmp	00130$
00124$:
;	src/dino.c:118: } else if (gameState==GAMEOVER){
	mov	a,#0x35
	cjne	a,_gameState,00130$
;	src/dino.c:119: if (lastKeyState == SIGN_KEY ) {
	mov	a,#0x23
	cjne	a,_lastKeyState,00120$
;	src/dino.c:120: gameState = READY;
	mov	_gameState,#0x33
;	src/dino.c:121: rendered = 0 ;
	mov	_rendered,#0x00
00120$:
;	src/dino.c:123: lastKeyState = '\0';
	mov	_lastKeyState,#0x00
;	src/dino.c:124: sub_state=1;
	mov	_sub_state,#0x01
00130$:
;	src/dino.c:129: }
	setb	_ctrl_thread_sloc0_1_0
	jbc	ea,00271$
	clr	_ctrl_thread_sloc0_1_0
00271$:
;	src/dino.c:128: sub_state=7;
	mov	_sub_state,#0x07
	mov	c,_ctrl_thread_sloc0_1_0
	mov	ea,c
;	src/dino.c:130: ThreadYield();
	lcall	_ThreadYield
;	src/dino.c:132: }
	ljmp	00134$
;------------------------------------------------------------
;Allocation info for local variables in function 'devide'
;------------------------------------------------------------
;b                         Allocated with name '_devide_PARM_2'
;a                         Allocated to registers r7 
;result                    Allocated to registers r6 
;------------------------------------------------------------
;	src/dino.c:141: unsigned char devide(unsigned char a, unsigned char b) {
;	-----------------------------------------
;	 function devide
;	-----------------------------------------
_devide:
	mov	r7, dpl
;	src/dino.c:143: while(a>b){
	mov	r6,#0x00
00101$:
	clr	c
	mov	a,_devide_PARM_2
	subb	a,r7
	jnc	00103$
;	src/dino.c:144: a-=b;
	mov	a,r7
	clr	c
	subb	a,_devide_PARM_2
	mov	r7,a
;	src/dino.c:145: result++;
	inc	r6
	sjmp	00101$
00103$:
;	src/dino.c:147: return result;
	mov	dpl, r6
;	src/dino.c:148: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'render_thread'
;------------------------------------------------------------
;	src/dino.c:156: void render_thread() {
;	-----------------------------------------
;	 function render_thread
;	-----------------------------------------
_render_thread:
;	src/dino.c:161: while(1) {
00151$:
;	src/dino.c:216: }
	setb	_render_thread_sloc0_1_0
	jbc	ea,00365$
	clr	_render_thread_sloc0_1_0
00365$:
;	src/dino.c:163: state=1;
	mov	_state,#0x01
;	src/dino.c:164: if(!rendered){
	mov	a,_rendered
	jz	00366$
	ljmp	00148$
00366$:
;	src/dino.c:165: if(gameState == READY){
	mov	a,#0x33
	cjne	a,_gameState,00145$
;	src/dino.c:166: for ( row = 0; row < MAP_HEIGHT; row++) {
	mov	_row,#0x00
00157$:
	mov	a,#0x100 - 0x02
	add	a,_row
	jnc	00369$
	ljmp	00146$
00369$:
;	src/dino.c:167: for ( col = 0; col < MAP_WIDTH; col++) {
	mov	_col,#0x00
00154$:
	mov	a,#0x100 - 0x10
	add	a,_col
	jc	00158$
;	src/dino.c:168: LCD_cursorGoTo(row, col);
	mov	a,_row
	rr	a
	rr	a
	anl	a,#0xc0
	add	a,_col
	orl	a,#0x80
	mov	dpl,a
	lcall	_LCD_IRWrite
;	src/dino.c:169: if(row==0 && col<12) {
	mov	a,_row
	jnz	00106$
	mov	a,#0x100 - 0x0c
	add	a,_col
	jc	00106$
;	src/dino.c:170: LCD_write_char(("Choose Level")[col]); 
	mov	a,_col
	mov	dptr,#___str_0
	movc	a,@a+dptr
	mov	dpl,a
	lcall	_LCD_write_char
	sjmp	00155$
00106$:
;	src/dino.c:171: }else if (row==1 && col<13) {
	mov	a,#0x01
	cjne	a,_row,00102$
	mov	a,#0x100 - 0x0d
	add	a,_col
	jc	00102$
;	src/dino.c:172: LCD_write_char(("To Start Game")[col]); 
	mov	a,_col
	mov	dptr,#___str_1
	movc	a,@a+dptr
	mov	dpl,a
	lcall	_LCD_write_char
	sjmp	00155$
00102$:
;	src/dino.c:174: LCD_write_char('_');
	mov	dpl, #0x5f
	lcall	_LCD_write_char
00155$:
;	src/dino.c:167: for ( col = 0; col < MAP_WIDTH; col++) {
	mov	a,_col
	inc	a
	mov	_col,a
	sjmp	00154$
00158$:
;	src/dino.c:166: for ( row = 0; row < MAP_HEIGHT; row++) {
	mov	a,_row
	inc	a
	mov	_row,a
	sjmp	00157$
00145$:
;	src/dino.c:178: }else if(gameState == GAMEOVER){
	mov	a,#0x35
	cjne	a,_gameState,00376$
	sjmp	00377$
00376$:
	ljmp	00142$
00377$:
;	src/dino.c:179: for ( row = 0; row < MAP_HEIGHT; row++) {
	mov	_row,#0x00
00163$:
	mov	a,#0x100 - 0x02
	add	a,_row
	jnc	00378$
	ljmp	00146$
00378$:
;	src/dino.c:180: for ( col = 0; col < MAP_WIDTH; col++) {
	mov	_col,#0x00
00160$:
	mov	a,#0x100 - 0x10
	add	a,_col
	jnc	00379$
	ljmp	00164$
00379$:
;	src/dino.c:181: LCD_cursorGoTo(row, col);
	mov	a,_row
	rr	a
	rr	a
	anl	a,#0xc0
	add	a,_col
	orl	a,#0x80
	mov	dpl,a
	lcall	_LCD_IRWrite
;	src/dino.c:182: if(row==0 && col<9) {
	mov	a,_row
	jnz	00125$
	mov	a,#0x100 - 0x09
	add	a,_col
	jc	00125$
;	src/dino.c:183: LCD_write_char(("Game_Over")[col]); 
	mov	a,_col
	mov	dptr,#___str_2
	movc	a,@a+dptr
	mov	dpl,a
	lcall	_LCD_write_char
	ljmp	00161$
00125$:
;	src/dino.c:184: }else if (row==1 && col<11) {
	mov	a,#0x01
	cjne	a,_row,00382$
	sjmp	00383$
00382$:
	ljmp	00121$
00383$:
	mov	a,#0x100 - 0x0b
	add	a,_col
	jnc	00384$
	ljmp	00121$
00384$:
;	src/dino.c:185: if(col<7){
	mov	a,#0x100 - 0x07
	add	a,_col
	jc	00114$
;	src/dino.c:186: LCD_write_char(("Score:_")[col]); 
	mov	a,_col
	mov	dptr,#___str_3
	movc	a,@a+dptr
	mov	dpl,a
	lcall	_LCD_write_char
	sjmp	00115$
00114$:
;	src/dino.c:187: }else if(col==8){
	mov	a,#0x08
	cjne	a,_col,00115$
;	src/dino.c:188: LCD_write_char(("0123456789")[devide(score, 100)]); 
	mov	_devide_PARM_2,#0x64
	mov	dpl, _score
	lcall	_devide
	mov	a,dpl
	mov	dptr,#___str_4
	movc	a,@a+dptr
	mov	dpl,a
	lcall	_LCD_write_char
00115$:
;	src/dino.c:189: } if(col==9){
	mov	a,#0x09
	cjne	a,_col,00117$
;	src/dino.c:190: LCD_write_char(("0123456789")[devide((score%100), 10)]); 
	mov	r6,_score
	mov	r7,#0x00
	mov	__modsint_PARM_2,#0x64
	mov	(__modsint_PARM_2 + 1),r7
	mov	dpl, r6
	mov	dph, r7
	lcall	__modsint
	mov	_devide_PARM_2,#0x0a
	lcall	_devide
	mov	a,dpl
	mov	dptr,#___str_4
	movc	a,@a+dptr
	mov	dpl,a
	lcall	_LCD_write_char
00117$:
;	src/dino.c:191: } if(col==10){
	mov	a,#0x0a
	cjne	a,_col,00161$
;	src/dino.c:192: LCD_write_char(("0123456789")[(score%10)]); 
	mov	r6,_score
	mov	r7,#0x00
	mov	__modsint_PARM_2,#0x0a
	mov	(__modsint_PARM_2 + 1),r7
	mov	dpl, r6
	mov	dph, r7
	lcall	__modsint
	mov	r6, dpl
	mov	r7, dph
	mov	a,r6
	add	a, #___str_4
	mov	dpl,a
	mov	a,r7
	addc	a, #(___str_4 >> 8)
	mov	dph,a
	clr	a
	movc	a,@a+dptr
	mov	dpl,a
	lcall	_LCD_write_char
	sjmp	00161$
00121$:
;	src/dino.c:195: LCD_write_char('_');
	mov	dpl, #0x5f
	lcall	_LCD_write_char
00161$:
;	src/dino.c:180: for ( col = 0; col < MAP_WIDTH; col++) {
	mov	a,_col
	inc	a
	mov	_col,a
	ljmp	00160$
00164$:
;	src/dino.c:179: for ( row = 0; row < MAP_HEIGHT; row++) {
	mov	a,_row
	inc	a
	mov	_row,a
	ljmp	00163$
00142$:
;	src/dino.c:199: }else if(gameState == START){
	mov	a,#0x34
	cjne	a,_gameState,00146$
;	src/dino.c:200: for ( row = 0; row < MAP_HEIGHT; row++) {
	mov	_row,#0x00
00169$:
	mov	a,#0x100 - 0x02
	add	a,_row
	jc	00146$
;	src/dino.c:201: for ( col = 0; col < MAP_WIDTH; col++) {
	mov	_col,#0x00
00166$:
	mov	a,#0x100 - 0x10
	add	a,_col
	jc	00170$
;	src/dino.c:202: LCD_cursorGoTo(row, col);
	mov	a,_row
	rr	a
	rr	a
	anl	a,#0xc0
	add	a,_col
	orl	a,#0x80
	mov	dpl,a
	lcall	_LCD_IRWrite
;	src/dino.c:203: if(row==dinosaurPosition && col==0) {
	mov	a,_dinosaurPosition
	cjne	a,_row,00134$
	mov	a,_col
	jnz	00134$
;	src/dino.c:204: LCD_write_char(DINOSAUR); 
	mov	dpl, #0x01
	lcall	_LCD_write_char
	sjmp	00167$
00134$:
;	src/dino.c:205: }else if (check_cactus(map, row, col)) { // If there's a cactus at this position
	mov	_check_cactus_PARM_2,_row
	mov	(_check_cactus_PARM_2 + 1),#0x00
	mov	_check_cactus_PARM_3,_col
	mov	(_check_cactus_PARM_3 + 1),#0x00
	mov	dptr,#_map
	mov	b, #0x40
	lcall	_check_cactus
	mov	a, dpl
	jz	00131$
;	src/dino.c:207: LCD_write_char(CACTUS); // Assuming '\1' is mapped to cactus graphics
	mov	dpl, #0x02
	lcall	_LCD_write_char
	sjmp	00167$
00131$:
;	src/dino.c:209: LCD_write_char('_');
	mov	dpl, #0x5f
	lcall	_LCD_write_char
00167$:
;	src/dino.c:201: for ( col = 0; col < MAP_WIDTH; col++) {
	mov	a,_col
	inc	a
	mov	_col,a
	sjmp	00166$
00170$:
;	src/dino.c:200: for ( row = 0; row < MAP_HEIGHT; row++) {
	mov	a,_row
	inc	a
	mov	_row,a
	sjmp	00169$
00146$:
;	src/dino.c:214: rendered = 1;
	mov	_rendered,#0x01
00148$:
	mov	c,_render_thread_sloc0_1_0
	mov	ea,c
;	src/dino.c:218: ThreadYield();
	lcall	_ThreadYield
;	src/dino.c:220: }
	ljmp	00151$
;------------------------------------------------------------
;Allocation info for local variables in function 'fixed_update'
;------------------------------------------------------------
;add1                      Allocated to registers r7 
;add2                      Allocated to registers r6 
;------------------------------------------------------------
;	src/dino.c:228: void fixed_update() {
;	-----------------------------------------
;	 function fixed_update
;	-----------------------------------------
_fixed_update:
;	src/dino.c:229: while (1) {
00109$:
;	src/dino.c:230: if (gameState==START) {
	mov	a,#0x34
	cjne	a,_gameState,00141$
	sjmp	00142$
00141$:
	ljmp	00107$
00142$:
;	src/dino.c:258: }
	setb	_fixed_update_sloc0_1_0
	jbc	ea,00143$
	clr	_fixed_update_sloc0_1_0
00143$:
;	src/dino.c:232: state=3;
	mov	_state,#0x03
;	src/dino.c:233: sub_state=0;
	mov	_sub_state,#0x00
;	src/dino.c:236: if (!check_cactus(map, dinosaurPosition, 0)) {
	mov	_check_cactus_PARM_2,_dinosaurPosition
	clr	a
	mov	(_check_cactus_PARM_2 + 1),a
	mov	_check_cactus_PARM_3,a
	mov	(_check_cactus_PARM_3 + 1),a
	mov	dptr,#_map
	mov	b, #0x40
	lcall	_check_cactus
	mov	a, dpl
	jz	00144$
	ljmp	00102$
00144$:
;	src/dino.c:237: add1 = check_cactus(map, 0, 8);
	clr	a
	mov	_check_cactus_PARM_2,a
	mov	(_check_cactus_PARM_2 + 1),a
	mov	_check_cactus_PARM_3,#0x08
	mov	(_check_cactus_PARM_3 + 1),a
	mov	dptr,#_map
	mov	b, #0x40
	lcall	_check_cactus
	mov	r7, dpl
;	src/dino.c:238: add2 = check_cactus(map, 0, 0);
	clr	a
	mov	_check_cactus_PARM_2,a
	mov	(_check_cactus_PARM_2 + 1),a
	mov	_check_cactus_PARM_3,a
	mov	(_check_cactus_PARM_3 + 1),a
	mov	dptr,#_map
	mov	b, #0x40
	push	ar7
	lcall	_check_cactus
	mov	r6, dpl
	pop	ar7
;	src/dino.c:239: map[0][0] = map[0][0] << 1;
	mov	a,_map
	add	a,acc
	mov	r5,a
	mov	_map,r5
;	src/dino.c:240: map[0][0] += add1;
	mov	a,r7
	add	a, _map
	mov	_map,a
;	src/dino.c:241: map[0][1] = map[0][1] << 1;
	mov	a,(_map + 0x0001)
	add	a,acc
	mov	r7,a
	mov	(_map + 0x0001),r7
;	src/dino.c:242: map[0][1] += add2;
	mov	a,r6
	add	a, (_map + 0x0001)
	mov	(_map + 0x0001),a
;	src/dino.c:244: add1 = check_cactus(map, 1, 8);
	mov	_check_cactus_PARM_2,#0x01
	mov	(_check_cactus_PARM_2 + 1),#0x00
	mov	_check_cactus_PARM_3,#0x08
	mov	(_check_cactus_PARM_3 + 1),#0x00
	mov	dptr,#_map
	mov	b, #0x40
	lcall	_check_cactus
	mov	r7, dpl
;	src/dino.c:245: add2 = check_cactus(map, 1, 0);
	mov	_check_cactus_PARM_2,#0x01
	clr	a
	mov	(_check_cactus_PARM_2 + 1),a
	mov	_check_cactus_PARM_3,a
	mov	(_check_cactus_PARM_3 + 1),a
	mov	dptr,#_map
	mov	b, #0x40
	push	ar7
	lcall	_check_cactus
	mov	r6, dpl
	pop	ar7
;	src/dino.c:246: map[1][0] = map[1][0] << 1;
	mov	a,(_map + 0x0002)
	add	a,acc
	mov	r5,a
	mov	(_map + 0x0002),r5
;	src/dino.c:247: map[1][0] += add1;
	mov	a,r7
	add	a, (_map + 0x0002)
	mov	(_map + 0x0002),a
;	src/dino.c:248: map[1][1] = map[1][1] << 1;
	mov	a,(_map + 0x0003)
	add	a,acc
	mov	r7,a
	mov	(_map + 0x0003),r7
;	src/dino.c:249: map[1][1] += add2;
	mov	a,r6
	add	a, (_map + 0x0003)
	mov	(_map + 0x0003),a
00102$:
;	src/dino.c:251: if (check_cactus(map, dinosaurPosition, 0)) {
	mov	_check_cactus_PARM_2,_dinosaurPosition
	clr	a
	mov	(_check_cactus_PARM_2 + 1),a
	mov	_check_cactus_PARM_3,a
	mov	(_check_cactus_PARM_3 + 1),a
	mov	dptr,#_map
	mov	b, #0x40
	lcall	_check_cactus
	mov	a, dpl
	jz	00104$
;	src/dino.c:252: gameState = GAMEOVER;
	mov	_gameState,#0x35
	sjmp	00105$
00104$:
;	src/dino.c:254: score++;
	mov	a,_score
	inc	a
	mov	_score,a
00105$:
;	src/dino.c:256: sub_state=2;
	mov	_sub_state,#0x02
;	src/dino.c:257: rendered=0;
	mov	_rendered,#0x00
	mov	c,_fixed_update_sloc0_1_0
	mov	ea,c
00107$:
;	src/dino.c:260: ThreadYield();
	lcall	_ThreadYield
;	src/dino.c:262: }
	ljmp	00109$
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;	src/dino.c:265: void main() {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	src/dino.c:266: LCD_Init();          // Initialize LCD
	lcall	_LCD_Init
;	src/dino.c:267: Init_Keypad();       // Initialize Keypad
	lcall	_Init_Keypad
;	src/dino.c:270: gameState = READY;
	mov	_gameState,#0x33
;	src/dino.c:271: score = 0;
	mov	_score,#0x00
;	src/dino.c:272: rendered = 0;
	mov	_rendered,#0x00
;	src/dino.c:273: difficulty = 0;
	mov	_difficulty,#0x00
;	src/dino.c:274: dinosaurPosition = 0;
	mov	_dinosaurPosition,#0x00
;	src/dino.c:275: nextCactusRow = 0;
	mov	_nextCactusRow,#0x00
;	src/dino.c:276: lastKeyState=0;
	mov	_lastKeyState,#0x00
;	src/dino.c:277: state=0;
	mov	_state,#0x00
;	src/dino.c:278: sub_state=0;
	mov	_sub_state,#0x00
;	src/dino.c:280: LCD_set_symbol(0x08, dinosaur); // bitmap for dinosaur starts at 0x10
	mov	_LCD_set_symbol_PARM_2,#_dinosaur
	mov	(_LCD_set_symbol_PARM_2 + 1),#(_dinosaur >> 8)
	mov	(_LCD_set_symbol_PARM_2 + 2),#0x80
	mov	dpl, #0x08
	lcall	_LCD_set_symbol
;	src/dino.c:281: LCD_set_symbol(0x10, cactus);   // bitmap for cactus starts at 0x20
	mov	_LCD_set_symbol_PARM_2,#_cactus
	mov	(_LCD_set_symbol_PARM_2 + 1),#(_cactus >> 8)
	mov	(_LCD_set_symbol_PARM_2 + 2),#0x80
	mov	dpl, #0x10
	lcall	_LCD_set_symbol
;	src/dino.c:283: map[0][0] = 0x06; // 0000_0111
	mov	_map,#0x06
;	src/dino.c:284: map[0][1] = 0x04; // 0000_0100 
	mov	(_map + 0x0001),#0x04
;	src/dino.c:285: map[1][0] = 0x00; // 0000_0000 
	mov	(_map + 0x0002),#0x00
;	src/dino.c:286: map[1][1] = 0x20; // 0010_0000
	mov	(_map + 0x0003),#0x20
;	src/dino.c:289: ThreadCreate(ctrl_thread);
	mov	dptr,#_ctrl_thread
	lcall	_ThreadCreate
;	src/dino.c:290: ThreadCreate(render_thread);
	mov	dptr,#_render_thread
	lcall	_ThreadCreate
;	src/dino.c:291: fixed_update();
;	src/dino.c:292: }
	ljmp	_fixed_update
;------------------------------------------------------------
;Allocation info for local variables in function '_sdcc_gsinit_startup'
;------------------------------------------------------------
;	src/dino.c:295: void _sdcc_gsinit_startup(void) {
;	-----------------------------------------
;	 function _sdcc_gsinit_startup
;	-----------------------------------------
__sdcc_gsinit_startup:
;	src/dino.c:298: __endasm;
	ljmp	_Bootstrap
;	src/dino.c:299: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
;------------------------------------------------------------
;	src/dino.c:302: void _mcs51_genRAMCLEAR(void) {}
;	-----------------------------------------
;	 function _mcs51_genRAMCLEAR
;	-----------------------------------------
__mcs51_genRAMCLEAR:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genXINIT'
;------------------------------------------------------------
;	src/dino.c:303: void _mcs51_genXINIT(void) {}
;	-----------------------------------------
;	 function _mcs51_genXINIT
;	-----------------------------------------
__mcs51_genXINIT:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
;------------------------------------------------------------
;	src/dino.c:304: void _mcs51_genXRAMCLEAR(void) {}
;	-----------------------------------------
;	 function _mcs51_genXRAMCLEAR
;	-----------------------------------------
__mcs51_genXRAMCLEAR:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'timer0_ISR'
;------------------------------------------------------------
;	src/dino.c:307: void timer0_ISR(void) __interrupt(1) {
;	-----------------------------------------
;	 function timer0_ISR
;	-----------------------------------------
_timer0_ISR:
;	src/dino.c:310: __endasm;
	ljmp	_myTimer0Handler
;	src/dino.c:311: }
	reti
;	eliminated unneeded mov psw,# (no regs used in bank)
;	eliminated unneeded push/pop not_psw
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;	eliminated unneeded push/pop b
;	eliminated unneeded push/pop acc
	.area CSEG    (CODE)
	.area CONST   (CODE)
_dinosaur:
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x14	; 20
	.db #0x17	; 23
	.db #0x0e	; 14
	.db #0x0a	; 10
_cactus:
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x16	; 22
	.db #0x0c	; 12
	.db #0x04	; 4
	.db #0x04	; 4
_number:
	.ascii "0123456789"
	.db 0x00
	.area CONST   (CODE)
___str_0:
	.ascii "Choose Level"
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_1:
	.ascii "To Start Game"
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_2:
	.ascii "Game_Over"
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_3:
	.ascii "Score:_"
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_4:
	.ascii "0123456789"
	.db 0x00
	.area CSEG    (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)

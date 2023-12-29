;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14549 (MINGW64)
;--------------------------------------------------------
	.module preemptive
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _myTimer0Handler
	.globl _Bootstrap
	.globl _main
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
	.globl _ThreadCreate
	.globl _ThreadYield
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
_ThreadCreate_sloc0_1_0:
	.ds 1
_ThreadYield_sloc0_1_0:
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
;Allocation info for local variables in function 'Bootstrap'
;------------------------------------------------------------
;	preemptive.c:48: void Bootstrap(void) {
;	-----------------------------------------
;	 function Bootstrap
;	-----------------------------------------
_Bootstrap:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	preemptive.c:50: TMOD = 0x01;  // timer 1 mode 1(render), timer 0 mode 1(general)
	mov	_TMOD,#0x01
;	preemptive.c:55: ET0 = 1; // 啟動 Timer 0 中斷 
;	assignBit
	setb	_ET0
;	preemptive.c:57: TR0 = 1; // 啟動 Timer_0// set bit TR0 to start running timer 0
;	assignBit
	setb	_TR0
;	preemptive.c:58: EA = 1;
;	assignBit
	setb	_EA
;	preemptive.c:60: TH0 = 0;
	mov	_TH0,#0x00
;	preemptive.c:61: TL0 = 0;
	mov	_TL0,#0x00
;	preemptive.c:62: cnt0 = 0;
	mov	_cnt0,#0x00
;	preemptive.c:63: stay = 1;
	mov	_stay,#0x01
;	preemptive.c:65: mask = 0b0000;
	mov	_mask,#0x00
;	preemptive.c:66: isAlive[0] = 0b0001; 
	mov	_isAlive,#0x01
;	preemptive.c:67: isAlive[1] = 0b0010; 
	mov	(_isAlive + 0x0001),#0x02
;	preemptive.c:68: isAlive[2] = 0b0100; 
	mov	(_isAlive + 0x0002),#0x04
;	preemptive.c:69: isAlive[3] = 0b1000;
	mov	(_isAlive + 0x0003),#0x08
;	preemptive.c:70: ThreadCreate(main);
	mov	dptr,#_main
	lcall	_ThreadCreate
;	preemptive.c:71: curThread = 0; 
	mov	_curThread,#0x00
;	preemptive.c:72: RESTORESTATE;
	mov	a,_curThread
	add	a, #_savedSP
	mov	r1,a
	mov	_SP,@r1
	pop PSW 
	pop DPH 
	pop DPL 
	pop B 
	pop ACC 
;	preemptive.c:73: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadCreate'
;------------------------------------------------------------
;fp                        Allocated to registers 
;------------------------------------------------------------
;	preemptive.c:82: ThreadID ThreadCreate(FunctionPtr fp) {
;	-----------------------------------------
;	 function ThreadCreate
;	-----------------------------------------
_ThreadCreate:
;	preemptive.c:83: if(mask == 0b1111) return -1;
	mov	a,#0x0f
	cjne	a,_mask,00102$
	mov	dpl, #0xff
	ret
00102$:
;	preemptive.c:114: }
	setb	_ThreadCreate_sloc0_1_0
	jbc	ea,00137$
	clr	_ThreadCreate_sloc0_1_0
00137$:
;	preemptive.c:85: for(i = 0; i < MAXTHREADS; i++) {
	mov	_i,#0x00
00107$:
	mov	a,#0x100 - 0x04
	add	a,_i
	jc	00105$
;	preemptive.c:86: if(((mask) & (0b0001 << i)) == 0) {
	mov	b,_i
	inc	b
	mov	r6,#0x01
	mov	r7,#0x00
	sjmp	00140$
00139$:
	mov	a,r6
	add	a,r6
	mov	r6,a
	mov	a,r7
	rlc	a
	mov	r7,a
00140$:
	djnz	b,00139$
	mov	r4,_mask
	mov	r5,#0x00
	mov	a,r4
	anl	ar6,a
	mov	a,r5
	anl	ar7,a
	mov	a,r6
	orl	a,r7
	jnz	00108$
;	preemptive.c:87: mask |= (0b0001 << i);
	mov	b,_i
	inc	b
	mov	a,#0x01
	sjmp	00143$
00142$:
	add	a,acc
00143$:
	djnz	b,00142$
	orl	_mask,a
;	preemptive.c:88: newThread = i;
	mov	_newThread,_i
;	preemptive.c:89: break;
	sjmp	00105$
00108$:
;	preemptive.c:85: for(i = 0; i < MAXTHREADS; i++) {
	mov	a,_i
	inc	a
	mov	_i,a
	sjmp	00107$
00105$:
;	preemptive.c:93: tmp = SP; // tmp : old thread stack pointer
	mov	_tmp,_SP
;	preemptive.c:94: SP = 0x3F + (i << 4); // SP: new thread stack pointer
	mov	a,_i
	swap	a
	anl	a,#0xf0
	mov	r7,a
	add	a,#0x3f
	mov	_SP,a
;	preemptive.c:104: __endasm;
	push	DPL
	push	DPH
	mov	A, #0
	push	A
	push	A
	push	A
	push	A
;	preemptive.c:106: tmp2 = (i << 3);
	mov	a,_i
	mov	r7,a
	swap	a
	rr	a
	anl	a,#0xf8
	mov	_tmp2,a
;	preemptive.c:110: __endasm;
	push	_tmp2
;	preemptive.c:112: savedSP[newThread] = SP;
	mov	a,_newThread
	add	a, #_savedSP
	mov	r0,a
	mov	@r0,_SP
;	preemptive.c:113: SP = tmp; // let the old thread continue
	mov	_SP,_tmp
	mov	c,_ThreadCreate_sloc0_1_0
	mov	ea,c
;	preemptive.c:115: return newThread;
	mov	dpl, _newThread
;	preemptive.c:116: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadYield'
;------------------------------------------------------------
;	preemptive.c:126: void ThreadYield(void) {
;	-----------------------------------------
;	 function ThreadYield
;	-----------------------------------------
_ThreadYield:
;	preemptive.c:139: }
	setb	_ThreadYield_sloc0_1_0
	jbc	ea,00144$
	clr	_ThreadYield_sloc0_1_0
00144$:
;	preemptive.c:128: SAVESTATE;
	push ACC 
	push B 
	push DPL 
	push DPH 
	push PSW 
	mov	a,_curThread
	add	a, #_savedSP
	mov	r0,a
	mov	@r0,_SP
;	preemptive.c:129: do {
00107$:
;	preemptive.c:130: if(cnt0>(3-speed[difficulty]) && gameState==START){
	mov	a,_difficulty
	mov	dptr,#_speed
	movc	a,@a+dptr
	mov	r7,a
	mov	r6,#0x00
	mov	a,#0x03
	clr	c
	subb	a,r7
	mov	r7,a
	clr	a
	subb	a,r6
	mov	r6,a
	mov	r4,_cnt0
	mov	r5,#0x00
	clr	c
	mov	a,r7
	subb	a,r4
	mov	a,r6
	xrl	a,#0x80
	mov	b,r5
	xrl	b,#0x80
	subb	a,b
	jnc	00102$
	mov	a,#0x34
	cjne	a,_gameState,00102$
;	preemptive.c:131: curThread=0;
	mov	_curThread,#0x00
;	preemptive.c:132: cnt0=0;
	mov	_cnt0,#0x00
	sjmp	00103$
00102$:
;	preemptive.c:134: curThread = (curThread==1) ? 2 : 1;
	mov	a,#0x01
	cjne	a,_curThread,00112$
	mov	r7,#0x02
	sjmp	00113$
00112$:
	mov	r7,#0x01
00113$:
	mov	_curThread,r7
00103$:
;	preemptive.c:136: if(mask & isAlive[curThread]) break;
	mov	a,_curThread
	add	a, #_isAlive
	mov	r1,a
	mov	a,@r1
	mov	r7,a
	anl	a,_mask
	jz	00107$
;	preemptive.c:138: RESTORESTATE;
	mov	a,_curThread
	add	a, #_savedSP
	mov	r1,a
	mov	_SP,@r1
	pop PSW 
	pop DPH 
	pop DPL 
	pop B 
	pop ACC 
	mov	c,_ThreadYield_sloc0_1_0
	mov	ea,c
;	preemptive.c:140: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'myTimer0Handler'
;------------------------------------------------------------
;	preemptive.c:146: void myTimer0Handler(){
;	-----------------------------------------
;	 function myTimer0Handler
;	-----------------------------------------
_myTimer0Handler:
;	preemptive.c:147: cnt0++;
	mov	a,_cnt0
	inc	a
	mov	_cnt0,a
;	preemptive.c:150: __endasm;
	reti
;	preemptive.c:151: }
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
_speed:
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)

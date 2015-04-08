#************************************************************* ## ECE 344L - Microprocessors - Spring 2015## Name: Matthew James Greci##     Laboratory Number: 1     Due Date: February 3, 2015### Lab Group:### #*************************************************************** ## This program solves Problem 2. Place the values 0x11FFEEDD, # 0x22EEDDCC,… into memory using the .long directive. Then load# the values into registers using load word, load halfword, and# load byte (lw, lh, lb).## #***************************************************************
#include <p32xxxx.h>

.global main

.data

.text

.set noreorder

.ent main

data: 
	.long 0x11FFEEDD
	.long 0x22EEDDCC
	.long 0x33DDCCBB
	.long 0x44CCBBAA
	.long 0x55BBAA99
	.long 0x66AA9988
	.long 0x77998877
	.long 0x88887766
main:
	#Problem 2
	#clear out registers
	nop
	and t0, t0, zero
	and t1, t1, zero
	and t2, t2, zero
	and t3, t3, zero
	and t4, t4, zero
	and t5, t5, zero
	and t6, t6, zero
	and t7, t7, zero
	nop	
	#load address of data into s0
	la s0, data
	nop
	#load words into t0-t7
	lw t0, 0x00(s0)
	lw t1, 0x04(s0)
	lw t2, 0x08(s0)
	lw t3, 0x0C(s0)
	lw t4, 0x10(s0)
	lw t5, 0x14(s0)
	lw t6, 0x18(s0)
	lw t7, 0x1C(s0)
	nop
	#clear out registers
	and t0, t0, zero
	and t1, t1, zero
	and t2, t2, zero
	and t3, t3, zero
	and t4, t4, zero
	and t5, t5, zero
	and t6, t6, zero
	and t7, t7, zero
	nop
	#load halfwords into t0-t7
	#loads least significant halfword (2 bytes) and sign extends
	lh t0, 0x00(s0)
	lh t1, 0x04(s0)
	lh t2, 0x08(s0)
	lh t3, 0x0C(s0)
	lh t4, 0x10(s0)
	lh t5, 0x14(s0)
	lh t6, 0x18(s0)
	lh t7, 0x1C(s0)
	nop
	#clear out registers
	and t0, t0, zero
	and t1, t1, zero
	and t2, t2, zero
	and t3, t3, zero
	and t4, t4, zero
	and t5, t5, zero
	and t6, t6, zero
	and t7, t7, zero
	nop
	#load bytes into t0-t7
	#loads least significant byte and sign extends
	lb t0, 0x00(s0)
	lb t1, 0x04(s0)
	lb t2, 0x08(s0)
	lb t3, 0x0C(s0)
	lb t4, 0x10(s0)
	lb t5, 0x14(s0)
	lb t6, 0x18(s0)
	lb t7, 0x1C(s0)
	nop
	nop
	#forever loop
	b loop
	nop
loop:
	b loop
	nop
.end main
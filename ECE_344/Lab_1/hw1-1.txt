#************************************************************* ## ECE 344L - Microprocessors - Spring 2015## Name: Matthew James Greci##     Laboratory Number: 1     Due Date: February 3, 2015### Lab Group:### #*************************************************************** ## This program solves Problem 1. Load the values 0x11FFEEDD, 0x22EEDDCC,…# into 8 registers. Then store these values into memory using store# word, store halfword, and store byte (sw, sh, sb)### #***************************************************************
#include <p32xxxx.h>

.global main

.data

.text

.set addra, 0xA0000400

.set noreorder

.ent main
main:
	#Problem 1
	#load values into registers t0-t7
	li t0, 0x11FFEEDD
	li t1, 0x22EEDDCC
	li t2, 0x33DDCCBB
	li t3, 0x44CCBBAA
	li t4, 0x55BBAA99
	li t5, 0x66AA9988
	li t6, 0x77998877
	li t7, 0x88887766
	#load address (0xA0000400) into s0
	la s0, addra
	nop
	#store values of registers t0-t7
	#as words into memory where s0 points (with offset)
	sw t0, 0x00(s0)
	sw t1, 0x04(s0)
	sw t2, 0x08(s0)
	sw t3, 0x0C(s0)
	sw t4, 0x10(s0)
	sw t5, 0x14(s0)
	sw t6, 0x18(s0)
	sw t7, 0x1C(s0)
	nop
	#store values of registers t0-t7
	#as halfwords into memory where s0 points (with offset)
	#sh stores least significant halfword (2 bytes) into lowest address
	sh t0, 0x20(s0)
	sh t1, 0x24(s0)
	sh t2, 0x28(s0)
	sh t3, 0x2C(s0)
	sh t4, 0x30(s0)
	sh t5, 0x34(s0)
	sh t6, 0x38(s0)
	sh t7, 0x3C(s0)
	nop
	#store values of registers t0-t7
	#as bytes into memory where s0 points (with offset)
	#sb stores least significant Byte into lowest address
	sb t0, 0x40(s0)
	sb t1, 0x44(s0)
	sb t2, 0x48(s0)
	sb t3, 0x4C(s0)
	sb t4, 0x50(s0)
	sb t5, 0x54(s0)
	sb t6, 0x58(s0)
	sb t7, 0x5C(s0)
	nop
	nop
	#forever loop
	b loop
	nop
loop:
	b loop
	nop
.end main
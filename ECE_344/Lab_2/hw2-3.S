#************************************************************* ## ECE 344L - Microprocessors - Spring 2015## Name: Matthew James Greci##     Laboratory Number: 2             Due Date: 24 February 2015### Lab Group:### #*************************************************************** ## This problem rotates LEDs on a board. Pressing one of the two
# buttons on the board will change the direction, or keep it the
# same. The LEDs change at about half second intervals.# #***************************************************************
#include <p32xxxx.h>
.global main
.data
.text
.set noreorder
.ent main

main:
  	nop  #point PC here
	la s0, 0xBF880000   #load base address of ports
        nop                 #access addresses with offsets from here
	sw zero, 0x6100(s0) #clear TRISE
	sw zero, 0x6130(s0) #clear OCDE
	#initial setup, direction is left
	#t0 is direction reg (0 is left, otherwise right)
	li t0, 0
	#load value into reg (t1)
	#0x01 == 0000 0001
	li t1, 0x01
mainloop:
	#start half second loop
	li t9, 0x20000
loop:
	addi t9, t9, -1
	bgez t9, loop
	nop
	#end of half second loop
	sw t1, 0x6110(s0)    store pattern (t1) to LEDs (PORTE)
	lw t2, 0x6010(s0)    #load value of PORTA into t2
	#determine direction based on regs values
	#0xC63F (3 = 0011) = none
	#0xC67F (7 = 0111) = Left button
	#0xC6BF (B = 1011) = Right button
	#0xC6FF (F = 1111) = Both button
	andi t3, t2, 0x0040  #left button on, shift left
	andi t4, t2, 0x0080  #right button on, shift right
	#shift left
	bgtz t3, shiftLeft
	nop
	#shift right
	bgtz t4, shiftRight
	nop
	#no button pushed, check t0 to continue in current direction
	#(t0 == 0), shift left
	beq t0, zero, shiftLeft
	nop
	#otherwise (t0 != 0), shift right
	b shiftRight
	nop
shiftRight:
	#direction is right
	li t0, 1
	#shift pattern (t1) right by 1
	srl t1, 1
	#start loop again if t1 != 0 (valid pattern)
	bne t1, zero, mainloop
	nop
	#otherwise t1 not valid, set value to 0x80
	li t1, 0x80
	#then start loop again
	b mainloop
	nop
shiftLeft:
	#direction is left
	li t0, 0
	#shift pattern (t1) left by 1
	sll t1, 1
	#test if pattern (t1) > 0x100
	sub t2, t1, 0x100
	#start loop again since t1 is a valid pattern
	bltz t2, mainloop
	nop
	#otherwise t1 not valid, set value to 0x01
	li t1, 0x01
	#then start loop again
	b mainloop
	nop

	#program never ends

.end main
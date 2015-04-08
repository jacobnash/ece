#************************************************************* ## ECE 344L - Microprocessors - Spring 2015## Name: Matthew James Greci##     Laboratory Number: 2             Due Date: 24 February 2015### Lab Group:### #*************************************************************** ## This problem shows how to implement an if/else statement in# assembly language. Multiple test values are used and the result# (W) is written into memory.## #***************************************************************
#include <p32xxxx.h>
.global main
.data
.text
.set noreorder
.set addrw, 0xA0000400
.ent main

valuesA:
	.long 10
	.long 3
	.long 5
	.long -10
	.long -3
	.long -5
valuesB:
	.long 3
	.long 10
	.long 5
	.long -3
	.long -10
	.long -5
valueX:
	.long 15
valueY:
	.long 5
main:
  	nop  #point PC here
	#clear registers
	and s0, s0, zero  #s0 is A address
	and s1, s1, zero  #s1 is B address
	and s2, s2, zero  #s2 is W address
	and s3, s3, zero  #s1 is X address
	and s4, s4, zero  #s2 is Y address
	and t0, t0, zero  #t0 is X
	and t1, t1, zero  #t1 is Y
	and t2, t2, zero  #t2 is A
	and t3, t3, zero  #t3 is B
	and t4, t4, zero  #t4 is W
	and t5, t5, zero  #t5 is loop counter
	and t6, t6, zero  #t6 is temp storage
	nop
	#place addresses into s regs
	la s0, valuesA  #address of values for A
	la s1, valuesB  #address of values for B
	la s2, addrw    #address of values for W
	la s3, valueX
	la s4, valueY
	nop
	#load X and Y values from memory
	lw t0, 0x00(s3)    #t0 = X = 15
	lw t1, 0x00(s4)    #t1 = Y = 5
	#create loop counter
	li t5, 6         #loop 6 times
loop:
	lw t2, 0x00(s0)  #t2 is A
	lw t3, 0x00(s1)  #t3 is B
	addi s0, s0, 4   #increment address for A
	addi s1, s1, 4   #increment address for B
	sub t5, t5, 1    #decrement loop counter by 1
	#perform test
	sub t6, t2, t3  #t6 = A-B
	bgtz t6, true   #branch to true if A-B > 0 is TRUE
	nop             
	nop             #otherwise fall into false
	nop             #A =< B is considered false since 0>0 is false
	nop             #for the case when A == B, this goes to false. 
	false:
		add t4, t0, t1  #t4 = t0 + t1 (W = X + Y)
		b done
		nop
	true:
		sub t4, t0, t1  #t4 = t0 - t1 (W = X - Y)
	done:
		nop
		#t4 is value of W
		#W = 20 (0x14) means false
		#W = 10 (0x0A) means true
		sw t4, 0x00(s2)
		addi s2, s2, 4  #increment s2 (address) by 4 bytes = 32 bits
		bgtz t5, loop   #loop again if loop counter > 0
		nop
		nop
		nop
		#output at 0xA0000400 should be:
		# 10>3, 3>10, 5>5, -10>-3, -3>-10, -5>-5     
		#    T,    F,   F,      F,      T,     F  (Bool)
		#    A,   14,  14,     14,      A,    14  (Hex)
		#otherwise program fully done, forever loop
		b floop
		nop
floop:
	nop
	b floop
	nop
.end main
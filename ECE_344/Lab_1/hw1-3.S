#************************************************************* ## ECE 344L - Microprocessors - Spring 2015## Name: Matthew James Greci##     Laboratory Number: 1   Due Date: February 3, 2015### Lab Group:### #*************************************************************** ## This program solves Problem 3. Create a place in memory to hold
# two values. Then perform addition, subtraction, AND, and NAND on# the values and store the results in memory.### #***************************************************************
#include <p32xxxx.h>

.global main

.data

.text 

.set noreorder

.ent main

data:
	.long 0xEF6587CD
	.long 0x1234AE57

main:
	#Problem 3
	#clear registers
	and s0, s0, zero
	and t0, t0, zero
	and t1, t1, zero
	and t2, t2, zero
	and t3, t3, zero
	and t4, t4, zero
	and t5, t5, zero
	and t6, t6, zero
	and t7, t7, zero
	nop
	la s0, data     #load address of data into s0
	lw t0, 0x00(s0) #load first value into t0
	lw t1, 0x04(s0) #load second value into t1
	nop
	#start operations
	ADD t2, t0, t1   #add words to t2 (t2=ADD)
	SUB t3, t0, t1   #subtract words (t3=SUB)
	AND t4, t0, t1   #AND words (t4=AND)
	#nor to And words
	NOR t5, t0, t0   #NOR t0 and t0 into t5 (temp register)
	NOR t6, t1, t1   #NOR t1 and t1 into t6 (temp register)
	NOR t7, t5, t6   #NOR t5 and t6 into t7 (t7=AND)
	NOR t6, t7, t7   #NOR t7 and t7 into t6 (t6=NAND)
	#t7 and t4 are logical AND
	#t6 is logical NAND
	nop
	nop
	#forever loop
	b loop
	nop	
loop:
	b loop
	nop
.end main 

#************************************************************* ## ECE 344L - Microprocessors - Spring 2015## Name: Matthew James Greci##     Laboratory Number: 1   Due Date: February 3, 2015### Lab Group:### #*************************************************************** ## This program solves Problem 4. Create a simple loop that stores 
# the values, starting from 0x1101, increasing by 7 in 100
# consecutive places in memory values and store the results in
# memory.## #***************************************************************
#include <p32xxxx.h>

.global main

.data
	
.text 

.set noreorder
.set addra, 0xA0000400

.ent main

main: 
	#clear registers
	and s0,s0,zero
	and s1,s1,zero
	and s2,s2,zero
	nop
	#load addra (0xA0000400) into s0
	la s0, addra  #Starting Address
	li s1, 0x1101 #value to store
	li s2, 100    #loop counter 
	nop
	loop:
		nop
		sw s1,0x00(s0) #Store value (s1) into s0 address
		addiu s1, 7    #add 7 to s1 (value)
		addi s0, 0x04  #increment s0 by 4 bytes (32 bits)
		addiu s2, -1   #decrement s2 (loop counter) 
		bgtz s2, loop  #branch if s0 > 0
		nop
		nop
		#forever loop
	floop:
		b floop
		nop
.end main 

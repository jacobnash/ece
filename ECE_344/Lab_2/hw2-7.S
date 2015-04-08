#************************************************************* ## ECE 344L - Microprocessors - Spring 2015## Name: Matthew James Greci##     Laboratory Number: 2             Due Date: 24 February 2015### Lab Group:### #*************************************************************** ## This problem runs what is equivalent to:
# int x = 1234567;
# printf(“%d”, x);
# in the C language.
# The input value is stored as a hexadecimal number and is converted
# to base 10, one digit at a time, so that each digit can be printed
# (by transmitting via UART).# #***************************************************************
#include <p32xxxx.h>
.global main
.data
.text
.set noreorder
.ent main

input:
	.long 1234567
main:
    	nop                     	# point PC here
    	# UART Setup
    	la s0,0xBF800000        	# base address for UART
    	li t1,0x20              	# t1 is temp storage
    	sw t1,0x6240(s0)        	# 0x20 (baud=19200) -> U2BRG (offset 6240)
    	sw zero,0x6210(s0)      	# clear U2STA (offset 6210)
    	li t1,0x8B00            	# set bits 15(ON) 11(RTSMD) 9:8 (UEN)
    	sw t1,0x6200(s0)        	# 0x8B00 -> MODE (offset=6200)
    	li t1,0x1400            	# set bits 10,12 (UTXEN, URXEN) on
    	sw t1,0x6218(s0)        	# 0x1400 -> U2STA SET reg address
	# Load input value
	la t0, input            	# t0 points to address of input value
	lw t1,0x00(t0)          	# t1 = value at t0 (value at input label) as a hex
    	# check sign of input (t1)
	bgtz t1, divide			# t1 > 0, do normal divide
	nop				# otherwise continue to negative
	# the goal of 'divide' is to determine where to start printing
	# take the input (t1) and divide by a base 10 and place into t2
	# any time t2 > 0, we want to start printing at this base of 10
negative:
	li t2,0x2D			# ASCII negative sign (-)
    	lw t5,0x6210(s0)     		# (status) U2STA (6210) -> t5
   	andi t5,t5,0x200     		# check transmit status
    	bne t5,zero,neg 		# cannot transmit now (try again)
    	nop                  		# otherwise continue
	sw t2,0x6220(s0)		# transmit char (-)
	mul t1,t1,-1		    	# change the number to a positive
	nop                     	# continue as normal
divide:
	div t2,t1,1000000000   		# check billions place
	bgtz t2, billion        	# branch to find and print digit
	nop						# otherwise continue
	div t2,t1,100000000		# check hundred millions place
	bgtz t2, hmillion   		# branch to find and print digit      
	nop						# otherwise continue
	div t2,t1,10000000		# check ten millions place
	bgtz t2, tmillion
	nop
	div t2,t1,1000000		# check millions place
	bgtz t2, million
	nop
	div t2,t1,100000		# check hundred thousands place
	bgtz t2, hthousand
	nop
	div t2,t1,10000			# check ten thousands place
	bgtz t2, tthousand
	nop
	div t2,t1,1000			# check thousands place
	bgtz t2, thousand
	nop
	div t2,t1,100			# check hundreds place
	bgtz t2, hundred
	nop
	div t2,t1,10			# check tens place
	bgtz t2, ten
	nop
	div t2,t1,1			# check ones place
	bgtz t2, one
	nop
	b zero	                 	# value == 0, print ‘0’
	nop
billion:                    
   	div t2,t1,1000000000  		# divide for billion place
   	mflo t3                		# copy lo register to t3
   	mfhi t4      			# copy hi register to t4
   	bal print			# print char
   	nop
hmillion:   
   	div t2,t1,100000000		# divide for hundred million place
   	mflo t3				# copy lo register to t3
   	mfhi t4 			# copy hi register to t4
   	bal print			# print char
   	nop
tmillion:   									
   	div t2,t1,10000000		# divide for ten million place
   	mflo t3				# copy lo register to t3
   	mfhi t4				# copy hi register to t4
   	bal print			# print char
   	nop
million:
   	div t2,t1,1000000		# divide for million place
   	mflo t3				# copy lo register to t3
   	mfhi t4 			# copy hi register to t4
   	bal print			# print char
   	nop
hthousand:   			
   	div t2,t1,100000		# divide for hundred thousand place
   	mflo t3				# copy lo register to t3
   	mfhi t4 			# copy hi register to t4	
   	bal print			# print char
   	nop
tthousand:   			
   	div t2,t1,10000			# divide for ten thousand place
   	mflo t3				# copy lo register to t3
   	mfhi t4				# copy hi register to t4
   	bal print			# print char
   	nop
thousand:				
   	div t2,t1,1000			# divide for thousand place
   	mflo t3				# copy lo register to t3
   	mfhi t4 			# copy hi register to t4
	bal print			# print digit
   	nop
hundred:				
	div t2,t1,100			# divide for hundred place
	mflo t3				# copy lo register to t3
	mfhi t4				# copy hi register to t4
	bal print			# print char
	nop
ten:					
	div t2,t1,10			# divide for ten place
	mflo t3				# copy lo register to t3
	mfhi t4 			# copy hi register to t4
	bal print			# send the PC to the print for this digit
	nop
one:   				
	div t2,t1,1			# divide for one place
	mflo t3                		# copy lo register to t3
	mfhi t4                 	# copy hi register to t4
	nop				# send remainder (t4), 1 is lowest base 10
	addi t4,t4,0x30			# convert to ASCII
	sw t4,0x6220(s0)     		# transmit char
	b floop 			# DONE
	nop
zero:
	li t2, 0x30 			# 0x30 is ‘0’ in ASCII
	sw t2, 0x6220(s0)		# transmit char
	b loop				# DONE
	nop
print:
	addi t3,t3,0x30   		# convert to ASCII
	sw t3,0x6220(s0)   		# transmit char
	li t1, 0         		# clear t1
	add t1, t1, t4 	    		# copy t4 to t1
	li t9, 0x1000           	# loop counter for delay between transmissions
delayLoop: 				# delay loop between transmissions
	addi t9, t9, -1
	bgtz t9, delayLoop
	nop
	jr ra                  		# return from subroutine          
	nop
floop:
	nop                     # DONE
.end main
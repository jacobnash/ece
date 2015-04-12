#include <p32xxxx.h>
.global main
.data
.text
.set noreorder
.set mbox, 0xA0000500
.ent main

main:
	nop						#point PC here
	#Clear Mailbox
	sw zero, mbox
	#Initialize UART
	li t1, 0x20				#Set up baud rate
   	sw t1, U1BRG			#Store baud rate bits
   	li t1, 0x8B00			#Set enable bits
   	sw t1, U1MODE			#Store enable bits
   	li t1, 0x1400			#Set UART enable bits
   	sw t1, U1STA			#Store to UART1 SET
	#Initialize Interupts
	li t1, 0x9FC01000		#Setup ebase address = 9FC01000
	MTC0 t1, $15, 1			#Store ebase address to co-prossesor
	li t1, 0x20 			#Set vector spacing
	MTC0 t1, $12, 1			#Configure vector spacing
	sw zero, IFS0			#Clear IFS0
	sw zero, IFS1			#Clear IFS1
	sw zero, IEC0			#Clear IEC0
	sw zero, IEC1			#Clear IEC1
	li t1, 0x1A
	sw t1, IPC6				#Set UART1 priority
	li t1, 0x08000000		#U1RX enable bit
	sw t1, IEC0				#Store RX interupt enable bits
	li t1, 0x1000			#Bit pattern for multivector
	sw t1, INTCON			#Enable multivector
	ei 						#Enable Interrupts

	#jump to print_string
	#jal print_string
	#nop

busy:
	lw s1, mbox				#Load mailbox
	bgtz s1, print			#Print if something is there
	nop
	b busy					#Otherwise loop again
	nop
print:
	sw t9, U1TXREG			#Put char in TX register
	sw zero, mbox			#Clear mailbox
	b busy					#Go back to busy loop
	nop
.end main
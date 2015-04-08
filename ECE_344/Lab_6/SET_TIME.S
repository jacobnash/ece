#include <p32xxxx.h>
.global main
.data
.set mbox, 0xA0000300
.text
.ent main

main:
	nop						#point PC here
	#Clear Mailbox
	sw zero, mbox
	#Initialize Timer 1
	#sw zero, TMR1			#Clear Timer 1
	#li t1, 0x2000
	#sw t1, PR1				#Store Period 
	#li t1, 0x8070
	#sw t1, T1CON			#Enable Timer 1
	#Initialize Timer 2
	#sw zero, TMR2			#Clear Timer 2
	#li t1, 0x4000
	#sw t1, PR2				#Store Period 
	#li t1, 0x8070			
	#sw t1, T2CON			#Enable 
	#Initialize UART
	li t1, 0x20				#Set up baud rate
   	sw t1, U2BRG			#Store baud rate bits
   	li t1, 0x8B00			#Set enable bits
   	sw t1, U2MODE			#Store enable bits
   	li t1, 0x1400			#Set UART enable bits
   	sw t1, U2STA			#Store to UART2 SET
	#Initialize Interupts
	li t1, 0x9FC01000		#Setup ebase address = 9FC01000
	MTC0 t1, $15, 1			#Store ebase address to co-prossesor
	li t1, 0x20 			#Set vector spacing
	MTC0 t1, $12, 1			#Configure vector spacing
	sw zero, IFS0			#Clear IFS0
	sw zero, IFS1			#Clear IFS1
	sw zero, IEC0			#Clear IEC0
	sw zero, IEC1			#Clear IEC1
	#li t1, 0x19
	#sw t1, IPC1         	#Set Timer1 priority
	#li t1, 0x1A
	#sw t1, IPC2         	#Set Timer2 priority
	li t1, 0x1B
	sw t1, IPC8				#Set UAR2T priority 
	li t1, 0x1000			#Bit pattern for multivector
	sw t1, INTCON			#Enable multivector
	#li t1, 0x0110			#Timer 1 and 2 enable bits
	#sw t1, IEC0      		#Enable Timer 1 and 2 interrupts
	li t1, 0x0200			#U2RX enable bit
	sw t1, IEC1				#Store RX interupt enable bits
	ei 						#Enable Interrupts

	#jump to printString
	jr printString
	nop
	
busy:
	lw s1, mbox			#Load mailbox
	bgtz s1, print			#Print if something is there
	nop
	b busy				#Otherwise loop again
	nop
print:
	sw t9, U2TXREG			#Put char in TX register
	sw zero, mbox			#Clear mailbox
	b busy				#Go back to busy loop
	nop
.end main

#include <p32xxxx.h>
.global main
.data
.set mailbox, 0xA0000300
.text
.ent main 

main:
	nop					#point PC here
	#Clear Mailbox
	sw zero, mailbox
	#Initial PORTB
	sw zero, TRISB
	sw zero, ODCB
	li a0, 0x2000				#Initialize bit pattern (LD4 on)
	sw a0, PORTB
	#Initialize PORTE
	sw zero, TRISE
	sw zero, ODCE
	li a1, 0x80				#Initialize bit pattern (LD7 on)
	sw a1, PORTE
	#Initialize Timer 1
	sw zero, T1CON				#Enable T1CON
	sw zero, TMR1				#Clear timer 1
	li t1, 0x1C00				#Set Period 
	sw t1, PR1				#Store Period 
	li t1, 0x8070				#
	sw t1, T1CON				#
	#Initialize Timer 2
	sw zero, T2CON				#Enable T2CON
	sw zero, TMR2				#Clear timer 2
	li t1, 0x3800				#Set Period 
	sw t1, PR2				#Store Period 
	li t1, 0x8070				#
	sw t1, T2CON				#
	#Initialize UART
	li t1, 0x20			#Set up baud rate            		
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
	li t1, 0x19		    	#Load Timer 1 priority
	sw t1, IPC1         		#Set Timer 1 priority	
	li t1, 0x1A		    	#Load Timer 2 priority
	sw t1, IPC2         		#Set Timer 2 priority	
	li t1, 0x1B			#Load UART priority
	sw t1, IPC8			#Set UART priority 
	li t1, 0x1000			#Bit pattern for multivector
	sw t1, INTCON			#Store pattern for multivector
	li t1, 0x0110			#Timer 1 and 2 interupt bits
	sw t1, IEC0      		#Enable Timer 1 and 2 interupt
	li t1, 0x0200			#Enable RX interupt
	sw t1, IEC1			#Store RX interupt enable bits
	ei 				#Enable Interrupts
home:
	lw s1, mailbox
	bgtz s1, print 
	nop
	b home
	nop
print:
	sw t9, U2TXREG			#Put char in TX register
	sw zero, mailbox		#Clear mailbox
	b home				#Branch back to LED rotation
	nop
.end main

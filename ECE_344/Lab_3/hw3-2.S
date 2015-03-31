#include <p32xxxx.h>
.global main
.data
.set mailbox, 0xA0000300
.text
.ent main 

main:
	#Clear Mailbox
	sw zero, mailbox
	# Initial PORTB
	sw zero, TRISB
	sw zero, ODCB
	li a3, 0x2000				#bit pattern
	sw a3,PORTB
	#Initialize PORTE
	sw zero, TRISE
	sw zero, ODCE
	li a2, 0x80				#bit pattern
	sw a2, PORTE
	#initialize Timer1
	sw zero, T1CON				#enable T1CON
	sw zero, TMR1               # clear timer 1
	li t1, 0x00001C00			#set Period 
	sw t1, PR1					#Store Period 
	li t1, 0x8070              
	sw t1, T1CON

#initialize Timer2
	sw zero, T2CON				#enable T2CON
	sw zero, TMR2               # clear timer 2
	li t1, 0x00003800			#set Period 
	sw t1, PR2					#Store Period 
	li t1, 0x8070              
	sw t1, T2CON

#Initialize UART
	lui s0,0xBF80               #usefull base address
    ori k0, zero, 0x20          #set up baud rate            		
   	sw k0, U2BRG         		#store baud rate bits
   	sw zero, U2STA        		#clear UART status
   	li s2, 0x8B00          		#set enable bits
   	sw s2, U2MODE         		#store enable bits
   	li s3, 0x1400          		#set UART enable bits
   	sw s3, 0x6218(s0)         	#store to UART2 SET
	#Initialize Interupts 
	li t0, 0xBF880000		#Base address				
	li t2, 0x9FC01000		#Setup ebase address = 9FC01000
	MTC0 t2, $15, 1			#Store ebase address to co-prossesor
	li t2, 0x20 			#Set vector spacing
	MTC0 t2, $12, 1			#Configure vector spacing
	sw zero, IFS0			#Clear IFS0
	sw zero, IFS1			#Clear IFS1
	sw zero, IEC0			#Clear IEC0
	sw zero, IEC1			#Clear IEC1
	li t2, 0x19		    	#Load Timer 1 priority
	sw t2, IPC1         		#Set Timer 1 priority	
	li t2, 0x1A		    	#Load Timer 2 priority
	sw t2, IPC2         		#Set Timer 2 priority	
	li t2, 0x1B			#Load UART priority
	sw t2, IPC8			#Set UART priority 
	li t2, 0x1000			#Bit pattern for multivector
	sw t2, INTCON			#Store pattern for multivector
	li t2, 0x0110			#Timer 1 and 2 interupt bits
	sw t2, IEC0      		#Enable Timer 1 and 2 interupt
	li t2, 0x0200			#Enable RX interupt
	sw t2, IEC1      		#Store RX interupt enable bits
	ei 				#Enable Interrupts
home:
	lw s1, mailbox
	bgtz s1,  print 
	nop
	b home
print:
	sw t9, U2TXREG			#put char in TX register
	sw zero, mailbox		#clear mailbox
	b home				#branch back to LED rotation
	nop 
.end main

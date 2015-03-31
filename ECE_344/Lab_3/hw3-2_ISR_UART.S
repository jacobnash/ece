#include <p32xxxx.h>
						
.global ISR_UART
.text
.set noreorder
.set MailBox, 0xA0000500
.ent ISR_UART

ISR_UART:
	sw zero, IFS1		#Clear interrupt flag
	lw t9, U2RXREG		#Retrieve char from RX register
	sw t9, MailBox		#Store char in mailbox
	eret			#Return to main
	nop	
.end ISR_UART

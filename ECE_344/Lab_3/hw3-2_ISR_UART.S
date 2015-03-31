#include <p32xxxx.h>
						
.global ISR_UART
.text
.set noreorder
.set MailBox, 0xA0000500
.ent ISR_UART

ISR_UART:
	lw t9, U2RXREG		#retrieve char from RX register
	sw t9, MailBox  	#store char in mailbox
	sw zero, IFS1		#clear flag
	nop			
	eret				#return to main
	nop	
.end ISR_UART

#include <p32xxxx.h>
.global ISR_UART
.text
.set noreorder
.set mbox, 0xA0000300
.ent ISR_UART

ISR_UART:
	sw zero, IFS1		#clear flag
	lw t9, U2RXREG		#retrieve char from RX register
	sw t9, mbox  		#store char in mailbox
	eret				#return to SET_TIME
	nop	
.end ISR_UART

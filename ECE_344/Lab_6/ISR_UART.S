#include <p32xxxx.h>
.global ISR_UART
.data
.text
.set noreorder
.set mbox, 0xA0000500
.ent ISR_UART

ISR_UART:
	sw zero, IFS0		#clear flag
	lw t9, U1RXREG		#retrieve char from RX register
	sw t9, mbox  		#store char in mailbox
	eret				#return to SET_TIME
	nop
.end ISR_UART
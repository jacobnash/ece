#include <p32xxxx.h>

.global ISR_UART

.data

.text

.ent ISR_UART
						
ISR_UART:
	li t0, 0x200	
	sw t0, IFS1CLR		#clear the UART interrupt flag
check_rx:
	lw t2, U2RXREG
	sw t2, 0x00(t3)
    addi t3, t3, 8						
check_tx: 	
	lw t0, U2STA		
	andi t0, t0, 0x200	
	beq t0, s1, check_tx	
	nop
	sw t2, U2TXREG
    sw t2, 0x00(t4)
    addi t4, t4, 8		
	b home			
	nop

home:
	eret
	nop
	
.end ISR_UART

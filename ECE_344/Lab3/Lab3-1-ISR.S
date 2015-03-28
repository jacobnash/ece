#include <p32xxxx.h>
.global ISR_UART
.data
.text
.ent ISR_UART				
ISR_UART:
    li t1, 0x200            #clear the UART interrupt flag (bit 9)
    sw t1, IFS1CLR    
check_rx:
    lw t1, U2RXREG          #load char from Rx reg
    sw t1, 0x00(s2)         #place char into mailbox one
    addi s2, s2, 4          #increament base pointer
check_tx: 	
    lw t1, U2STA            #load status -> t1
    andi t1, t1, 0x200	    #check if bit 9 is on (can send char)
    beq t1, zero, check_tx  #loop again if not able to transmit
    nop                     #otherwise continue
    sw t1, U2TXREG          #transmit char
    sw t1, 0x00(s3)         #save char to mailbox two
    addi s3, s3, 4          #increment mailbox two
    eret                    #return PC to where interupt occured
    nop
.end ISR_UART

#include <p32xxxx.h>
.global PRINT_CHAR_X_Y
.data
.text
.set noreorder
.ent PRINT_CHAR_X_Y
.set TO_PRINT, 0xA0000400

#0x1B = ESC
#0x5B = '['
#0x3B = ';'
#0x68 = 'h'

PRINT_CHAR_X_Y:
	li s0, 0
	or s0, s0, ra

	la s1, TO_PRINT

    #Send escape sequence via TXREG
    li t1, 0x1B          # ESC
	bal transmit
	nop
	 #Send escape sequence via TXREG
    li t1, 0x5B          # [
	bal transmit
	nop

	lb t1, 0(s1)
	bal transmit
	nop

	lb t1, 1(s1)
	bal transmit
	nop
 	#Send escape sequence via TXREG
    li t1,0x3B          # ;
	bal transmit
	nop

	lb t1, 2(s1)
	bal transmit
	nop

	lb t1, 3(s1)
	bal transmit
	nop

	#Send escape sequence via TXREG
    li t1,0x6B          # h
	bal transmit
	nop

	#Send char
	lb t1, 4(s1)
	bal transmit
	nop

	jr s0
	nop
transmit:
	li s2, 0
	or s2, s2, ra
	lw t0,U1STA		     # U1STA (status)
    andi t0,t0,0x200     # check if able to transmit
    bne t0,zero,transmit # cannot transmit now, try again
    nop                  # otherwise continue
    sw t1,U1TXREG	     # char -> U1TXREG
	jr s2                # return
	nop

.end PRINT_CHAR_X_Y

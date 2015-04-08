#include <p32xxxx.h>
.global print_string
.data
.text
.ent print_string

string:
	.ASCIZ “Please enter the time in 24 hour format (HH:MM): ”
print_string:
	la t0, string        # address of string -> t0
	li t3, 0             # clear t3
	and t3, t3, ra       # copy ra into t3
loadChar:
	#Send each char from the address pointed by t0
	lb t1, 0(t0)         # load char into t1
	beq t1, zero, t3     # t1 == 0 (NULL), done sending chars
	nop                  # otherwise continue (more chars to send)
	bal printChar        # start subroutine ‘printChar’
	nop
	#return from printChar here
	addi t0, t0, 1       # increment t0 pointer
	b loadChar           # load next char
	nop
printChar: 
	lw t2,U2STA            # (status) U2STA (6210) -> t2
	andi t2, t2, 0x200     # check transmit status
	bne t2,zero,printChar  # cannot transmit now, try again
	nop                    # otherwise continue
	sb t1,U2TXREG          # char (t1) -> U2TXREG (6220)
	jr ra                  # return to ‘return from printChar here’
	nop
.end mprint_string

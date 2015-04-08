#************************************************************* ## ECE 344L - Microprocessors - Spring 2015## Name: Matthew James Greci##     Laboratory Number: 2             Due Date: 24 February 2015### Lab Group:### #*************************************************************** ## This problem continually transmits a single character for the 
# purpose of viewing the waveform on an oscilloscope. Sketches
# are made of the resulting output.# #***************************************************************
#include <p32xxxx.h>
.global main
.text
.set noreorder
.ent main

#0x20 = ' '
#0x2A = '*'
#0x30 = '0'
#0x38 = '8'
#0x40 = '@'
#0x55 = 'U'
#0x70 = 'p'
main:
    nop                  # point PC here
    # UART Setup
	li t1,0x20           # t1 is used multiple times as temp storage
    sw t1,U2BRG		     # 0x20 (baud=19200) -> U2BRG (offset 6240)
    li t1,0x1400         # set bits 10,12 (UTXEN, URXEN) on
    sw t1,U2STA     	 # 0x1400 -> U2STA SET reg address
    li t1,0x8B00         # set bits 15(ON) 11(RTSMD) 9:8 (UEN)
    sw t1,U2MODE     	 # 0x8B00 -> MODE (offset=6200)
trans:
    #Send char via TXREG
    li t2,0x2A          # character to send
    lw t1,U2STA		     # (status) U2STA (6210) -> t1
    andi t1,t1,0x200     # check if able to transmit
    bne t1,zero,trans    # cannot transmit now, try again
    nop                  # otherwise continue
    sw t2,U2TXREG	     # char -> U2TXREG (6220)
    b trans
    nop
.end main

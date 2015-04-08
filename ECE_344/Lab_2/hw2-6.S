#************************************************************* ## ECE 344L - Microprocessors - Spring 2015## Name: Matthew James Greci##     Laboratory Number: 2             Due Date: 24 February 2015### Lab Group:### #*************************************************************** ## This problem runs a subroutine to print out a string from memory.
# The string is set in memory and each character is sent over
# UART, one at a time.# #***************************************************************
#include <p32xxxx.h>
.global main
.text
.set noreorder
.ent main

string:
    .ASCIZ "Matthew Greci 24 February, 2015"
main:
    nop                  # point PC here
    # UART Setup
    la s0,0xBF800000     # base address for UART
    li t1,0x20           # t1 is temp storage
    sw t1,0x6240(s0)     # 0x20 (baud=19200) -> U2BRG (offset 6240)
    sw zero,0x6210(s0)   # clear U2STA (offset 6210)
    li t1,0x8B00         # set bits 15(ON) 11(RTSMD) 9:8 (UEN)
    sw t1,0x6200(s0)     # 0x8B00 -> MODE (offset=6200)
    li t1,0x1400         # set bits 10,12 (UTXEN, URXEN) on
    sw t1,0x6218(s0)     # 0x1400 -> U2STA SET reg address
    la t0, string        # address of string -> t0
loadChar:
    #Send each char from the address pointed by t0
    lb t2, 0x0(t0)       # load char into t2
    beq t2, zero, done   # t2 == 0 (NULL), done sending chars
    nop                  # otherwise continue (more chars to send)
    bal printChar        # start subroutine ‘printChar’
    nop
    #return from printChar here
    addi t0, t0, 1       # increment t0 pointer
    b loadChar           # load next char
    nop
printChar: 
    lw t1,0x6210(s0)     # (status) U2STA (6210) -> t1
    andi t1,t1,0x200     # check transmit status
    bne t1,zero,printChar # cannot transmit now, try again
    nop                  # otherwise continue
    sb t2,0x6220(s0)     # char (t2) -> U2TXREG (6220)
    jr ra                # return to ‘return from printChar here’
    nop
done:
    nop
.end main

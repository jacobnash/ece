#************************************************************* ## ECE 344L - Microprocessors - Spring 2015## Name: Matthew James Greci##     Laboratory Number: 2             Due Date: 24 February 2015### Lab Group:### #*************************************************************** ## This problem demonstrates how UART works on the PIC32. By knowing
# the addresses of special UART registers and how the UART protocol
# works, characters can be sent from a terminal to the board, 
# stored to memory, and then sent back to the terminal. When 
# ’Enter’ is hit on the terminal, the history of typed characters
# are displayed.# #***************************************************************
#include <p32xxxx.h>
.global main
.text
.set noreorder
.ent main

main:
   nop                  # point PC here
   la s0,0xBF800000     # base address for UART
   li t0,0xA0000300     # base address to store chars
   li t4, 0x0A          # constant for new line
   li t9, 0             # counts number of chars stored
   # UART Setup
   li t1,0x20           # t1 is used multiple times as temp storage
   sw t1,0x6240(s0)     # 0x0C (baud=19200) -> U2BRG (offset 6240)
   sw zero,0x6210(s0)   # clear U2STA (offset 6210)
   li t1,0x8B00         # set bits 15(ON) 11(RTSMD) 9:8 (UEN)
   sw t1,0x6200(s0)     # 0x8B00 -> MODE (offset=6200)
   li t1,0x1400         # set bits 10,12 (UTXEN, URXEN) on
   sw t1,0x6218(s0)     # 0x1400 -> U2STA SET reg address
read:
   #Read from RXREG
   lw t1,0x6210(s0)     # read U2STA (6210) -> t1
   andi t1, t1, 0x01    # check if least sig bit (LSb) == 1
   beq t1, zero, read   # if LSb != 1, nothing to read (check again)
   nop                  # otherwise something there, (store value)
store:
   #Store into memory or print history of chars
   lw t2, 0x6230(s0)    # load value from U2RXREG -> t2
   beq t2,t4,printLine  # branch (print history) if t2 == 0xA
   nop                  # otherwise continue
   sw t2, 0(t0)         # store value into memory
   addi t0, t0, 4       # increment base address pointer
   addi t9, t9, 1       # increment number of letters to print
transmit:
   #Send char via TXREG
   lw t1,0x6210(s0)     # read U2STA (6210) -> t1
   andi t1,t1,0x200     # check if able to transmit
   bne t1,zero,transmit # go to transmit, cannot transmit right now
   nop                  # otherwise continue
   sw t2,0x6220(s0)     # char -> U2TXREG (6220)
   b read               # go back to start of loop
   nop
printLine:
   la t0,0xA0000300     # reset base address pointer
loop:
   lw t1,0x6210(s0)     # read U2STA (6210) -> t1
   andi t1,t1,0x200     # check if able to transmit
   bne t1,zero,loop     # cannot transmit right now, try again
   nop                  # otherwise continue
   sw t4,0x6220(s0)     # char (t4 is new line) -> U2TXREG (6220)
contLoop:
   lw t2, 0(t0)         # load value from memory
   lw t1,0x6210(s0)     # read U2STA (6210) -> t1
   andi t1,t1,0x200     # check if able to transmit
   bne t1,zero,contLoop # cannot transmit right now, try again
   nop                  # otherwise continue
   sw t2,0x6220(s0)     # char -> U2TXREG (6220)
   addi t0, t0, 4       # increment base address
   addi t9, t9, -1      # decrement loop counter
   bgtz t9, contLoop
   nop
printNewLine:
   lw t1,0x6210(s0)     # read U2STA (6210) -> t1
   andi t1,t1,0x200     # check if able to transmit
   bne t1,zero,printNewLine  # cannot transmit right now, try again
   nop                  # otherwise continue
   sw t4,0x6220(s0)     # char (t3 = new line) -> U2TXREG (6220)
   li t0, 0xA0000300    # reset base pointer
   li t9, 0             # reset number of letters to print   
   b read               # branch to read (start over)
   nop

.end main

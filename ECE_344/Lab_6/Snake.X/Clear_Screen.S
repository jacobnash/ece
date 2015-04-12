#include <p32xxxx.h>
.global Clear_Screen
.text
.set noreorder
.ent Clear_Screen

Clear_Screen:
    and s0, s0, zero
    or s0, s0, ra

Create_Clear_String:
     la t0, 0xA0000330
     nop
     li t1, 0x1B
     sb t1, 0x0(t0)
     li t1, 0x5B
     sb t1, 0x1(t0)
     li t1, 0x32
     sb t1, 0x2(t0)
     li t1, 0x4a
     sb t1, 0x3(t0)
     li t1, 0x1B
     sb t1, 0x4(t0)
     li t1, 0x5B
     sb t1, 0x5(t0)
     li t1, 0x30
     sb t1, 0x6(t0)
     li t1, 0x3b
     sb t1, 0x7(t0)
     li t1, 0x30
     sb t1, 0x8(t0)
     li t1, 0x48
     sb t1, 0x9(t0)
     li t1, 0x00
     sb t1, 0xa(t0)

load_Screen_Clear:
    #Send each char from the address pointed by t0
    lb t2, 0x0(t0)       # load char into t2
    beq t2, zero, Screen_Cleared   # t2 == 0 (NULL), done sending chars
    nop                  # otherwise continue (more chars to send)
    bal Print_Screen_Clear        # start subroutine ‘printChar’
    nop
    #return from Print_Screen_Clear here
    addi t0, t0, 1       # increment t0 pointer
    b load_Screen_Clear           # load next char
    nop
Print_Screen_Clear:
    lw t1,U1STA           # (status) U2STA (6210) -> t1
    andi t1,t1,0x200      # check transmit status
    bne t1,zero,Print_Screen_Clear # cannot transmit now, try again
    nop                   # otherwise continue
    sb t2,U1TXREG         # char (t2) -> U2TXREG (6220)
    jr ra                 # return to ‘return from printChar here’
    nop
Screen_Cleared:
    jr s0
    nop
.end Clear_Screen
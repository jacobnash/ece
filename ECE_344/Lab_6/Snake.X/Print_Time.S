#include <p32xxxx.h>
.global Print_Time
.text
.set noreorder
.ent Print_Time

.set WHATTIMEISIT, 0xA0000200

Print_Time:
    and s0, s0, zero
    or s0, s0, ra

Move_Cursor_Print_Time:
     la t0, 0xA0000330
     la t2, 0xA0000300
     li t1, 0x1B
     sb t1, 0x4(t0)
     li t1, 0x5B
     sb t1, 0x5(t0)
     li t1, 0x31
     sb t1, 0x6(t0)
     li t1, 0x3b
     sb t1, 0x7(t0)
     li t1, 0x32
     sb t1, 0x8(t0)
     li t1, 0x66
     sb t1, 0x9(t0)
     lb t1, 0x0(t2)
     sb t1, 0xa(t0)
     lb t1, 0x1(t2)
     sb t1, 0xb(t0)
     li t1, 0x3a
     sb t1, 0xc(t0)
     lb t1, 0x2(t2)
     sb t1, 0xd(t0)
     lb t1, 0x3(t2)
     sb t1, 0xe(t0)
     li t1, 0x00
     sb t1, 0xf(t0)

load_Print_Time:
    #Send each char from the address pointed by t0
    lb t2, 0x0(t0)                  # load char into t2
    beq t2, zero, Done_Print_Time   # t2 == 0 (NULL), done sending chars
    nop                             # otherwise continue (more chars to send)
    bal Print_Print_Time            # start subroutine ‘printChar’
    nop
    #return from Print_Print_Time here
    addi t0, t0, 1              # increment t0 pointer
    b load_Print_Time           # load next char
    nop
Print_Print_Time:
    lw t1,U1STA                 # (status) U2STA (6210) -> t1
    andi t1,t1,0x200            # check transmit status
    bne t1,zero,Print_Print_Time # cannot transmit now, try again
    nop                         # otherwise continue
    sb t2,U1TXREG               # char (t2) -> U2TXREG (6220)
    jr ra                       # return to ‘return from printChar here’
    nop

Done_Print_Time:
   nop
   jr s0
   nop

.end Print_Time
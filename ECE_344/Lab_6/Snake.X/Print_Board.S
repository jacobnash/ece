#include <p32xxxx.h>
.global Print_Board
.text
.set noreorder
.ent Print_Board

.set WHATTIMEISIT, 0xA0000200

Print_Board:
    and s0, s0, zero
    or s0, s0, ra
    la t0, 0xA0000330
Move_Cursor_Print_Board:
     
     li t1, 0x1B
     sb t1, 0(t0)
     addi t0,1
     li t1, 0x5B
     sb t1, 0x0(t0)
     addi t0,1
     li t1, 0x31
     sb t1, 0x0(t0)
     addi t0,1
     li t1, 0x3b
     sb t1, 0x0(t0)
     addi t0,1
     li t1, 0x31
     sb t1, 0x0(t0)
     addi t0,1
     li t1, 0x66
     sb t1, 0x0(t0)
     li t2, 158
     li t3, 0x58
#print out 74 x

Print_X:
     addi t0, 1
     addi t2, -1
     sb t3, 0x0(t0)
     bne zero, t2, Print_X
     nop
     li t4, 20
Print_Other:
     li t5, 4
Print_4_X:
     addi t0, 1
     addi t5, -1
     sb t3, 0x0(t0)
     bne zero, t5, Print_4_X
     nop
     li t6, 76
Print_Space:
     addi t6, -1
     addi t0, 1
     li t1, 0x20
     sb t1, 0x0(t0)
     bne zero, t6, Print_Space
     nop
     addi t4, -1
     bne  t4, zero, Print_Other
     nop
     li t2, 162
     li t3, 0x58
#print out 74 x

Print_X_last:
     addi t0, 1
     addi t2, -1
     sb t3, 0x0(t0)
     bne zero, t2, Print_X_last
     nop


     addi t0, 1
     li t1, 0x00
     sb t1, 0x0(t0)
     la t0, 0xA0000330
load_Print_Board:
    #Send each char from the address pointed by t0
    lb t2, 0x0(t0)                  # load char into t2
    beq t2, zero, Done_Print_Board   # t2 == 0 (NULL), done sending chars
    nop                             # otherwise continue (more chars to send)
    bal Print_Print_Board            # start subroutine ‘printChar’
    nop
    #return from Print_Print_Board here
    addi t0, t0, 1              # increment t0 pointer
    b load_Print_Board           # load next char
    nop
Print_Print_Board:
    lw t1,U1STA                 # (status) U2STA (6210) -> t1
    andi t1,t1,0x200            # check transmit status
    bne t1,zero,Print_Print_Board # cannot transmit now, try again
    nop                         # otherwise continue
    sb t2,U1TXREG               # char (t2) -> U2TXREG (6220)
    jr ra                       # return to ‘return from printChar here’
    nop

Done_Print_Board:
   nop
   jr s0
   nop

.end Print_Board
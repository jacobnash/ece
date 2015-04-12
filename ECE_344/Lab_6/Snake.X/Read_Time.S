#include <p32xxxx.h>
.global Read_Time
.text
.set noreorder
.ent Read_Time

Read_Time:
   and s0, s0, zero
   or s0, s0, ra

   la t0, 0xA0000300                  # base address to store chars
   li t4, 0x0D                        # constant for new line
                                      # Read from RXREG
CharCheck_Read_Time:
   lw t1, U1STA                       # read U2STA (6210) -> t1
   andi t1, t1, 0x01                  # check if least sig bit (LSb) == 1
   beq t1, zero, CharCheck_Read_Time  # if LSb != 1
   nop                    
Store_Read_Time:
   
   lb t2, U1RXREG                 # load value from U2RXREG -> t2
  beq t2,t4,Submitted_Read_Time   # branch (print history) if t2 == 0xA
  nop                             # otherwise continue
   sb t2, 0(t0)                   # store value into memory
 addi t0, t0, 1                   # increment base address pointer

Echo_Read_Time:
   #Send char via TXREG
   lb t1, U1STA                    # read U1STA
   andi t1, t1, 0x200               # check if able to transmit
   bne t1, zero, Echo_Read_Time     # go to transmit, cannot transmit right now
   nop                            # otherwise continue
   sb t2, U1TXREG                 # char -> U2TXREG (6220)
   b CharCheck_Read_Time          # go back to start of loop
   nop

Submitted_Read_Time:
  jr s0
  nop

.end Read_Time

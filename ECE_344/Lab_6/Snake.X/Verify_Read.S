#include <p32xxxx.h>
.global Verify_Read
.text
.set noreorder
.ent Verify_Read



Verify_Read:
   and s0, s0, zero
   or s0, s0, ra
   and t2, t2, zero
   la t0, 0xA0000300                  # base address to store chars

LOAD_TIME_VERIFY_READ:

 lb t1, 0x0(t0)
 lb t2, 0x1(t0)
 lb t3, 0x3(t0)
 lb t4, 0x4(t0)

 sw zero, 0x0(t0)
 sw zero, 0x4(t0)

 sb t1, 0x0(t0)
 sb t2, 0x1(t0)
 sb t3, 0x2(t0)
 sb t4, 0x3(t0)




  jr s0
  nop

.end Verify_Read

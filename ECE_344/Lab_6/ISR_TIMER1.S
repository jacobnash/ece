
#include <p32xxxx.h>
.global ISR_TIMER1
.set noreorder
.ent ISR_TIMER1
.set WHATTIMEISIT 0xA0000200
#byte 0 = Hour 0-23 = 0x0-0x17
#byte 1 = Min  0-59 = 0x0-0x3B
#byte 2 = Sec  0-59 = 0x0-0x3B

ISR_TIMER1:
	or s0, s0, ra		#load ra into reg
	sw zero, IFS0		#clear IFS0, interrupt flags for Timer1
	lw t0, WHATTIMEISIT	#load time from memory
	lb t0, 0(WHATTIMEISIT)  #load seconds
	lb t1, 1(WHATTIMEISIT)  #load mins
	lb t2, 2(WHATTIMEISIT)  #load hours
	addi t0, t0, 1		#incr secs
	# if secs >= 0x3C, incr mins, secs = 0
	addi t3, t0, -60	
	beq t3, zero, incr_mins
	nop
cont1:
	# if min >= 0x3C, incr hour, mins = 0
	addi t3, t1, -60	
	beq t3, zero, incr_hours
	nop
cont2:
	# if hour >= 0x18, hour = 0
	addi t3, t2, -24	
	beq t3, zero, zero_hour
	nop

incr_mins:
	sb zero, 0(WHATTIMEISIT)
	b cont1
	nop

incr_secs:
	sb zero, 1(WHATTIMEISIT)
	b cont2   
	nop

zero_hour:
	sb zero, 2(WHATTIMEISIT)

done:
	jr s0
	nop
	
	
.end ISR_TIMER1
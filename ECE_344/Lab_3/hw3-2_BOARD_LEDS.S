#include <p32xxxx.h>
.global ON_BOARD_LEDS
.set noreorder
.ent ON_BOARD_LEDS

ON_BOARD_LEDS:
shift_right:
	sw zero, IFS0		#Clear interrupt flag
	sw a0, PORTB		#Set LED bit pattern in PORTB
	srl a0, a0, 1		#Shift bit pattern right by 1
	beq a0, 0x100, origin	#Reset bit pattern if goes too far right
	nop			#otherwise continue
	eret			#Return
	nop
origin:
	li a0, 0x2000		#Reset bit pattern
	b shift_right		#Go to shift_right
	nop 	
.end ON_BOARD_LEDS

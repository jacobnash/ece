#include <p32xxxx.h>
.global OFF_BOARD_LEDS
.set noreorder
.ent OFF_BOARD_LEDS

OFF_BOARD_LEDS:
shift_right:
	sw zero, IFS0		#Clear interrupt flag
	beq a1, 0x00, origin	#Reset bit pattern if goes too far right
	nop			
	sw a1, PORTE		#Set LED bit pattern in PORTB
	srl a1, a1, 1		#Shift bit pattern right by 1
	eret			#Return
	nop
origin:
	li a1, 0x80		#Reset bit pattern
	b shift_right		#Go to shift_right
	nop 	
.end OFF_BOARD_LEDS

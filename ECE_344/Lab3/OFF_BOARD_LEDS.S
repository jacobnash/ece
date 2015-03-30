#include <p32xxxx.h>
.global OFF_BOARD_LEDS
.set noreorder
.ent OFF_BOARD_LEDS

OFF_BOARD_LEDS:
shift_left:

	beq a2, 0x00, origin	#Reset bit pattern if goes too far left
	nop
	sw a2, PORTE 	    	#Set LED bit pattern in PORTB
	srl a2, a2, 1           #Shift bit pattern left by 1
	nop                     #otherwise continue
	sw zero, IFS0			#clear IFS0, interrupt flags
	ERET                    #Return
	nop
origin:
	li a2, 0x80  			#Reset bit pattern
	b shift_left			#Go to shift_left
	nop 	
.end OFF_BOARD_LEDS
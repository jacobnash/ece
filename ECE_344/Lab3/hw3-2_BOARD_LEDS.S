#include <p32xxxx.h>
.global ON_BOARD_LEDS
.set noreorder
.ent ON_BOARD_LEDS

ON_BOARD_LEDS:
shift_right:
	sw a3, PORTB 	    	#Set LED bit pattern in PORTB
	srl a3, a3, 1           #Shift bit pattern right by 1
	beq a3, 0x100, origin	#Reset bit pattern if goes too far right
	nop                     #otherwise continue
	sw zero, IFS0			#clear IFS0, interrupt flags
	ERET                    #Return
	nop
origin:
	li a3, 0x2000			#Reset bit pattern
	b shift_right			#Go to shift_right
	nop 	
.end ON_BOARD_LEDS
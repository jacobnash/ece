.set noreorder
.section .vector_4, code
.ent _vector_4
_vector_4:
	#j MODULE_LEDS
	nop
.end _vector_4

.section .vector_8, code
.ent _vector_8
_vector_8:
	#j BOARD_LEDS
	nop
.end _vector_8

.section .vector_32, code
.ent _vector_32
_vector_32:
	j ISR_UART
	nop
.end _vector_32

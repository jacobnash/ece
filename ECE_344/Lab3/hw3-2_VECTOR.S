.section .vector_4, code

.set noreorder

.ent _vector_4

_vector_4:
	nop
	j OFF_BOARD_LEDS
	nop
	nop
	nop
	nop
	nop
	nop
.end _vector_4

.section .vector_8, code

.set noreorder

.ent _vector_8

_vector_8:
	nop
	j ON_BOARD_LEDS
	nop
	nop
	nop
	nop
	nop
	nop
.end _vector_8

.section .vector_32, code

.set noreorder

.ent _vector_32

_vector_32:
	nop
	j ISR_UART		#jump to service routine
	nop
	nop
	nop
	nop
.end _vector_32
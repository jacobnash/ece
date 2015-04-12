.set noreorder
.section .vector_24, code
.ent _vector_24
_vector_24:
	j ISR_UART
	nop
.end _vector_24

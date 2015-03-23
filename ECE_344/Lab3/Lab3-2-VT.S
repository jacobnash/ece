#include <p32xxxx.h>
.section .vector_32,code
.set noreorder
.ent _vector_32
_vector_32:
	nop
	la t9, ISR_UART 
	jr t9 
	nop
	
.end _vector_32

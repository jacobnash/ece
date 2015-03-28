#include <p32xxxx.h>
.section .vector_32,code
.set noreorder
.ent _vector_32
_vector_32:
	la t1, ISR_UART 
	jr t1 
	nop
.end _vector_32

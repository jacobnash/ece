#include <p32xxxx.h>
.global main
.data
.text
.set noreorder
.ent main
main:
	nop  #point PC here
	
	b floop
	nop
floop:
	nop
.end main
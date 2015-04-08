#include <p32xxxx.h>

.global main

.data

.text

.set noreorder

.ent main
main:

	b loop
	nop
loop:
	nop
.end main
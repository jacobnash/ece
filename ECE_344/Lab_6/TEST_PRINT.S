#include <p32xxxx.h>
.global main
.text
.set noreorder
.ent main
.set TO_PRINT, 0xA0000400

#0x1B = ESC
#0x5B = '['

#0x3B = ';'
#0x68 = 'h'
main:
	#Initialize UART
	li t1, 0x20			#Set up baud rate
   	sw t1, U1BRG			#Store baud rate bits
   	li t1, 0x8B00			#Set enable bits
   	sw t1, U1MODE			#Store enable bits
   	li t1, 0x1400			#Set UART enable bits
   	sw t1, U1STA			#Store to UART1 SET

	la s0, TO_PRINT
	li t0, 0x23
	sw t0, 4(s0)
	li t0, 0x30343531
	sw t0, 0(s0)
	
	bal PRINT_CHAR_X_Y
	nop
	
done:
	b done
	nop

.end main

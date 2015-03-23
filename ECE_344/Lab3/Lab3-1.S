#include <p32xxxx.h>

.global main

.data

.text

.ent main 


main:
	####################
	###REG CLEAR PROC###
	####################
	and	t0, t0, zero
	and	t1, t1, zero
	and	t2, t2, zero
	and	t3, t3, zero
	and	t4, t4, zero
	and	t5, t5, zero
	and	t6, t6, zero
	and	t7, t7, zero
	and	t8, t8, zero
	and	t9, t9, zero
	nop	
	and s0, s0, zero
	and s1, s1, zero
	and s2, s2, zero
	and s3, s3, zero
	and s4, s4, zero
	and s5, s5, zero
	and s6, s6, zero
	and s7, s7, zero
	nop
	and a0, a0, zero
	and a1, a1, zero
	and a2, a2, zero
	and a3, a3, zero
	
	la t3, 0xA0000500
	la t4, 0xA0000400

	#UART Setup:	
	Lw t1, U2MODE			#clear UARTB
	sw zero, U2TXREG		#clear transmit register
	sw zero, U2RXREG		#clear recieve register
	ori t0, t1, 0x8B00	    #load bit pattern 1001101100000000
	sw t0, U2MODE			#set bits in UARTB
	ori t0, zero, 0x08		#load BRG bits for baud rate of 2400
	sw t0, U2BRG			#set BRG bits
	li s0, 0x01				#UART status check
	li s1, 0x200			#UART tx buffer check
	ori t0, zero, 0x1440	#set enable bits for  status register
	sw t0, U2STA			#clear and set status register of uart

	#Interrupt Setup:
	li t5, 0xBF881000		#useful base address
	sw zero, 0x1030(t5)		#clear IFS0
	sw zero, 0x1040(t5)		#clear IFS1
	sw zero, 0x1060(t5)		#clear IEC0
	sw zero, 0x1070(t5)		#clear IEC1
	li t6, 0x1000			#bit pattern to enable multivector
	sw t6, 0x00(t5)			#store multivector enable to INTCON set register
	li t6, 0x200			#bit pattern to enable UART flag
	sw t6, 0x70(t5)			#store UART inturrupt flag enable 
	li t6, 0x1A				#load priority bits
	sw t6, 0x110(t5)		#store priority bits
	li t6, 0x9FC01000		#load ebase
	mtc0 t6, $15, 0x01		#set ebase
	#li s2, 0x01			#load vector spacing bits
    #mtc0 s2, $12, 0x01		#store vector spacing bits
	
	ei						#enable interrups 


##Start Echo
	
mainLoop:

	lui t8, 0xBF88			#another usefull base address
	lw t7, 0x1040(t8)		#check flag register
	lw t9, 0x1070(t8)		#check enable register	 
	nop
 	b mainLoop
 	nop
.end main
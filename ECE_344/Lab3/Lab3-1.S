#include <p32xxxx.h>
.global main
.data
.text
.ent main 
main:	
	#UART Setup
	li s0,0xBF800000     # base address for UART
	li t1,0x20           # t1 is used multiple times as temp storage
	sw t1,0x6240(s0)     # 0x20 (baud=19200) -> U2BRG (offset 6240)
	li t1,0x1440         # set bits 10,12 (UTXEN, URXEN) on
	sw t1,0x6210(s0)     # 0x1400 -> U2STA SET reg address
	li t1,0x8B00         # set bits 15(ON) 11(RTSMD) 9:8 (UEN)
	sw t1,0x6200(s0)     # 0x8B00 -> MODE (offset=6200)

	#Setup mailboxes	
	li s2, 0xA0000400      # mailbox one
	li s3, 0xA0000500      # mailbox two

	#Interrupt Setup:
	li s1, 0xBF880000      #interupts base address
	sw zero, 0x1030(s1)    #clear IFS0
	sw zero, 0x1040(s1)    #clear IFS1
	sw zero, 0x1060(s1)    #clear IEC0
	sw zero, 0x1070(s1)    #clear IEC1
	li t1, 0x1000          #bit pattern to enable multivector
	sw t1, 0x1000(s1)      #store multivector enable to INTCON set register
	li t1, 0x200           #bit pattern to enable UART flag
	sw t1, 0x1070(s1)      #store UART inturrupt flag enable 
	li t1, 0x1A            #load priority bits
	sw t1, 0x1110(s1)      #store priority bits
	#li t1, 0x9FC01000     #load ebase
	#mtc0 t1, $15, 0x01    #set ebase
	#li 11, 0x01           #load vector spacing bits
        #mtc0 t1, $12, 0x01    #store vector spacing bits	
	ei                     #enable interrups 
	
mainLoop:
	nop
 	b mainLoop
 	nop
.end main

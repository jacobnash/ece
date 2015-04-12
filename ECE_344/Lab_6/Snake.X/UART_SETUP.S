#include <p32xxxx.h>
.global UART_SETUP
.text
.set noreorder
.ent UART_SETUP


UART_SETUP:
# UART Setup
    nop
    lw t1, OSCCON       # chang this to PBDIV 00
    li t1,0x0a          # t1 is temp storage
    sw t1,U1BRG         # 0x20 (baud=19200) -> U2BRG (offset 6240)
    sw zero,U1STA       # clear U2STA (offset 6210)
    li t1,0x8B00        # set bits 15(ON) 11(RTSMD) 9:8 (UEN)
    sw t1,U1MODE        # 0x8B00 -> MODE (offset=6200)
    li t1,0x1400        # set bits 10,12 (UTXEN, URXEN) on
    sw t1,U1STA         # enable U2STA (offset 6210)
    jr ra
    nop

.end UART_SETUP
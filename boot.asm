[org 0x7c00]

[section .text]
[bits 16]

global _start
_start:

    jmp $

msg:
    db "hello, world", 0x0a, 0x0d, 0x0

times 510 - ($ - $$) db 0
db 0x55, 0xaa
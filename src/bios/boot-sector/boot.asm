[bits 64]

extern BootMain

section .text
    global _start

_start: 
    cli
    MOV ax, cs
    MOV ds, ax
    MOV es, ax
    MOV ss, ax
    MOV bp, 0x7c00
    MOV sp, 0x7c00
    sti

    call BootMain
    ret


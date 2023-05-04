[bits 64]

section .text
    global _start
_start: 
    cli
    MOV rax, cs
    MOV ds, rax
    MOV es, rax
    MOV ss, rax
    MOV bp, 0x7c00
    MOV sp, 0x7c00
    sti
    ret



.section .data
.section .text
.globl _start
_start: 
    cli
    MOV %cs, %rax
    MOV %rax,%ds
    MOV %rax,%es
    MOV %rax,%ss
    MOV 0x7c00, %bp
    MOV 0x7c00, %sp
    sti
    ret
.ORG 0x7c00

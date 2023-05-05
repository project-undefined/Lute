
.code64
.extern _boot_main:near
.globl _start

_start: 
    cli
    MOV %cs, %rax
    MOV %rax, %ds
    MOV %rax, %es
    MOV %rax, %ss
    MOV $0x7c00, %rbp
    MOV $0x7c00, %rsp
    sti

    mov $0x0e41, %rax
    int $0x10
    call _boot_main

    

.fill 510-(.-_start), 1, 0
.word 0xaa55

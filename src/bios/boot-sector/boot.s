.code64
.extern _boot_main
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

    call _boot_main
   
    hlt
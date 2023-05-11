.code64
.extern _load_on_disk
.extern _clear_screen
.extern _boot_main

.globl _start


_start: 
    cli # clear interrupts, don't want this code to be interrupted
    # allows bootloader to access all parts of memory by making the segment registers equal
    # TODO: will probably need to be changed when moved to ARM64
    MOV %cs, %rax
    MOV %rax, %ds
    MOV %rax, %es
    MOV %rax, %ss 
    # set the base and stack pointers to the correct memory location required
    # for bootloader applications
    MOV $0x7c00, %rbp 
    MOV $0x7c00, %rsp
    sti # start interrupts
    
    # call the bootmain function
    call _boot_main
   
    hlt
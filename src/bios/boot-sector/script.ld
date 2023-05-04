SECTIONS {
    . = 0x7c00;
    combined . : AT(0x7c00) ALIGN(1) SUBALIGN(1) { 
        *(.text*)
        *(.data*)
        *(.rodata*)
        *(.bss*)
    }
}
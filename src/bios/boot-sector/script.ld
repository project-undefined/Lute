ENTRY(_start)

MEMORY { 
    
}

SECTIONS {
    . = 0x7c00;
    
    .text : { 
        *(.text*)

        /* fill remaining bytes with empty space */
        FILL(0x0)
        
        /* add 510 bytes of space */
        . = 0x1FE;

        /* tell bios it is a bootloader */ 
        BYTE(0x55)
        BYTE(0xaa)
    }

    .data : { 
        *(.data*)
    }
    .rodata : {
        *(.rodata*)
    }
    .bss : {
        *(.bss*)
    }
  
}
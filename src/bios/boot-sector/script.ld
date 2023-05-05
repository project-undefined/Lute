
SECTIONS {
    . = 0x7c00;
    
    .text : { 
        *(text*)
    }
    .data : { 
        *(data*)
    }
    .rodata : {
        *(rodat*)
    }
    .bss : {
        *(bss*)
    }
  
}
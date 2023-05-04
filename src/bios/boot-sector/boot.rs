#![crate_type = "rlib"]
#![no_std]
#![no_main]

use core::arch::asm; 

pub unsafe fn clear_screen() {
    asm!{ 
        "mov al, 02h",
        "mov ah, 00h",
        "int 0x10"
    }
}

#[no_mangle]
pub extern "C" fn BootMain() {
    unsafe {
        clear_screen();
        asm!{
            "mov dx,'A'",
            "mov ah, 2",
            "int 0x10"
        }
    }

}
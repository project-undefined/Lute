#![crate_type = "rlib"]
#![no_std]
#![no_main]

use core::arch::asm; 

#[no_mangle]
pub extern "C" fn BootMain() -> ! {
    unsafe {
        asm!{ 
            "mov al, 02h",
            "mov ah, 00h",
            "int 10h"
        }
    }
    loop {}
}
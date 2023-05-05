#![crate_type = "rlib"]
#![no_std]
#![no_main]


use core::arch::asm; 
use core::arch::global_asm; 


#[no_mangle]
pub extern "C" fn _boot_main() {
    unsafe {
        asm!{
            "mov rax, 0x0e41",
            "int 0x10"
        }
    }

}

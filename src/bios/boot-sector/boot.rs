#![crate_type = "staticlib"]
#![no_std]
#![no_main]


use core::arch::asm; 
use core::panic::PanicInfo;


pub const STAGE_ONE_OFFSET: u16 = 0x1000;

#[no_mangle]
pub extern "C" fn _boot_main() {
    unsafe {
        _clear_screen();
        
        asm! {
            "mov rax, 0x0e4f",
            "int 0x10"
        }    
    }
}

#[no_mangle]
pub extern "C" fn _load_on_disk() {

}

#[no_mangle]
pub extern "C" fn _clear_screen() { 
    unsafe {
        asm! { 
            "mov rax, 0x3",
            "int 0x10"
        }
    }
}

#[panic_handler]
pub extern "C" fn panic_handler(_p: &PanicInfo) -> ! {
    loop {}
}

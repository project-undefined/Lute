/* meant to start the phase1 and initialize the bootloader */
/* we want minimal code here */
#![crate_type = "staticlib"]
#![no_std]
#![no_main]


use core::arch::asm; 
use core::panic::PanicInfo;


pub const STAGE_ONE_OFFSET: u16 = 0x1000;

#[no_mangle]
pub extern "C" fn _start() {
    unsafe {
        asm! { 
            "cli",
            // make cs == es == ds == ss (seg registers)
            // required for the x86_64 boot process
            "MOV rax, cs",
            "MOV ds,  rax",
            "MOV es,  rax",
            "MOV ss,  rax", 

            // make base pointer and stack pointer
            // equal to 0x7c00 (kernel memory location)
            "MOV rbp, 0x7c00",
            "MOV rsp, 0x7c00", 
            "sti"
        }
        _boot_main();
    }
}

#[no_mangle]
pub extern "C" fn _boot_main() {
    unsafe {
        _clear_screen();
        _load_on_disk();
    }
}

// WARNING: testing function
// referenced from "https://dev.to/frosnerd/writing-my-own-boot-loader-3mld"
#[no_mangle]
pub extern "C" fn _load_on_disk() {
    unsafe {
        /* TODO: Needs to be tested, sector reading needs to be dynamic to allow for any phase2/phase3 size */
        /* TODO: Decide whether to decrease phase sizes or not, more research needs to be put in for this */
        asm! { 
            "push dx",
            "mov ah, 0x02",         // read mode
            "mov dh, 0x4B6F",       // 19311 sectors (~9.89M), TODO: Need to be tested 
            "mov al, dh",           // read dh # of sectors
            "mov cl, 0x02",         // start from sector 2
            "mov ch, 0x00",         // start from cylinder 0
            "mov dh, 0x00",         // head 0
            "int 0x13",             // BIOS interrupt

            "jc panic_nodata",      // panic if bit error

            "pop dx",               // get back sectors to read
            "cmp al, dh",           //sets al to # of sectors to read

            "jne panic_nodata"
        }
      
    }
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

#[no_mangle]
pub extern "C" fn panic_nodata() {
    loop {}
}

#[panic_handler]
#[no_mangle]
pub extern "C" fn panic_handler(_p: &PanicInfo) -> ! {
    loop {}
}

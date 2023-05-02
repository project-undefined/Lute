#![crate_type="rlib"]
#![feature(no_core)]
#![feature(lang_items)]
#![no_std]
#![no_main]
#![allow(unstable)]

//use core::arch::asm;

#[no_mangle]
pub fn _start() -> ! {
    loop {};
}
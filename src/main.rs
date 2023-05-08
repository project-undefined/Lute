#![no_std]
#![no_main]
#![no_core]
#![crate_type="rlib"]
#![feature(no_core)]
#![feature(lang_items)]


// Weird rustc error here, anyone know how to fix it?
// FULL ERROR:
// error[E0152]: found duplicate lang item `sized`
//   --> src\main.rs:10:1
//    |
// 20 | trait Sized {}
//    | ^^^^^^^^^^^
//    |
//    = note: the lang item is first defined in crate `core` (which `std` depends on)
//    = note: first definition in `core` loaded from \\?\C:\Users\[REDACTED]\.rustup\toolchains\nightly-x86_64-pc-windows-msvc\lib\rustlib\x86_64-pc-windows-msvc\lib\libcore-798bc7c2d986ac97.rlib
//    = note: second definition in the local crate (`lute`)
// NOTE: This will be removed once full stages are complete, development is in the bios folder
#[lang="sized"]
trait Sized {}

#[no_mangle] 
fn _start() -> ! {

    loop {}
}






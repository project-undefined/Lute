/* Initialize hardware, then load phase 3 */
#![crate_type="staticlib"]
#![no_main]

#[no_mangle]
fn _start() {
    println!("Hello, world!");
}

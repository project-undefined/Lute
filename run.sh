cargo rustc  --release  --target=armv7r-none-eabi -- --emit asm
objcopy -SO binary ./target/armv7r-none-eabi/release/Lute ./Lute.com

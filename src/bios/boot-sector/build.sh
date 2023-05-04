nasm -f elf64 -F dwarf -g boot.asm -o ./out/boot.o
rustc -C opt-level=z -C panic=abort -C strip=symbols boot.rs -o ./out/libboot.o
ld --gc-sections -T ./script.ld --oformat binary ./out/boot.o ./out/libboot.o  -o  ./out/bootloader.bin


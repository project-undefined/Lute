clear
echo -e "\033[1;32mRunning \`nasm\`\033[0m"
echo ""
as boot.s -o ./out/boot.o
echo -e "\033[1;32mRunning \`rustc\`\033[0m"
echo ""
rustc -C panic=abort -C relocation-model=static boot.rs -o ./out/libboot.rlib
echo -e "\033[1;32mRunning \`ld\`\033[0m"
echo ""
ld -T./script.ld -static --oformat binary -e _start  ./out/boot.o ./out/libboot.rlib -o  ./out/bootloader.bin
ld -T./script.ld -static -e _start  ./out/boot.o ./out/libboot.rlib -o  ./out/bootloader.dbg.elf
clear
echo -e "\033[1;32mRunning \`nasm\`\033[0m"
echo ""
nasm -f elf64 -F dwarf -g boot.asm -o ./out/boot.o
echo -e "\033[1;32mRunning \`rustc\`\033[0m"
echo ""
rustc -C opt-level=z -C panic=abort -C strip=symbols boot.rs -o ./out/libboot.o
echo -e "\033[1;32mRunning \`ld\`\033[0m"
echo ""
ld --gc-sections --verbose -nostdlib --strip-all -static --oformat binary -e _start -T ./script.ld ./out/boot.o ./out/libboot.o  -o  ./out/bootloader.bin

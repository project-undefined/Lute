clear
echo -e "\033[1;32mRunning \`nasm\`\033[0m"
echo ""
as boot.s -o ./out/boot.o
echo -e "\033[1;32mRunning \`rustc\`\033[0m"
echo ""
rustc -C panic=abort boot.rs -o ./out/libboot.rlib
ar x ./out/libboot.rlib --output=./out/
echo -e "\033[1;32mRunning \`ld\`\033[0m"
echo ""
ld -T./script.ld --oformat binary -e _start  ./out/boot.o ./out/libboot.boot.* -o  ./out/bootloader.bin
ld -T./script.ld -e _start  ./out/boot.o ./out/libboot.boot.* -o  ./out/bootloader.dbg.elf
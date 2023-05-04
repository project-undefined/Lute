nasm -f elf64 -F dwarf -g boot.s -o boot.elf
ld -Ttext=0x7c00 --oformat binary -o boot.bin boot.elf

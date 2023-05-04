@echo off
cls
echo [1m[33mWARNING[0m
echo [33mThis script may not work on windows. 
echo It has been confirmed to not work with MinGW-W64 on Windows.[0m
echo;
pause
echo [1m[32mRunning `nasm`[0m
nasm -f elf64 -F dwarf -g boot.asm -o ./out/boot.o
echo;
echo [1m[32mRunning `rustc`[0m
rustc -C opt-level=z -C panic=abort -C strip=symbols boot.rs -o ./out/libboot.o
echo;
echo [1m[32mRunning `ld`[0m
ld --gc-sections --verbose -nostdlib --strip-all -static --oformat binary -e _start -T ./script.ld ./out/boot.o ./out/libboot.o  -o  ./out/bootloader.bin

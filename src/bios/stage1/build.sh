rustc first_stage.rs -O -C relocation-model=static
ar x libfirst_stage.rs first_stage.o
ld --gc-sections -e _start -T script.ld -o payload payload.bin
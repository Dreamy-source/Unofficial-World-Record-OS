# Unofficial World Record OS
OS booting from 16-bit (Real Mode) bootloader, and transferring control to 32-bit (Protected Mode) kernel, then 32-bit kernel transferring control to 64-bit (Long Mode) kernel. Written by 13 y.o, in 35 minutes.

# Way:
- **Low** Start: **bootloader** (16-bits, **Real Mode**)
- **Medium** Start: **kernel32** (32-bits, **Protected Mode**)
- **High Start**: **kernel64** (64-bits, **Long Mode**)

# Written by 13 y.o, in 35 minutes.

# Compile & Run
```bash
echo Compiling...
nasm -f bin boot.asm -o boot.bin
nasm -f bin krnl32.asm -o krnl32.bin
nasm -f bin krnl64.asm -o krnl64.bin
cat boot.bin krnl32.bin krnl64.bin > os.bin
qemu-system-x86_64 -fda os.bin
```

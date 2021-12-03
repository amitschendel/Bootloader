# Bootloader
A simple bootloader, Init GDT, Protected mode, crossing 512 bytes.

Following this [blog post](http://3zanders.co.uk/2017/10/13/writing-a-bootloader/).

# Compile
```bash
nasm -f bin src/boot.asm -o ~/Desktop/boot.bin
```

# Run with QEMU
```bash
qemu-system-x86_64 -fda boot.bin
```

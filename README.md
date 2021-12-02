# Bootloader
A simple bootloader, Init GDT, Protected mode, crossing 512 bytes.

# Compile
```bash
nasm -f bin src/boot.asm -o ~/Desktop/boot.bin
```

# Run with QEMU
```bash
qemu-system-x86_64 -fda boot.bin
```

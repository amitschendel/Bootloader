[bits 16]
switch_to_32bit:
    cli                     ; 1. Disable interrupts.
    lgdt [gdt_descriptor]   ; 2. Load GDT descriptor.
    mov eax, cr0
    or eax, 0x1             ; 3. Enable protected mode.
    mov cr0, eax
    jmp CODE_SEG:init_32bit ; 4. Far jump.

[bits 32]
init_32bit:
    mov ax, DATA_SEG        ; 5. Update segment registers.
    mov ds, ax
    mov ss, ax
    mov es, ax
    mov fs, ax
    mov gs, ax

    mov ebp, 0x90000        ; 6. Setup stack.
    mov esp, ebp

    call BEGIN_32BIT        ; 7. Move back to mbr.asm.
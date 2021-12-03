disk_load:
    pusha
    push dx

    mov ah, 0x02 ; Read mode.
    mov al, dh   ; Read dh number of sectors.
    mov cl, 0x02 ; Start from sector 2,
                 ; (as sector 1 is our boot sector).
    mov ch, 0x00 ; Cylinder 0.
    mov dh, 0x00 ; Head 0.

    ; dl = drive number is set as input to disk_load.
    ; es:bx = buffer pointer is set as input as well.

    int 0x13      ; BIOS interrupt.
    jc disk_error ; Check carry bit for error.

    pop dx     ; Get back original number of sectors to read.
    cmp al, dh ; BIOS sets 'al' to the # of sectors actually read.
               ; Compare it to 'dh' and error out if they are !=
    jne sectors_error
    popa
    ret

disk_error:
    jmp disk_loop

sectors_error:
    jmp disk_loop

disk_loop:
    jmp $
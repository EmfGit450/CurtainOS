[org 0x8000]
[bits 16]

; load GDT and switch to protected mode
cli
lgdt [gdt_descriptor]
mov eax, cr0
or eax, 1
mov cr0, eax
jmp 0x08:protected_mode

; GDT
gdt_start:
    dq 0
    ; code segment
    dw 0xFFFF
    dw 0x0000
    db 0x00
    db 10011010b
    db 11001111b
    db 0x00
    ; data segment
    dw 0xFFFF
    dw 0x0000
    db 0x00
    db 10010010b
    db 11001111b
    db 0x00
gdt_end:

gdt_descriptor:
    dw gdt_end - gdt_start - 1
    dd gdt_start

[bits 32]
protected_mode:
    mov ax, 0x10
    mov ds, ax
    mov ss, ax
    mov es, ax
    mov esp, 0x90000

    ; print 'P' to VGA to confirm protected mode
    mov byte [0xb8000], 'P'
    mov byte [0xb8001], 0x0f

    jmp $
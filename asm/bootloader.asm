[org 0x7c00]
[bits 16]

mov bp, 0x9000
mov sp, bp

mov si, msg
call print

; load stage 2 from disk
mov ah, 0x02    ; BIOS read sector
mov al, 1       ; read 1 sector
mov ch, 0       ; cylinder 0
mov cl, 2       ; sector 2 (stage 2)
mov dh, 0       ; head 0
mov bx, 0x8000  ; load to address 0x8000
int 0x13        ; BIOS disk interrupt
jmp 0x8000      ; jump to stage 2

print:
    mov ah, 0x0e
.loop:
    lodsb
    cmp al, 0
    je .done
    int 0x10
    jmp .loop
.done:
    ret

msg db 'CurtainOS', 0x0D, 0x0A, 0

times 510-($-$$) db 0
dw 0xAA55
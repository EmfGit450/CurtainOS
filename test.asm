[org 0x7c00]
[bits 16]

mov ah, 0x0e
mov al, 'C'
int 0x10
mov al, 'u'
int 0x10
mov al, 'r'
int 0x10
mov al, 't'
int 0x10
mov al, 'a'
int 0x10
mov al, 'i'
int 0x10
mov al, 'n'
int 0x10
mov al, 'O'
int 0x10
mov al, 'S'
int 0x10

jmp $

times 510-($-$$) db 0
dw 0xAA55

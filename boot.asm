[org 0x7c00]
[bits 16]
jmp s
gm:
 dq 0
 dq 0x00CF9A000000FFFF
 dq 0x00CF92000000FFFF
g:
gd:
 dw (g-gm-1) & 0xFFFF
 dd gm
s:
 mov [bd], dl
 mov ah, 0x02
 mov al, 0x02
 mov ch, 0x00
 mov cl, 0x02
 mov dh, 0x00
 mov dl, [bd]
 mov bx, 0x1000
 mov es, bx
 xor bx, bx
 int 0x13
 in al, 0x92
 or al, 0x02
 out 0x92, al
 cli
 lgdt [gd]
 mov eax, cr0
 or eax, 1
 mov cr0, eax
 jmp dword 0x08:0x10000
bd: db 0x00
times 510-($-$$) db 0
dw 0xAA55

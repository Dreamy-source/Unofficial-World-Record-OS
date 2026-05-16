[org 0x10000]
[bits 32]
mov ax, 0x10
mov ds, ax
mov es, ax
mov fs, ax
mov gs, ax
mov ss, ax
mov esp, 0x300000
lgdt [g6d]
call ps
g6m:
 dq 0
 dq 0x00209A0000000000
 dq 0x0000920000000000
g6:
g6d:
 dw g6-g6m-1
 dd g6m
ps:
 cli
 mov dword [0x11000], 0x12003
 mov dword [0x11004], 0x00000
 mov dword [0x12000], 0x13003
 mov dword [0x12004], 0x00000
 mov dword [0x13000], 0x00083
 mov dword [0x13004], 0x00000
 mov dword [0x13008], 0x20083
 mov dword [0x1300C], 0x00000
 mov eax, 0x11000
 mov cr3, eax
 mov eax, cr4
 or eax, 0x20
 mov cr4, eax
 mov ecx, 0xC0000080
 rdmsr
 or eax, 0x100
 wrmsr
 mov eax, cr0
 or eax, 1 << 31
 mov cr0, eax
 mov esp, 0x10000
 jmp 0x08:0x10200
 times 512-($-$$) db 0

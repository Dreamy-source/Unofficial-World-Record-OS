[bits 64]
default rel
jmp s
g6m:
 dq 0
 dq 0x00209A0000000000
 dq 0x0000920000000000
g6:
g6d:
 dw 23
 dq 0
s:
 lea rax, [g6m]
 mov [g6d + 2], rax
 lgdt [g6d]
 mov ax, 0x10
 mov ds, ax
 mov es, ax
 mov fs, ax
 mov gs, ax
 mov ss, ax
 mov rdi, 0xB8000
 hlt

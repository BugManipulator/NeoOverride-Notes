section .data
    msg db "Hello, World!", 0
    len equ $ - msg

section .text
    global _start

_start:

    mov edx, len
    mov ecx, msg
    mov eax, 4
    mov ebx, 1
    
    int 0x80
    
    mov eax, 1
    mov ebx, 0
    int 0x80
    

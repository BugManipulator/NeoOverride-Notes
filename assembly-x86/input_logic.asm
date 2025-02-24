section .data
    msg db "Enter text: ", 0  ; Prompt message
    msg_len equ $ - msg       ; Message length
    buffer times 100 db 0     ; 100-byte input buffer

section .bss
    input resb 100            ; Reserve 100 bytes for input

section .text
    global _start

_start:
    ; 1️⃣ Print message "Enter text: "
    mov eax, 4      ; sys_write
    mov ebx, 1      ; stdout
    mov ecx, msg    ; Message address
    mov edx, msg_len ; Message length
    int 0x80

    ; 2️⃣ Read user input
    mov eax, 3      ; sys_read
    mov ebx, 0      ; stdin (keyboard)
    mov ecx, input  ; Input buffer address
    mov edx, 100    ; Max bytes to read
    int 0x80

    ; 3️⃣ Print user input
    mov eax, 4      ; sys_write
    mov ebx, 1      ; stdout
    mov ecx, input  ; Address of input buffer
    mov edx, 100    ; Length (reads max 100 bytes)
    int 0x80

    ; 4️⃣ Exit program
    mov eax, 1      ; sys_exit
    xor ebx, ebx    ; Exit code 0
    int 0x80

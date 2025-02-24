section .data
    newline db 10, 0   ; Newline character for output

section .bss
    result resb 10     ; Buffer to store result as string

section .text
    global _start       ; Entry point

_start:
    ; a = 10, b = 10
    mov eax, 10   ; Load first number into EAX
    mov ebx, 10   ; Load second number into EBX

    call sum      ; Call sum function

    mov edi, result   ; Store result buffer in EDI
    call int_to_str   ; Convert integer to string

    ; Print result using sys_write
    mov eax, 4        ; syscall: sys_write
    mov ebx, 1        ; file descriptor: stdout
    mov ecx, result   ; buffer to print
    mov edx, 10       ; max bytes
    int 0x80          ; call kernel

    ; Print newline
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Exit program
    mov eax, 1    ; syscall: sys_exit
    xor ebx, ebx  ; status 0
    int 0x80

; Function: sum (a + b)
sum:
    add eax, ebx  ; EAX = EAX + EBX (sum)
    ret           ; Return result in EAX

; Function: int_to_str (Converts integer to string)
int_to_str:
    mov ecx, 10    ; ECX = 10 (divisor for conversion)
    mov esi, edi   ; Store buffer address in ESI
    add esi, 9     ; Move to the end of buffer
    mov byte [esi], 0  ; Null-terminate string
    dec esi        ; Move to last character position

.int_to_str_loop:
    mov edx, 0     ; Clear remainder
    div ecx        ; EAX /= 10, remainder in EDX
    add dl, '0'    ; Convert to ASCII
    mov [esi], dl  ; Store character
    dec esi        ; Move left
    test eax, eax  ; Check if number is 0
    jnz .int_to_str_loop

    inc esi        ; Adjust pointer to start of string
    mov edi, esi   ; Update result buffer pointer
    ret

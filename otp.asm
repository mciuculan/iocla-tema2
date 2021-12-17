%include "io.mac"

section .text
    global otp
    extern printf

otp:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edx, [ebp + 8]      ; ciphertext
    mov     esi, [ebp + 12]     ; plaintext
    mov     edi, [ebp + 16]     ; key
    mov     ecx, [ebp + 20]     ; length
    ;; DO NOT MODIFY

    mov ebp, 0
loop:
    cmp     ebp, ecx
    je      exit
    mov     al, [esi + ebp]
    xor     al, [edi + ebp]
    mov     [edx + ebp], al
    add     ebp, 1
    jmp     loop

exit:
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY

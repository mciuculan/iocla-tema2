%include "io.mac"

section .text
    global vigenere
    extern printf

section .data
    LEN         dd 0
    KEY_LEN     dd 0
    KEY         dd 0
    BACKUP      dd 0

vigenere:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edx, [ebp + 8]      ; ciphertext
    mov     esi, [ebp + 12]     ; plaintext
    mov     ecx, [ebp + 16]     ; plaintext_len
    mov     edi, [ebp + 20]     ; key
    mov     ebx, [ebp + 24]     ; key_len
    ;; DO NOT MODIFY

    ;; TODO: Implement the Vigenere cipher
    mov     eax, 0              ; counter
    mov     dword[LEN], ecx
    mov     dword[KEY_LEN], ebx
    xor     ecx, ecx            ; counter pt cipher
    xor     ebx, ebx            ; pt caracter

loop:
	cmp		eax, dword[LEN]
	je		exit
	mov     ebx, [esi + eax]
	cmp		bl, 122	; after 'z'
	jg		back
	cmp		bl, 65	; before 'A'
	jl		back
	cmp		bl, 90	; between 'Z' and 'a'
	jg		between
character:
    cmp     ecx, dword[KEY_LEN]
    je      modify
    push    eax
    mov     eax, [edi + ecx]
    mov     dword[KEY], eax
    pop     eax
    sub     dword[KEY], 65
    cmp     bl, 'a'
    jge     lower
    cmp     bl, 'A'
    jge     upper
back_ch:
    add     ecx, 1
back:
	mov     [edx + eax], ebx
	add		eax, 1
	jmp		loop

lower:
    mov     dword[BACKUP], 0
    mov     dword[BACKUP], ebx
    sub     bl, 32
    add     ebx, dword[KEY]
    cmp     bl, 'Z'
    jg      subst
back_to_lower:
    add     bl, 32
    jmp     back_ch

upper:
    mov     dword[BACKUP], 0
    mov     dword[BACKUP], ebx
    add     ebx, dword[KEY]
    cmp     bl, 'Z'
    jg      subst
    jmp     back_ch

subst:
    sub     bl, 26
    cmp     [BACKUP], byte 'a'
    jge     back_to_lower
    jmp     back_ch

between:
	cmp		bl, 97
	jl		back
	jmp		character

modify:
    xor     ecx, ecx
    jmp     character

exit:
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY

%include "io.mac"

section .text
    global my_strstr
    extern printf

section .data
	LEN         dd  0
    sub_LEN     dd  0
	INDEX       dd  0

my_strstr:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edi, [ebp + 8]      ; substr_index
    mov     esi, [ebp + 12]     ; haystack
    mov     ebx, [ebp + 16]     ; needle
    mov     ecx, [ebp + 20]     ; haystack_len
    mov     edx, [ebp + 24]     ; needle_len
    ;; DO NOT MODIFY

    mov     dword[LEN], ecx
    mov     dword[sub_LEN], edx
	sub     [sub_LEN], byte 1
    xor     ecx, ecx
    xor     eax, eax
    xor     edx, edx

string_cmp:
    cmp     ecx, dword[LEN]
	je      return_init_len
    mov     al, [esi + ecx]
    mov     [INDEX], ecx
	cmp     al, [ebx + edx]
	je      caracter_bun
back:
    xor     edx, edx
    add     ecx, 1
	jmp     string_cmp

caracter_bun:
    cmp     edx, [sub_LEN]
    je      return_adresa
    add     edx, 1
    add     ecx, 1
    mov     al, [esi + ecx]
	cmp     al, [ebx + edx]
	jne		modify
    jmp     caracter_bun

modify:
	mov		ecx, [INDEX]
	jmp		back

return_adresa:
    mov     ecx, [INDEX]
    mov     [edi], ecx
    jmp     return

return_init_len:
    add     dword[LEN], 1
    mov     eax, dword[LEN]
    mov     [edi], eax
    jmp     return
    ;; DO NOT MODIFY

return:
    popa
    leave
    ret
    ;; DO NOT MODIFY

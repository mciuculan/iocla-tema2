%include "io.mac"

section .text
    global caesar
    extern printf

caesar:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edx, [ebp + 8]      ; ciphertext
    mov     esi, [ebp + 12]     ; plaintext
    mov     edi, [ebp + 16]     ; key
    mov     ecx, [ebp + 20]     ; length
    ;; DO NOT MODIFY

    mov     eax, 0              ; counter

loop:
	cmp		ecx, eax
	je		exit
	mov     ebx, [esi + eax]
	push 	edi
	cmp		edi, 0
	je		back
	cmp		bl, 122	; after 'z'
	jg		back
	cmp		bl, 65	; before 'A'
	jl		back
	cmp		bl, 90	; between 'Z' and 'a'
	jg		between
character:
	cmp		edi, 0
	je		back
	cmp		bl, 96
	jg		lower_case
	cmp		bl, 64
	jg		upper_case
back_ch:
	sub		edi, 1
	jmp		character
back:
	mov     [edx + eax], ebx
	add		eax, 1
	pop 	edi
	jmp		loop

between:
	cmp		bl, 97
	jl		back
	jmp		character

lower_case:
	add		bl, 1
	cmp		bl, 122
	jg		to_a
	jmp		back_ch

upper_case:
	add		bl, 1
	cmp		bl, 90
	jg		to_A
	jmp 	back_ch

to_a:
	mov		bl, 97
	jmp		back_ch

to_A:
	mov		bl, 65
	jmp		back_ch

exit:
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY

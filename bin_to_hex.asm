%include "io.mac"

section .text
	global bin_to_hex
	extern printf

section .data
	sum     dd  0
	LEN 	dd	0

bin_to_hex:
	;; DO NOT MODIFY
	push    ebp
	mov     ebp, esp
	pusha

	mov     edx, [ebp + 8]      ; hexa_value
	mov     esi, [ebp + 12]     ; bin_sequence
	mov     ecx, [ebp + 16]     ; length
	;; DO NOT MODIFY

	;; TODO: Implement bin to hex
; 	mov		dword[LEN], ecx
; 	xor		eax, eax ; counter pana la 3
; 	xor		ebx, ebx
; 	mov		dword[sum], 0
; 	sub		ecx, 1
; 	;sub		dword[LEN], 1
; ; ;; CAND O SA PUI VAL DIN HEXA, DA-LE UN PUSH PE STIVA CA SA LE AI IN ORDINEA BUNA
; ; ;; GANDESTE-TE CA DACA SE TERMINA SECVENTA INAINTE DE 4 TU NU O AFISEZI NICAIERI

; sequence:
; 	cmp		ecx, 0
; 	jl		return
; 	cmp		eax, 4
; 	je		change_to_0
; back2:
; 	mov		ebx, [esi + ecx]
; 	PRINTF32 `%d\n\x0`, ebx
; 	cmp		ebx, 1
; 	je		add_to_sum
; back:
; 	inc 	eax
; 	sub		ecx, 1
; 	loop	sequence

; change_to_0:
; 	mov		eax, 0
; 	mov		dword[sum], 0
; 	jmp		back2

; add_to_sum:
; 	cmp		eax, 0
; 	je		add_1
; 	cmp		eax, 1
; 	je		add_2
; 	cmp		eax, 2
; 	je		add_4
; 	cmp		eax, 3
; 	je		add_8

; add_1:
; 	add 	dword[sum], 1
; 	jmp		back

; add_2:
; 	add 	dword[sum], 2
; 	jmp		back

; add_4:
; 	add 	dword[sum], 4
; 	jmp		back

; add_8:
; 	add 	dword[sum], 8
; 	jmp		back

return:
	;; DO NOT MODIFY
	popa
	leave
	ret
	;; DO NOT MODIFY

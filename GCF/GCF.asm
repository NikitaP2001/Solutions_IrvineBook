include GCF.inc

.code

GCF PROC USES esi edx a: DWORD, b: DWORD
;Calculates greatest common
;factor of two integers		
;Input: a, b  						|
;Output: eax  - GCF(a,b)			|
;-----------------------------------+

	mov eax, a
	xor edx, edx
	mov esi, b
	div esi
	
	test edx, edx
	jne @@else
	mov eax, b
	jmp @@end
@@else:
	INVOKE GCF,b,edx
@@end:
	ret
GCF ENDP
END
include main.inc

.code

strRemove PROC USES eax ebx,
						target:PTR DWORD,
						amount:DWORD					
	mov ebx, target
	add ebx, amount
	
	mov edi, target
	mov esi, ebx
	
	INVOKE str_Length, ebx
	mov ecx,eax
	inc ecx
	
	cld
	rep movsb
	ret

strRemove ENDP

END
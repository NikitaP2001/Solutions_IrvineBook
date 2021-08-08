include main.inc

EXTERN str_Length :PROTO, :PTR BYTE
strConcat PROTO,
			target:PTR DWORD,
			source:PTR DWORD

.code

strConcat PROC USES esi edi ebx,
				target:PTR DWORD,
				source:PTR DWORD
	INVOKE str_Length, target		
	add eax, target	
	mov edi, eax
				
	INVOKE str_Length, source
	mov ecx, eax
	inc ecx
	mov esi, source
	
	rep movsb				
	ret			
		
strConcat ENDP

END
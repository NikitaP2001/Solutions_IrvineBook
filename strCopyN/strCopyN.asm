include strCopyN.inc


.code

strCopyN PROC USES eax ecx esi edi,
						source:PTR BYTE,
						target:PTR DWORD,
						_size:DWORD
	INVOKE Str_length, source
	cmp eax, _size
	ja @@movs
	mov ecx, eax
	jmp @@copy
@@movs:
	mov ecx, _size
@@copy:
	inc ecx
	mov esi, source
	mov edi, target
	cld
	rep movsb
	ret
strCopyN ENDP

END
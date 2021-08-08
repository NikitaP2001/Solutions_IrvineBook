include SwapIntArray.inc

.code

Swap PROC USES eax esi edi,
					pValX:PTR DWORD,
					pValY:PTR DWORD
	mov edi, pValX
	mov esi, pValY
	mov eax, [esi]
	xchg eax, [edi]
	mov [esi], eax
	ret
Swap ENDP
END
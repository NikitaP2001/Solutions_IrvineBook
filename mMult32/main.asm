;.486
;.model flat, stdcall

include /masm32/include/irvine32.inc
;include /masm32/include/kernel32.inc
include /masm32/include/msvcrt.inc
includelib /masm32/lib/kernel32.lib
includelib /masm32/lib/irvine32.lib
includelib /masm32/lib/msvcrt.lib

mMult32 MACRO op1, op2
	EXITM <op1*op2>
ENDM

.data

.code

start:

Main proc

	mov eax, mMult32(55h, 34h)
	call DumpRegs

	push 0
	call ExitProcess

	ret
Main endp


END start
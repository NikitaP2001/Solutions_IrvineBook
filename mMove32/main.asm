.486
.model flat, stdcall

include /masm32/include/kernel32.inc
include /masm32/include/msvcrt.inc
includelib /masm32/lib/kernel32.lib
includelib /masm32/lib/msvcrt.lib



mMove32 MACRO op1, op2
	ECHO	FUCK YOU!
	IFIDNI <op1>,<eax>
		ECHO 	Caution1!
		EXITM
	ENDIF
	IFIDNI <op2>, <ebx>
		ECHO	caution2!
		EXITM
	ENDIF

ENDM

.data
val1	dd	0
val2	dd	12345

.code

start:

Main proc
	mMove32 eax, ebx

	push 0
	call ExitProcess

	ret
Main endp


END start
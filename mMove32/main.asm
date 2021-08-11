;.486
;.model flat, stdcall

include /masm32/include/irvine32.inc
;include /masm32/include/kernel32.inc
include /masm32/include/msvcrt.inc
includelib /masm32/lib/kernel32.lib
includelib /masm32/lib/irvine32.lib
includelib /masm32/lib/msvcrt.lib



mMove32 MACRO op1, op2
	reg equ eax

	IFIDNI <op1>,reg
		reg equ ebx
		IFIDNI <op2>,reg
			reg equ edx
		ENDIF
	ENDIF
	IFIDNI <op2>,reg
		reg equ ebx
		IFIDNI <op1>,reg
			reg equ edx
		ENDIF
	ENDIF
	
	push reg
	mov reg, op1
	push reg
	mov reg, op2
	mov op1, reg
	pop reg
	mov op2, reg
	pop reg

ENDM

.data
val1	dd	0
val2	dd	12345

.code

start:

Main proc

	mov eax, val1
	mov ebx, val2
	call DumpRegs
	
	mMove32 val1, val2
	
	mov eax, val1
	mov ebx, val2
	call DumpRegs

	push 0
	call ExitProcess

	ret
Main endp


END start
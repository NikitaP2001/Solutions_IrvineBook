.486
.model flat, stdcall

include /masm32/include/kernel32.inc
include /masm32/include/msvcrt.inc
includelib /masm32/lib/kernel32.lib
includelib /masm32/lib/msvcrt.lib



mWriteStringAttr MACRO string, color

	pushad
	push -11
	call GetStdHandle
	mov ebx, eax
	
	push color
	push ebx
	call SetConsoleTextAttribute
	
	lea eax, byte ptr[string]
	push eax
	call crt_strlen
	
	lea edx, byte ptr[string]
	
	push 0
	push edi
	push eax
	push edx
	push ebx
	call WriteConsole
	add esp, 4
	
	popad
	
ENDM

.data
szstr	BYTE "Coloured", 0

.code

start:

Main proc

	mWriteStringAttr szstr, (15 * 16) + 1
	
	push 0
	call ExitProcess

	ret
Main endp


END start
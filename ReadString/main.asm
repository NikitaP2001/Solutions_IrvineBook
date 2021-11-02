include \masm64\include\user32.inc
include \masm64\include\kernel32.inc
includelib \masm64\lib\user32.lib
includelib \masm64\lib\kernel32.lib

ReadString PROTO szStr:PTR BYTE, str_size:DWORD

STD_INPUT_HANDLE EQU -10
STD_OUTPUT_HANDLE EQU -11

.data
buffer db 300 DUP(0)

.code

main proc
	sub rsp, 28h
	
	lea rcx, buffer
	mov edx, 300
	call ReadString
	mov r8, rax

	mov rcx, STD_OUTPUT_HANDLE
	call GetStdHandle
	mov rcx, rax

	lea rdx, buffer
	xor r9, r9
	mov qword ptr[rsp+20h], 0
	call WriteConsoleA

	add rsp, 28h
	ret
main endp

ReadString proc szStr:PTR BYTE, str_size:DWORD
	nChrRead EQU dword ptr[rbp-8]
	sub rsp, 30h
	mov szStr, rcx
	mov str_size, edx
	
	mov rcx, STD_INPUT_HANDLE
	call GetStdHandle
	test rax, rax
	jz @Error

	mov rcx, rax
	mov rdx, szStr
	mov r8d, str_size
	lea r9, nChrRead
	mov qword ptr[rsp+20h], 0
	call ReadConsoleA
	test rax, rax
	mov eax, nChrRead
	
	jmp @end
@Error:
	xor rax, rax

@end:

	add rsp, 30h
	ret
ReadString endp 


END

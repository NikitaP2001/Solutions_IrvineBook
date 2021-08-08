
include	SwapIntArray.inc

ArraySize = 10
;Program SwapIntArray creates unordered array of integers and 
;swaps all elements if array using swap proc from file
;swap.asm
;------------------------------------------------------------


WriteArray PROTO, :PTR DWORD, :DWORD
.data
endmes	BYTE 10, "Press eny key to continue...", 0
array DWORD 50, 20241, 23, 4521, 2134152, 234, 5405, 52525, 539, 39245, 12, 21345, 69



.code
main PROC

	INVOKE WriteArray, addr array, LENGTHOF array
	
	mov ecx, OFFSET array			;ecx = array[0]
	mov eax, LENGTHOF array			;eax = length(array) - 1;
	dec eax
	
	xor edx, edx					;eax = ecx + eax * 4
	mov edi, 4
	mul edi
	add eax, ecx

L1:	
	cmp eax, ecx
	je @@end
	mov edi, ecx
	add edi, 4
	INVOKE swap, ecx, edi
	add ecx, 4
	jmp L1
@@end:

	INVOKE WriteArray, addr array, LENGTHOF array

	mov edx, OFFSET endmes
	call WriteString
	INVOKE crt__getch
	ret
main ENDP

WriteArray PROC uses ebx edi edi ecx edx eax, PtrArray:PTR DWORD, _size:DWORD
	mov ecx, PtrArray				;ecx = &array[0]
	mov eax, _size					;eax = length(array) - 1;
	dec eax
	
	xor edx, edx					;eax = ecx + eax * 4
	mov edi, 4
	mul edi
	add eax, ecx

L1:									;while (ecx <= eax){
	cmp ecx, eax
	jnbe @@end
	
	push eax						;WriteInt(array[ecx])
	mov eax, dword ptr[ecx]
	call WriteInt
	pop eax
	add ecx, 4						
	
	push eax						;print(' ');
	mov eax, ' '
	call WriteChar
	pop eax
	
	jmp L1							;}
@@end:
	call CrLf						;endl
	ret
WriteArray ENDP

END main














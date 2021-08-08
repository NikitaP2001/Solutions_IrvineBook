includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\user32.lib
includelib \masm32\lib\Irvine32.lib
include      \masm32\include\Irvine32.inc

.data
    UserRecv BYTE "Enter your points amount", 0
    Error  BYTE   "Input has incorrect format", 0
    RetMark  BYTE   "Your mark is: ", 0
    Marks   BYTE    "ABCDD", 0
    Mcount  BYTE    " Mark was calculeted ", 0
    Mcount2  BYTE    " times.", 0
.code
main PROC

quit:
    mov edx, OFFSET UserRecv
    xor ecx, ecx
    call WriteString
    call CrLf
Read:
    call ReadInt
    call Validate
    jz BadInput
    cmp eax, 0
    je _ext
    push eax
    call GetMark
    inc ecx
    mov edx, OFFSET RetMark
    call WriteString
    call WriteChar
    mov edx, OFFSET Mcount
    call WriteString
    mov eax, ecx
    call WriteInt
    mov edx, OFFSET Mcount2
    call WriteString
    call CrLf
    jmp Read  
BadInput:
    mov edx, OFFSET Error
    call WriteString
_ext:
    exit 
main ENDP
;*************************************
GetMark PROC
    push edi
    mov edx, [esp + 8]
    mov ebx, 90
    mov edi, offset Marks
L1:
    cmp eax, ebx
    jae _RetMark
    cmp ebx, 59
    jbe _F
    sub ebx, 10
    inc edi
    jmp L1
_F:
    mov byte ptr [edi], 'F'
_RetMark:
    mov al, byte ptr [edi]
    pop edi   
    ret
GetMark ENDP
;*************************************
Validate PROC
    push edx
    cmp eax, 100
    jg L1
    cmp eax, 0
    jl L1
    or edx, 1
    jmp OK
L1:
    test ax, 0
OK:
    pop edx
    ret    
Validate ENDP
;*************************************

END main





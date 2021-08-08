includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\user32.lib
includelib \masm32\lib\Irvine32.lib
include      \masm32\include\Irvine32.inc
CycleFactorial PROTO :DWORD
.data
mes1    BYTE    "Recursive proc time is ", 0
mes2    BYTE    "Cycle proc time is ", 0
mes3    BYTE    " ms", 0
.code
main PROC
    mov ecx, 9999999
    call GetMseconds
    push eax
L1:
    INVOKE CycleFactorial, 12
    LOOP L1
    call GetMseconds
    
    pop ebx
    sub eax, ebx
    mov edx, OFFSET mes2
    call WriteString
    call WriteInt
    mov edx, OFFSET mes3
    call WriteString

    call CrLf


    mov ecx, 9999999
    call GetMseconds
    push eax
L2:
    push 12
    call Factorial

    LOOP L2
    call GetMseconds
    
    pop ebx
    sub eax, ebx
    mov edx, OFFSET mes1
    call WriteString
    call WriteInt
    mov edx, OFFSET mes3
    call WriteString

@@quit:

    ret
main ENDP

CycleFactorial PROC uses esi edx n:DWORD
    mov eax, 1
    xor esi, esi
    
@@L1:
    cmp esi, n
    je @@End
    inc esi
    xor edx, edx
    mul esi
    jmp @@L1
@@End:
    ret
    
CycleFactorial ENDP

Factorial PROC

    push ebp
    mov ebp, esp
    mov eax, [ebp+8]
    cmp eax, 0
    ja L1
    mov eax, 1
    jmp L2
L1:
    dec eax
    push eax
    call Factorial
ReturnFact:
    mov ebx,[ebp+8]
    mul ebx
L2:
    pop ebp
    ret 4

Factorial ENDP


END main













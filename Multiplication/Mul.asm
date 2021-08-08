includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\user32.lib
includelib \masm32\lib\Irvine32.lib
include      \masm32\include\Irvine32.inc
.data
    shift BYTE ?
.code
main PROC
    mov eax, 25
    mov ebx, 2021
    call mulp
    call WriteInt
    exit
main ENDP
mulp PROC
    push edx
    push edi
    xor edx, edx
    xor ecx, ecx
contin:
    test ebx, ebx
    jz _out
    shr ebx, 1
    jnc endstep
    push eax
    shl eax, cl
    add edx, eax
    pop eax
endstep:
    inc cl
    jmp contin
_out:
    mov eax, edx
    pop edi
    pop edx
    ret
mulp ENDP
END main



















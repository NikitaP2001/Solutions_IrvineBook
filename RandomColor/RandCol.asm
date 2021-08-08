includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\user32.lib
includelib \masm32\lib\Irvine32.lib
include      \masm32\include\Irvine32.inc
.data
    RandCol BYTE    "Interesting, which color am I?", 10, 0
.code
main PROC
    call Randomize
    mov ecx, 20
L1:
    mov eax, 10
    call RandomRange
    cmp eax, 2
    ja ELSE1
    mov eax, 15
    jmp _ENDIF
ELSE1:
    cmp eax, 3
    ja ELSE2
    mov eax, 1
    jmp _ENDIF
ELSE2:
    mov eax, 2
_ENDIF:
    call SetTextColor
    mov edx, OFFSET RandCol
    call WriteString
    cmp ecx, 0
    dec ecx
    ja L1
    exit
main ENDP

END main











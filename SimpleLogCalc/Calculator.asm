includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\user32.lib
includelib \masm32\lib\Irvine32.lib
include      \masm32\include\Irvine32.inc
.data
    _title  BYTE "1. X AND Y", 10
            BYTE "2.X OR Y", 10
            BYTE "3.NOT X", 10
            BYTE "4. x XOR y", 10
            BYTE "5. Exit from program", 10, 0

    ANDtit BYTE    "X AND y", 10, 0
    ORtit   BYTE    "X OR y", 10, 0
    NOTtit  BYTE    "NOT x", 10, 0
    XORtit  BYTE    "x XOR y", 10, 0
    EXITtit  BYTE    "Quiting from program.", 10, 0
            
     _proc  DWORD   ?
            DWORD   procAND
            DWORD   procOR
            DWORD   procNOT
            DWORD   procXOR
            DWORD   procEXIT

.code
main PROC
cont:
    mov edx, OFFSET _title
    call WriteString
    call ReadInt
    cmp eax, 0
    jb procEXIT
    cmp eax, 5
    ja procEXIT
    imul eax, 4
    call dword ptr[_proc+eax]
    jmp cont
main ENDP
procAND PROC
    mov edx, OFFSET ANDtit
    call WriteString
    call ReadHex
    mov edx, eax
    call ReadHex
    and eax, edx
    call WriteHex
    call CrLf
    ret
procAND ENDP
;--------------------
procOR  PROC
    mov edx, OFFSET ORtit
    call WriteString
    call ReadHex
    mov edx, eax
    call ReadHex
    or eax, edx
    call WriteHex
    call CrLf
    ret
procOR  ENDP
;--------------------
procNOT PROC
    mov edx, OFFSET NOTtit
    call WriteString
    call ReadHex
    not eax
    call WriteHex
    call CrLf
    ret
procNOT ENDP
;--------------------
procXOR PROC
    mov edx, OFFSET XORtit
    call WriteString
    call ReadHex
    mov edx, eax
    call ReadHex
    xor eax, edx
    call WriteHex
    call CrLf
    ret
procXOR ENDP
;--------------------
procEXIT PROC
    mov edx, OFFSET EXITtit
    call WriteString
    exit
procEXIT ENDP
END main











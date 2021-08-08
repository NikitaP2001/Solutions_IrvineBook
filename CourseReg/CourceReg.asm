includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\user32.lib
includelib \masm32\lib\Irvine32.lib
include      \masm32\include\Irvine32.inc

.data
    TRUE = 1
    FALSE = 0
    gradeAverange WORD 275
    credits       WORD 12
    OkToRegister    BYTE ?
    S1  BYTE    "Input your averange grade", 0
    S2 BYTE    "credits", 0
    InvInput BYTE   "You input invalid data", 0  
    success BYTE    "You successfully registered on course", 0
    failture    BYTE    "You cant register on this coure now", 0
.code
main PROC
continue:
    mov edx, OFFSET s1
    call WriteString
    call CrLf
    call ReadInt
    mov WORD ptr gradeAverange, ax
    cmp ax, 0
    je _exit
    mov edx, OFFSET s2
    call WriteString
    call CrLf
    call ReadInt
    mov WORD ptr credits, ax
    call CheckRegData
    mov al, byte ptr[OkToRegister]
    cmp ax, 1
    jne _fault
    mov edx, OFFSET success
    call WriteString
    jmp continue
_fault:
    mov edx, OFFSET failture
    call WriteString
    call CrLf
    jmp continue
_exit:
    exit
main ENDP
CheckRegData PROC
    pushad
    mov OkToRegister, FALSE
    mov ax, WORD PTR [gradeAverange]
    mov bx, WORD PTR [credits]
    cmp ax, 400
    ja InvIn
    cmp bx, 30
    ja InvIn
    cmp bx, 0
    je InvIn
    ;-----------------------------
    cmp ax, 350
    jb _ELSE1
    mov OkToRegister, TRUE
    jmp _exit
_ELSE1:
    cmp ax, 250
    jb _ELSE2
    cmp bx, 16
    ja _ELSE2
    mov OkToRegister, TRUE
    jmp _exit
_ELSE2:
    cmp bx, 12
    jg _exit
    mov OkToRegister, TRUE
    jmp _exit 
    ;-----------------------------
InvIn:
    mov edx, OFFSET InvInput
    call WriteString
_exit:
    popad
    ret
CheckRegData ENDP
END main













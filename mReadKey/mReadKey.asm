;includelib \masm32\lib\kernel32.lib
;includelib \masm32\lib\user32.lib
;include      \masm32\include\Irvine32.inc
INCLUDE \masm32\include\Irvine16.inc
INCLUDELIB \masm32\lib\Irvine16.lib

mWriteStr MACRO message
	IFB <ascii>
        ECHO ---------------------------------
        ECHO *  Error scipped parametr message
        ECHO *        in macro Readkey
        ECHO ---------------------------------
        EXITM
    ENDIF
	mov ah, 40h
	mov bx, 1
	
	mov cx, SIZEOF message
	mov dx, OFFSET message
	int 21h

ENDM

mExit	MACRO

	mov ah, 4Ch
	int 21h
	
ENDM

mReadkey MACRO ascii, scan
    IFB <ascii>
        ECHO --------------------------------
        ECHO *  Error scipped parametr ascii
        ECHO *      in macro Readkey
        ECHO --------------------------------
        EXITM
    ENDIF
    IFB <scan>
        ECHO --------------------------------
        ECHO *  Error scipped parametr scan
        ECHO *      in macro Readkey
        ECHO --------------------------------
        EXITM
    ENDIF

        mov ah,10h
        int 16h
        mov byte ptr[ascii],al
        mov byte ptr[scan],ah
    
ENDM

.data
ascii BYTE ?
scan    BYTE ?
ascmsg 	BYTE "ascii code:",0
scnmsg	BYTE "scan code:", 0

.code
main PROC
    xor ah,ah
	mov ax, SEG ascmsg
    mov ds,ax
	
	mWriteStr ascmsg
    mov word ptr[ascii], 0
    mov al,byte ptr[ascii]
    call WriteChar
	call Crlf
	
	mWriteStr scnmsg	
    movzx ax,byte ptr[scan]
    call WriteHex
    call Crlf

    mReadkey ascii, scan

	mWriteStr ascmsg
    mov al,byte ptr[ascii]
    call WriteChar
	call Crlf
	
	mWriteStr scnmsg
    movzx ax,byte ptr[scan]
    call WriteHex
    call Crlf
	
	mExit

main ENDP



END main








include strCopyN.inc

.data
src		BYTE "String will be copied"
trg		BYTE 20 DUP(0)
.code
main PROC
	mov edx, OFFSET src
	call WriteString
	call CrLf
	INVOKE strCopyN, addr src, addr trg, 20
	mov edx, OFFSET trg
	call WriteString
	call CrLf
	call WaitMsg
	ret
main ENDP

END main
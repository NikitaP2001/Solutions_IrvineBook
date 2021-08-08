include main.inc

.data
src		BYTE "String will be copied", 0
trg		BYTE "Dont wanish me,", 20 DUP(0)
.code
main PROC
	INVOKE strConcat,addr trg,addr src
	
	mov edx, OFFSET trg
	call WriteString
	call CrLf
	call WaitMsg
	ret
	
main ENDP

END main
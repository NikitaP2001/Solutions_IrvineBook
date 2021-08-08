include main.inc

.data
trg		BYTE "Hey xxxxxx, delete 'x', please!", 0
.code
main PROC
	INVOKE strRemove,addr trg + 4,6
	
	mov edx, OFFSET trg
	call WriteString
	call CrLf
	call WaitMsg
	ret
	
main ENDP

END main
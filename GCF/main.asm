
include	GCF.inc


.data


.code
main PROC

	INVOKE GCF,9080,44
	call WriteInt
	call CrLf
	call WaitMsg

main ENDP

END main














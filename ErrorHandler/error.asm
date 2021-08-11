
.data
ErrorCaption BYTE "Error",0
ErrorMsg	 BYTE " failed with error ",0
.code
ErrorMessage PROC uses ebx esi edi, DWErrorCode:DWORD,lpszFunction:PTR BYTE
	LOCAL lpMsgBuf: LPVOID
	LOCAL lpDisplayBuf: LPVOID
	LOCAL dwerror: DWORD

	call GetLastError
	mov dwerror, eax
	
	mov ebx,FORMAT_MESSAGE_ALLOCATE_BUFFER
	or ebx,FORMAT_MESSAGE_FROM_SYSTEM
	or ebx,FORMAT_MESSAGE_IGNORE_INSERTS
	
	invoke FormatMessage,ebx,0,dwerror,0,addr lpMsgBuf,0,0
	
	invoke crt_strlen,lpszFunction
	mov ebx,eax
	invoke crt_strlen,lpMsgBuf
	add ebx,eax
	add ebx,80
	
	invoke LocalAlloc,LMEM_ZEROINIT,ebx
	mov lpDisplayBuf, eax
	
	invoke crt_strcpy,lpszFunction,lpDisplayBuf
	
	invoke crt_strcat,lpDisplayBuf,OFFSET ErrorMsg
	
	invoke crt_strlen,lpDisplayBuf
	add eax,lpDisplayBuf
	invoke crt__itoa,dwerror,eax,10
	
	invoke crt_strlen,lpDisplayBuf
	add eax,lpDisplayBuf
	mov byte ptr[eax], ':'
	mov byte ptr[eax+1], ' '
	mov byte ptr[eax+2], 0
	
	invoke crt_strcat, lpDisplayBuf, lpMsgBuf
	
	invoke MessageBox,0,lpDisplayBuf,addr ErrorCaption,MB_ICONERROR
	
	invoke LocalFree,lpMsgBuf
	invoke LocalFree,lpDisplayBuf
	invoke ExitProcess,dwerror

	Ret
ErrorMessage EndP
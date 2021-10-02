;.486
;.model flat, stdcall

include /masm32/include/irvine32.inc
;include /masm32/include/kernel32.inc
include /masm32/include/msvcrt.inc
includelib /masm32/lib/kernel32.lib
includelib /masm32/lib/irvine32.lib
includelib /masm32/lib/msvcrt.lib

WalkMax = 	50
StartX 	=	25
StartY	=	25

DrunkardWalk	STRUCT
	path	COORD WalkMax DUP(<0, 0>)
	pathsUsed	WORD	0
	direction	WORD	?
DrunkardWalk	ENDS

DisplayPosition PROTO currX:WORD, currY:WORD
TakeDrunkenWalk PROTO

.data
	aWalk	DrunkardWalk <>
	
.code

start:

Main proc
	mov esi, offset aWalk
	call	TakeDrunkenWalk
	exit
Main endp

TakeDrunkenWalk PROC
	LOCAL currX:WORD, currY:WORD
	
	pushad
	
	mov edi,esi
	add edi,OFFSET DrunkardWalk.path
	
	mov ecx,WalkMax
	mov currX,StartX
	mov currY,StartY
	
	;initilize direction
	mov ah, 0
	mov (DrunkardWalk PTR[esi]).direction, ax
	
Again:
	mov ax,currX
	mov (COORD PTR [edi]).X,ax
	
	mov ax,currY
	mov (COORD PTR [edi]).Y,ax
	
	INVOKE DisplayPosition, currX, currY
	
	mov eax, 9
	call RandomRange
	
	cmp eax, 5
	jbe @keep_going
	
	.IF eax == 6
		mov bx, 0
	.ELSEIF ax == 7
		mov bx, 1
	.ELSEIF eax == 8
		mov bx, 2
	.ELSE
		mov bx, 3
	.ENDIF
	mov (DrunkardWalk PTR[esi]).direction, bx
	
@keep_going:
	mov ax, (DrunkardWalk PTR[esi]).direction
	.IF ax == 0
		inc currY
	.ELSEIF ax == 1
		dec currY
	.ELSEIF ax == 2
		dec currX
	.ELSE
		inc currX
	.ENDIF
	
	add edi, TYPE COORD
	dec ecx
	jne Again
Finish:
	mov (DrunkardWalk PTR [esi]).pathsUsed, WalkMax
	popad
	ret
	
TakeDrunkenWalk ENDP

DisplayPosition PROC uses eax edx,
			currX:WORD, currY:WORD
.data
commaStr	BYTE ",",0

.code
	pushad
	
	movzx eax,currX
	call WriteDec
	
	mov edx,OFFSET commaStr
	call WriteString
	
	movzx eax,currY
	call WriteDec
	call CrLf
	
	popad
	ret
DisplayPosition ENDP

END start
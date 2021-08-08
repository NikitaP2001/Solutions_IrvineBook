include C:\masm32\include\Irvine32.inc
include \masm32\include\msvcrt.inc
includelib \masm32\lib\msvcrt.lib
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\user32.lib
includelib \masm32\lib\Irvine32.lib

EXTERN WriteInt :PROTO

strConcat PROTO,
			target:PTR DWORD,
			source:PTR DWORD








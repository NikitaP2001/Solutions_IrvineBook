PATH c:\Masm32\
	SET INCLUDE=c:\Masm32\include
	SET LIB=c:\Masm32\lib
	
	c:\Masm32\bin\ML -Zi -c -Fl -coff SwapIntArray.asm swap.asm
	if errorlevel 1 goto terminate
	
	c:\Masm32\bin\LINK SwapIntArray.obj swap.obj irvine32.lib kernel32.lib msvcrt.lib user32.lib /SUBSYSTEM:CONSOLE 
	if errorlevel 1 goto terminate
	dir
	:terminate
	pause
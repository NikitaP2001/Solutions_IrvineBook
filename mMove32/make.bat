@echo off
PATH c:\Masm32\
	SET INCLUDE=c:\Masm32\include
	SET LIB=c:\Masm32\lib
	
	c:\Masm32\bin\ML -c -coff main.asm
	if errorlevel 1 goto terminate

	c:\Masm32\bin\LINK main.obj kernel32.lib msvcrt.lib user32.lib /SUBSYSTEM:CONSOLE 

	if errorlevel 1 goto terminate
	
	del main.obj
	if errorlevel 1 goto terminate
@echo on
	dir
	:terminate
	pause
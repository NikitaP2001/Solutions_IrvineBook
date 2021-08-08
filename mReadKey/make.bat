PATH c:\Masm32\
	SET INCLUDE=c:\Masm32\include
	SET LIB=c:\Masm32\lib
	
	C:\Masm32\bin\ml /Cp -c mReadKey.asm
	if errorlevel 1 goto terminate
	
	c:\Masm32\bin\link16 mReadKey.obj
	if errorlevel 1 goto terminate
	dir
	:terminate
	pause
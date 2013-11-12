@echo off
@if "%~1" == "" goto Syntax
@set src=%~1
@if not exist "%src%" goto NoSourceFile
call :CheckFileSize %src%
@if "%size%" == "0" goto EmptySourceFile
@if not exist as.exe goto AssemblerMissing
@if exist a.out del /f /q a.out
@as -mthumb -mthumb-interwork "%src%"
@if not "%errorlevel%" == "0" goto Cleanup
@set dest=%~2
@if "%dest%" == "" goto NoDestFile

:ToBinary
@if not exist objcopy.exe goto ObjCopyMissing
@if exist "%dest%" del /f /q "%dest%"
@objcopy -O binary a.out "%dest%"
@if not exist "%dest%" goto CleanUp
@if not "%errorlevel%" == "0" goto Cleanup
@echo Assembled successfully.

:CleanUp
@set src=""
@set dest=""
@set size=""
@if exist a.out del /f /q a.out
goto:EOF

:NoDestFile
@set dest=%src%
@set dest=%dest:~0,-3%bin
goto ToBinary

:NoSourceFile
@echo Cannot assemble '%src%': the file does not exist.
goto:EOF

:CheckFileSize
@set size=%~z1
goto:EOF

:EmptySourceFile
@echo Cannot assemble '%src%': the file is empty.
goto Cleanup

:AssemblerMissing
@echo as.exe is missing.
goto Cleanup

:ObjCopyMissing
@echo objcopy.exe is missing.
goto Cleanup

:Syntax
@echo Lil' ARM/THUMB Assembler Batch Script
@echo Written by HackMew
@echo.
@echo Usage: thumb source.asm [output.bin]
@echo.
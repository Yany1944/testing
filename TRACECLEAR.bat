@echo off
color 1E
:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------



title Our FunPay Yany1944 \ ElixOS
Set mycmdWidth=75
Set mycmdHeight=40


setlocal
call :colorEZ
cls

SETLOCAL ENABLEEXTENSIONS
SETLOCAL ENABLEDELAYEDEXPANSION

:menuLOOP

color 1E
cls

echo  %ESC%[44m%ESC%[107m%ESC%[91mVersion:3
echo %ESC%[44m%ESC%[92m------------------------
echo %ESC%[44m%ESC%[92m***** Our FunPay Yany1944 \ ElixOS ***** 
echo %ESC%[44m%ESC%[92m------------------------ %ESC%[97m%ESC%[44m 
echo.
for /f "tokens=1,2,* delims=_ " %%A in ('"findstr /b /c:":menu_" "%~f0""') do echo.  %%B  %%C
set choice=
echo.&set /p choice= Please select your choice:  ||GOTO:EOF
echo.&call:menu_%choice%

GOTO:menuLOOP

::-----------------------------------------------------------
:: menu functions follow below here
::-----------------------------------------------------------

:menu_1   Spoof HDD Serial

Set mycmdWidth=37
Set mycmdHeight=31

cls
echo %ESC%[44m%ESC%[92m------------------------
echo %ESC%[44m%ESC%[92m--- Spoof HDD Serial --- 
echo %ESC%[44m%ESC%[92m------------------------
echo(
echo(%ESC%[97m%ESC%[93mDisk Drive:%ESC%[97m 
wmic diskdrive get serialnumber
echo(%ESC%[97m%ESC%[93mMemory Chip:%ESC%[97m 
wmic memorychip get serialnumber
echo(%ESC%[97m%ESC%[93mBase Board:%ESC%[97m 
wmic baseboard get serialnumber
echo %ESC%[93m

:UseChoice
%SystemRoot%\System32\choice.exe /C YN /N /M "Do you want to spoof it? [Y/N]?"
if not errorlevel 1 goto UseChoice
if errorlevel 2 goto :EOF

%CurrentDir%mapper.exe spoofer.sys
%CurrentDir%mapper.exe spoofer.sys

Set mycmdWidth=75
Set mycmdHeight=40

color F0
cls

    setlocal enableextensions enabledelayedexpansion

    Rem Get a carriage return character
    set "CR=" & for /f %%a in ('copy /Z "%~f0" nul') do if not defined CR set "CR=%%a"
    rem The progress bar
    set "fill=[##############################]"
	

    echo(
    echo(
    echo(
    echo(
    echo(%ESC%[91mComputers were created to give humans time to think while waiting ....

    echo(
    echo(
    rem For each character in the fill
    for /l %%a in (2 1 31) do (
        rem Calculate the right part of the bar
        set "spaces=!fill:~%%a!"

        rem Output the left and right parts of the bar and carriage return
        <nul set/p ".= Loading The Magic !fill:~0,%%a!!spaces:#= !!CR!"

        rem Pause for a second
        ping -n 2 "" > nul
    )
    echo(
	cls
	
	
Set mycmdWidth=37
Set mycmdHeight=31

	color 1E
    echo(
    echo(
echo %ESC%[92m-----------------------------------------
echo %ESC%[92mHDD serial has been successfully changed.
echo %ESC%[96mNew Serial Numbers:
echo %ESC%[96m-----------------------------------------%ESC%[97m
    echo(

echo(%ESC%[97m%ESC%[93mDisk Drive:%ESC%[97m 
wmic diskdrive get serialnumber
echo(%ESC%[97m%ESC%[93mMemory Chip:%ESC%[97m 
wmic memorychip get serialnumber
echo(%ESC%[97m%ESC%[93mBase Board:%ESC%[97m 
wmic baseboard get serialnumber

echo %ESC%[91m

pause
cls
GOTO:EOF

:menu_2   Check Serials



cls
echo %ESC%[44m%ESC%[92m------------------------
echo %ESC%[44m%ESC%[92m---- Check Serials ---- 
echo %ESC%[44m%ESC%[92m------------------------
echo(
echo(%ESC%[97m%ESC%[93mDisk Drive:%ESC%[97m 
wmic diskdrive get serialnumber
echo(%ESC%[97m%ESC%[93mMemory Chip:%ESC%[97m 
wmic memorychip get serialnumber
echo(%ESC%[97m%ESC%[93mBase Board:%ESC%[97m 
wmic baseboard get serialnumber


echo %ESC%[91m

pause
cls
GOTO:menuLOOP

:colorEZ
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set ESC=%%b
  exit /B 0
)
GOTO:EOF

@echo off
chcp 65001 > nul
@REM Project: download_curl
@REM Description: 下載 curl.exe 並解壓縮
@REM Author: Yomisana
@REM Date: 2023-12-04
@REM Version: 1.0.0

:menu
title LunarHub
cls
echo LunarHub
echo.


echo 1. Run screenshot2code
@REM echo 2. Download curl
echo 2. Install Dependency
echo 3. Exit


echo.
@REM set /p choice=Enter the number of your choice: 
choice /c 123456789 /n /m "請選擇操作 (0-3): "

if "%errorlevel%"=="1" goto screenshot2code
@REM if "%errorlevel%"=="2" goto downloadCurl
if "%errorlevel%"=="2" goto check_dependency
if "%errorlevel%"=="9" goto exitScript
goto menu

:screenshot2code
cls
echo Running screenshot2code...
call lib\screenshot2code.bat
pause
goto menu

@REM :downloadCurl
@REM cls
@REM echo Running downloadCurl...
@REM call lib\curl.bat
@REM pause
@REM goto menu

:check_dependency
cls
echo Running check_dependency...
call lib\depend_install.bat
pause
goto menu

:exitScript
cls
echo Exiting...
exit

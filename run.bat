@echo off
chcp 65001 > nul
@REM Project: download_curl
@REM Description: 下載 curl.exe 並解壓縮
@REM Author: Yomisana
@REM Date: 2023-12-04
@REM Version: 1.0.0

:menu
cls
echo LunarHub
echo 1. Run screenshot2code
@REM echo 2. Download curl
echo 3. Exit

set /p choice=Enter the number of your choice: 

if "%choice%"=="1" goto screenshot2code
@REM if "%choice%"=="2" goto downloadCurl
if "%choice%"=="2" goto check_dependency
if "%choice%"=="3" goto exitScript

:screenshot2code
cls
echo Running screenshot2code...
call lib\screenshot2code.bat
pause
goto menu

:downloadCurl
cls
echo Running downloadCurl...
call lib\curl.bat
pause
goto menu

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

@echo off
chcp 65001 > nul

:menu
cls
echo My Tools Menu
echo 1. Run screenshot2code
echo 2. Download curl
echo 3. Exit

set /p choice=Enter the number of your choice: 

if "%choice%"=="1" goto screenshot2code
if "%choice%"=="2" goto downloadCurl
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

:exitScript
cls
echo Exiting...
exit

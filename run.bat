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
echo 2. Install Dependency
echo 3. Download curl
echo 4. download git
echo 5. download screenshot2code
echo 6. download python
echo 9. Exit


echo.
@REM set /p choice=Enter the number of your choice: 
choice /c 123456789 /n /m "請選擇操作 (0-9): "

if "%errorlevel%"=="1" goto screenshot2code
if "%errorlevel%"=="2" goto check_dependency


if "%errorlevel%"=="3" goto downloadCurl
if "%errorlevel%"=="4" goto downloadGit
if "%errorlevel%"=="5" goto downloads2c
if "%errorlevel%"=="6" goto downloadpy


if "%errorlevel%"=="9" goto exitScript
goto menu

:screenshot2code
cls
echo Running screenshot2code...
call lib\screenshot2code.bat
pause
goto menu

:check_dependency
cls
echo Running check_dependency...
call lib\depend_install.bat
pause
goto menu

:downloadCurl
cls
echo Running downloadCurl...
call lib\download_curl.bat
pause
goto menu

:downloadGit
cls
echo Running downloadGit...
call lib\download_git.bat
pause
goto menu

:downloads2c
cls
echo Running downloads2c...
call lib\download_s2c.bat
pause
goto menu

:downloadpy
cls
echo Running downloadpy...
call lib\download_python.bat
pause
goto menu

:exitScript
cls
echo Exiting...
exit

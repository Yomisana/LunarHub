@echo off
chcp 65001 > nul
setlocal enabledelayedexpansion
@REM Project: download_python
@REM Description: 下載 python 並解壓縮
@REM Author: Yomisana
@REM Date: 2023-12-05
@REM Version: 1.0.5

cls
title LunarHub - update - python
echo curl → git → screenshot2code → python → pip
echo download → move → update
echo → update
set "pthFile=%cd%\bin\python\python310._pth"
for /f "usebackq delims=" %%i in ("%pthFile%") do (
    set "newData=%%i"
    set "newData=!newData:#import site=import site!"
    echo !newData!>>"%pthFile%.new"
)
del "%pthFile%"
move "%pthFile%.new" "%pthFile%"
echo The python310._pth has been updated!
timeout /t 1 /nobreak >nul
pause

endlocal
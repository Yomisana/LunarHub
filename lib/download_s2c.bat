@echo off
chcp 65001 > nul
@REM Project: download_s2c
@REM Description: 下載 s2c
@REM Author: Yomisana
@REM Date: 2023-12-05
@REM Version: 1.0.0

cls
title LunarHub - download - screenshot2code
echo curl → git → screenshot2code
echo download
echo → download
@REM cd /d "%cd%\bin"
%cd%\bin\git\bin\git.exe clone https://github.com/abi/screenshot-to-code %cd%\bin\s2c
@REM %cd%\bin\curl.exe -k -O -L https://github.com/git-for-windows/git/releases/download/v2.40.1.windows.1/PortableGit-2.40.1-64-bit.7z.exe
@REM %cd%\lib\batcurl.exe -O -k -L https://github.com/git-for-windows/git/releases/download/v2.40.1.windows.1/PortableGit-2.40.1-64-bit.7z.exe

cls
title LunarHub - done - screenshot2code
echo curl → git → screenshot2code
echo download → done
echo → done

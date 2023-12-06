@echo off
chcp 65001 > nul
@REM Project: download_node
@REM Description: 下載 node.exe 並解壓縮
@REM Author: Yomisana
@REM Date: 2023-12-05
@REM Version: 1.0.0

@REM https://nodejs.org/download/release/v21.3.0/node-v21.3.0-win-x64.zip
cls
title LunarHub - download - node
echo curl → git → screenshot2code → python → pip → node
echo download
echo → download
%cd%\bin\curl.exe -k -O -L https://nodejs.org/download/release/v21.3.0/node-v21.3.0-win-x64.zip
timeout /t 1 /nobreak >nul

cls
title LunarHub - download - node
echo curl → git → screenshot2code → python → pip → node
echo download → unzip
echo → unzip
tar -xf %cd%\node-v21.3.0-win-x64.zip -C %cd%\bin\
timeout /t 2 /nobreak >nul
move %cd%\bin\node-v21.3.0-win-x64 %cd%\bin\node

cls
title LunarHub - clean - nvm
echo curl → git → screenshot2code → python → pip → node
echo download → unzip → clean
echo → clean
del /q /f "%cd%\node-v21.3.0-win-x64.zip"
timeout /t 1 /nobreak >nul

cls
title LunarHub - Done - node
echo curl → git → screenshot2code → python → pip → node
echo download → unzip → clean → Done
echo → Done
echo node version:
%cd%\bin\node\node -v
echo npm  version:
%cd%\bin\node\npm -v
timeout /t 1 /nobreak >nul
pause
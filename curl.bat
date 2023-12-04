@echo off

@REM Project: download_curl
@REM Description: 下載 curl.exe by binary Michael Kostylev 提供的版本
@REM Author: Yomisana
@REM Date: 2023-12-04
@REM Version: 1.0.0

@REM 程式碼底加
set "url=https://curl.se/windows/latest.cgi?p=win64-mingw.zip"
set "curlDownloadPath=%cd%\curl.zip"
set "extractPath=%cd%\curl"

echo Download curl.zip...
bitsadmin /transfer downloadJob /download /priority normal %url% %curlDownloadPath%

echo Waiting curl.zip download finished...
timeout /t 5 /nobreak >nul

echo Finished download curl.zip
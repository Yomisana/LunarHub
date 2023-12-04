@echo off

@REM Project: download_curl
@REM Description: 下載 curl.exe 並解壓縮
@REM Author: Yomisana
@REM Date: 2023-12-04
@REM Version: 1.0.0

@REM 環境變數
set "url=https://curl.se/windows/latest.cgi?p=win64-mingw.zip"
set "curlDownloadPath=%cd%\curl.zip"
set "extractPath=%cd%\curl"

@REM 下載 curl.zip
echo Download curl.zip...
bitsadmin /transfer downloadJob /download /priority normal %url% %curlDownloadPath%
echo.

@REM 解壓縮 curl.zip
if not exist "%extractPath%" (
    mkdir "%extractPath%"
)

echo.
echo unzip curl.zip to %extractPath%...
tar -xf %curlDownloadPath% -C %extractPath%

@REM 清除 curl.zip
@REM echo Cleaning up curl.zip...
echo.
echo del curl.zip...
del %curlDownloadPath%
echo.
echo Done! %extractPath%
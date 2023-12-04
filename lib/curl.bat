@echo off
chcp 65001 > nul
@REM Project: download_curl
@REM Description: 下載 curl.exe 並解壓縮
@REM Author: Yomisana
@REM Date: 2023-12-04
@REM Version: 1.0.0

@REM 環境變數
set "url=https://curl.se/windows/latest.cgi?p=win64-mingw.zip"
set "curlDownloadPath=%cd%\curl.zip"
set "extractPath=%cd%\curl"
set "curlPath=%cd%\curl"
set "libPath=%cd%\lib"

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

@REM 遞迴搜尋 curl 資料夾下的所有非空 bin 資料夾
for /d /r "%curlPath%" %%i in (bin) do (
    dir /b "%%i\curl.exe" >nul 2>nul
    if not errorlevel 1 (
        echo 找到 bin 資料夾：%%i
        call :SearchNonEmptyCurlExe "%%i"
    )
)

echo.
echo 搜尋完成
echo.
echo.
echo.

@REM 創建 lib 資料夾，如果不存在
if not exist "%libPath%" (
    mkdir "%libPath%"
    echo Created lib folder: %libPath%
)

@REM 移動 curl.exe 到 lib 資料夾
move "%curlPath%\curl.exe" "%libPath%\"
echo 移動 %curlPath%\curl.exe 到 %libPath%\
echo 移動完成

@REM 刪除解壓縮的資料夾
echo Deleting extractPath: %extractPath%
rmdir /s /q "%extractPath%"

curl.exe --version
goto :eof

:SearchNonEmptyCurlExe
@REM 在指定的 bin 資料夾中檢查非空的 curl.exe
if exist "%1\curl.exe" (
    echo 在 %1 中找到 curl.exe：%1\curl.exe

    @REM 移動非空的 curl.exe 到原先的目錄下
    move "%1\curl.exe" "%libPath%\"
    echo 移動 %1\curl.exe 到 %libPath%\

    echo 移動完成
)
goto :eof
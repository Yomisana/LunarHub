@echo off
chcp 65001 > nul
@REM Project: download_curl
@REM Description: 下載 curl.exe 並解壓縮
@REM Author: Yomisana
@REM Date: 2023-12-04
@REM Version: 1.0.0

@REM 環境變數
title LunarHub - Check Dependency - curl
set "url=https://curl.se/windows/latest.cgi?p=win64-mingw.zip"
set "curlDownloadPath=%cd%\curl.zip"
set "extractPath=%cd%\curl"
set "curlPath=%cd%\curl"
set "binPath=%cd%\bin"

:download
@REM 下載 curl.zip
title LunarHub - Download - curl
echo Download
echo → Download
echo.
bitsadmin /transfer downloadJob /download /priority normal %url% %curlDownloadPath%
timeout /t 1 /nobreak >nul
goto extract

:extract
@REM 解壓縮 curl.zip
cls
title LunarHub - Extract - curl
echo Download → Extract
echo → Extract
echo.
if not exist "%extractPath%" (
    mkdir "%extractPath%"
)
echo unzip curl.zip to %extractPath%...
tar -xf %curlDownloadPath% -C %extractPath%
timeout /t 1 /nobreak >nul

:move
cls
title LunarHub - Move - curl
echo Download → Extract → Move
echo → Move
echo.
@REM 創建 bin 資料夾，如果不存在
if not exist "%binPath%" (
    mkdir "%binPath%"
    echo Created bin folder: %binPath%
)

@REM 遞迴搜尋 curl 資料夾下的所有非空 bin 資料夾
for /d /r "%curlPath%" %%i in (bin) do (
    dir /b "%%i\curl.exe" >nul 2>nul
    if not errorlevel 1 (
        @REM echo 找到 bin 資料夾：%%i
        call :SearchNonEmptyCurlExe "%%i"
    )
)

:SearchNonEmptyCurlExe
@REM 在指定的 bin 資料夾中檢查非空的 curl.exe
if exist "%1\curl.exe" (
    echo 在 %1 中找到 curl.exe：%1\curl.exe

    @REM 移動非空的 curl.exe 到原先的目錄下
    move "%1\curl.exe" "%binPath%\"
    echo 移動 %1\curl.exe 到 %binPath%\

    @REM echo 移動完成
)

@REM 移動 curl.exe 到 bin 資料夾
move "%curlPath%\curl.exe" "%binPath%\"
@REM echo 移動 %curlPath%\curl.exe 到 %binPath%\
@REM echo 移動完成
timeout /t 1 /nobreak >nul

:clean_zip
@REM 清除 curl.zip
cls
title LunarHub - Clean - curl
echo Download → Extract → Move → Clean
echo → Clean
echo.
@REM echo del curl.zip...
del %curlDownloadPath%
@REM echo.
@REM echo Done! %extractPath%
timeout /t 1 /nobreak >nul
@REM 刪除解壓縮的資料夾
@REM echo Deleting extractPath: %extractPath%
rmdir /s /q "%extractPath%"
timeout /t 1 /nobreak >nul
goto end

:end
cls
title LunarHub - Done - curl
echo Download → Extract → Move → Clean → Done!
echo → Done
echo.
curl.exe --version
timeout /t 1 /nobreak >nul
@echo off
chcp 65001 > nul

@REM Project: search_curl_bins
@REM Description: 搜尋 curl 資料夾內的 bin 資料夾以及是否包含非空 curl.exe
@REM Author: Yomisana
@REM Date: 2023-12-04
@REM Version: 1.0.0

@REM 環境變數
set "curlPath=%cd%\curl"

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
goto :eof

:SearchNonEmptyCurlExe
@REM 在指定的 bin 資料夾中檢查非空的 curl.exe
if exist "%1\curl.exe" (
    echo 在 %1 中找到 curl.exe：%1\curl.exe

    @REM 移動非空的 curl.exe 到原先的目錄下
    move "%1\curl.exe" "%cd%\"
    echo 移動 %1\curl.exe 到 %cd%\

    echo 移動完成
)
goto :eof

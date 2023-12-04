@echo off
chcp 65001 > nul
@REM Project: depend install
@REM Description: 下載需要的依賴檔案與套件
@REM Author: Yomisana
@REM Date: 2023-12-04
@REM Version: 1.0.0

@REM 環境變數
title LunarHub - Check Dependency
set "curlBatPath=%cd%\lib\curl.bat"
set "downloadGitBatPath=%cd%\lib\git.bat"

set "binPath=%cd%\bin"
set "gitFolderPath=%cd%\bin\git"


@REM 檢查 curl 執行檔是否存在
if not exist "%binPath%\curl.exe" (
    echo curl.exe not found in bin folder.
    echo Calling curl.bat...
    call "%curlBatPath%"
) else (
    echo curl.exe found in bin folder.
    echo Proceed with other tasks...
    rem Add your additional tasks here.
)

@REM 檢查 git 資料夾是否存在
if not exist "%gitFolderPath%" (
    echo git folder not found in bin.
    echo Downloading git...
    call "%downloadGitBatPath%"
) else (
    echo git folder found in bin.
    echo Proceed with other tasks...
    rem Add your additional tasks here.
)
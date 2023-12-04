@echo off
chcp 65001 > nul
@REM Project: depend install
@REM Description: 下載需要的依賴檔案與套件
@REM Author: Yomisana
@REM Date: 2023-12-04
@REM Version: 1.0.0

@REM 環境變數
title LunarHub - Check Dependency
set "curlBatPath=%cd%\lib\download_curl.bat"
set "downloadGitBatPath=%cd%\lib\download_git.bat"
set "downloads2cBatPath=%cd%\lib\download_s2c.bat"
set "downloadpyBatPath=%cd%\lib\download_python.bat"

set "binPath=%cd%\bin"
set "gitFolderPath=%cd%\bin\git"
set "s2cFolderPath=%cd%\bin\s2c"
set "pyFolderPath=%cd%\bin\python"

:check_curl
@REM 檢查 curl 執行檔是否存在
title LunarHub - Check Dependency - curl
echo.
if not exist "%binPath%\curl.exe" (
    echo curl not found in bin folder.
    echo Calling curl.bat...
    call "%curlBatPath%"
    goto check_git
) else (
    echo curl        found in bin.
    @REM echo Proceed with other tasks...
    rem Add your additional tasks here.
    goto check_git
)
goto check_git
pause
goto menu

:check_git
@REM 檢查 git 資料夾是否存在
title LunarHub - Check Dependency - git
if not exist "%gitFolderPath%" (
    echo git  folder not found in bin.
    echo Downloading git...
    call "%downloadGitBatPath%"
) else (
    echo git  folder found in bin.
    @REM echo Proceed with other tasks...
    rem Add your additional tasks here.
)
goto clone_s2c
pause
goto menu

:clone_s2c
@REM 檢查 s2c 資料夾是否存在
title LunarHub - Check Dependency - screenshot2code
if not exist "%s2cFolderPath%" (
    echo s2c  folder not found in bin.
    echo Downloading s2c...
    echo.
    call "%downloads2cBatPath%"
) else (
    echo s2c  folder found in bin.
    @REM echo Proceed with other tasks...
    rem Add your additional tasks here.
    @REM goto pull_s2c
)
goto check_py

:check_py
title LunarHub - Check Dependency - python
if not exist "%pyFolderPath%" (
    echo py   folder not found in bin.
    echo Downloading python...
    echo.
    call "%downloadpyBatPath%"
) else (
    echo py   folder found in bin.
    @REM echo Proceed with other tasks...
    rem Add your additional tasks here.
    @REM goto pull_s2c
)

goto menu

@REM :pull_s2c
@REM @REM 提取 s2c 是否需要更新
@REM title LunarHub - Update Dependency - screenshot2code
@REM echo.
@REM %cd%\bin\git\bin\git.exe pull  %cd%\bin\s2c
@REM goto menu
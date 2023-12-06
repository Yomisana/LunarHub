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
set "downloadnodeBatPath=%cd%\lib\download_node.bat"

set "binPath=%cd%\bin"
set "gitFolderPath=%cd%\bin\git"
set "s2cFolderPath=%cd%\bin\s2c"
set "pyFolderPath=%cd%\bin\python"
set "nodeFolderPath=%cd%\bin\node"

:check_curl
@REM 檢查 curl 執行檔是否存在
title LunarHub - Check Dependency - curl
echo.
if not exist "%binPath%\curl.exe" (
    echo curl not found in bin folder.
    echo Calling curl.bat...
    call "%curlBatPath%"
    goto check_git
) 
@REM else (
@REM     @REM echo curl        found in bin.
@REM     @REM echo Proceed with other tasks...
@REM     rem Add your additional tasks here.
@REM     %cd%\bin\curl.exe -V
@REM     goto check_git
@REM )
echo curl version:
%cd%\bin\curl.exe -V
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
) 
@REM else (
@REM     @REM echo git  folder found in bin.
@REM     @REM echo Proceed with other tasks...
@REM     rem Add your additional tasks here.
@REM     %cd%\bin\git\bin\git.exe -v
@REM )
echo git version:
%cd%\bin\git\bin\git.exe -v
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
) 
@REM else (
@REM     echo s2c  folder found in bin.
@REM     @REM echo Proceed with other tasks...
@REM     rem Add your additional tasks here.
@REM     @REM goto pull_s2c
@REM )
goto check_py

:check_py
title LunarHub - Check Dependency - python
if not exist "%pyFolderPath%" (
    echo py   folder not found in bin.
    echo Downloading python...
    echo.
    call "%downloadpyBatPath%"
)
@REM  else (
@REM     @REM echo py   folder found in bin.
@REM     @REM echo Proceed with other tasks...
@REM     rem Add your additional tasks here.
@REM     %cd%\bin\python\python --version
@REM     @REM goto pull_s2c
@REM )
echo python version:
%cd%\bin\python\python --version
goto check_node

:check_node
title LunarHub - Check Dependency - node
if not exist "%nodeFolderPath%" (
    echo node   folder not found in bin.
    echo Downloading node...
    echo.
    call "%downloadnodeBatPath%"
)
@REM else (
@REM     @REM echo node   folder found in bin.
@REM     @REM echo Proceed with other tasks...
@REM     rem Add your additional tasks here.
@REM     @REM goto pull_s2c
@REM )
echo node version:
%cd%\bin\node\node -v
%cd%\bin\node\npm -v
pause
goto menu

@REM :pull_s2c
@REM @REM 提取 s2c 是否需要更新
@REM title LunarHub - Update Dependency - screenshot2code
@REM echo.
@REM %cd%\bin\git\bin\git.exe pull  %cd%\bin\s2c
@REM goto menu
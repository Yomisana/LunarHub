@echo off
chcp 65001 > nul
setlocal enabledelayedexpansion
@REM Project: download_python
@REM Description: 下載 python 並解壓縮
@REM Author: Yomisana
@REM Date: 2023-12-05
@REM Version: 1.0.0

cls
title LunarHub - download - python
echo curl → git → screenshot2code → python
echo download
echo → download
@REM https://www.python.org/ftp/python/3.10.11/python-3.10.11-embed-amd64.zip
@REM https://www.python.org/ftp/python/version/python-version-embed-amd64.zip
%cd%\bin\curl.exe -k -O -L https://www.python.org/ftp/python/3.10.11/python-3.10.11-embed-amd64.zip

cls
title LunarHub - move - python
echo curl → git → screenshot2code → python
echo download → move
echo → move
move /y python-3.10.11-embed-amd64.zip "%cd%\bin\py.zip"

cls
title LunarHub - unzip - python
echo curl → git → screenshot2code → python
echo download → move → unzip
echo → create unzip dir
@REM 創建 python 資料夾，如果不存在
set "pyPath=%cd%\bin\python"
if not exist "%pyPath%" (
    mkdir "%pyPath%"
    echo Created pyPath folder: %pyPath%
)
echo → unzip
tar -xf %cd%\bin\py.zip -C %cd%\bin\python

cls
title LunarHub - clean - python
echo curl → git → screenshot2code → python
echo download → move → unzip → clean
echo → clean
del /q /f "%cd%\bin\py.zip"


cls
title LunarHub - done - python
echo curl → git → screenshot2code → python
echo download → move → unzip → clean → done
echo → done
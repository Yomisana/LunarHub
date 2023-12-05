@echo off
chcp 65001 > nul
setlocal enabledelayedexpansion
@REM Project: download_python
@REM Description: 下載 python 並解壓縮
@REM Author: Yomisana
@REM Date: 2023-12-05
@REM Version: 1.0.5

cls
title LunarHub - download - python
echo curl → git → screenshot2code → python
echo download
echo → download
@REM https://www.python.org/ftp/python/3.10.11/python-3.10.11-embed-amd64.zip
@REM https://www.python.org/ftp/python/version/python-version-embed-amd64.zip
%cd%\bin\curl.exe -k -O -L https://www.python.org/ftp/python/3.10.11/python-3.10.11-embed-amd64.zip
timeout /t 1 /nobreak >nul

cls
title LunarHub - move - python
echo curl → git → screenshot2code → python
echo download → move
echo → move
move /y python-3.10.11-embed-amd64.zip "%cd%\bin\py.zip"
timeout /t 1 /nobreak >nul

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
    timeout /t 1 /nobreak >nul
)
echo → unzip
tar -xf %cd%\bin\py.zip -C %cd%\bin\python
timeout /t 1 /nobreak >nul

cls
title LunarHub - clean - python
echo curl → git → screenshot2code → python
echo download → move → unzip → clean
echo → clean
del /q /f "%cd%\bin\py.zip"
timeout /t 1 /nobreak >nul

cls
title LunarHub - done - python
echo curl → git → screenshot2code → python
echo download → move → unzip → clean → done
echo → done
timeout /t 1 /nobreak >nul

@REM 安裝 python pip 創建虛擬環境給 s2c
cls
title LunarHub - download - pip of py
echo curl → git → screenshot2code → python → pip
echo download
%cd%\bin\curl.exe -k -O -L https://bootstrap.pypa.io/get-pip.py
timeout /t 1 /nobreak >nul

cls
title LunarHub - move - python
echo curl → git → screenshot2code → python
echo download → move
echo → move
move /y get-pip.py "%cd%\bin\python\"
echo → create DLLs dir
@REM 創建 python\DLLs 資料夾，如果不存在
set "pyDLLsPath=%cd%\bin\python\DLLs"
if not exist "%pyDLLsPath%" (
    mkdir "%pyDLLsPath%"
    echo Created python of DLLs folder: %pyDLLsPath%
    timeout /t 1 /nobreak >nul
)
timeout /t 1 /nobreak >nul

cls
title LunarHub - update - python
echo curl → git → screenshot2code → python → pip
echo download → move → update
echo → update
set "pthFile=%cd%\bin\python\python310._pth"
for /f "usebackq delims=" %%i in ("%pthFile%") do (
    set "newData=%%i"
    set "newData=!newData:#import site=import site!"
    echo !newData!>>"%pthFile%.new"
)
del "%pthFile%"
move "%pthFile%.new" "%pthFile%"
echo The python310._pth has been updated!
timeout /t 1 /nobreak >nul

cls
title LunarHub - install - pip of py
echo curl → git → screenshot2code → python → pip
echo download → move → update → install
echo → install
@REM 設定 PY 環境變數空間
@REM set "PYTHONHOME=%cd%\bin\python"
@REM set "PYTHONPATH=%cd%\bin\python"
@REM set "PYTHONUTF8=1"
"%cd%\bin\python\python.exe" "%cd%\bin\python\get-pip.py"  --no-warn-script-location
"%cd%\bin\python\python.exe" -m pip install --upgrade pip
echo Install pip done!
timeout /t 1 /nobreak >nul

"%cd%\bin\python\python.exe" -m pip install virtualenv
"%cd%\bin\python\python.exe" -m virtualenv "%cd%\bin\s2c\venv"
echo Install virtualenv done!
timeout /t 1 /nobreak >nul


cls
title LunarHub - patch - pip of py
echo curl → git → screenshot2code → python → pip
echo download → move → update → install → patch
echo → patch
echo Copy python important files
@REM copy "%cd%\bin\python\python310.zip" "%cd%\bin\s2c\venv\Scripts\python310.zip" /Y
timeout /t 1 /nobreak >nul

cls
title LunarHub - done - pip of py
echo curl → git → screenshot2code → python → pip
echo download → move → update → install → patch → done
echo → done
call "%cd%\bin\s2c\venv\Scripts\activate.bat"
timeout /t 1 /nobreak >nul

endlocal
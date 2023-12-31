@echo off
chcp 65001 > nul
@REM Project: screenshot2webcode
@REM Description: 將截圖轉換成網頁程式碼(使用批次檔安裝)
@REM Author: Yomisana
@REM Date: 2023-12-04
@REM Version: 2.0.0

@REM 環境變數
@REM set envFile=%cd%\bin\s2c\backend\.env

@REM 安裝前置作業
@REM cd %cd%\bin\s2c\backend


@REM if not exist "%envFile%" (
@REM     echo https://platform.openai.com/api-keys
@REM     echo ================================
@REM     set /p OPENAI_API_KEY=Please enter your OPENAI_API_KEY:
@REM     echo OPENAI_API_KEY=%OPENAI_API_KEY% > .env
@REM     timeout /t 1 /nobreak >nul
@REM )

@REM echo enter python venv
@REM call "%cd%\venv\Scripts\activate.bat"
@REM @REM %cd%\bin\s2c\backend\venv\Scripts\activate.bat

@REM @REM timeout /t 1 /nobreak >nul
@REM pip install poetry
@REM @REM timeout /t 1 /nobreak >nul
@REM poetry install
@REM @REM timeout /t 1 /nobreak >nul
@REM poetry shell
@REM @REM timeout /t 1 /nobreak >nul
@REM echo http://127.0.0.1:8080
@REM poetry run uvicorn main:app --reload --port 8080

start "後端批次檔" call %cd%\lib\s2c_backend.bat
start "前端批次檔" call %cd%\lib\s2c_frontend.bat

echo "兩個批次檔已經同時啟動"
exit
@REM goto menu
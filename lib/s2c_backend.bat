@echo off
chcp 65001 > nul
@REM Project: screenshot2webcode_back
@REM Description: 將截圖轉換成網頁程式碼(使用批次檔安裝)
@REM Author: Yomisana
@REM Date: 2023-12-06
@REM Version: 1.0.0

title LunarHub - backend
@REM 環境變數
set envFile=%cd%\bin\s2c\backend\.env

@REM 安裝前置作業
cd %cd%\bin\s2c\backend


if not exist "%envFile%" (
    echo https://platform.openai.com/api-keys
    echo ================================
    set /p OPENAI_API_KEY=Please enter your OPENAI_API_KEY:
    echo OPENAI_API_KEY=%OPENAI_API_KEY% > .env
    timeout /t 1 /nobreak >nul
)

echo enter python venv
call "%cd%\venv\Scripts\activate.bat"
@REM %cd%\bin\s2c\backend\venv\Scripts\activate.bat

@REM timeout /t 1 /nobreak >nul
pip install poetry
@REM timeout /t 1 /nobreak >nul
poetry install
@REM timeout /t 1 /nobreak >nul
poetry shell
@REM timeout /t 1 /nobreak >nul
echo http://127.0.0.1:8080
poetry run uvicorn main:app --reload --port 7001
@REM goto menu
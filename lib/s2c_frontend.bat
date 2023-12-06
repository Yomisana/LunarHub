@echo off
chcp 65001 > nul
@REM Project: screenshot2webcode_front
@REM Description: 將截圖轉換成網頁程式碼(使用批次檔安裝)
@REM Author: Yomisana
@REM Date: 2023-12-06
@REM Version: 1.0.0

title LunarHub - frontend
rem 設定目錄路徑
set frontend_path=%cd%\bin\s2c\frontend\
set node_path=%cd%\bin\node\

rem 進入 frontend 目錄
cd /d "%frontend_path%"

rem 使用 node 的 npm 安裝依賴
set npminstall=%cd%\node_modules

if not exist "%npminstall%" (
    "%node_path%\npm" install
)

rem 執行 npm dev
"%node_path%\npm" run dev


@REM @REM 安裝前置作業
@REM cd %cd%\bin\s2c\frontend\

@REM %cd%\bin\node\npm install
@REM timeout /t 1 /nobreak >nul
@REM %cd%\bin\node\npm dev



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
@REM goto menu
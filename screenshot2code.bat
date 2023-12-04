@echo off
@REM Project: screenshot2webcode
@REM Description: 將截圖轉換成網頁程式碼(使用批次檔安裝)
@REM Author: Yomisana
@REM Date: 2023-12-04
@REM Version: 1.0.0


@REM 程式碼底加
:: Download curl 的 URL
@REM 使用 binary	Michael Kostylev  提供的版本
set url="http://mik.dyndns.pro/dos-stuff/bin/curl.exe"

:: 下載的目標路徑
set target_path="curl.tar.gz"

:: 建立下載工作
bitsadmin /create download_curl

:: 設定下載選項
bitsadmin /set download_curl /priority normal
bitsadmin /set download_curl /timeout 300000
bitsadmin /set download_curl /download file "%url%" "%target_path%"

:: 開始下載
bitsadmin /start download_curl

:: 等待下載完成
echo "下載中..."
while (bitsadmin /istransferring download_curl) do (
  echo "下載中..."
  sleep 1
)

:: 檢查下載是否成功
if (bitsadmin /gettransferstatus download_curl != 0) (
  echo "下載失敗。"
  exit 1
)

:: 下載成功
echo "下載成功。"
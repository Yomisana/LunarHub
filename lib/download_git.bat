@echo off
chcp 65001 > nul
@REM Project: download_git
@REM Description: 下載 git.exe 並解壓縮
@REM Author: Yomisana
@REM Date: 2023-12-05
@REM Version: 1.0.0

cls
title LunarHub - download - git
echo download
echo → download
@REM cd /d "%cd%\bin"
%cd%\bin\curl.exe -k -O -L https://github.com/git-for-windows/git/releases/download/v2.40.1.windows.1/PortableGit-2.40.1-64-bit.7z.exe
@REM %cd%\lib\batcurl.exe -O -k -L https://github.com/git-for-windows/git/releases/download/v2.40.1.windows.1/PortableGit-2.40.1-64-bit.7z.exe

cls
title LunarHub - move - git
echo download → move
echo → move
move /y PortableGit-2.40.1-64-bit.7z.exe "%cd%\bin\git.7z.exe"

cls
title LunarHub - unzip - git
echo download → move → unzip
echo → unzip
echo NOTIC: This will popup the window about unzip git.7z.exe to git folder.
echo Please don't close it.
%cd%\bin\git.7z.exe -o %cd%\bin\git -y

cls
title LunarHub - clean - git
echo download → move → unzip → clean
echo → clean
del /q /f "%cd%\bin\git.7z.exe"

cls
title LunarHub - done - git
echo download → move → unzip → clean → done
echo → done

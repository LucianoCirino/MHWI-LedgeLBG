@echo off
REM Run PyInstaller (requires pyinstaller to be installed)
pyinstaller --noconfirm --onefile --noconsole --icon=LBG.ico gui.py

REM Rename and move the executable up two directories
move /Y ".\dist\gui.exe" "..\..\LLBG.exe"

REM Remove the build and dist directories
rmdir /S /Q build
rmdir /S /Q dist

REM Remove the spec file
del /Q gui.spec

REM Pause the script to check for errors
pause

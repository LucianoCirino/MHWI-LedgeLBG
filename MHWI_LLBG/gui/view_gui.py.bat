@echo off
echo Running Python script...

REM Change directory two levels up (this is where exe will reside)
pushd ..\..

REM Run the Python script which is located in the 'gui' subdirectory
python MHWI_LLBG\gui\gui.py

REM Return to the original directory
popd

echo Script finished.
pause

@echo off
color 4
setlocal EnableDelayedExpansion
title Looking for Python...

where python >nul 2>nul
if errorlevel 1 (
    echo Python is not installed. Installing...
    call resources\utils\install_python.bat
    
    pause
) else (
    echo Python is installed.
)

title Creating venv...
echo Creating venv...
python -m venv myvenv

title Entering venv...
echo Entering venv...
call myvenv\Scripts\activate

title Installing packages...
echo Installing packages...
pip install --upgrade --force-reinstall --ignore-installed --requirement resources\data\requirements.txt

title Starting builder...
echo Starting builder...
start /min cmd.exe /k "python resources\ui\builder.py"

endlocal
pause
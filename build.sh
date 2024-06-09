@echo off
color 4
setlocal EnableDelayedExpansion
title Looking for Python...

:: Check if Python is installed
where python >nul 2>nul
if %errorlevel% neq 0 (
    echo Python is not installed. Please install it from the following link, and make sure to add it to PATH. Then restart this file.
    echo https://www.python.org/ftp/python/3.11.6/python-3.11.6-amd64.exe
    pause
    exit /b
) else (
    echo Python is installed.
)

title Creating venv...
echo Creating venv...
python -m venv rosevenv

title Entering venv...
echo Entering venv...
call rosevenv\Scripts\activate

title Installing packages...
echo Installing packages...
echo This may take a while. Be patient!
python -m pip install --upgrade --ignore-installed -r resources\data\requirements.txt

title Starting builder...
echo Starting builder...
start /min cmd.exe /c "python resources\ui\builder.py"

endlocal
pause

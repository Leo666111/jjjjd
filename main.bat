@echo off
setlocal enabledelayedexpansion

:: Set the start time (in seconds)
set start_time=%time%

:: Convert start time to seconds
for /f "tokens=1-4 delims=:.," %%a in ("%start_time%") do (
    set /a start_seconds=%%a*3600 + %%b*60 + %%c
)

:loop
:: Get the current time and convert it to seconds
set current_time=%time%
for /f "tokens=1-4 delims=:.," %%a in ("%current_time%") do (
    set /a current_seconds=%%a*3600 + %%b*60 + %%c
)

:: Calculate the elapsed time
set /a elapsed_time=current_seconds-start_seconds

:: Check if the elapsed time is greater than or equal to 60 seconds (1 minute)
if !elapsed_time! geq 60 (
    echo 1 minute has passed, stopping the script.
    exit /b
)

:: Perform the mouse movement commands
nircmd.exe sendmouse move 100 100
nircmd.exe sendmouse move 200 200
nircmd.exe sendmouse move 300 300
nircmd.exe sendmouse move 400 400
nircmd.exe sendmouse move 500 500

:: Wait for 0.5 seconds
timeout /t 0.5 >nul

:: Repeat the loop
goto loop

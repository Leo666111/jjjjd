@echo off
setlocal enabledelayedexpansion

:: Set a time limit (60 seconds)
set /a time_limit=60

:: Start the timer
set /a start_time=%time:~6,2%

:loop
:: Get the current time
set /a current_time=%time:~6,2%

:: Calculate the elapsed time in seconds
set /a elapsed_time=current_time-start_time

:: If elapsed time is greater than or equal to 60 seconds, stop
if !elapsed_time! geq !time_limit! (
    echo 1 minute has passed, stopping the script.
    exit /b
)

:: Perform the mouse movement commands using nircmd
nircmd.exe sendmouse move 100 100
nircmd.exe sendmouse move 200 200
nircmd.exe sendmouse move 300 300
nircmd.exe sendmouse move 400 400
nircmd.exe sendmouse move 500 500

:: Wait for 0.5 seconds before the next move
timeout /t 0.5 >nul

:: Repeat the loop
goto loop


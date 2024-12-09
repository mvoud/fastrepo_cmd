@echo off
:: Cleanup Git repository resources
echo Cleaning up Git repository resources...

:: Check if Git is installed
where git >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo Git is not installed. Please install Git and try again.
    exit /b 1
)

:: Confirm cleanup
set /p CONFIRM=Are you sure you want to clean up this repository? (y/n): 
if /i "%CONFIRM%" neq "y" (
    echo Cleanup aborted.
    exit /b 0
)

:: Remove Git directory
rmdir /s /q .git
if exist ".git" (
    echo Error removing .git directory.
    exit /b 1
)

echo Git repository cleaned up!
pause

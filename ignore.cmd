@echo off
:: Script to add file extensions to .gitignore
echo Adding extensions to .gitignore...

:: Check if Git is installed
where git >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo Git is not installed. Please install Git and try again.
    exit /b 1
)

:: Check if .gitignore exists; create it if not
if not exist ".gitignore" (
    echo Creating .gitignore file...
    echo # Git ignore rules > .gitignore
)

:: Prompt for extensions to ignore
set /p EXTENSIONS=Enter file extensions to ignore (e.g., .log, .tmp, .bak): 

:: Add extensions to .gitignore
for %%E in (%EXTENSIONS%) do (
    echo %%E>> .gitignore
    echo Added %%E to .gitignore
)

:: Show the updated .gitignore
echo Updated .gitignore:
type .gitignore

:: Optionally, add .gitignore to Git
set /p ADD_TO_GIT=Do you want to stage the updated .gitignore? (y/n): 
if /i "%ADD_TO_GIT%" == "y" (
    git add .gitignore
    echo .gitignore staged for commit.
)

echo Done!
pause

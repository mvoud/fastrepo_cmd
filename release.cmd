@echo off
:: Release files to remote repository
echo Releasing project files to the remote repository...

:: Check if Git is installed
where git >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo Git is not installed. Please install Git and try again.
    exit /b 1
)

:: Add all changes to Git
git add -A
if %ERRORLEVEL% neq 0 (
    echo Error adding files to Git.
    exit /b 1
)

:: Commit changes
set /p COMMIT_MESSAGE=Enter the commit message: 
git commit -m "%COMMIT_MESSAGE%"
if %ERRORLEVEL% neq 0 (
    echo Error committing files. Make sure there are changes to commit.
    exit /b 1
)

:: Push to remote repository
git push origin main || git push origin master
if %ERRORLEVEL% neq 0 (
    echo Error pushing files to the remote repository. Ensure the repository is configured correctly.
    exit /b 1
)

echo Release completed!
pause

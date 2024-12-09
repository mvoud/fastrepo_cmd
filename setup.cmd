@echo off
:: Setup a Git repository and push the initial commit to the main branch
echo Setting up the Git repository with a main branch...

:: Check if Git is installed
where git >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo Git is not installed. Please install Git and try again.
    exit /b 1
)

:: Create a README.md file if it doesn't exist
if not exist README.md (
    echo "# fastrepo_cmd" > README.md
    echo README.md file created.
) else (
    echo README.md already exists.
)

:: Initialize Git if not already done
if not exist ".git" (
    git init
    echo Initialized an empty Git repository.
) else (
    echo Git repository already initialized.
)

:: Add the README.md file to staging
git add README.md
if %ERRORLEVEL% neq 0 (
    echo Error adding README.md to staging.
    exit /b 1
)

:: Commit the changes
git commit -m "first commit"
if %ERRORLEVEL% neq 0 (
    echo Error committing the files. Make sure there are changes to commit.
    exit /b 1
)

:: Set the branch to main
git branch -M main
if %ERRORLEVEL% neq 0 (
    echo Error renaming branch to main.
    exit /b 1
)

:: Add the remote repository
set /p REMOTE_URL=Enter the remote repository URL: 
git remote add origin %REMOTE_URL% 2>nul
if %ERRORLEVEL% neq 0 (
    echo Remote origin already exists or an error occurred. Proceeding with existing configuration.
)

:: Push the initial commit to the main branch
git push -u origin main
if %ERRORLEVEL% neq 0 (
    echo Error pushing to the remote repository. Check your remote URL or permissions.
    exit /b 1
)

echo Repository setup completed successfully!
pause

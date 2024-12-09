@echo off
:: Enable colored output
:: Menu for Git Operations
title Git Repository Manager

:: Set color for menu background and text
color 0A

:menu
cls
echo.
echo ============================================================
echo                 GIT REPOSITORY MANAGER
echo ============================================================
echo.
echo [1] Setup Repository (setup.cmd)
echo [2] Release Files to Remote (release.cmd)
echo [3] Cleanup Repository Resources (cleanup.cmd)
echo [4] Ignore File Extensions (ignore.cmd)
echo [5] Exit
echo.
echo ============================================================
echo.

:: Prompt for user input
set /p CHOICE=Enter your choice (1-5): 

:: Handle user choice
if "%CHOICE%"=="1" goto setup
if "%CHOICE%"=="2" goto release
if "%CHOICE%"=="3" goto cleanup
if "%CHOICE%"=="4" goto ignore
if "%CHOICE%"=="5" goto exit
goto invalid

:setup
echo.
echo Running setup.cmd...
call setup.cmd
pause
goto menu

:release
echo.
echo Running release.cmd...
call release.cmd
pause
goto menu

:cleanup
echo.
echo Running cleanup.cmd...
call cleanup.cmd
pause
goto menu

:ignore
echo.
echo Running ignore.cmd...
call ignore.cmd
pause
goto menu

:exit
echo.
echo Exiting Git Repository Manager. Goodbye!
color
exit

:invalid
echo.
echo Invalid choice! Please try again.
pause
goto menu

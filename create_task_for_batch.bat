@echo off
SET SCRIPT_PATH=%~dp0delete_registry_key.bat
SET TASK_NAME=RunDeleteRegistryKey

:: Check if the task already exists and delete it if it does
schtasks /query /tn %TASK_NAME% >nul 2>&1
IF %ERRORLEVEL% == 0 (
    schtasks /delete /tn %TASK_NAME% /f
)

:: Create a scheduled task to run the batch file at startup
schtasks /create /tn %TASK_NAME% /tr "\"%SCRIPT_PATH%\"" /sc onstart /rl highest /f

echo Task created successfully.
pause

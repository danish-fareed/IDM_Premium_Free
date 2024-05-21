@echo off
SET SCRIPT_PATH=%~dp0delete_registry_key.bat
SET STARTUP_TASK_NAME=RunDeleteRegistryKeyAtStartup
SET HOURLY_TASK_NAME=RunDeleteRegistryKeyHourly

:: Check if the startup task already exists and delete it if it does
schtasks /query /tn %STARTUP_TASK_NAME% >nul 2>&1
IF %ERRORLEVEL% == 0 (
    schtasks /delete /tn %STARTUP_TASK_NAME% /f
)

:: Create a scheduled task to run the batch file at startup
schtasks /create /tn %STARTUP_TASK_NAME% /tr "\"%SCRIPT_PATH%\"" /sc onstart /rl highest /f

:: Check if the hourly task already exists and delete it if it does
schtasks /query /tn %HOURLY_TASK_NAME% >nul 2>&1
IF %ERRORLEVEL% == 0 (
    schtasks /delete /tn %HOURLY_TASK_NAME% /f
)

:: Create a scheduled task to run the batch file every 2 hours
schtasks /create /tn %HOURLY_TASK_NAME% /tr "\"%SCRIPT_PATH%\"" /sc hourly /mo 2 /rl highest /f

echo Tasks created successfully.
pause

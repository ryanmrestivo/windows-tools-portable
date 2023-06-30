@echo off
REM This script repairs system files using sfc and DISM

REM Check for admin rights
net session >nul 2>&1
if %errorlevel% NEQ 0 (
    echo Failure: This script must be run as an administrator.
    pause >nul
    exit /B
)

REM Set the log file path to the same directory as the script
set "LOGFILE=%~dp0RepairLog.txt"

echo Starting System Repair Script at %date% %time% > "%LOGFILE%"

echo Running System File Checker. Please wait...
echo [%date% %time%] Running System File Checker >> "%LOGFILE%"
sfc /scannow >> "%LOGFILE%" 2>&1
if %errorlevel% NEQ 0 echo SFC failed with error code %errorlevel% >> "%LOGFILE%"

echo Running DISM ScanHealth. Please wait...
echo [%date% %time%] Running DISM ScanHealth >> "%LOGFILE%"
DISM.exe /Online /Cleanup-image /Scanhealth >> "%LOGFILE%" 2>&1
if %errorlevel% NEQ 0 echo DISM ScanHealth failed with error code %errorlevel% >> "%LOGFILE%"

echo Running DISM RestoreHealth. Please wait...
echo [%date% %time%] Running DISM RestoreHealth >> "%LOGFILE%"
DISM.exe /Online /Cleanup-image /Restorehealth >> "%LOGFILE%" 2>&1
if %errorlevel% NEQ 0 echo DISM RestoreHealth failed with error code %errorlevel% >> "%LOGFILE%"

echo Script completed at %date% %time%. Check the log file for details.
echo Script completed at %date% %time% >> "%LOGFILE%"
exit /B

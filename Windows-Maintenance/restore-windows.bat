@echo off
REM System Repair Script - SFC and DISM
REM Ensures system integrity by running SFC and DISM repairs

:: Ensure script is run as Administrator
net session >nul 2>&1
if %errorlevel% NEQ 0 (
    echo ERROR: This script must be run as an administrator.
    pause
    exit /B
)

:: Set log file path to script directory
set "LOGFILE=%~dp0RepairLog.txt"

:: Log start time
echo [INFO] System Repair Script started at %date% %time% > "%LOGFILE%"
echo Starting system repair process...

:: Run System File Checker (SFC)
echo Running System File Checker (SFC)...
echo [%date% %time%] Running SFC /scannow >> "%LOGFILE%"
sfc /scannow >> "%LOGFILE%" 2>&1
if %errorlevel% NEQ 0 (
    echo [ERROR] SFC scan failed with error code %errorlevel%.
    echo [%date% %time%] SFC failed with error code %errorlevel% >> "%LOGFILE%"
) else (
    echo [SUCCESS] SFC scan completed successfully.
)

:: Run DISM ScanHealth
echo Running DISM ScanHealth...
echo [%date% %time%] Running DISM /ScanHealth >> "%LOGFILE%"
DISM.exe /Online /Cleanup-Image /ScanHealth >> "%LOGFILE%" 2>&1
if %errorlevel% NEQ 0 (
    echo [ERROR] DISM ScanHealth failed with error code %errorlevel%.
    echo [%date% %time%] DISM ScanHealth failed with error code %errorlevel% >> "%LOGFILE%"
) else (
    echo [SUCCESS] DISM ScanHealth completed successfully.
)

:: Run DISM RestoreHealth
echo Running DISM RestoreHealth...
echo [%date% %time%] Running DISM /RestoreHealth >> "%LOGFILE%"
DISM.exe /Online /Cleanup-Image /RestoreHealth >> "%LOGFILE%" 2>&1
if %errorlevel% NEQ 0 (
    echo [ERROR] DISM RestoreHealth failed with error code %errorlevel%.
    echo [%date% %time%] DISM RestoreHealth failed with error code %errorlevel% >> "%LOGFILE%"
) else (
    echo [SUCCESS] DISM RestoreHealth completed successfully.
)

:: Log completion and exit
echo System repair process completed. Check the log file for details.
echo [%date% %time%] Script completed successfully. >> "%LOGFILE%"
exit /B

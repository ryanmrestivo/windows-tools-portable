@echo off
REM This script restarts the computer and enters the firmware configuration interface (UEFI).

REM Ask the user for confirmation
set /p UserInput="Are you sure you want to restart and enter UEFI? All unsaved work will be lost. (Y/N): "
if /i "%UserInput%" neq "Y" goto :eof

REM Specify a timeout (in seconds) before the computer restarts
set Timeout=10

echo The computer will restart in %Timeout% seconds...
shutdown /r /fw /t %Timeout%

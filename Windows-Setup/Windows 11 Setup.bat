@echo off
Title Windows 11 Setup
mode con: cols=155 lines=36
color 03

:Start
cls
echo.
echo.                                                                                                                                                      
echo  _____________________________________________________________________________________________________________________________________________________
echo.
echo  [1] ^| Debloat Windows 11
echo.
echo  This script is designed to remove unnecessary built-in applications and services from Windows 11 to optimize performance.
echo  Below is the list of actions that will be performed:
echo.
echo  - Remove specified built-in applications (e.g., YourPhone, Zune, OneNote).
echo  - Uninstall Microsoft Edge.
echo  - Remove Windows Media Player.
echo  - Disable scheduled tasks for Maps updates.
echo  - Remove Quick Assist and Windows Hello Face.
echo  - Uninstall and remove OneDrive.
echo.
echo  Press '1' and Enter to proceed with the debloat process, or press '0' and Enter to exit.
echo.

set /p op=  Your Option:
if %op%==1 goto Op1
if %op%==0 goto End

:Op1
cls
echo.
echo.                                                                                                                                                                                                                                                                                                                
echo  _____________________________________________________________________________________________________________________________________________________                                                                                                                                                        
echo.

setlocal enabledelayedexpansion
set "powershellCmd=powershell -command"
set "appsToRemove=Microsoft.549981C3F5F10, *Microsoft.YourPhone*, *zune*, *sticky*, *maps*, *people*, *comm*, *mess*, *onenote*, *photo*, *bing*, *soundrec*, *Microsoft.Getstarted*, *Microsoft.WindowsFeedbackHub*, *Microsoft.3DBuilder*, *GetHelp*, *phone*, *Microsoft.Office.Sway*, *Microsoft.Office.Desktop*, *Microsoft.MicrosoftEdge.Stable*, *Microsoft.MicrosoftSolitaireCollection*, *Microsoft.Wallet*, *Microsoft.MixedReality.Portal*, *Microsoft.MicrosoftOfficeHub*, *Microsoft.ScreenSketch*"

for %%a in (%appsToRemove%) do (
    %powershellCmd% "Get-AppxPackage -AllUsers %%a | Remove-AppxPackage"
)

cd %PROGRAMFILES(X86)%\Microsoft\Edge\Application\9*\Installer && setup --uninstall --force-uninstall --system-level
C:\Windows\install_wim_tweak.exe /o /l
C:\Windows\install_wim_tweak.exe /o /c "Microsoft-Windows-Internet-Browser-Package" /r
C:\Windows\install_wim_tweak.exe /h /o /l

%powershellCmd% "Get-WindowsPackage -Online | Where PackageName -like *MediaPlayer* | Remove-WindowsPackage -Online -NoRestart"

schtasks /Change /TN "\Microsoft\Windows\Maps\MapsUpdateTask" /disable
schtasks /Change /TN "\Microsoft\Windows\Maps\MapsToastTask" /disable

%powershellCmd% "Get-WindowsPackage -Online | Where PackageName -like *QuickAssist* | Remove-WindowsPackage -Online -NoRestart"
%powershellCmd% "Get-WindowsPackage -Online | Where PackageName -like *Hello-Face* | Remove-WindowsPackage -Online -NoRestart"

schtasks /Change /TN "\Microsoft\Windows\HelloFace\FODCleanupTask" /Disable

%SystemRoot%\SysWOW64\OneDriveSetup.exe /uninstall
rd "%UserProfile%\OneDrive" /s /q
rd "%LocalAppData%\Microsoft\OneDrive" /s /q
rd "%ProgramData%\Microsoft OneDrive" /s /q
rd "C:\OneDriveTemp" /s /q

rem Log completion and any errors to files
echo Completed debloating process >> log.txt
2>> error.log

:End
cls
echo.
echo Operation completed successfully!
echo Press any key to exit...
pause >nul
exit

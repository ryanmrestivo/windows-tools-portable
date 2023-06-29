@echo off
setlocal enabledelayedexpansion

REM Set Variables
set "HostsFile=%WINDIR%\system32\drivers\etc\hosts"
set "NewLine=^& echo."

REM Check for administrative privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo This script must be run as an administrator.
    pause
    exit /b 1
)

:mainloop
REM Display menu options
echo.
echo 1. Block a domain
echo 2. Unblock a domain
echo 3. Exit
set /p Choice="Enter your choice (1, 2, or 3): "

REM Process choice
if "%Choice%"=="1" goto :blockdomain
if "%Choice%"=="2" goto :unblockdomain
if "%Choice%"=="3" goto :eof
echo Invalid choice. Please enter 1, 2, or 3.
goto :mainloop

:blockdomain
REM Prompt for domain name to block
set /p DomainName="Enter the domain name to block: "
REM Check if the domain name is already in the hosts file
find /c /i "%DomainName%" "%HostsFile%" >nul
if %errorlevel% neq 0 (
    echo Adding %DomainName% to the hosts file to block it...
    echo !NewLine!^	127.0.0.1	%DomainName% >> "%HostsFile%"
    echo %DomainName% has been added to the hosts file.
) else (
    echo The domain %DomainName% is already in the hosts file.
)
goto :askrepeat

:unblockdomain
REM Prompt for domain name to unblock
set /p DomainName="Enter the domain name to unblock: "
REM Remove the domain from the hosts file
echo Removing %DomainName% from the hosts file...
type "%HostsFile%" | findstr /v /i "%DomainName%" > "%HostsFile%.tmp"
move /y "%HostsFile%.tmp" "%HostsFile%" >nul
echo %DomainName% has been removed from the hosts file.
goto :askrepeat

:askrepeat
REM Ask if user wants to perform another action
set /p Repeat="Do you want to perform another action? (Y/N): "
if /i "%Repeat%"=="Y" goto :mainloop

echo Exiting...

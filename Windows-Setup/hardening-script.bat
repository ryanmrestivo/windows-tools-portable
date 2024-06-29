@echo off
:: https://privacy.sexy — v0.13.5 — Sat, 29 Jun 2024 14:41:51 GMT
:: Ensure admin privileges
fltmc >nul 2>&1 || (
    echo Administrator privileges are required.
    PowerShell Start -Verb RunAs '%0' 2> nul || (
        echo Right-click on the script and select "Run as administrator".
        pause & exit 1
    )
    exit 0
)
:: Initialize environment
setlocal EnableExtensions DisableDelayedExpansion


:: Disable participation in Visual Studio Customer Experience Improvement Program (VSCEIP)
echo --- Disable participation in Visual Studio Customer Experience Improvement Program (VSCEIP)
if %PROCESSOR_ARCHITECTURE%==x86 ( REM is 32 bit?
    reg add "HKLM\SOFTWARE\Microsoft\VSCommon\14.0\SQM" /v "OptIn" /t REG_DWORD /d 0 /f
    reg add "HKLM\SOFTWARE\Microsoft\VSCommon\15.0\SQM" /v "OptIn" /t REG_DWORD /d 0 /f
    reg add "HKLM\SOFTWARE\Microsoft\VSCommon\16.0\SQM" /v "OptIn" /t REG_DWORD /d 0 /f
    reg add "HKLM\SOFTWARE\Microsoft\VSCommon\17.0\SQM" /v "OptIn" /t REG_DWORD /d 0 /f
) else (
    reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\VSCommon\14.0\SQM" /v "OptIn" /t REG_DWORD /d 0 /f
    reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\VSCommon\15.0\SQM" /v "OptIn" /t REG_DWORD /d 0 /f
    reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\VSCommon\16.0\SQM" /v "OptIn" /t REG_DWORD /d 0 /f
    reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\VSCommon\17.0\SQM" /v "OptIn" /t REG_DWORD /d 0 /f
)
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\Software\Policies\Microsoft\VisualStudio\SQM' /v 'OptIn' /t 'REG_DWORD' /d '0' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------Disable Visual Studio telemetry--------------
:: ----------------------------------------------------------
echo --- Disable Visual Studio telemetry
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKCU\Software\Microsoft\VisualStudio\Telemetry' /v 'TurnOffSwitch' /t 'REG_DWORD' /d '1' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------------Disable Visual Studio feedback--------------
:: ----------------------------------------------------------
echo --- Disable Visual Studio feedback
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\VisualStudio\Feedback' /v 'DisableFeedbackDialog' /t 'REG_DWORD' /d '1' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\VisualStudio\Feedback' /v 'DisableEmailInput' /t 'REG_DWORD' /d '1' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\VisualStudio\Feedback' /v 'DisableScreenshotCapture' /t 'REG_DWORD' /d '1' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----Disable "Visual Studio Standard Collector Service"----
:: ----------------------------------------------------------
echo --- Disable "Visual Studio Standard Collector Service"
:: Disable service(s): `VSStandardCollectorService150`
PowerShell -ExecutionPolicy Unrestricted -Command "$serviceName = 'VSStandardCollectorService150'; Write-Host "^""Disabling service: `"^""$serviceName`"^""."^""; <# -- 1. Skip if service does not exist #>; $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue; if(!$service) {; Write-Host "^""Service `"^""$serviceName`"^"" could not be not found, no need to disable it."^""; Exit 0; }; <# -- 2. Stop if running #>; if ($service.Status -eq [System.ServiceProcess.ServiceControllerStatus]::Running) {; Write-Host "^""`"^""$serviceName`"^"" is running, stopping it."^""; try {; Stop-Service -Name "^""$serviceName"^"" -Force -ErrorAction Stop; Write-Host "^""Stopped `"^""$serviceName`"^"" successfully."^""; } catch {; Write-Warning "^""Could not stop `"^""$serviceName`"^"", it will be stopped after reboot: $_"^""; }; } else {; Write-Host "^""`"^""$serviceName`"^"" is not running, no need to stop."^""; }; <# -- 3. Skip if already disabled #>; $startupType = $service.StartType <# Does not work before .NET 4.6.1 #>; if(!$startupType) {; $startupType = (Get-WmiObject -Query "^""Select StartMode From Win32_Service Where Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; if(!$startupType) {; $startupType = (Get-WmiObject -Class Win32_Service -Property StartMode -Filter "^""Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; }; }; if($startupType -eq 'Disabled') {; Write-Host "^""$serviceName is already disabled, no further action is needed"^""; }; <# -- 4. Disable service #>; try {; Set-Service -Name "^""$serviceName"^"" -StartupType Disabled -Confirm:$false -ErrorAction Stop; Write-Host "^""Disabled `"^""$serviceName`"^"" successfully."^""; } catch {; Write-Error "^""Could not disable `"^""$serviceName`"^"": $_"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------Disable Diagnostics Hub log collection----------
:: ----------------------------------------------------------
echo --- Disable Diagnostics Hub log collection
reg delete "HKLM\Software\Microsoft\VisualStudio\DiagnosticsHub" /v "LogLevel" /f 2>nul
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---Disable participation in IntelliCode data collection---
:: ----------------------------------------------------------
echo --- Disable participation in IntelliCode data collection
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\VisualStudio\IntelliCode' /v 'DisableRemoteAnalysis' /t 'REG_DWORD' /d '1' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKCU\SOFTWARE\Microsoft\VSCommon\16.0\IntelliCode' /v 'DisableRemoteAnalysis' /t 'REG_DWORD' /d '1' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKCU\SOFTWARE\Microsoft\VSCommon\17.0\IntelliCode' /v 'DisableRemoteAnalysis' /t 'REG_DWORD' /d '1' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------Disable "NVIDIA Telemetry Report" task----------
:: ----------------------------------------------------------
echo --- Disable "NVIDIA Telemetry Report" task
:: Disable scheduled task(s): `\NvTmRep_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}`
PowerShell -ExecutionPolicy Unrestricted -Command "$taskPathPattern='\'; $taskNamePattern='NvTmRep_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}'; Write-Output "^""Disabling tasks matching pattern `"^""$taskNamePattern`"^""."^""; $tasks = @(Get-ScheduledTask -TaskPath $taskPathPattern -TaskName $taskNamePattern -ErrorAction Ignore); if (-Not $tasks) {; Write-Output "^""Skipping, no tasks matching pattern `"^""$taskNamePattern`"^"" found, no action needed."^""; exit 0; }; $operationFailed = $false; foreach ($task in $tasks) {; $taskName = $task.TaskName; if ($task.State -eq [Microsoft.PowerShell.Cmdletization.GeneratedTypes.ScheduledTask.StateEnum]::Disabled) {; Write-Output "^""Skipping, task `"^""$taskName`"^"" is already disabled, no action needed."^""; continue; }; try {; $task | Disable-ScheduledTask -ErrorAction Stop | Out-Null; Write-Output "^""Successfully disabled task `"^""$taskName`"^""."^""; } catch {; Write-Error "^""Failed to disable task `"^""$taskName`"^"": $($_.Exception.Message)"^""; $operationFailed = $true; }; }; if ($operationFailed) {; Write-Output 'Failed to disable some tasks. Check error messages above.'; exit 1; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----Disable "NVIDIA Telemetry Report on Logon" task------
:: ----------------------------------------------------------
echo --- Disable "NVIDIA Telemetry Report on Logon" task
:: Disable scheduled task(s): `\NvTmRepOnLogon_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}`
PowerShell -ExecutionPolicy Unrestricted -Command "$taskPathPattern='\'; $taskNamePattern='NvTmRepOnLogon_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}'; Write-Output "^""Disabling tasks matching pattern `"^""$taskNamePattern`"^""."^""; $tasks = @(Get-ScheduledTask -TaskPath $taskPathPattern -TaskName $taskNamePattern -ErrorAction Ignore); if (-Not $tasks) {; Write-Output "^""Skipping, no tasks matching pattern `"^""$taskNamePattern`"^"" found, no action needed."^""; exit 0; }; $operationFailed = $false; foreach ($task in $tasks) {; $taskName = $task.TaskName; if ($task.State -eq [Microsoft.PowerShell.Cmdletization.GeneratedTypes.ScheduledTask.StateEnum]::Disabled) {; Write-Output "^""Skipping, task `"^""$taskName`"^"" is already disabled, no action needed."^""; continue; }; try {; $task | Disable-ScheduledTask -ErrorAction Stop | Out-Null; Write-Output "^""Successfully disabled task `"^""$taskName`"^""."^""; } catch {; Write-Error "^""Failed to disable task `"^""$taskName`"^"": $($_.Exception.Message)"^""; $operationFailed = $true; }; }; if ($operationFailed) {; Write-Output 'Failed to disable some tasks. Check error messages above.'; exit 1; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---------Disable "NVIDIA telemetry monitor" task----------
:: ----------------------------------------------------------
echo --- Disable "NVIDIA telemetry monitor" task
:: Disable scheduled task(s): `\NvTmMon_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}`
PowerShell -ExecutionPolicy Unrestricted -Command "$taskPathPattern='\'; $taskNamePattern='NvTmMon_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}'; Write-Output "^""Disabling tasks matching pattern `"^""$taskNamePattern`"^""."^""; $tasks = @(Get-ScheduledTask -TaskPath $taskPathPattern -TaskName $taskNamePattern -ErrorAction Ignore); if (-Not $tasks) {; Write-Output "^""Skipping, no tasks matching pattern `"^""$taskNamePattern`"^"" found, no action needed."^""; exit 0; }; $operationFailed = $false; foreach ($task in $tasks) {; $taskName = $task.TaskName; if ($task.State -eq [Microsoft.PowerShell.Cmdletization.GeneratedTypes.ScheduledTask.StateEnum]::Disabled) {; Write-Output "^""Skipping, task `"^""$taskName`"^"" is already disabled, no action needed."^""; continue; }; try {; $task | Disable-ScheduledTask -ErrorAction Stop | Out-Null; Write-Output "^""Successfully disabled task `"^""$taskName`"^""."^""; } catch {; Write-Error "^""Failed to disable task `"^""$taskName`"^"": $($_.Exception.Message)"^""; $operationFailed = $true; }; }; if ($operationFailed) {; Write-Output 'Failed to disable some tasks. Check error messages above.'; exit 1; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------Remove Nvidia telemetry packages-------------
:: ----------------------------------------------------------
echo --- Remove Nvidia telemetry packages
if exist "%ProgramFiles%\NVIDIA Corporation\Installer2\InstallerCore\NVI2.DLL" (
    rundll32 "%PROGRAMFILES%\NVIDIA Corporation\Installer2\InstallerCore\NVI2.DLL",UninstallPackage NvTelemetryContainer
    rundll32 "%PROGRAMFILES%\NVIDIA Corporation\Installer2\InstallerCore\NVI2.DLL",UninstallPackage NvTelemetry
)
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------Remove Nvidia telemetry components------------
:: ----------------------------------------------------------
echo --- Remove Nvidia telemetry components
:: Soft delete files matching pattern  : "%PROGRAMFILES(X86)%\NVIDIA Corporation\NvTelemetry\*"
PowerShell -ExecutionPolicy Unrestricted -Command "$pathGlobPattern = "^""%PROGRAMFILES(X86)%\NVIDIA Corporation\NvTelemetry\*"^""; $expandedPath = [System.Environment]::ExpandEnvironmentVariables($pathGlobPattern); Write-Host "^""Searching for items matching pattern: `"^""$($expandedPath)`"^""."^""; $renamedCount   = 0; $skippedCount   = 0; $failedCount    = 0; $foundAbsolutePaths = @(); Write-Host 'Iterating files and directories recursively.'; try {; $foundAbsolutePaths += @(; Get-ChildItem -Path $expandedPath -Force -Recurse -ErrorAction Stop | Select-Object -ExpandProperty FullName; ); } catch [System.Management.Automation.ItemNotFoundException] {; <# Swallow, do not run `Test-Path` before, it's unreliable for globs requiring extra permissions #>; }; try {; $foundAbsolutePaths += @(; Get-Item -Path $expandedPath -ErrorAction Stop | Select-Object -ExpandProperty FullName; ); } catch [System.Management.Automation.ItemNotFoundException] {; <# Swallow, do not run `Test-Path` before, it's unreliable for globs requiring extra permissions #>; }; $foundAbsolutePaths = $foundAbsolutePaths | Select-Object -Unique | Sort-Object -Property { $_.Length } -Descending; if (!$foundAbsolutePaths) {; Write-Host 'Skipping, no items available.'; exit 0; }; Write-Host "^""Initiating processing of $($foundAbsolutePaths.Count) items from `"^""$expandedPath`"^""."^""; foreach ($path in $foundAbsolutePaths) {; if (Test-Path -Path $path -PathType Container) {; Write-Host "^""Skipping folder (not its contents): `"^""$path`"^""."^""; $skippedCount++; continue; }; if($revert -eq $true) {; if (-not $path.EndsWith('.OLD')) {; Write-Host "^""Skipping non-backup file: `"^""$path`"^""."^""; $skippedCount++; continue; }; } else {; if ($path.EndsWith('.OLD')) {; Write-Host "^""Skipping backup file: `"^""$path`"^""."^""; $skippedCount++; continue; }; }; $originalFilePath = $path; Write-Host "^""Processing file: `"^""$originalFilePath`"^""."^""; if (-Not (Test-Path $originalFilePath)) {; Write-Host "^""Skipping, file `"^""$originalFilePath`"^"" not found."^""; $skippedCount++; exit 0; }; if ($revert -eq $true) {; $newFilePath = $originalFilePath.Substring(0, $originalFilePath.Length - 4); } else {; $newFilePath = "^""$($originalFilePath).OLD"^""; }; try {; Move-Item -LiteralPath "^""$($originalFilePath)"^"" -Destination "^""$newFilePath"^"" -Force -ErrorAction Stop; Write-Host "^""Successfully processed `"^""$originalFilePath`"^""."^""; $renamedCount++; } catch {; Write-Error "^""Failed to rename `"^""$originalFilePath`"^"" to `"^""$newFilePath`"^"": $($_.Exception.Message)"^""; $failedCount++; }; }; if (($renamedCount -gt 0) -or ($skippedCount -gt 0)) {; Write-Host "^""Successfully processed $renamedCount items and skipped $skippedCount items."^""; }; if ($failedCount -gt 0) {; Write-Warning "^""Failed to processed $($failedCount) items."^""; }"
:: Soft delete files matching pattern  : "%PROGRAMFILES%\NVIDIA Corporation\NvTelemetry\*"
PowerShell -ExecutionPolicy Unrestricted -Command "$pathGlobPattern = "^""%PROGRAMFILES%\NVIDIA Corporation\NvTelemetry\*"^""; $expandedPath = [System.Environment]::ExpandEnvironmentVariables($pathGlobPattern); Write-Host "^""Searching for items matching pattern: `"^""$($expandedPath)`"^""."^""; $renamedCount   = 0; $skippedCount   = 0; $failedCount    = 0; $foundAbsolutePaths = @(); Write-Host 'Iterating files and directories recursively.'; try {; $foundAbsolutePaths += @(; Get-ChildItem -Path $expandedPath -Force -Recurse -ErrorAction Stop | Select-Object -ExpandProperty FullName; ); } catch [System.Management.Automation.ItemNotFoundException] {; <# Swallow, do not run `Test-Path` before, it's unreliable for globs requiring extra permissions #>; }; try {; $foundAbsolutePaths += @(; Get-Item -Path $expandedPath -ErrorAction Stop | Select-Object -ExpandProperty FullName; ); } catch [System.Management.Automation.ItemNotFoundException] {; <# Swallow, do not run `Test-Path` before, it's unreliable for globs requiring extra permissions #>; }; $foundAbsolutePaths = $foundAbsolutePaths | Select-Object -Unique | Sort-Object -Property { $_.Length } -Descending; if (!$foundAbsolutePaths) {; Write-Host 'Skipping, no items available.'; exit 0; }; Write-Host "^""Initiating processing of $($foundAbsolutePaths.Count) items from `"^""$expandedPath`"^""."^""; foreach ($path in $foundAbsolutePaths) {; if (Test-Path -Path $path -PathType Container) {; Write-Host "^""Skipping folder (not its contents): `"^""$path`"^""."^""; $skippedCount++; continue; }; if($revert -eq $true) {; if (-not $path.EndsWith('.OLD')) {; Write-Host "^""Skipping non-backup file: `"^""$path`"^""."^""; $skippedCount++; continue; }; } else {; if ($path.EndsWith('.OLD')) {; Write-Host "^""Skipping backup file: `"^""$path`"^""."^""; $skippedCount++; continue; }; }; $originalFilePath = $path; Write-Host "^""Processing file: `"^""$originalFilePath`"^""."^""; if (-Not (Test-Path $originalFilePath)) {; Write-Host "^""Skipping, file `"^""$originalFilePath`"^"" not found."^""; $skippedCount++; exit 0; }; if ($revert -eq $true) {; $newFilePath = $originalFilePath.Substring(0, $originalFilePath.Length - 4); } else {; $newFilePath = "^""$($originalFilePath).OLD"^""; }; try {; Move-Item -LiteralPath "^""$($originalFilePath)"^"" -Destination "^""$newFilePath"^"" -Force -ErrorAction Stop; Write-Host "^""Successfully processed `"^""$originalFilePath`"^""."^""; $renamedCount++; } catch {; Write-Error "^""Failed to rename `"^""$originalFilePath`"^"" to `"^""$newFilePath`"^"": $($_.Exception.Message)"^""; $failedCount++; }; }; if (($renamedCount -gt 0) -or ($skippedCount -gt 0)) {; Write-Host "^""Successfully processed $renamedCount items and skipped $skippedCount items."^""; }; if ($failedCount -gt 0) {; Write-Warning "^""Failed to processed $($failedCount) items."^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------Disable Nvidia telemetry drivers-------------
:: ----------------------------------------------------------
echo --- Disable Nvidia telemetry drivers
:: Soft delete files matching pattern  : "%SYSTEMROOT%\System32\DriverStore\FileRepository\NvTelemetry*.dll"
PowerShell -ExecutionPolicy Unrestricted -Command "$pathGlobPattern = "^""%SYSTEMROOT%\System32\DriverStore\FileRepository\NvTelemetry*.dll"^""; $expandedPath = [System.Environment]::ExpandEnvironmentVariables($pathGlobPattern); Write-Host "^""Searching for items matching pattern: `"^""$($expandedPath)`"^""."^""; $renamedCount   = 0; $skippedCount   = 0; $failedCount    = 0; $foundAbsolutePaths = @(); Write-Host 'Iterating files and directories recursively.'; try {; $foundAbsolutePaths += @(; Get-ChildItem -Path $expandedPath -Force -Recurse -ErrorAction Stop | Select-Object -ExpandProperty FullName; ); } catch [System.Management.Automation.ItemNotFoundException] {; <# Swallow, do not run `Test-Path` before, it's unreliable for globs requiring extra permissions #>; }; try {; $foundAbsolutePaths += @(; Get-Item -Path $expandedPath -ErrorAction Stop | Select-Object -ExpandProperty FullName; ); } catch [System.Management.Automation.ItemNotFoundException] {; <# Swallow, do not run `Test-Path` before, it's unreliable for globs requiring extra permissions #>; }; $foundAbsolutePaths = $foundAbsolutePaths | Select-Object -Unique | Sort-Object -Property { $_.Length } -Descending; if (!$foundAbsolutePaths) {; Write-Host 'Skipping, no items available.'; exit 0; }; Write-Host "^""Initiating processing of $($foundAbsolutePaths.Count) items from `"^""$expandedPath`"^""."^""; foreach ($path in $foundAbsolutePaths) {; if (Test-Path -Path $path -PathType Container) {; Write-Host "^""Skipping folder (not its contents): `"^""$path`"^""."^""; $skippedCount++; continue; }; if($revert -eq $true) {; if (-not $path.EndsWith('.OLD')) {; Write-Host "^""Skipping non-backup file: `"^""$path`"^""."^""; $skippedCount++; continue; }; } else {; if ($path.EndsWith('.OLD')) {; Write-Host "^""Skipping backup file: `"^""$path`"^""."^""; $skippedCount++; continue; }; }; $originalFilePath = $path; Write-Host "^""Processing file: `"^""$originalFilePath`"^""."^""; if (-Not (Test-Path $originalFilePath)) {; Write-Host "^""Skipping, file `"^""$originalFilePath`"^"" not found."^""; $skippedCount++; exit 0; }; if ($revert -eq $true) {; $newFilePath = $originalFilePath.Substring(0, $originalFilePath.Length - 4); } else {; $newFilePath = "^""$($originalFilePath).OLD"^""; }; try {; Move-Item -LiteralPath "^""$($originalFilePath)"^"" -Destination "^""$newFilePath"^"" -Force -ErrorAction Stop; Write-Host "^""Successfully processed `"^""$originalFilePath`"^""."^""; $renamedCount++; } catch {; Write-Error "^""Failed to rename `"^""$originalFilePath`"^"" to `"^""$newFilePath`"^"": $($_.Exception.Message)"^""; $failedCount++; }; }; if (($renamedCount -gt 0) -or ($skippedCount -gt 0)) {; Write-Host "^""Successfully processed $renamedCount items and skipped $skippedCount items."^""; }; if ($failedCount -gt 0) {; Write-Warning "^""Failed to processed $($failedCount) items."^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------Disable participation in Nvidia telemetry---------
:: ----------------------------------------------------------
echo --- Disable participation in Nvidia telemetry
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\NVIDIA Corporation\NvControlPanel2\Client' /v 'OptInOrOutPreference' /t 'REG_DWORD' /d '0' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS' /v 'EnableRID44231' /t 'REG_DWORD' /d '0' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS' /v 'EnableRID64640' /t 'REG_DWORD' /d '0' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS' /v 'EnableRID66610' /t 'REG_DWORD' /d '0' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Global\Startup' /v 'SendTelemetryData' /t 'REG_DWORD' /d '0' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------Disable "Nvidia Telemetry Container" service-------
:: ----------------------------------------------------------
echo --- Disable "Nvidia Telemetry Container" service
:: Disable service(s): `NvTelemetryContainer`
PowerShell -ExecutionPolicy Unrestricted -Command "$serviceName = 'NvTelemetryContainer'; Write-Host "^""Disabling service: `"^""$serviceName`"^""."^""; <# -- 1. Skip if service does not exist #>; $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue; if(!$service) {; Write-Host "^""Service `"^""$serviceName`"^"" could not be not found, no need to disable it."^""; Exit 0; }; <# -- 2. Stop if running #>; if ($service.Status -eq [System.ServiceProcess.ServiceControllerStatus]::Running) {; Write-Host "^""`"^""$serviceName`"^"" is running, stopping it."^""; try {; Stop-Service -Name "^""$serviceName"^"" -Force -ErrorAction Stop; Write-Host "^""Stopped `"^""$serviceName`"^"" successfully."^""; } catch {; Write-Warning "^""Could not stop `"^""$serviceName`"^"", it will be stopped after reboot: $_"^""; }; } else {; Write-Host "^""`"^""$serviceName`"^"" is not running, no need to stop."^""; }; <# -- 3. Skip if already disabled #>; $startupType = $service.StartType <# Does not work before .NET 4.6.1 #>; if(!$startupType) {; $startupType = (Get-WmiObject -Query "^""Select StartMode From Win32_Service Where Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; if(!$startupType) {; $startupType = (Get-WmiObject -Class Win32_Service -Property StartMode -Filter "^""Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; }; }; if($startupType -eq 'Disabled') {; Write-Host "^""$serviceName is already disabled, no further action is needed"^""; }; <# -- 4. Disable service #>; try {; Set-Service -Name "^""$serviceName"^"" -StartupType Disabled -Confirm:$false -ErrorAction Stop; Write-Host "^""Disabled `"^""$serviceName`"^"" successfully."^""; } catch {; Write-Error "^""Could not disable `"^""$serviceName`"^"": $_"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----------Disable Visual Studio Code telemetry-----------
:: ----------------------------------------------------------
echo --- Disable Visual Studio Code telemetry
PowerShell -ExecutionPolicy Unrestricted -Command "$settingKey='telemetry.enableTelemetry'; $settingValue=$false; $jsonFilePath = "^""$($env:APPDATA)\Code\User\settings.json"^""; if (!(Test-Path $jsonFilePath -PathType Leaf)) {; Write-Host "^""Skipping, no updates. Settings file was not at `"^""$jsonFilePath`"^""."^""; exit 0; }; try {; $fileContent = Get-Content $jsonFilePath -ErrorAction Stop; } catch {; throw "^""Error, failed to read the settings file: `"^""$jsonFilePath`"^"". Error: $_"^""; }; if ([string]::IsNullOrWhiteSpace($fileContent)) {; Write-Host "^""Settings file is empty. Treating it as default empty JSON object."^""; $fileContent = "^""{}"^""; }; try {; $json = $fileContent | ConvertFrom-Json; } catch {; throw "^""Error, invalid JSON format in the settings file: `"^""$jsonFilePath`"^"". Error: $_"^""; }; $existingValue = $json.$settingKey; if ($existingValue -eq $settingValue) {; Write-Host "^""Skipping, `"^""$settingKey`"^"" is already configured as `"^""$settingValue`"^""."^""; exit 0; }; $json | Add-Member -Type NoteProperty -Name $settingKey -Value $settingValue -Force; $json | ConvertTo-Json | Set-Content $jsonFilePath; Write-Host "^""Successfully applied the setting to the file: `"^""$jsonFilePath`"^""."^"""
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------Disable Visual Studio Code crash reporting--------
:: ----------------------------------------------------------
echo --- Disable Visual Studio Code crash reporting
PowerShell -ExecutionPolicy Unrestricted -Command "$settingKey='telemetry.enableCrashReporter'; $settingValue=$false; $jsonFilePath = "^""$($env:APPDATA)\Code\User\settings.json"^""; if (!(Test-Path $jsonFilePath -PathType Leaf)) {; Write-Host "^""Skipping, no updates. Settings file was not at `"^""$jsonFilePath`"^""."^""; exit 0; }; try {; $fileContent = Get-Content $jsonFilePath -ErrorAction Stop; } catch {; throw "^""Error, failed to read the settings file: `"^""$jsonFilePath`"^"". Error: $_"^""; }; if ([string]::IsNullOrWhiteSpace($fileContent)) {; Write-Host "^""Settings file is empty. Treating it as default empty JSON object."^""; $fileContent = "^""{}"^""; }; try {; $json = $fileContent | ConvertFrom-Json; } catch {; throw "^""Error, invalid JSON format in the settings file: `"^""$jsonFilePath`"^"". Error: $_"^""; }; $existingValue = $json.$settingKey; if ($existingValue -eq $settingValue) {; Write-Host "^""Skipping, `"^""$settingKey`"^"" is already configured as `"^""$settingValue`"^""."^""; exit 0; }; $json | Add-Member -Type NoteProperty -Name $settingKey -Value $settingValue -Force; $json | ConvertTo-Json | Set-Content $jsonFilePath; Write-Host "^""Successfully applied the setting to the file: `"^""$jsonFilePath`"^""."^"""
:: ----------------------------------------------------------


:: Disable online experiments by Microsoft in Visual Studio Code
echo --- Disable online experiments by Microsoft in Visual Studio Code
PowerShell -ExecutionPolicy Unrestricted -Command "$settingKey='workbench.enableExperiments'; $settingValue=$false; $jsonFilePath = "^""$($env:APPDATA)\Code\User\settings.json"^""; if (!(Test-Path $jsonFilePath -PathType Leaf)) {; Write-Host "^""Skipping, no updates. Settings file was not at `"^""$jsonFilePath`"^""."^""; exit 0; }; try {; $fileContent = Get-Content $jsonFilePath -ErrorAction Stop; } catch {; throw "^""Error, failed to read the settings file: `"^""$jsonFilePath`"^"". Error: $_"^""; }; if ([string]::IsNullOrWhiteSpace($fileContent)) {; Write-Host "^""Settings file is empty. Treating it as default empty JSON object."^""; $fileContent = "^""{}"^""; }; try {; $json = $fileContent | ConvertFrom-Json; } catch {; throw "^""Error, invalid JSON format in the settings file: `"^""$jsonFilePath`"^"". Error: $_"^""; }; $existingValue = $json.$settingKey; if ($existingValue -eq $settingValue) {; Write-Host "^""Skipping, `"^""$settingKey`"^"" is already configured as `"^""$settingValue`"^""."^""; exit 0; }; $json | Add-Member -Type NoteProperty -Name $settingKey -Value $settingValue -Force; $json | ConvertTo-Json | Set-Content $jsonFilePath; Write-Host "^""Successfully applied the setting to the file: `"^""$jsonFilePath`"^""."^"""
:: ----------------------------------------------------------


:: Disable Visual Studio Code automatic updates in favor of manual updates
echo --- Disable Visual Studio Code automatic updates in favor of manual updates
PowerShell -ExecutionPolicy Unrestricted -Command "$settingKey='update.mode'; $settingValue='manual'; $jsonFilePath = "^""$($env:APPDATA)\Code\User\settings.json"^""; if (!(Test-Path $jsonFilePath -PathType Leaf)) {; Write-Host "^""Skipping, no updates. Settings file was not at `"^""$jsonFilePath`"^""."^""; exit 0; }; try {; $fileContent = Get-Content $jsonFilePath -ErrorAction Stop; } catch {; throw "^""Error, failed to read the settings file: `"^""$jsonFilePath`"^"". Error: $_"^""; }; if ([string]::IsNullOrWhiteSpace($fileContent)) {; Write-Host "^""Settings file is empty. Treating it as default empty JSON object."^""; $fileContent = "^""{}"^""; }; try {; $json = $fileContent | ConvertFrom-Json; } catch {; throw "^""Error, invalid JSON format in the settings file: `"^""$jsonFilePath`"^"". Error: $_"^""; }; $existingValue = $json.$settingKey; if ($existingValue -eq $settingValue) {; Write-Host "^""Skipping, `"^""$settingKey`"^"" is already configured as `"^""$settingValue`"^""."^""; exit 0; }; $json | Add-Member -Type NoteProperty -Name $settingKey -Value $settingValue -Force; $json | ConvertTo-Json | Set-Content $jsonFilePath; Write-Host "^""Successfully applied the setting to the file: `"^""$jsonFilePath`"^""."^"""
:: ----------------------------------------------------------


:: Disable fetching release notes from Microsoft servers after an update
echo --- Disable fetching release notes from Microsoft servers after an update
PowerShell -ExecutionPolicy Unrestricted -Command "$settingKey='update.showReleaseNotes'; $settingValue=$false; $jsonFilePath = "^""$($env:APPDATA)\Code\User\settings.json"^""; if (!(Test-Path $jsonFilePath -PathType Leaf)) {; Write-Host "^""Skipping, no updates. Settings file was not at `"^""$jsonFilePath`"^""."^""; exit 0; }; try {; $fileContent = Get-Content $jsonFilePath -ErrorAction Stop; } catch {; throw "^""Error, failed to read the settings file: `"^""$jsonFilePath`"^"". Error: $_"^""; }; if ([string]::IsNullOrWhiteSpace($fileContent)) {; Write-Host "^""Settings file is empty. Treating it as default empty JSON object."^""; $fileContent = "^""{}"^""; }; try {; $json = $fileContent | ConvertFrom-Json; } catch {; throw "^""Error, invalid JSON format in the settings file: `"^""$jsonFilePath`"^"". Error: $_"^""; }; $existingValue = $json.$settingKey; if ($existingValue -eq $settingValue) {; Write-Host "^""Skipping, `"^""$settingKey`"^"" is already configured as `"^""$settingValue`"^""."^""; exit 0; }; $json | Add-Member -Type NoteProperty -Name $settingKey -Value $settingValue -Force; $json | ConvertTo-Json | Set-Content $jsonFilePath; Write-Host "^""Successfully applied the setting to the file: `"^""$jsonFilePath`"^""."^"""
:: ----------------------------------------------------------


:: Automatically check extensions from Microsoft online service
echo --- Automatically check extensions from Microsoft online service
PowerShell -ExecutionPolicy Unrestricted -Command "$settingKey='extensions.autoCheckUpdates'; $settingValue=$false; $jsonFilePath = "^""$($env:APPDATA)\Code\User\settings.json"^""; if (!(Test-Path $jsonFilePath -PathType Leaf)) {; Write-Host "^""Skipping, no updates. Settings file was not at `"^""$jsonFilePath`"^""."^""; exit 0; }; try {; $fileContent = Get-Content $jsonFilePath -ErrorAction Stop; } catch {; throw "^""Error, failed to read the settings file: `"^""$jsonFilePath`"^"". Error: $_"^""; }; if ([string]::IsNullOrWhiteSpace($fileContent)) {; Write-Host "^""Settings file is empty. Treating it as default empty JSON object."^""; $fileContent = "^""{}"^""; }; try {; $json = $fileContent | ConvertFrom-Json; } catch {; throw "^""Error, invalid JSON format in the settings file: `"^""$jsonFilePath`"^"". Error: $_"^""; }; $existingValue = $json.$settingKey; if ($existingValue -eq $settingValue) {; Write-Host "^""Skipping, `"^""$settingKey`"^"" is already configured as `"^""$settingValue`"^""."^""; exit 0; }; $json | Add-Member -Type NoteProperty -Name $settingKey -Value $settingValue -Force; $json | ConvertTo-Json | Set-Content $jsonFilePath; Write-Host "^""Successfully applied the setting to the file: `"^""$jsonFilePath`"^""."^"""
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---Fetch recommendations from Microsoft only on demand----
:: ----------------------------------------------------------
echo --- Fetch recommendations from Microsoft only on demand
PowerShell -ExecutionPolicy Unrestricted -Command "$settingKey='extensions.showRecommendationsOnlyOnDemand'; $settingValue=$true; $jsonFilePath = "^""$($env:APPDATA)\Code\User\settings.json"^""; if (!(Test-Path $jsonFilePath -PathType Leaf)) {; Write-Host "^""Skipping, no updates. Settings file was not at `"^""$jsonFilePath`"^""."^""; exit 0; }; try {; $fileContent = Get-Content $jsonFilePath -ErrorAction Stop; } catch {; throw "^""Error, failed to read the settings file: `"^""$jsonFilePath`"^"". Error: $_"^""; }; if ([string]::IsNullOrWhiteSpace($fileContent)) {; Write-Host "^""Settings file is empty. Treating it as default empty JSON object."^""; $fileContent = "^""{}"^""; }; try {; $json = $fileContent | ConvertFrom-Json; } catch {; throw "^""Error, invalid JSON format in the settings file: `"^""$jsonFilePath`"^"". Error: $_"^""; }; $existingValue = $json.$settingKey; if ($existingValue -eq $settingValue) {; Write-Host "^""Skipping, `"^""$settingKey`"^"" is already configured as `"^""$settingValue`"^""."^""; exit 0; }; $json | Add-Member -Type NoteProperty -Name $settingKey -Value $settingValue -Force; $json | ConvertTo-Json | Set-Content $jsonFilePath; Write-Host "^""Successfully applied the setting to the file: `"^""$jsonFilePath`"^""."^"""
:: ----------------------------------------------------------


:: Disable automatic fetching of remote repositories in Visual Studio Code
echo --- Disable automatic fetching of remote repositories in Visual Studio Code
PowerShell -ExecutionPolicy Unrestricted -Command "$settingKey='git.autofetch'; $settingValue=$false; $jsonFilePath = "^""$($env:APPDATA)\Code\User\settings.json"^""; if (!(Test-Path $jsonFilePath -PathType Leaf)) {; Write-Host "^""Skipping, no updates. Settings file was not at `"^""$jsonFilePath`"^""."^""; exit 0; }; try {; $fileContent = Get-Content $jsonFilePath -ErrorAction Stop; } catch {; throw "^""Error, failed to read the settings file: `"^""$jsonFilePath`"^"". Error: $_"^""; }; if ([string]::IsNullOrWhiteSpace($fileContent)) {; Write-Host "^""Settings file is empty. Treating it as default empty JSON object."^""; $fileContent = "^""{}"^""; }; try {; $json = $fileContent | ConvertFrom-Json; } catch {; throw "^""Error, invalid JSON format in the settings file: `"^""$jsonFilePath`"^"". Error: $_"^""; }; $existingValue = $json.$settingKey; if ($existingValue -eq $settingValue) {; Write-Host "^""Skipping, `"^""$settingKey`"^"" is already configured as `"^""$settingValue`"^""."^""; exit 0; }; $json | Add-Member -Type NoteProperty -Name $settingKey -Value $settingValue -Force; $json | ConvertTo-Json | Set-Content $jsonFilePath; Write-Host "^""Successfully applied the setting to the file: `"^""$jsonFilePath`"^""."^"""
:: ----------------------------------------------------------


:: Disable fetching package information from NPM and Bower in Visual Studio Code
echo --- Disable fetching package information from NPM and Bower in Visual Studio Code
PowerShell -ExecutionPolicy Unrestricted -Command "$settingKey='npm.fetchOnlinePackageInfo'; $settingValue=$false; $jsonFilePath = "^""$($env:APPDATA)\Code\User\settings.json"^""; if (!(Test-Path $jsonFilePath -PathType Leaf)) {; Write-Host "^""Skipping, no updates. Settings file was not at `"^""$jsonFilePath`"^""."^""; exit 0; }; try {; $fileContent = Get-Content $jsonFilePath -ErrorAction Stop; } catch {; throw "^""Error, failed to read the settings file: `"^""$jsonFilePath`"^"". Error: $_"^""; }; if ([string]::IsNullOrWhiteSpace($fileContent)) {; Write-Host "^""Settings file is empty. Treating it as default empty JSON object."^""; $fileContent = "^""{}"^""; }; try {; $json = $fileContent | ConvertFrom-Json; } catch {; throw "^""Error, invalid JSON format in the settings file: `"^""$jsonFilePath`"^"". Error: $_"^""; }; $existingValue = $json.$settingKey; if ($existingValue -eq $settingValue) {; Write-Host "^""Skipping, `"^""$settingKey`"^"" is already configured as `"^""$settingValue`"^""."^""; exit 0; }; $json | Add-Member -Type NoteProperty -Name $settingKey -Value $settingValue -Force; $json | ConvertTo-Json | Set-Content $jsonFilePath; Write-Host "^""Successfully applied the setting to the file: `"^""$jsonFilePath`"^""."^"""
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------Disable Microsoft Office logging-------------
:: ----------------------------------------------------------
echo --- Disable Microsoft Office logging
reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\Outlook\Options\Mail" /v "EnableLogging" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Outlook\Options\Mail" /v "EnableLogging" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\Outlook\Options\Calendar" /v "EnableCalendarLogging" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Outlook\Options\Calendar" /v "EnableCalendarLogging" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\Word\Options" /v "EnableLogging" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Word\Options" /v "EnableLogging" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Office\15.0\OSM" /v "EnableLogging" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Office\16.0\OSM" /v "EnableLogging" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Office\15.0\OSM" /v "EnableUpload" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Office\16.0\OSM" /v "EnableUpload" /t REG_DWORD /d 0 /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------Disable Microsoft Office client telemetry---------
:: ----------------------------------------------------------
echo --- Disable Microsoft Office client telemetry
reg add "HKCU\SOFTWARE\Microsoft\Office\Common\ClientTelemetry" /v "DisableTelemetry" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\ClientTelemetry" /v "DisableTelemetry" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\Common\ClientTelemetry" /v "VerboseLogging" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\ClientTelemetry" /v "VerboseLogging" /t REG_DWORD /d 0 /f
:: ----------------------------------------------------------


:: Disable Microsoft Office Customer Experience Improvement Program
echo --- Disable Microsoft Office Customer Experience Improvement Program
reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\Common" /v "QMEnable" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common" /v "QMEnable" /t REG_DWORD /d 0 /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------Disable Microsoft Office feedback-------------
:: ----------------------------------------------------------
echo --- Disable Microsoft Office feedback
reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\Common\Feedback" /v "Enabled" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\Feedback" /v "Enabled" /t REG_DWORD /d 0 /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---------Disable Microsoft Office telemetry agent---------
:: ----------------------------------------------------------
echo --- Disable Microsoft Office telemetry agent
:: Disable scheduled task(s): `\Microsoft\Office\OfficeTelemetryAgentFallBack`
PowerShell -ExecutionPolicy Unrestricted -Command "$taskPathPattern='\Microsoft\Office\'; $taskNamePattern='OfficeTelemetryAgentFallBack'; Write-Output "^""Disabling tasks matching pattern `"^""$taskNamePattern`"^""."^""; $tasks = @(Get-ScheduledTask -TaskPath $taskPathPattern -TaskName $taskNamePattern -ErrorAction Ignore); if (-Not $tasks) {; Write-Output "^""Skipping, no tasks matching pattern `"^""$taskNamePattern`"^"" found, no action needed."^""; exit 0; }; $operationFailed = $false; foreach ($task in $tasks) {; $taskName = $task.TaskName; if ($task.State -eq [Microsoft.PowerShell.Cmdletization.GeneratedTypes.ScheduledTask.StateEnum]::Disabled) {; Write-Output "^""Skipping, task `"^""$taskName`"^"" is already disabled, no action needed."^""; continue; }; try {; $task | Disable-ScheduledTask -ErrorAction Stop | Out-Null; Write-Output "^""Successfully disabled task `"^""$taskName`"^""."^""; } catch {; Write-Error "^""Failed to disable task `"^""$taskName`"^"": $($_.Exception.Message)"^""; $operationFailed = $true; }; }; if ($operationFailed) {; Write-Output 'Failed to disable some tasks. Check error messages above.'; exit 1; }"
:: Disable scheduled task(s): `\Microsoft\Office\OfficeTelemetryAgentFallBack2016`
PowerShell -ExecutionPolicy Unrestricted -Command "$taskPathPattern='\Microsoft\Office\'; $taskNamePattern='OfficeTelemetryAgentFallBack2016'; Write-Output "^""Disabling tasks matching pattern `"^""$taskNamePattern`"^""."^""; $tasks = @(Get-ScheduledTask -TaskPath $taskPathPattern -TaskName $taskNamePattern -ErrorAction Ignore); if (-Not $tasks) {; Write-Output "^""Skipping, no tasks matching pattern `"^""$taskNamePattern`"^"" found, no action needed."^""; exit 0; }; $operationFailed = $false; foreach ($task in $tasks) {; $taskName = $task.TaskName; if ($task.State -eq [Microsoft.PowerShell.Cmdletization.GeneratedTypes.ScheduledTask.StateEnum]::Disabled) {; Write-Output "^""Skipping, task `"^""$taskName`"^"" is already disabled, no action needed."^""; continue; }; try {; $task | Disable-ScheduledTask -ErrorAction Stop | Out-Null; Write-Output "^""Successfully disabled task `"^""$taskName`"^""."^""; } catch {; Write-Error "^""Failed to disable task `"^""$taskName`"^"": $($_.Exception.Message)"^""; $operationFailed = $true; }; }; if ($operationFailed) {; Write-Output 'Failed to disable some tasks. Check error messages above.'; exit 1; }"
:: Disable scheduled task(s): `\Microsoft\Office\OfficeTelemetryAgentLogOn`
PowerShell -ExecutionPolicy Unrestricted -Command "$taskPathPattern='\Microsoft\Office\'; $taskNamePattern='OfficeTelemetryAgentLogOn'; Write-Output "^""Disabling tasks matching pattern `"^""$taskNamePattern`"^""."^""; $tasks = @(Get-ScheduledTask -TaskPath $taskPathPattern -TaskName $taskNamePattern -ErrorAction Ignore); if (-Not $tasks) {; Write-Output "^""Skipping, no tasks matching pattern `"^""$taskNamePattern`"^"" found, no action needed."^""; exit 0; }; $operationFailed = $false; foreach ($task in $tasks) {; $taskName = $task.TaskName; if ($task.State -eq [Microsoft.PowerShell.Cmdletization.GeneratedTypes.ScheduledTask.StateEnum]::Disabled) {; Write-Output "^""Skipping, task `"^""$taskName`"^"" is already disabled, no action needed."^""; continue; }; try {; $task | Disable-ScheduledTask -ErrorAction Stop | Out-Null; Write-Output "^""Successfully disabled task `"^""$taskName`"^""."^""; } catch {; Write-Error "^""Failed to disable task `"^""$taskName`"^"": $($_.Exception.Message)"^""; $operationFailed = $true; }; }; if ($operationFailed) {; Write-Output 'Failed to disable some tasks. Check error messages above.'; exit 1; }"
:: Disable scheduled task(s): `\Microsoft\Office\OfficeTelemetryAgentLogOn2016`
PowerShell -ExecutionPolicy Unrestricted -Command "$taskPathPattern='\Microsoft\Office\'; $taskNamePattern='OfficeTelemetryAgentLogOn2016'; Write-Output "^""Disabling tasks matching pattern `"^""$taskNamePattern`"^""."^""; $tasks = @(Get-ScheduledTask -TaskPath $taskPathPattern -TaskName $taskNamePattern -ErrorAction Ignore); if (-Not $tasks) {; Write-Output "^""Skipping, no tasks matching pattern `"^""$taskNamePattern`"^"" found, no action needed."^""; exit 0; }; $operationFailed = $false; foreach ($task in $tasks) {; $taskName = $task.TaskName; if ($task.State -eq [Microsoft.PowerShell.Cmdletization.GeneratedTypes.ScheduledTask.StateEnum]::Disabled) {; Write-Output "^""Skipping, task `"^""$taskName`"^"" is already disabled, no action needed."^""; continue; }; try {; $task | Disable-ScheduledTask -ErrorAction Stop | Out-Null; Write-Output "^""Successfully disabled task `"^""$taskName`"^""."^""; } catch {; Write-Error "^""Failed to disable task `"^""$taskName`"^"": $($_.Exception.Message)"^""; $operationFailed = $true; }; }; if ($operationFailed) {; Write-Output 'Failed to disable some tasks. Check error messages above.'; exit 1; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --Disable "Microsoft Office Subscription Heartbeat" task--
:: ----------------------------------------------------------
echo --- Disable "Microsoft Office Subscription Heartbeat" task
:: Disable scheduled task(s): `\Microsoft\Office\Office 15 Subscription Heartbeat`
PowerShell -ExecutionPolicy Unrestricted -Command "$taskPathPattern='\Microsoft\Office\'; $taskNamePattern='Office 15 Subscription Heartbeat'; Write-Output "^""Disabling tasks matching pattern `"^""$taskNamePattern`"^""."^""; $tasks = @(Get-ScheduledTask -TaskPath $taskPathPattern -TaskName $taskNamePattern -ErrorAction Ignore); if (-Not $tasks) {; Write-Output "^""Skipping, no tasks matching pattern `"^""$taskNamePattern`"^"" found, no action needed."^""; exit 0; }; $operationFailed = $false; foreach ($task in $tasks) {; $taskName = $task.TaskName; if ($task.State -eq [Microsoft.PowerShell.Cmdletization.GeneratedTypes.ScheduledTask.StateEnum]::Disabled) {; Write-Output "^""Skipping, task `"^""$taskName`"^"" is already disabled, no action needed."^""; continue; }; try {; $task | Disable-ScheduledTask -ErrorAction Stop | Out-Null; Write-Output "^""Successfully disabled task `"^""$taskName`"^""."^""; } catch {; Write-Error "^""Failed to disable task `"^""$taskName`"^"": $($_.Exception.Message)"^""; $operationFailed = $true; }; }; if ($operationFailed) {; Write-Output 'Failed to disable some tasks. Check error messages above.'; exit 1; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----------Disable Edge diagnostic data sending-----------
:: ----------------------------------------------------------
echo --- Disable Edge diagnostic data sending
:: Configure "DiagnosticData" Edge policy
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'DiagnosticData' /t 'REG_DWORD' /d '0' /f"
:: Suggest restarting Edge for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'For the changes to fully take effect, please restart Microsoft Edge.'; $ignoreWindows10 =  $false; $ignoreWindows11 =  $false; $warn =  $false; $osVersion = [System.Environment]::OSVersion.Version; function Test-IsWindows10 { ($osVersion.Major -eq 10) -and ($osVersion.Build -lt 22000) }; function Test-IsWindows11 { ($osVersion.Major -gt 10) -or (($osVersion.Major -eq 10) -and ($osVersion.Build -ge 22000)) }; if (($ignoreWindows10 -and (Test-IsWindows10)) -or ($ignoreWindows11 -and (Test-IsWindows11))) {; echo "^""Skipping"^""; exit 0 <# Skip #>; }; if ($warn) {; Write-Warning "^""$message"^""; } else {; Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------Disable outdated Edge metrics data sending--------
:: ----------------------------------------------------------
echo --- Disable outdated Edge metrics data sending
:: Configure "MetricsReportingEnabled" Edge policy
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'MetricsReportingEnabled' /t 'REG_DWORD' /d '0' /f"
:: Suggest restarting Edge for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'For the changes to fully take effect, please restart Microsoft Edge.'; $ignoreWindows10 =  $false; $ignoreWindows11 =  $false; $warn =  $false; $osVersion = [System.Environment]::OSVersion.Version; function Test-IsWindows10 { ($osVersion.Major -eq 10) -and ($osVersion.Build -lt 22000) }; function Test-IsWindows11 { ($osVersion.Major -gt 10) -or (($osVersion.Major -eq 10) -and ($osVersion.Build -ge 22000)) }; if (($ignoreWindows10 -and (Test-IsWindows10)) -or ($ignoreWindows11 -and (Test-IsWindows11))) {; echo "^""Skipping"^""; exit 0 <# Skip #>; }; if ($warn) {; Write-Warning "^""$message"^""; } else {; Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------Disable outdated Edge site information sending------
:: ----------------------------------------------------------
echo --- Disable outdated Edge site information sending
:: Configure "SendSiteInfoToImproveServices" Edge policy
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'SendSiteInfoToImproveServices' /t 'REG_DWORD' /d '0' /f"
:: Suggest restarting Edge for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'For the changes to fully take effect, please restart Microsoft Edge.'; $ignoreWindows10 =  $false; $ignoreWindows11 =  $false; $warn =  $false; $osVersion = [System.Environment]::OSVersion.Version; function Test-IsWindows10 { ($osVersion.Major -eq 10) -and ($osVersion.Build -lt 22000) }; function Test-IsWindows11 { ($osVersion.Major -gt 10) -or (($osVersion.Major -eq 10) -and ($osVersion.Build -ge 22000)) }; if (($ignoreWindows10 -and (Test-IsWindows10)) -or ($ignoreWindows11 -and (Test-IsWindows11))) {; echo "^""Skipping"^""; exit 0 <# Skip #>; }; if ($warn) {; Write-Warning "^""$message"^""; } else {; Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------------Disable Edge Feedback-------------------
:: ----------------------------------------------------------
echo --- Disable Edge Feedback
:: Configure "UserFeedbackAllowed" Edge policy
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'UserFeedbackAllowed' /t 'REG_DWORD' /d '0' /f"
:: Suggest restarting Edge for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'For the changes to fully take effect, please restart Microsoft Edge.'; $ignoreWindows10 =  $false; $ignoreWindows11 =  $false; $warn =  $false; $osVersion = [System.Environment]::OSVersion.Version; function Test-IsWindows10 { ($osVersion.Major -eq 10) -and ($osVersion.Build -lt 22000) }; function Test-IsWindows11 { ($osVersion.Major -gt 10) -or (($osVersion.Major -eq 10) -and ($osVersion.Build -ge 22000)) }; if (($ignoreWindows10 -and (Test-IsWindows10)) -or ($ignoreWindows11 -and (Test-IsWindows11))) {; echo "^""Skipping"^""; exit 0 <# Skip #>; }; if ($warn) {; Write-Warning "^""$message"^""; } else {; Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------Disable Edge automatic update scheduled tasks-------
:: ----------------------------------------------------------
echo --- Disable Edge automatic update scheduled tasks
:: Disable scheduled task(s): `\MicrosoftEdgeUpdateTaskMachineCore{*}`
PowerShell -ExecutionPolicy Unrestricted -Command "$taskPathPattern='\'; $taskNamePattern='MicrosoftEdgeUpdateTaskMachineCore{*}'; Write-Output "^""Disabling tasks matching pattern `"^""$taskNamePattern`"^""."^""; $tasks = @(Get-ScheduledTask -TaskPath $taskPathPattern -TaskName $taskNamePattern -ErrorAction Ignore); if (-Not $tasks) {; Write-Output "^""Skipping, no tasks matching pattern `"^""$taskNamePattern`"^"" found, no action needed."^""; exit 0; }; $operationFailed = $false; foreach ($task in $tasks) {; $taskName = $task.TaskName; if ($task.State -eq [Microsoft.PowerShell.Cmdletization.GeneratedTypes.ScheduledTask.StateEnum]::Disabled) {; Write-Output "^""Skipping, task `"^""$taskName`"^"" is already disabled, no action needed."^""; continue; }; try {; $task | Disable-ScheduledTask -ErrorAction Stop | Out-Null; Write-Output "^""Successfully disabled task `"^""$taskName`"^""."^""; } catch {; Write-Error "^""Failed to disable task `"^""$taskName`"^"": $($_.Exception.Message)"^""; $operationFailed = $true; }; }; if ($operationFailed) {; Write-Output 'Failed to disable some tasks. Check error messages above.'; exit 1; }"
:: Disable scheduled task(s): `\MicrosoftEdgeUpdateTaskMachineUA{*}`
PowerShell -ExecutionPolicy Unrestricted -Command "$taskPathPattern='\'; $taskNamePattern='MicrosoftEdgeUpdateTaskMachineUA{*}'; Write-Output "^""Disabling tasks matching pattern `"^""$taskNamePattern`"^""."^""; $tasks = @(Get-ScheduledTask -TaskPath $taskPathPattern -TaskName $taskNamePattern -ErrorAction Ignore); if (-Not $tasks) {; Write-Output "^""Skipping, no tasks matching pattern `"^""$taskNamePattern`"^"" found, no action needed."^""; exit 0; }; $operationFailed = $false; foreach ($task in $tasks) {; $taskName = $task.TaskName; if ($task.State -eq [Microsoft.PowerShell.Cmdletization.GeneratedTypes.ScheduledTask.StateEnum]::Disabled) {; Write-Output "^""Skipping, task `"^""$taskName`"^"" is already disabled, no action needed."^""; continue; }; try {; $task | Disable-ScheduledTask -ErrorAction Stop | Out-Null; Write-Output "^""Successfully disabled task `"^""$taskName`"^""."^""; } catch {; Write-Error "^""Failed to disable task `"^""$taskName`"^"": $($_.Exception.Message)"^""; $operationFailed = $true; }; }; if ($operationFailed) {; Write-Output 'Failed to disable some tasks. Check error messages above.'; exit 1; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------Disable Edge automatic update services----------
:: ----------------------------------------------------------
echo --- Disable Edge automatic update services
:: Disable service(s): `edgeupdate`
PowerShell -ExecutionPolicy Unrestricted -Command "$serviceName = 'edgeupdate'; Write-Host "^""Disabling service: `"^""$serviceName`"^""."^""; <# -- 1. Skip if service does not exist #>; $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue; if(!$service) {; Write-Host "^""Service `"^""$serviceName`"^"" could not be not found, no need to disable it."^""; Exit 0; }; <# -- 2. Stop if running #>; if ($service.Status -eq [System.ServiceProcess.ServiceControllerStatus]::Running) {; Write-Host "^""`"^""$serviceName`"^"" is running, stopping it."^""; try {; Stop-Service -Name "^""$serviceName"^"" -Force -ErrorAction Stop; Write-Host "^""Stopped `"^""$serviceName`"^"" successfully."^""; } catch {; Write-Warning "^""Could not stop `"^""$serviceName`"^"", it will be stopped after reboot: $_"^""; }; } else {; Write-Host "^""`"^""$serviceName`"^"" is not running, no need to stop."^""; }; <# -- 3. Skip if already disabled #>; $startupType = $service.StartType <# Does not work before .NET 4.6.1 #>; if(!$startupType) {; $startupType = (Get-WmiObject -Query "^""Select StartMode From Win32_Service Where Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; if(!$startupType) {; $startupType = (Get-WmiObject -Class Win32_Service -Property StartMode -Filter "^""Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; }; }; if($startupType -eq 'Disabled') {; Write-Host "^""$serviceName is already disabled, no further action is needed"^""; }; <# -- 4. Disable service #>; try {; Set-Service -Name "^""$serviceName"^"" -StartupType Disabled -Confirm:$false -ErrorAction Stop; Write-Host "^""Disabled `"^""$serviceName`"^"" successfully."^""; } catch {; Write-Error "^""Could not disable `"^""$serviceName`"^"": $_"^""; }"
:: Disable service(s): `edgeupdatem`
PowerShell -ExecutionPolicy Unrestricted -Command "$serviceName = 'edgeupdatem'; Write-Host "^""Disabling service: `"^""$serviceName`"^""."^""; <# -- 1. Skip if service does not exist #>; $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue; if(!$service) {; Write-Host "^""Service `"^""$serviceName`"^"" could not be not found, no need to disable it."^""; Exit 0; }; <# -- 2. Stop if running #>; if ($service.Status -eq [System.ServiceProcess.ServiceControllerStatus]::Running) {; Write-Host "^""`"^""$serviceName`"^"" is running, stopping it."^""; try {; Stop-Service -Name "^""$serviceName"^"" -Force -ErrorAction Stop; Write-Host "^""Stopped `"^""$serviceName`"^"" successfully."^""; } catch {; Write-Warning "^""Could not stop `"^""$serviceName`"^"", it will be stopped after reboot: $_"^""; }; } else {; Write-Host "^""`"^""$serviceName`"^"" is not running, no need to stop."^""; }; <# -- 3. Skip if already disabled #>; $startupType = $service.StartType <# Does not work before .NET 4.6.1 #>; if(!$startupType) {; $startupType = (Get-WmiObject -Query "^""Select StartMode From Win32_Service Where Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; if(!$startupType) {; $startupType = (Get-WmiObject -Class Win32_Service -Property StartMode -Filter "^""Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; }; }; if($startupType -eq 'Disabled') {; Write-Host "^""$serviceName is already disabled, no further action is needed"^""; }; <# -- 4. Disable service #>; try {; Set-Service -Name "^""$serviceName"^"" -StartupType Disabled -Confirm:$false -ErrorAction Stop; Write-Host "^""Disabled `"^""$serviceName`"^"" successfully."^""; } catch {; Write-Error "^""Could not disable `"^""$serviceName`"^"": $_"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------Disable Edge Copilot and Hubs Sidebar-----------
:: ----------------------------------------------------------
echo --- Disable Edge Copilot and Hubs Sidebar
:: Configure "HubsSidebarEnabled" Edge policy
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'HubsSidebarEnabled' /t 'REG_DWORD' /d '0' /f"
:: Configure "StandaloneHubsSidebarEnabled" Edge policy
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'StandaloneHubsSidebarEnabled' /t 'REG_DWORD' /d '0' /f"
:: Suggest restarting Edge for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'For the changes to fully take effect, please restart Microsoft Edge.'; $ignoreWindows10 =  $false; $ignoreWindows11 =  $false; $warn =  $false; $osVersion = [System.Environment]::OSVersion.Version; function Test-IsWindows10 { ($osVersion.Major -eq 10) -and ($osVersion.Build -lt 22000) }; function Test-IsWindows11 { ($osVersion.Major -gt 10) -or (($osVersion.Major -eq 10) -and ($osVersion.Build -ge 22000)) }; if (($ignoreWindows10 -and (Test-IsWindows10)) -or ($ignoreWindows11 -and (Test-IsWindows11))) {; echo "^""Skipping"^""; exit 0 <# Skip #>; }; if ($warn) {; Write-Warning "^""$message"^""; } else {; Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------Disable Edge Copilot browsing data collection-------
:: ----------------------------------------------------------
echo --- Disable Edge Copilot browsing data collection
:: Configure "DiscoverPageContextEnabled" Edge policy
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'DiscoverPageContextEnabled' /t 'REG_DWORD' /d '0' /f"
:: Configure "CopilotPageContext" Edge policy
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'CopilotPageContext' /t 'REG_DWORD' /d '0' /f"
:: Configure "CopilotCDPPageContext" Edge policy
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'CopilotCDPPageContext' /t 'REG_DWORD' /d '0' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------Disable Edge Copilot access on new tab page--------
:: ----------------------------------------------------------
echo --- Disable Edge Copilot access on new tab page
:: Configure "NewTabPageBingChatEnabled" Edge policy
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'NewTabPageBingChatEnabled' /t 'REG_DWORD' /d '0' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------Disable outdated Edge Discover button-----------
:: ----------------------------------------------------------
echo --- Disable outdated Edge Discover button
:: Configure "EdgeDiscoverEnabled" Edge policy
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'EdgeDiscoverEnabled' /t 'REG_DWORD' /d '0' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------Disable Edge spotlight recommendations----------
:: ----------------------------------------------------------
echo --- Disable Edge spotlight recommendations
:: Configure "SpotlightExperiencesAndRecommendationsEnabled" Edge policy
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'SpotlightExperiencesAndRecommendationsEnabled' /t 'REG_DWORD' /d '0' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----------------Disable Edge feature ads-----------------
:: ----------------------------------------------------------
echo --- Disable Edge feature ads
:: Configure "ShowRecommendationsEnabled" Edge policy
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'ShowRecommendationsEnabled' /t 'REG_DWORD' /d '0' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------------Disable Edge Bing ads-------------------
:: ----------------------------------------------------------
echo --- Disable Edge Bing ads
:: Configure "BingAdsSuppression" Edge policy
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'BingAdsSuppression' /t 'REG_DWORD' /d '0' /f"
:: Suggest restarting Edge for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'For the changes to fully take effect, please restart Microsoft Edge.'; $ignoreWindows10 =  $false; $ignoreWindows11 =  $false; $warn =  $false; $osVersion = [System.Environment]::OSVersion.Version; function Test-IsWindows10 { ($osVersion.Major -eq 10) -and ($osVersion.Build -lt 22000) }; function Test-IsWindows11 { ($osVersion.Major -gt 10) -or (($osVersion.Major -eq 10) -and ($osVersion.Build -ge 22000)) }; if (($ignoreWindows10 -and (Test-IsWindows10)) -or ($ignoreWindows11 -and (Test-IsWindows11))) {; echo "^""Skipping"^""; exit 0 <# Skip #>; }; if ($warn) {; Write-Warning "^""$message"^""; } else {; Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------------Disable Edge promotional pages--------------
:: ----------------------------------------------------------
echo --- Disable Edge promotional pages
:: Configure "PromotionalTabsEnabled" Edge policy
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'PromotionalTabsEnabled' /t 'REG_DWORD' /d '0' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----Disable Edge browsing history collection for ads-----
:: ----------------------------------------------------------
echo --- Disable Edge browsing history collection for ads
:: Configure "PersonalizationReportingEnabled" Edge policy
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'PersonalizationReportingEnabled' /t 'REG_DWORD' /d '0' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----------------Disable Edge Insider ads-----------------
:: ----------------------------------------------------------
echo --- Disable Edge Insider ads
:: Configure "MicrosoftEdgeInsiderPromotionEnabled" Edge policy
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'MicrosoftEdgeInsiderPromotionEnabled' /t 'REG_DWORD' /d '0' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------Disable Edge Adobe Acrobat subscription ads--------
:: ----------------------------------------------------------
echo --- Disable Edge Adobe Acrobat subscription ads
:: Configure "ShowAcrobatSubscriptionButton" Edge policy
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'ShowAcrobatSubscriptionButton' /t 'REG_DWORD' /d '0' /f"
:: ----------------------------------------------------------


:: Disable Edge top sites and sponsored links on new tab page
echo --- Disable Edge top sites and sponsored links on new tab page
:: Configure "NewTabPageHideDefaultTopSites" Edge policy
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'NewTabPageHideDefaultTopSites' /t 'REG_DWORD' /d '0' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---------------Enable Do Not Track requests---------------
:: ----------------------------------------------------------
echo --- Enable Do Not Track requests
:: Configure "ConfigureDoNotTrack" Edge policy
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'ConfigureDoNotTrack' /t 'REG_DWORD' /d '0' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---------------Disable Edge Follow feature----------------
:: ----------------------------------------------------------
echo --- Disable Edge Follow feature
:: Configure "EdgeFollowEnabled" Edge policy
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'EdgeFollowEnabled' /t 'REG_DWORD' /d '0' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------Disable Edge Shopping Assistant--------------
:: ----------------------------------------------------------
echo --- Disable Edge Shopping Assistant
:: Configure "EdgeShoppingAssistantEnabled" Edge policy
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'EdgeShoppingAssistantEnabled' /t 'REG_DWORD' /d '0' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------Disable Edge Search bar on desktop------------
:: ----------------------------------------------------------
echo --- Disable Edge Search bar on desktop
:: Configure "WebWidgetAllowed" Edge policy
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'WebWidgetAllowed' /t 'REG_DWORD' /d '0' /f"
:: Configure "WebWidgetIsEnabledOnStartup" Edge policy
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'WebWidgetIsEnabledOnStartup' /t 'REG_DWORD' /d '0' /f"
:: Configure "SearchbarAllowed" Edge policy
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'SearchbarAllowed' /t 'REG_DWORD' /d '0' /f"
:: Configure "SearchbarIsEnabledOnStartup" Edge policy
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'SearchbarIsEnabledOnStartup' /t 'REG_DWORD' /d '0' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------------Disable Edge Microsoft Rewards--------------
:: ----------------------------------------------------------
echo --- Disable Edge Microsoft Rewards
:: Configure "ShowMicrosoftRewards" Edge policy
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'ShowMicrosoftRewards' /t 'REG_DWORD' /d '0' /f"
:: Suggest restarting Edge for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'For the changes to fully take effect, please restart Microsoft Edge.'; $ignoreWindows10 =  $false; $ignoreWindows11 =  $false; $warn =  $false; $osVersion = [System.Environment]::OSVersion.Version; function Test-IsWindows10 { ($osVersion.Major -eq 10) -and ($osVersion.Build -lt 22000) }; function Test-IsWindows11 { ($osVersion.Major -gt 10) -or (($osVersion.Major -eq 10) -and ($osVersion.Build -ge 22000)) }; if (($ignoreWindows10 -and (Test-IsWindows10)) -or ($ignoreWindows11 -and (Test-IsWindows11))) {; echo "^""Skipping"^""; exit 0 <# Skip #>; }; if ($warn) {; Write-Warning "^""$message"^""; } else {; Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------Disable Edge Bing suggestions in address bar-------
:: ----------------------------------------------------------
echo --- Disable Edge Bing suggestions in address bar
:: Configure "AddressBarMicrosoftSearchInBingProviderEnabled" Edge policy
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'AddressBarMicrosoftSearchInBingProviderEnabled' /t 'REG_DWORD' /d '0' /f"
:: Suggest restarting Edge for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'For the changes to fully take effect, please restart Microsoft Edge.'; $ignoreWindows10 =  $false; $ignoreWindows11 =  $false; $warn =  $false; $osVersion = [System.Environment]::OSVersion.Version; function Test-IsWindows10 { ($osVersion.Major -eq 10) -and ($osVersion.Build -lt 22000) }; function Test-IsWindows11 { ($osVersion.Major -gt 10) -or (($osVersion.Major -eq 10) -and ($osVersion.Build -ge 22000)) }; if (($ignoreWindows10 -and (Test-IsWindows10)) -or ($ignoreWindows11 -and (Test-IsWindows11))) {; echo "^""Skipping"^""; exit 0 <# Skip #>; }; if ($warn) {; Write-Warning "^""$message"^""; } else {; Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------Disable Edge "Find on Page" data collection--------
:: ----------------------------------------------------------
echo --- Disable Edge "Find on Page" data collection
:: Configure "RelatedMatchesCloudServiceEnabled" Edge policy
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'RelatedMatchesCloudServiceEnabled' /t 'REG_DWORD' /d '0' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------Disable Edge sign-in prompt on new tab page--------
:: ----------------------------------------------------------
echo --- Disable Edge sign-in prompt on new tab page
:: Configure "SignInCtaOnNtpEnabled" Edge policy
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'SignInCtaOnNtpEnabled' /t 'REG_DWORD' /d '0' /f"
:: Suggest restarting Edge for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'For the changes to fully take effect, please restart Microsoft Edge.'; $ignoreWindows10 =  $false; $ignoreWindows11 =  $false; $warn =  $false; $osVersion = [System.Environment]::OSVersion.Version; function Test-IsWindows10 { ($osVersion.Major -eq 10) -and ($osVersion.Build -lt 22000) }; function Test-IsWindows11 { ($osVersion.Major -gt 10) -or (($osVersion.Major -eq 10) -and ($osVersion.Build -ge 22000)) }; if (($ignoreWindows10 -and (Test-IsWindows10)) -or ($ignoreWindows11 -and (Test-IsWindows11))) {; echo "^""Skipping"^""; exit 0 <# Skip #>; }; if ($warn) {; Write-Warning "^""$message"^""; } else {; Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---------Disable Edge search and site suggestions---------
:: ----------------------------------------------------------
echo --- Disable Edge search and site suggestions
:: Configure "SearchSuggestEnabled" Edge policy
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'SearchSuggestEnabled' /t 'REG_DWORD' /d '0' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----Disable outdated Edge automatic image enhancement-----
:: ----------------------------------------------------------
echo --- Disable outdated Edge automatic image enhancement
:: Configure "EdgeEnhanceImagesEnabled" Edge policy
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'EdgeEnhanceImagesEnabled' /t 'REG_DWORD' /d '0' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------Disable Edge quick links on the new tab page-------
:: ----------------------------------------------------------
echo --- Disable Edge quick links on the new tab page
:: Configure "NewTabPageQuickLinksEnabled" Edge policy
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'NewTabPageQuickLinksEnabled' /t 'REG_DWORD' /d '0' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --Disable Edge remote background images on new tab page---
:: ----------------------------------------------------------
echo --- Disable Edge remote background images on new tab page
:: Configure "NewTabPageAllowedBackgroundTypes" Edge policy
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'NewTabPageAllowedBackgroundTypes' /t 'REG_DWORD' /d '1' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------Disable Edge Collections feature-------------
:: ----------------------------------------------------------
echo --- Disable Edge Collections feature
:: Configure "EdgeCollectionsEnabled" Edge policy
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'EdgeCollectionsEnabled' /t 'REG_DWORD' /d '0' /f"
:: Suggest restarting Edge for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'For the changes to fully take effect, please restart Microsoft Edge.'; $ignoreWindows10 =  $false; $ignoreWindows11 =  $false; $warn =  $false; $osVersion = [System.Environment]::OSVersion.Version; function Test-IsWindows10 { ($osVersion.Major -eq 10) -and ($osVersion.Build -lt 22000) }; function Test-IsWindows11 { ($osVersion.Major -gt 10) -or (($osVersion.Major -eq 10) -and ($osVersion.Build -ge 22000)) }; if (($ignoreWindows10 -and (Test-IsWindows10)) -or ($ignoreWindows11 -and (Test-IsWindows11))) {; echo "^""Skipping"^""; exit 0 <# Skip #>; }; if ($warn) {; Write-Warning "^""$message"^""; } else {; Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -Disable Edge failed page data collection and suggestions-
:: ----------------------------------------------------------
echo --- Disable Edge failed page data collection and suggestions
:: Configure "AlternateErrorPagesEnabled" Edge policy
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'AlternateErrorPagesEnabled' /t 'REG_DWORD' /d '0' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------Disable outdated Edge games menu-------------
:: ----------------------------------------------------------
echo --- Disable outdated Edge games menu
:: Configure "AllowGamesMenu" Edge policy
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'AllowGamesMenu' /t 'REG_DWORD' /d '0' /f"
:: Suggest restarting Edge for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'For the changes to fully take effect, please restart Microsoft Edge.'; $ignoreWindows10 =  $false; $ignoreWindows11 =  $false; $warn =  $false; $osVersion = [System.Environment]::OSVersion.Version; function Test-IsWindows10 { ($osVersion.Major -eq 10) -and ($osVersion.Build -lt 22000) }; function Test-IsWindows11 { ($osVersion.Major -gt 10) -or (($osVersion.Major -eq 10) -and ($osVersion.Build -ge 22000)) }; if (($ignoreWindows10 -and (Test-IsWindows10)) -or ($ignoreWindows11 -and (Test-IsWindows11))) {; echo "^""Skipping"^""; exit 0 <# Skip #>; }; if ($warn) {; Write-Warning "^""$message"^""; } else {; Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---------------Disable Edge in-app support----------------
:: ----------------------------------------------------------
echo --- Disable Edge in-app support
:: Configure "InAppSupportEnabled" Edge policy
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'InAppSupportEnabled' /t 'REG_DWORD' /d '0' /f"
:: Suggest restarting Edge for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'For the changes to fully take effect, please restart Microsoft Edge.'; $ignoreWindows10 =  $false; $ignoreWindows11 =  $false; $warn =  $false; $osVersion = [System.Environment]::OSVersion.Version; function Test-IsWindows10 { ($osVersion.Major -eq 10) -and ($osVersion.Build -lt 22000) }; function Test-IsWindows11 { ($osVersion.Major -gt 10) -or (($osVersion.Major -eq 10) -and ($osVersion.Build -ge 22000)) }; if (($ignoreWindows10 -and (Test-IsWindows10)) -or ($ignoreWindows11 -and (Test-IsWindows11))) {; echo "^""Skipping"^""; exit 0 <# Skip #>; }; if ($warn) {; Write-Warning "^""$message"^""; } else {; Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------Disable Edge payment data storage and ads---------
:: ----------------------------------------------------------
echo --- Disable Edge payment data storage and ads
:: Configure "AutofillCreditCardEnabled" Edge policy
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'AutofillCreditCardEnabled' /t 'REG_DWORD' /d '0' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------------Disable Edge automatic startup--------------
:: ----------------------------------------------------------
echo --- Disable Edge automatic startup
:: Configure "StartupBoostEnabled" Edge policy
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'StartupBoostEnabled' /t 'REG_DWORD' /d '0' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----------Disable Edge Family Safety settings------------
:: ----------------------------------------------------------
echo --- Disable Edge Family Safety settings
:: Configure "FamilySafetySettingsEnabled" Edge policy
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'FamilySafetySettingsEnabled' /t 'REG_DWORD' /d '0' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----Disable Edge site information gathering from Bing-----
:: ----------------------------------------------------------
echo --- Disable Edge site information gathering from Bing
:: Configure "SiteSafetyServicesEnabled" Edge policy
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'SiteSafetyServicesEnabled' /t 'REG_DWORD' /d '0' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----Disable Edge (Legacy) Live Tile data collection------
:: ----------------------------------------------------------
echo --- Disable Edge (Legacy) Live Tile data collection
:: Configure "PreventLiveTileDataCollection" Edge (Legacy) policy
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main' /v 'PreventLiveTileDataCollection' /t 'REG_DWORD' /d '1' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKCU\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Main' /v 'PreventLiveTileDataCollection' /t 'REG_DWORD' /d '1' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---------Disable Edge (Legacy) search suggestions---------
:: ----------------------------------------------------------
echo --- Disable Edge (Legacy) search suggestions
:: Configure "ShowSearchSuggestionsGlobal" Edge (Legacy) policy
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\SearchScopes' /v 'ShowSearchSuggestionsGlobal' /t 'REG_DWORD' /d '0' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKCU\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\SearchScopes' /v 'ShowSearchSuggestionsGlobal' /t 'REG_DWORD' /d '0' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------Disable Edge (Legacy) Books telemetry-----------
:: ----------------------------------------------------------
echo --- Disable Edge (Legacy) Books telemetry
:: Configure "EnableExtendedBooksTelemetry" Edge (Legacy) policy
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\BooksLibrary' /v 'EnableExtendedBooksTelemetry' /t 'REG_DWORD' /d '0' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKCU\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\BooksLibrary' /v 'EnableExtendedBooksTelemetry' /t 'REG_DWORD' /d '0' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------Disable Internet Explorer geolocation-----------
:: ----------------------------------------------------------
echo --- Disable Internet Explorer geolocation
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKCU\Software\Policies\Microsoft\Internet Explorer\Geolocation' /v 'PolicyDisableGeolocation' /t 'REG_DWORD' /d '1' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------Disable Internet Explorer InPrivate logging--------
:: ----------------------------------------------------------
echo --- Disable Internet Explorer InPrivate logging
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Safety\PrivacIE' /v 'DisableLogging' /t 'REG_DWORD' /d '1' /f"
:: ----------------------------------------------------------


:: Disable Internet Explorer CEIP (Customer Experience Improvement Program)
echo --- Disable Internet Explorer CEIP (Customer Experience Improvement Program)
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\SQM' /v 'DisableCustomerImprovementProgram' /t 'REG_DWORD' /d '0' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------Disable legacy WCM policy calls--------------
:: ----------------------------------------------------------
echo --- Disable legacy WCM policy calls
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Internet Settings" /v "CallLegacyWCMPolicies" /t REG_DWORD /d 0 /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------------Disable SSLv3 fallback------------------
:: ----------------------------------------------------------
echo --- Disable SSLv3 fallback
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Internet Settings' /v 'EnableSSL3Fallback' /t 'REG_DWORD' /d '0' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------Disable certificate error ignoring------------
:: ----------------------------------------------------------
echo --- Disable certificate error ignoring
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Internet Settings' /v 'PreventIgnoreCertErrors' /t 'REG_DWORD' /d '1' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----Disable sharing scanned software data with Google-----
:: ----------------------------------------------------------
echo --- Disable sharing scanned software data with Google
:: Configure "ChromeCleanupReportingEnabled" Chrome policy
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Google\Chrome' /v 'ChromeCleanupReportingEnabled' /t 'REG_DWORD' /d '0' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------Disable Chrome metrics reporting-------------
:: ----------------------------------------------------------
echo --- Disable Chrome metrics reporting
:: Configure "MetricsReportingEnabled" Chrome policy
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Google\Chrome' /v 'MetricsReportingEnabled' /t 'REG_DWORD' /d '0' /f"
:: Suggest restarting Chrome for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'For the changes to fully take effect, please restart Google Chrome.'; $ignoreWindows10 =  $false; $ignoreWindows11 =  $false; $warn =  $false; $osVersion = [System.Environment]::OSVersion.Version; function Test-IsWindows10 { ($osVersion.Major -eq 10) -and ($osVersion.Build -lt 22000) }; function Test-IsWindows11 { ($osVersion.Major -gt 10) -or (($osVersion.Major -eq 10) -and ($osVersion.Build -ge 22000)) }; if (($ignoreWindows10 -and (Test-IsWindows10)) -or ($ignoreWindows11 -and (Test-IsWindows11))) {; echo "^""Skipping"^""; exit 0 <# Skip #>; }; if ($warn) {; Write-Warning "^""$message"^""; } else {; Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: Disable Firefox default browser and system data reporting-
:: ----------------------------------------------------------
echo --- Disable Firefox default browser and system data reporting
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Mozilla\Firefox' /v 'DisableDefaultBrowserAgent' /t 'REG_DWORD' /d '1' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------Disable Firefox telemetry data collection---------
:: ----------------------------------------------------------
echo --- Disable Firefox telemetry data collection
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Mozilla\Firefox' /v 'DisableTelemetry' /t 'REG_DWORD' /d '1' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------Disable Firefox background browser checks---------
:: ----------------------------------------------------------
echo --- Disable Firefox background browser checks
:: Disable scheduled task(s): `\Mozilla\Firefox Default Browser Agent 308046B0AF4A39CB`
PowerShell -ExecutionPolicy Unrestricted -Command "$taskPathPattern='\Mozilla\'; $taskNamePattern='Firefox Default Browser Agent 308046B0AF4A39CB'; Write-Output "^""Disabling tasks matching pattern `"^""$taskNamePattern`"^""."^""; $tasks = @(Get-ScheduledTask -TaskPath $taskPathPattern -TaskName $taskNamePattern -ErrorAction Ignore); if (-Not $tasks) {; Write-Output "^""Skipping, no tasks matching pattern `"^""$taskNamePattern`"^"" found, no action needed."^""; exit 0; }; $operationFailed = $false; foreach ($task in $tasks) {; $taskName = $task.TaskName; if ($task.State -eq [Microsoft.PowerShell.Cmdletization.GeneratedTypes.ScheduledTask.StateEnum]::Disabled) {; Write-Output "^""Skipping, task `"^""$taskName`"^"" is already disabled, no action needed."^""; continue; }; try {; $task | Disable-ScheduledTask -ErrorAction Stop | Out-Null; Write-Output "^""Successfully disabled task `"^""$taskName`"^""."^""; } catch {; Write-Error "^""Failed to disable task `"^""$taskName`"^"": $($_.Exception.Message)"^""; $operationFailed = $true; }; }; if ($operationFailed) {; Write-Output 'Failed to disable some tasks. Check error messages above.'; exit 1; }"
:: Disable scheduled task(s): `\Mozilla\Firefox Default Browser Agent D2CEEC440E2074BD`
PowerShell -ExecutionPolicy Unrestricted -Command "$taskPathPattern='\Mozilla\'; $taskNamePattern='Firefox Default Browser Agent D2CEEC440E2074BD'; Write-Output "^""Disabling tasks matching pattern `"^""$taskNamePattern`"^""."^""; $tasks = @(Get-ScheduledTask -TaskPath $taskPathPattern -TaskName $taskNamePattern -ErrorAction Ignore); if (-Not $tasks) {; Write-Output "^""Skipping, no tasks matching pattern `"^""$taskNamePattern`"^"" found, no action needed."^""; exit 0; }; $operationFailed = $false; foreach ($task in $tasks) {; $taskName = $task.TaskName; if ($task.State -eq [Microsoft.PowerShell.Cmdletization.GeneratedTypes.ScheduledTask.StateEnum]::Disabled) {; Write-Output "^""Skipping, task `"^""$taskName`"^"" is already disabled, no action needed."^""; continue; }; try {; $task | Disable-ScheduledTask -ErrorAction Stop | Out-Null; Write-Output "^""Successfully disabled task `"^""$taskName`"^""."^""; } catch {; Write-Error "^""Failed to disable task `"^""$taskName`"^"": $($_.Exception.Message)"^""; $operationFailed = $true; }; }; if ($operationFailed) {; Write-Output 'Failed to disable some tasks. Check error messages above.'; exit 1; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---------Disable "Google Update Service" services---------
:: ----------------------------------------------------------
echo --- Disable "Google Update Service" services
:: Disable service(s): `gupdate`
PowerShell -ExecutionPolicy Unrestricted -Command "$serviceName = 'gupdate'; Write-Host "^""Disabling service: `"^""$serviceName`"^""."^""; <# -- 1. Skip if service does not exist #>; $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue; if(!$service) {; Write-Host "^""Service `"^""$serviceName`"^"" could not be not found, no need to disable it."^""; Exit 0; }; <# -- 2. Stop if running #>; if ($service.Status -eq [System.ServiceProcess.ServiceControllerStatus]::Running) {; Write-Host "^""`"^""$serviceName`"^"" is running, stopping it."^""; try {; Stop-Service -Name "^""$serviceName"^"" -Force -ErrorAction Stop; Write-Host "^""Stopped `"^""$serviceName`"^"" successfully."^""; } catch {; Write-Warning "^""Could not stop `"^""$serviceName`"^"", it will be stopped after reboot: $_"^""; }; } else {; Write-Host "^""`"^""$serviceName`"^"" is not running, no need to stop."^""; }; <# -- 3. Skip if already disabled #>; $startupType = $service.StartType <# Does not work before .NET 4.6.1 #>; if(!$startupType) {; $startupType = (Get-WmiObject -Query "^""Select StartMode From Win32_Service Where Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; if(!$startupType) {; $startupType = (Get-WmiObject -Class Win32_Service -Property StartMode -Filter "^""Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; }; }; if($startupType -eq 'Disabled') {; Write-Host "^""$serviceName is already disabled, no further action is needed"^""; }; <# -- 4. Disable service #>; try {; Set-Service -Name "^""$serviceName"^"" -StartupType Disabled -Confirm:$false -ErrorAction Stop; Write-Host "^""Disabled `"^""$serviceName`"^"" successfully."^""; } catch {; Write-Error "^""Could not disable `"^""$serviceName`"^"": $_"^""; }"
:: Disable service(s): `gupdatem`
PowerShell -ExecutionPolicy Unrestricted -Command "$serviceName = 'gupdatem'; Write-Host "^""Disabling service: `"^""$serviceName`"^""."^""; <# -- 1. Skip if service does not exist #>; $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue; if(!$service) {; Write-Host "^""Service `"^""$serviceName`"^"" could not be not found, no need to disable it."^""; Exit 0; }; <# -- 2. Stop if running #>; if ($service.Status -eq [System.ServiceProcess.ServiceControllerStatus]::Running) {; Write-Host "^""`"^""$serviceName`"^"" is running, stopping it."^""; try {; Stop-Service -Name "^""$serviceName"^"" -Force -ErrorAction Stop; Write-Host "^""Stopped `"^""$serviceName`"^"" successfully."^""; } catch {; Write-Warning "^""Could not stop `"^""$serviceName`"^"", it will be stopped after reboot: $_"^""; }; } else {; Write-Host "^""`"^""$serviceName`"^"" is not running, no need to stop."^""; }; <# -- 3. Skip if already disabled #>; $startupType = $service.StartType <# Does not work before .NET 4.6.1 #>; if(!$startupType) {; $startupType = (Get-WmiObject -Query "^""Select StartMode From Win32_Service Where Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; if(!$startupType) {; $startupType = (Get-WmiObject -Class Win32_Service -Property StartMode -Filter "^""Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; }; }; if($startupType -eq 'Disabled') {; Write-Host "^""$serviceName is already disabled, no further action is needed"^""; }; <# -- 4. Disable service #>; try {; Set-Service -Name "^""$serviceName"^"" -StartupType Disabled -Confirm:$false -ErrorAction Stop; Write-Host "^""Disabled `"^""$serviceName`"^"" successfully."^""; } catch {; Write-Error "^""Could not disable `"^""$serviceName`"^"": $_"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------Disable "Adobe Acrobat Update Service" service------
:: ----------------------------------------------------------
echo --- Disable "Adobe Acrobat Update Service" service
:: Disable service(s): `AdobeARMservice`
PowerShell -ExecutionPolicy Unrestricted -Command "$serviceName = 'AdobeARMservice'; Write-Host "^""Disabling service: `"^""$serviceName`"^""."^""; <# -- 1. Skip if service does not exist #>; $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue; if(!$service) {; Write-Host "^""Service `"^""$serviceName`"^"" could not be not found, no need to disable it."^""; Exit 0; }; <# -- 2. Stop if running #>; if ($service.Status -eq [System.ServiceProcess.ServiceControllerStatus]::Running) {; Write-Host "^""`"^""$serviceName`"^"" is running, stopping it."^""; try {; Stop-Service -Name "^""$serviceName"^"" -Force -ErrorAction Stop; Write-Host "^""Stopped `"^""$serviceName`"^"" successfully."^""; } catch {; Write-Warning "^""Could not stop `"^""$serviceName`"^"", it will be stopped after reboot: $_"^""; }; } else {; Write-Host "^""`"^""$serviceName`"^"" is not running, no need to stop."^""; }; <# -- 3. Skip if already disabled #>; $startupType = $service.StartType <# Does not work before .NET 4.6.1 #>; if(!$startupType) {; $startupType = (Get-WmiObject -Query "^""Select StartMode From Win32_Service Where Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; if(!$startupType) {; $startupType = (Get-WmiObject -Class Win32_Service -Property StartMode -Filter "^""Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; }; }; if($startupType -eq 'Disabled') {; Write-Host "^""$serviceName is already disabled, no further action is needed"^""; }; <# -- 4. Disable service #>; try {; Set-Service -Name "^""$serviceName"^"" -StartupType Disabled -Confirm:$false -ErrorAction Stop; Write-Host "^""Disabled `"^""$serviceName`"^"" successfully."^""; } catch {; Write-Error "^""Could not disable `"^""$serviceName`"^"": $_"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------Disable "Adobe Update Service" service----------
:: ----------------------------------------------------------
echo --- Disable "Adobe Update Service" service
:: Disable service(s): `adobeupdateservice`
PowerShell -ExecutionPolicy Unrestricted -Command "$serviceName = 'adobeupdateservice'; Write-Host "^""Disabling service: `"^""$serviceName`"^""."^""; <# -- 1. Skip if service does not exist #>; $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue; if(!$service) {; Write-Host "^""Service `"^""$serviceName`"^"" could not be not found, no need to disable it."^""; Exit 0; }; <# -- 2. Stop if running #>; if ($service.Status -eq [System.ServiceProcess.ServiceControllerStatus]::Running) {; Write-Host "^""`"^""$serviceName`"^"" is running, stopping it."^""; try {; Stop-Service -Name "^""$serviceName"^"" -Force -ErrorAction Stop; Write-Host "^""Stopped `"^""$serviceName`"^"" successfully."^""; } catch {; Write-Warning "^""Could not stop `"^""$serviceName`"^"", it will be stopped after reboot: $_"^""; }; } else {; Write-Host "^""`"^""$serviceName`"^"" is not running, no need to stop."^""; }; <# -- 3. Skip if already disabled #>; $startupType = $service.StartType <# Does not work before .NET 4.6.1 #>; if(!$startupType) {; $startupType = (Get-WmiObject -Query "^""Select StartMode From Win32_Service Where Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; if(!$startupType) {; $startupType = (Get-WmiObject -Class Win32_Service -Property StartMode -Filter "^""Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; }; }; if($startupType -eq 'Disabled') {; Write-Host "^""$serviceName is already disabled, no further action is needed"^""; }; <# -- 4. Disable service #>; try {; Set-Service -Name "^""$serviceName"^"" -StartupType Disabled -Confirm:$false -ErrorAction Stop; Write-Host "^""Disabled `"^""$serviceName`"^"" successfully."^""; } catch {; Write-Error "^""Could not disable `"^""$serviceName`"^"": $_"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----Disable "Adobe Acrobat Update Task" scheduled task----
:: ----------------------------------------------------------
echo --- Disable "Adobe Acrobat Update Task" scheduled task
:: Disable scheduled task(s): `\Adobe Acrobat Update Task`
PowerShell -ExecutionPolicy Unrestricted -Command "$taskPathPattern='\'; $taskNamePattern='Adobe Acrobat Update Task'; Write-Output "^""Disabling tasks matching pattern `"^""$taskNamePattern`"^""."^""; $tasks = @(Get-ScheduledTask -TaskPath $taskPathPattern -TaskName $taskNamePattern -ErrorAction Ignore); if (-Not $tasks) {; Write-Output "^""Skipping, no tasks matching pattern `"^""$taskNamePattern`"^"" found, no action needed."^""; exit 0; }; $operationFailed = $false; foreach ($task in $tasks) {; $taskName = $task.TaskName; if ($task.State -eq [Microsoft.PowerShell.Cmdletization.GeneratedTypes.ScheduledTask.StateEnum]::Disabled) {; Write-Output "^""Skipping, task `"^""$taskName`"^"" is already disabled, no action needed."^""; continue; }; try {; $task | Disable-ScheduledTask -ErrorAction Stop | Out-Null; Write-Output "^""Successfully disabled task `"^""$taskName`"^""."^""; } catch {; Write-Error "^""Failed to disable task `"^""$taskName`"^"": $($_.Exception.Message)"^""; $operationFailed = $true; }; }; if ($operationFailed) {; Write-Output 'Failed to disable some tasks. Check error messages above.'; exit 1; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------Disable "Dropbox Update Service" services---------
:: ----------------------------------------------------------
echo --- Disable "Dropbox Update Service" services
:: Disable service(s): `dbupdate`
PowerShell -ExecutionPolicy Unrestricted -Command "$serviceName = 'dbupdate'; Write-Host "^""Disabling service: `"^""$serviceName`"^""."^""; <# -- 1. Skip if service does not exist #>; $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue; if(!$service) {; Write-Host "^""Service `"^""$serviceName`"^"" could not be not found, no need to disable it."^""; Exit 0; }; <# -- 2. Stop if running #>; if ($service.Status -eq [System.ServiceProcess.ServiceControllerStatus]::Running) {; Write-Host "^""`"^""$serviceName`"^"" is running, stopping it."^""; try {; Stop-Service -Name "^""$serviceName"^"" -Force -ErrorAction Stop; Write-Host "^""Stopped `"^""$serviceName`"^"" successfully."^""; } catch {; Write-Warning "^""Could not stop `"^""$serviceName`"^"", it will be stopped after reboot: $_"^""; }; } else {; Write-Host "^""`"^""$serviceName`"^"" is not running, no need to stop."^""; }; <# -- 3. Skip if already disabled #>; $startupType = $service.StartType <# Does not work before .NET 4.6.1 #>; if(!$startupType) {; $startupType = (Get-WmiObject -Query "^""Select StartMode From Win32_Service Where Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; if(!$startupType) {; $startupType = (Get-WmiObject -Class Win32_Service -Property StartMode -Filter "^""Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; }; }; if($startupType -eq 'Disabled') {; Write-Host "^""$serviceName is already disabled, no further action is needed"^""; }; <# -- 4. Disable service #>; try {; Set-Service -Name "^""$serviceName"^"" -StartupType Disabled -Confirm:$false -ErrorAction Stop; Write-Host "^""Disabled `"^""$serviceName`"^"" successfully."^""; } catch {; Write-Error "^""Could not disable `"^""$serviceName`"^"": $_"^""; }"
:: Disable service(s): `dbupdatem`
PowerShell -ExecutionPolicy Unrestricted -Command "$serviceName = 'dbupdatem'; Write-Host "^""Disabling service: `"^""$serviceName`"^""."^""; <# -- 1. Skip if service does not exist #>; $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue; if(!$service) {; Write-Host "^""Service `"^""$serviceName`"^"" could not be not found, no need to disable it."^""; Exit 0; }; <# -- 2. Stop if running #>; if ($service.Status -eq [System.ServiceProcess.ServiceControllerStatus]::Running) {; Write-Host "^""`"^""$serviceName`"^"" is running, stopping it."^""; try {; Stop-Service -Name "^""$serviceName"^"" -Force -ErrorAction Stop; Write-Host "^""Stopped `"^""$serviceName`"^"" successfully."^""; } catch {; Write-Warning "^""Could not stop `"^""$serviceName`"^"", it will be stopped after reboot: $_"^""; }; } else {; Write-Host "^""`"^""$serviceName`"^"" is not running, no need to stop."^""; }; <# -- 3. Skip if already disabled #>; $startupType = $service.StartType <# Does not work before .NET 4.6.1 #>; if(!$startupType) {; $startupType = (Get-WmiObject -Query "^""Select StartMode From Win32_Service Where Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; if(!$startupType) {; $startupType = (Get-WmiObject -Class Win32_Service -Property StartMode -Filter "^""Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; }; }; if($startupType -eq 'Disabled') {; Write-Host "^""$serviceName is already disabled, no further action is needed"^""; }; <# -- 4. Disable service #>; try {; Set-Service -Name "^""$serviceName"^"" -StartupType Disabled -Confirm:$false -ErrorAction Stop; Write-Host "^""Disabled `"^""$serviceName`"^"" successfully."^""; } catch {; Write-Error "^""Could not disable `"^""$serviceName`"^"": $_"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----Disable Dropbox automatic updates scheduled tasks-----
:: ----------------------------------------------------------
echo --- Disable Dropbox automatic updates scheduled tasks
:: Disable scheduled task(s): `\DropboxUpdateTaskMachineUA`
PowerShell -ExecutionPolicy Unrestricted -Command "$taskPathPattern='\'; $taskNamePattern='DropboxUpdateTaskMachineUA'; Write-Output "^""Disabling tasks matching pattern `"^""$taskNamePattern`"^""."^""; $tasks = @(Get-ScheduledTask -TaskPath $taskPathPattern -TaskName $taskNamePattern -ErrorAction Ignore); if (-Not $tasks) {; Write-Output "^""Skipping, no tasks matching pattern `"^""$taskNamePattern`"^"" found, no action needed."^""; exit 0; }; $operationFailed = $false; foreach ($task in $tasks) {; $taskName = $task.TaskName; if ($task.State -eq [Microsoft.PowerShell.Cmdletization.GeneratedTypes.ScheduledTask.StateEnum]::Disabled) {; Write-Output "^""Skipping, task `"^""$taskName`"^"" is already disabled, no action needed."^""; continue; }; try {; $task | Disable-ScheduledTask -ErrorAction Stop | Out-Null; Write-Output "^""Successfully disabled task `"^""$taskName`"^""."^""; } catch {; Write-Error "^""Failed to disable task `"^""$taskName`"^"": $($_.Exception.Message)"^""; $operationFailed = $true; }; }; if ($operationFailed) {; Write-Output 'Failed to disable some tasks. Check error messages above.'; exit 1; }"
:: Disable scheduled task(s): `\DropboxUpdateTaskMachineCore`
PowerShell -ExecutionPolicy Unrestricted -Command "$taskPathPattern='\'; $taskNamePattern='DropboxUpdateTaskMachineCore'; Write-Output "^""Disabling tasks matching pattern `"^""$taskNamePattern`"^""."^""; $tasks = @(Get-ScheduledTask -TaskPath $taskPathPattern -TaskName $taskNamePattern -ErrorAction Ignore); if (-Not $tasks) {; Write-Output "^""Skipping, no tasks matching pattern `"^""$taskNamePattern`"^"" found, no action needed."^""; exit 0; }; $operationFailed = $false; foreach ($task in $tasks) {; $taskName = $task.TaskName; if ($task.State -eq [Microsoft.PowerShell.Cmdletization.GeneratedTypes.ScheduledTask.StateEnum]::Disabled) {; Write-Output "^""Skipping, task `"^""$taskName`"^"" is already disabled, no action needed."^""; continue; }; try {; $task | Disable-ScheduledTask -ErrorAction Stop | Out-Null; Write-Output "^""Successfully disabled task `"^""$taskName`"^""."^""; } catch {; Write-Error "^""Failed to disable task `"^""$taskName`"^"": $($_.Exception.Message)"^""; $operationFailed = $true; }; }; if ($operationFailed) {; Write-Output 'Failed to disable some tasks. Check error messages above.'; exit 1; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----Disable sending Windows Media Player statistics------
:: ----------------------------------------------------------
echo --- Disable sending Windows Media Player statistics
reg add "HKCU\SOFTWARE\Microsoft\MediaPlayer\Preferences" /v "UsageTracking" /t "REG_DWORD" /d "0" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------------Disable metadata retrieval----------------
:: ----------------------------------------------------------
echo --- Disable metadata retrieval
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKCU\Software\Policies\Microsoft\WindowsMediaPlayer' /v 'PreventCDDVDMetadataRetrieval' /t 'REG_DWORD' /d '1' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKCU\Software\Policies\Microsoft\WindowsMediaPlayer' /v 'PreventMusicFileMetadataRetrieval' /t 'REG_DWORD' /d '1' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKCU\Software\Policies\Microsoft\WindowsMediaPlayer' /v 'PreventRadioPresetsRetrieval' /t 'REG_DWORD' /d '1' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\WMDRM' /v 'DisableOnline' /t 'REG_DWORD' /d '1' /f"
:: ----------------------------------------------------------


:: Disable "Windows Media Player Network Sharing Service" (`WMPNetworkSvc`)
echo --- Disable "Windows Media Player Network Sharing Service" (`WMPNetworkSvc`)
:: Disable service(s): `WMPNetworkSvc`
PowerShell -ExecutionPolicy Unrestricted -Command "$serviceName = 'WMPNetworkSvc'; Write-Host "^""Disabling service: `"^""$serviceName`"^""."^""; <# -- 1. Skip if service does not exist #>; $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue; if(!$service) {; Write-Host "^""Service `"^""$serviceName`"^"" could not be not found, no need to disable it."^""; Exit 0; }; <# -- 2. Stop if running #>; if ($service.Status -eq [System.ServiceProcess.ServiceControllerStatus]::Running) {; Write-Host "^""`"^""$serviceName`"^"" is running, stopping it."^""; try {; Stop-Service -Name "^""$serviceName"^"" -Force -ErrorAction Stop; Write-Host "^""Stopped `"^""$serviceName`"^"" successfully."^""; } catch {; Write-Warning "^""Could not stop `"^""$serviceName`"^"", it will be stopped after reboot: $_"^""; }; } else {; Write-Host "^""`"^""$serviceName`"^"" is not running, no need to stop."^""; }; <# -- 3. Skip if already disabled #>; $startupType = $service.StartType <# Does not work before .NET 4.6.1 #>; if(!$startupType) {; $startupType = (Get-WmiObject -Query "^""Select StartMode From Win32_Service Where Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; if(!$startupType) {; $startupType = (Get-WmiObject -Class Win32_Service -Property StartMode -Filter "^""Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; }; }; if($startupType -eq 'Disabled') {; Write-Host "^""$serviceName is already disabled, no further action is needed"^""; }; <# -- 4. Disable service #>; try {; Set-Service -Name "^""$serviceName"^"" -StartupType Disabled -Confirm:$false -ErrorAction Stop; Write-Host "^""Disabled `"^""$serviceName`"^"" successfully."^""; } catch {; Write-Error "^""Could not disable `"^""$serviceName`"^"": $_"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----------Disable "Razer Game Scanner Service"-----------
:: ----------------------------------------------------------
echo --- Disable "Razer Game Scanner Service"
:: Disable service(s): `Razer Game Scanner Service`
PowerShell -ExecutionPolicy Unrestricted -Command "$serviceName = 'Razer Game Scanner Service'; Write-Host "^""Disabling service: `"^""$serviceName`"^""."^""; <# -- 1. Skip if service does not exist #>; $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue; if(!$service) {; Write-Host "^""Service `"^""$serviceName`"^"" could not be not found, no need to disable it."^""; Exit 0; }; <# -- 2. Stop if running #>; if ($service.Status -eq [System.ServiceProcess.ServiceControllerStatus]::Running) {; Write-Host "^""`"^""$serviceName`"^"" is running, stopping it."^""; try {; Stop-Service -Name "^""$serviceName"^"" -Force -ErrorAction Stop; Write-Host "^""Stopped `"^""$serviceName`"^"" successfully."^""; } catch {; Write-Warning "^""Could not stop `"^""$serviceName`"^"", it will be stopped after reboot: $_"^""; }; } else {; Write-Host "^""`"^""$serviceName`"^"" is not running, no need to stop."^""; }; <# -- 3. Skip if already disabled #>; $startupType = $service.StartType <# Does not work before .NET 4.6.1 #>; if(!$startupType) {; $startupType = (Get-WmiObject -Query "^""Select StartMode From Win32_Service Where Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; if(!$startupType) {; $startupType = (Get-WmiObject -Class Win32_Service -Property StartMode -Filter "^""Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; }; }; if($startupType -eq 'Disabled') {; Write-Host "^""$serviceName is already disabled, no further action is needed"^""; }; <# -- 4. Disable service #>; try {; Set-Service -Name "^""$serviceName"^"" -StartupType Disabled -Confirm:$false -ErrorAction Stop; Write-Host "^""Disabled `"^""$serviceName`"^"" successfully."^""; } catch {; Write-Error "^""Could not disable `"^""$serviceName`"^"": $_"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------Disable "Logitech Gaming Registry Service"--------
:: ----------------------------------------------------------
echo --- Disable "Logitech Gaming Registry Service"
:: Disable service(s): `LogiRegistryService`
PowerShell -ExecutionPolicy Unrestricted -Command "$serviceName = 'LogiRegistryService'; Write-Host "^""Disabling service: `"^""$serviceName`"^""."^""; <# -- 1. Skip if service does not exist #>; $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue; if(!$service) {; Write-Host "^""Service `"^""$serviceName`"^"" could not be not found, no need to disable it."^""; Exit 0; }; <# -- 2. Stop if running #>; if ($service.Status -eq [System.ServiceProcess.ServiceControllerStatus]::Running) {; Write-Host "^""`"^""$serviceName`"^"" is running, stopping it."^""; try {; Stop-Service -Name "^""$serviceName"^"" -Force -ErrorAction Stop; Write-Host "^""Stopped `"^""$serviceName`"^"" successfully."^""; } catch {; Write-Warning "^""Could not stop `"^""$serviceName`"^"", it will be stopped after reboot: $_"^""; }; } else {; Write-Host "^""`"^""$serviceName`"^"" is not running, no need to stop."^""; }; <# -- 3. Skip if already disabled #>; $startupType = $service.StartType <# Does not work before .NET 4.6.1 #>; if(!$startupType) {; $startupType = (Get-WmiObject -Query "^""Select StartMode From Win32_Service Where Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; if(!$startupType) {; $startupType = (Get-WmiObject -Class Win32_Service -Property StartMode -Filter "^""Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; }; }; if($startupType -eq 'Disabled') {; Write-Host "^""$serviceName is already disabled, no further action is needed"^""; }; <# -- 4. Disable service #>; try {; Set-Service -Name "^""$serviceName"^"" -StartupType Disabled -Confirm:$false -ErrorAction Stop; Write-Host "^""Disabled `"^""$serviceName`"^"" successfully."^""; } catch {; Write-Error "^""Could not disable `"^""$serviceName`"^"": $_"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------Disable CCleaner data collection-------------
:: ----------------------------------------------------------
echo --- Disable CCleaner data collection
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKCU\Software\Piriform\CCleaner' /v 'Monitoring' /t 'REG_DWORD' /d '0' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKCU\Software\Piriform\CCleaner' /v 'HelpImproveCCleaner' /t 'REG_DWORD' /d '0' /f"
reg add "HKCU\Software\Piriform\CCleaner" /v "SystemMonitoring" /t REG_DWORD /d 0 /f
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKCU\Software\Piriform\CCleaner' /v 'UpdateAuto' /t 'REG_DWORD' /d '0' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKCU\Software\Piriform\CCleaner' /v 'UpdateCheck' /t 'REG_DWORD' /d '0' /f"
reg add "HKCU\Software\Piriform\CCleaner" /v "CheckTrialOffer" /t REG_DWORD /d 0 /f
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKCU\Software\Piriform\CCleaner' /v '(Cfg)HealthCheck' /t 'REG_DWORD' /d '0' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKCU\Software\Piriform\CCleaner' /v '(Cfg)QuickClean' /t 'REG_DWORD' /d '0' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKCU\Software\Piriform\CCleaner' /v '(Cfg)QuickCleanIpm' /t 'REG_DWORD' /d '0' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKCU\Software\Piriform\CCleaner' /v '(Cfg)GetIpmForTrial' /t 'REG_DWORD' /d '0' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKCU\Software\Piriform\CCleaner' /v '(Cfg)SoftwareUpdater' /t 'REG_DWORD' /d '0' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKCU\Software\Piriform\CCleaner' /v '(Cfg)SoftwareUpdaterIpm' /t 'REG_DWORD' /d '0' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------Enable strong Diffie-Hellman key requirement-------
:: ----------------------------------------------------------
echo --- Enable strong Diffie-Hellman key requirement
:: Require "Diffie-Hellman" key exchange algorithm to have at "2048" least bits keys for TLS/SSL connections
 reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\KeyExchangeAlgorithms\Diffie-Hellman" /v "ServerMinKeyBitLength" /t "REG_DWORD" /d "2048" /f
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\KeyExchangeAlgorithms\Diffie-Hellman' /v 'ClientMinKeyBitLength' /t 'REG_DWORD' /d '2048' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------------Disable insecure "RC2" ciphers--------------
:: ----------------------------------------------------------
echo --- Disable insecure "RC2" ciphers
:: Disable the use of "RC2 40/128" cipher algorithm for TLS/SSL connections
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC2 40/128' /v 'Enabled' /t 'REG_DWORD' /d '0' /f"
:: Disable the use of "RC2 56/128" cipher algorithm for TLS/SSL connections
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC2 56/128' /v 'Enabled' /t 'REG_DWORD' /d '0' /f"
:: Disable the use of "RC2 128/128" cipher algorithm for TLS/SSL connections
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC2 128/128' /v 'Enabled' /t 'REG_DWORD' /d '0' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------------Disable insecure "RC4" ciphers--------------
:: ----------------------------------------------------------
echo --- Disable insecure "RC4" ciphers
:: Disable the use of "RC4 128/128" cipher algorithm for TLS/SSL connections
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC4 128/128' /v 'Enabled' /t 'REG_DWORD' /d '0' /f"
:: Disable the use of "RC4 64/128" cipher algorithm for TLS/SSL connections
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC4 64/128' /v 'Enabled' /t 'REG_DWORD' /d '0' /f"
:: Disable the use of "RC4 56/128" cipher algorithm for TLS/SSL connections
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC4 56/128' /v 'Enabled' /t 'REG_DWORD' /d '0' /f"
:: Disable the use of "RC4 40/128" cipher algorithm for TLS/SSL connections
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC4 40/128' /v 'Enabled' /t 'REG_DWORD' /d '0' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------------Disable insecure "DES" cipher---------------
:: ----------------------------------------------------------
echo --- Disable insecure "DES" cipher
:: Disable the use of "DES 56/56" cipher algorithm for TLS/SSL connections
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\DES 56/56' /v 'Enabled' /t 'REG_DWORD' /d '0' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----------Disable insecure "Triple DES" cipher-----------
:: ----------------------------------------------------------
echo --- Disable insecure "Triple DES" cipher
:: Disable the use of "Triple DES 168" cipher algorithm for TLS/SSL connections
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\Triple DES 168' /v 'Enabled' /t 'REG_DWORD' /d '0' /f"
:: Disable the use of "Triple DES 168/168" cipher algorithm for TLS/SSL connections
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\Triple DES 168/168' /v 'Enabled' /t 'REG_DWORD' /d '0' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------------Disable insecure "NULL" cipher--------------
:: ----------------------------------------------------------
echo --- Disable insecure "NULL" cipher
:: Disable the use of "NULL" cipher algorithm for TLS/SSL connections
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\NULL' /v 'Enabled' /t 'REG_DWORD' /d '0' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---------------Disable insecure "MD5" hash----------------
:: ----------------------------------------------------------
echo --- Disable insecure "MD5" hash
:: Disable usage of "MD5" hash algorithm for TLS/SSL connections
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Hashes\MD5' /v 'Enabled' /t 'REG_DWORD' /d '0' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------------Disable insecure "SHA-1" hash---------------
:: ----------------------------------------------------------
echo --- Disable insecure "SHA-1" hash
:: Disable usage of "SHA" hash algorithm for TLS/SSL connections
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Hashes\SHA' /v 'Enabled' /t 'REG_DWORD' /d '0' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------Disable insecure "SMBv1" protocol-------------
:: ----------------------------------------------------------
echo --- Disable insecure "SMBv1" protocol
:: Disable the "SMB1Protocol" feature
PowerShell -ExecutionPolicy Unrestricted -Command "$featureName = 'SMB1Protocol'; $feature = Get-WindowsOptionalFeature -FeatureName "^""$featureName"^"" -Online -ErrorAction Stop; if (-Not $feature) {; Write-Output "^""Skipping: The feature `"^""$featureName`"^"" is not found. No action required."^""; Exit 0; }; if ($feature.State -eq [Microsoft.Dism.Commands.FeatureState]::Disabled) {; Write-Output "^""Skipping: The feature `"^""$featureName`"^"" is already disabled. No action required."^""; Exit 0; }; try {; Write-Host "^""Disabling feature: `"^""$featureName`"^""."^""; Disable-WindowsOptionalFeature -FeatureName "^""$featureName"^"" -Online -NoRestart -LogLevel ([Microsoft.Dism.Commands.LogLevel]::Errors) -WarningAction SilentlyContinue -ErrorAction Stop | Out-Null; } catch {; Write-Error "^""Failed to disable the feature `"^""$featureName`"^"": $($_.Exception.Message)"^""; Exit 1; }; Write-Output "^""Successfully disabled the feature `"^""$featureName`"^""."^""; Exit 0"
:: Disable the "SMB1Protocol-Client" feature
PowerShell -ExecutionPolicy Unrestricted -Command "$featureName = 'SMB1Protocol-Client'; $feature = Get-WindowsOptionalFeature -FeatureName "^""$featureName"^"" -Online -ErrorAction Stop; if (-Not $feature) {; Write-Output "^""Skipping: The feature `"^""$featureName`"^"" is not found. No action required."^""; Exit 0; }; if ($feature.State -eq [Microsoft.Dism.Commands.FeatureState]::Disabled) {; Write-Output "^""Skipping: The feature `"^""$featureName`"^"" is already disabled. No action required."^""; Exit 0; }; try {; Write-Host "^""Disabling feature: `"^""$featureName`"^""."^""; Disable-WindowsOptionalFeature -FeatureName "^""$featureName"^"" -Online -NoRestart -LogLevel ([Microsoft.Dism.Commands.LogLevel]::Errors) -WarningAction SilentlyContinue -ErrorAction Stop | Out-Null; } catch {; Write-Error "^""Failed to disable the feature `"^""$featureName`"^"": $($_.Exception.Message)"^""; Exit 1; }; Write-Output "^""Successfully disabled the feature `"^""$featureName`"^""."^""; Exit 0"
:: Disable the "SMB1Protocol-Server" feature
PowerShell -ExecutionPolicy Unrestricted -Command "$featureName = 'SMB1Protocol-Server'; $feature = Get-WindowsOptionalFeature -FeatureName "^""$featureName"^"" -Online -ErrorAction Stop; if (-Not $feature) {; Write-Output "^""Skipping: The feature `"^""$featureName`"^"" is not found. No action required."^""; Exit 0; }; if ($feature.State -eq [Microsoft.Dism.Commands.FeatureState]::Disabled) {; Write-Output "^""Skipping: The feature `"^""$featureName`"^"" is already disabled. No action required."^""; Exit 0; }; try {; Write-Host "^""Disabling feature: `"^""$featureName`"^""."^""; Disable-WindowsOptionalFeature -FeatureName "^""$featureName"^"" -Online -NoRestart -LogLevel ([Microsoft.Dism.Commands.LogLevel]::Errors) -WarningAction SilentlyContinue -ErrorAction Stop | Out-Null; } catch {; Write-Error "^""Failed to disable the feature `"^""$featureName`"^"": $($_.Exception.Message)"^""; Exit 1; }; Write-Output "^""Successfully disabled the feature `"^""$featureName`"^""."^""; Exit 0"
:: Disable service(s): `mrxsmb10`
PowerShell -ExecutionPolicy Unrestricted -Command "$serviceName = 'mrxsmb10'; Write-Host "^""Disabling service: `"^""$serviceName`"^""."^""; <# -- 1. Skip if service does not exist #>; $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue; if(!$service) {; Write-Host "^""Service `"^""$serviceName`"^"" could not be not found, no need to disable it."^""; Exit 0; }; <# -- 2. Stop if running #>; if ($service.Status -eq [System.ServiceProcess.ServiceControllerStatus]::Running) {; Write-Host "^""`"^""$serviceName`"^"" is running, stopping it."^""; try {; Stop-Service -Name "^""$serviceName"^"" -Force -ErrorAction Stop; Write-Host "^""Stopped `"^""$serviceName`"^"" successfully."^""; } catch {; Write-Warning "^""Could not stop `"^""$serviceName`"^"", it will be stopped after reboot: $_"^""; }; } else {; Write-Host "^""`"^""$serviceName`"^"" is not running, no need to stop."^""; }; <# -- 3. Skip if already disabled #>; $startupType = $service.StartType <# Does not work before .NET 4.6.1 #>; if(!$startupType) {; $startupType = (Get-WmiObject -Query "^""Select StartMode From Win32_Service Where Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; if(!$startupType) {; $startupType = (Get-WmiObject -Class Win32_Service -Property StartMode -Filter "^""Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; }; }; if($startupType -eq 'Disabled') {; Write-Host "^""$serviceName is already disabled, no further action is needed"^""; }; <# -- 4. Disable service #>; try {; Set-Service -Name "^""$serviceName"^"" -StartupType Disabled -Confirm:$false -ErrorAction Stop; Write-Host "^""Disabled `"^""$serviceName`"^"" successfully."^""; } catch {; Write-Error "^""Could not disable `"^""$serviceName`"^"": $_"^""; }"
sc.exe config lanmanworkstation depend= bowser/mrxsmb20/nsi
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters' /v 'SMBv1' /t 'REG_DWORD' /d '0' /f"
:: Suggest restarting computer for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'For the changes to fully take effect, please restart your computer.'; $ignoreWindows10 =  $false; $ignoreWindows11 =  $false; $warn =  $false; $osVersion = [System.Environment]::OSVersion.Version; function Test-IsWindows10 { ($osVersion.Major -eq 10) -and ($osVersion.Build -lt 22000) }; function Test-IsWindows11 { ($osVersion.Major -gt 10) -or (($osVersion.Major -eq 10) -and ($osVersion.Build -ge 22000)) }; if (($ignoreWindows10 -and (Test-IsWindows10)) -or ($ignoreWindows11 -and (Test-IsWindows11))) {; echo "^""Skipping"^""; exit 0 <# Skip #>; }; if ($warn) {; Write-Warning "^""$message"^""; } else {; Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----------Disable insecure "NetBios" protocol------------
:: ----------------------------------------------------------
echo --- Disable insecure "NetBios" protocol
PowerShell -ExecutionPolicy Unrestricted -Command "$key = 'HKLM:SYSTEM\CurrentControlSet\services\NetBT\Parameters\Interfaces'; Get-ChildItem $key | ForEach {; Set-ItemProperty -Path "^""$key\$($_.PSChildName)"^"" -Name NetbiosOptions -Value 2 -Verbose; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----------Disable insecure "SSL 2.0" protocol------------
:: ----------------------------------------------------------
echo --- Disable insecure "SSL 2.0" protocol
:: Disable usage of "SSL 2.0" protocol for TLS/SSL connections
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0\Server' /v 'Enabled' /t 'REG_DWORD' /d '0' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0\Server' /v 'DisabledByDefault' /t 'REG_DWORD' /d '1' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0\Client' /v 'Enabled' /t 'REG_DWORD' /d '0' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0\Client' /v 'DisabledByDefault' /t 'REG_DWORD' /d '1' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----------Disable insecure "SSL 3.0" protocol------------
:: ----------------------------------------------------------
echo --- Disable insecure "SSL 3.0" protocol
:: Disable usage of "SSL 3.0" protocol for TLS/SSL connections
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 3.0\Server' /v 'Enabled' /t 'REG_DWORD' /d '0' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 3.0\Server' /v 'DisabledByDefault' /t 'REG_DWORD' /d '1' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 3.0\Client' /v 'Enabled' /t 'REG_DWORD' /d '0' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 3.0\Client' /v 'DisabledByDefault' /t 'REG_DWORD' /d '1' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----------Disable insecure "TLS 1.0" protocol------------
:: ----------------------------------------------------------
echo --- Disable insecure "TLS 1.0" protocol
:: Disable usage of "TLS 1.0" protocol for TLS/SSL connections
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Server' /v 'Enabled' /t 'REG_DWORD' /d '0' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Server' /v 'DisabledByDefault' /t 'REG_DWORD' /d '1' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Client' /v 'Enabled' /t 'REG_DWORD' /d '0' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Client' /v 'DisabledByDefault' /t 'REG_DWORD' /d '1' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----------Disable insecure "TLS 1.1" protocol------------
:: ----------------------------------------------------------
echo --- Disable insecure "TLS 1.1" protocol
:: Disable usage of "TLS 1.1" protocol for TLS/SSL connections
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Server' /v 'Enabled' /t 'REG_DWORD' /d '0' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Server' /v 'DisabledByDefault' /t 'REG_DWORD' /d '1' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Client' /v 'Enabled' /t 'REG_DWORD' /d '0' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Client' /v 'DisabledByDefault' /t 'REG_DWORD' /d '1' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----------Disable insecure "DTLS 1.0" protocol-----------
:: ----------------------------------------------------------
echo --- Disable insecure "DTLS 1.0" protocol
:: Disable usage of "DTLS 1.0" protocol for TLS/SSL connections
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\DTLS 1.0\Server' /v 'Enabled' /t 'REG_DWORD' /d '0' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\DTLS 1.0\Server' /v 'DisabledByDefault' /t 'REG_DWORD' /d '1' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\DTLS 1.0\Client' /v 'Enabled' /t 'REG_DWORD' /d '0' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\DTLS 1.0\Client' /v 'DisabledByDefault' /t 'REG_DWORD' /d '1' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------Disable insecure "LM & NTLM" protocols----------
:: ----------------------------------------------------------
echo --- Disable insecure "LM ^& NTLM" protocols
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SYSTEM\CurrentControlSet\Control\Lsa' /v 'LmCompatibilityLevel' /t 'REG_DWORD' /d '5' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------------Disable insecure renegotiation--------------
:: ----------------------------------------------------------
echo --- Disable insecure renegotiation
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL' /v 'AllowInsecureRenegoClients' /t 'REG_DWORD' /d '0' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL' /v 'AllowInsecureRenegoServers' /t 'REG_DWORD' /d '0' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL' /v 'DisableRenegoOnServer' /t 'REG_DWORD' /d '1' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL' /v 'DisableRenegoOnClient' /t 'REG_DWORD' /d '1' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL' /v 'UseScsvForTls' /t 'REG_DWORD' /d '1' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------Disable insecure connections from .NET apps--------
:: ----------------------------------------------------------
echo --- Disable insecure connections from .NET apps
:: Configure "SchUseStrongCrypto" for .NET applications
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Microsoft\.NETFramework\v2.0.50727' /v 'SchUseStrongCrypto' /t 'REG_DWORD' /d '1' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\WOW6432Node\Microsoft\.NETFramework\v2.0.50727' /v 'SchUseStrongCrypto' /t 'REG_DWORD' /d '1' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Microsoft\.NETFramework\v4.0.30319' /v 'SchUseStrongCrypto' /t 'REG_DWORD' /d '1' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\WOW6432Node\Microsoft\.NETFramework\v4.0.30319' /v 'SchUseStrongCrypto' /t 'REG_DWORD' /d '1' /f"
:: Suggest restarting computer for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'For the changes to fully take effect, please restart your computer.'; $ignoreWindows10 =  $false; $ignoreWindows11 =  $false; $warn =  $false; $osVersion = [System.Environment]::OSVersion.Version; function Test-IsWindows10 { ($osVersion.Major -eq 10) -and ($osVersion.Build -lt 22000) }; function Test-IsWindows11 { ($osVersion.Major -gt 10) -or (($osVersion.Major -eq 10) -and ($osVersion.Build -ge 22000)) }; if (($ignoreWindows10 -and (Test-IsWindows10)) -or ($ignoreWindows11 -and (Test-IsWindows11))) {; echo "^""Skipping"^""; exit 0 <# Skip #>; }; if ($warn) {; Write-Warning "^""$message"^""; } else {; Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------Enable secure "TLS 1.3" protocol-------------
:: ----------------------------------------------------------
echo --- Enable secure "TLS 1.3" protocol
:: Enable "TLS 1.3" protocol as default for TLS/SSL connections
PowerShell -ExecutionPolicy Unrestricted -Command "$targetWindowsVersion = 'Windows11'; $parsedVersion=$null; if ($targetWindowsVersion -eq 'Windows11') {; $parsedVersion=[System.Version]::Parse('10.0.22000'); } elseif ($targetWindowsVersion -eq 'Windows10-1607') {; $parsedVersion=[System.Version]::Parse('10.0.14393'); }; if ([System.Environment]::OSVersion.Version -lt $parsedVersion) {; Write-Output "^""Skipping, versions before $parsedVersion are not supported."^""; exit 0; }; reg add 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.3\Server' /v 'Enabled' /t 'REG_DWORD' /d '1' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "$targetWindowsVersion = 'Windows11'; $parsedVersion=$null; if ($targetWindowsVersion -eq 'Windows11') {; $parsedVersion=[System.Version]::Parse('10.0.22000'); } elseif ($targetWindowsVersion -eq 'Windows10-1607') {; $parsedVersion=[System.Version]::Parse('10.0.14393'); }; if ([System.Environment]::OSVersion.Version -lt $parsedVersion) {; Write-Output "^""Skipping, versions before $parsedVersion are not supported."^""; exit 0; }; reg add 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.3\Server' /v 'DisabledByDefault' /t 'REG_DWORD' /d '0' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "$targetWindowsVersion = 'Windows11'; $parsedVersion=$null; if ($targetWindowsVersion -eq 'Windows11') {; $parsedVersion=[System.Version]::Parse('10.0.22000'); } elseif ($targetWindowsVersion -eq 'Windows10-1607') {; $parsedVersion=[System.Version]::Parse('10.0.14393'); }; if ([System.Environment]::OSVersion.Version -lt $parsedVersion) {; Write-Output "^""Skipping, versions before $parsedVersion are not supported."^""; exit 0; }; reg add 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.3\Client' /v 'Enabled' /t 'REG_DWORD' /d '1' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "$targetWindowsVersion = 'Windows11'; $parsedVersion=$null; if ($targetWindowsVersion -eq 'Windows11') {; $parsedVersion=[System.Version]::Parse('10.0.22000'); } elseif ($targetWindowsVersion -eq 'Windows10-1607') {; $parsedVersion=[System.Version]::Parse('10.0.14393'); }; if ([System.Environment]::OSVersion.Version -lt $parsedVersion) {; Write-Output "^""Skipping, versions before $parsedVersion are not supported."^""; exit 0; }; reg add 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.3\Client' /v 'DisabledByDefault' /t 'REG_DWORD' /d '0' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------Enable secure connections for legacy .NET apps------
:: ----------------------------------------------------------
echo --- Enable secure connections for legacy .NET apps
:: Configure "SystemDefaultTlsVersions" for .NET applications
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Microsoft\.NETFramework\v2.0.50727' /v 'SystemDefaultTlsVersions' /t 'REG_DWORD' /d '1' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\WOW6432Node\Microsoft\.NETFramework\v2.0.50727' /v 'SystemDefaultTlsVersions' /t 'REG_DWORD' /d '1' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Microsoft\.NETFramework\v4.0.30319' /v 'SystemDefaultTlsVersions' /t 'REG_DWORD' /d '1' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\WOW6432Node\Microsoft\.NETFramework\v4.0.30319' /v 'SystemDefaultTlsVersions' /t 'REG_DWORD' /d '1' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------Enable secure "DTLS 1.2" protocol-------------
:: ----------------------------------------------------------
echo --- Enable secure "DTLS 1.2" protocol
:: Enable "DTLS 1.2" protocol as default for TLS/SSL connections
PowerShell -ExecutionPolicy Unrestricted -Command "$targetWindowsVersion = 'Windows10-1607'; $parsedVersion=$null; if ($targetWindowsVersion -eq 'Windows11') {; $parsedVersion=[System.Version]::Parse('10.0.22000'); } elseif ($targetWindowsVersion -eq 'Windows10-1607') {; $parsedVersion=[System.Version]::Parse('10.0.14393'); }; if ([System.Environment]::OSVersion.Version -lt $parsedVersion) {; Write-Output "^""Skipping, versions before $parsedVersion are not supported."^""; exit 0; }; reg add 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\DTLS 1.2\Server' /v 'Enabled' /t 'REG_DWORD' /d '1' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "$targetWindowsVersion = 'Windows10-1607'; $parsedVersion=$null; if ($targetWindowsVersion -eq 'Windows11') {; $parsedVersion=[System.Version]::Parse('10.0.22000'); } elseif ($targetWindowsVersion -eq 'Windows10-1607') {; $parsedVersion=[System.Version]::Parse('10.0.14393'); }; if ([System.Environment]::OSVersion.Version -lt $parsedVersion) {; Write-Output "^""Skipping, versions before $parsedVersion are not supported."^""; exit 0; }; reg add 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\DTLS 1.2\Server' /v 'DisabledByDefault' /t 'REG_DWORD' /d '0' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "$targetWindowsVersion = 'Windows10-1607'; $parsedVersion=$null; if ($targetWindowsVersion -eq 'Windows11') {; $parsedVersion=[System.Version]::Parse('10.0.22000'); } elseif ($targetWindowsVersion -eq 'Windows10-1607') {; $parsedVersion=[System.Version]::Parse('10.0.14393'); }; if ([System.Environment]::OSVersion.Version -lt $parsedVersion) {; Write-Output "^""Skipping, versions before $parsedVersion are not supported."^""; exit 0; }; reg add 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\DTLS 1.2\Client' /v 'Enabled' /t 'REG_DWORD' /d '1' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "$targetWindowsVersion = 'Windows10-1607'; $parsedVersion=$null; if ($targetWindowsVersion -eq 'Windows11') {; $parsedVersion=[System.Version]::Parse('10.0.22000'); } elseif ($targetWindowsVersion -eq 'Windows10-1607') {; $parsedVersion=[System.Version]::Parse('10.0.14393'); }; if ([System.Environment]::OSVersion.Version -lt $parsedVersion) {; Write-Output "^""Skipping, versions before $parsedVersion are not supported."^""; exit 0; }; reg add 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\DTLS 1.2\Client' /v 'DisabledByDefault' /t 'REG_DWORD' /d '0' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------Disable basic authentication in WinRM-----------
:: ----------------------------------------------------------
echo --- Disable basic authentication in WinRM
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client' /v 'AllowBasic' /t 'REG_DWORD' /d '0' /f"
:: ----------------------------------------------------------


:: Disable unauthorized user account discovery (anonymous SAM enumeration)
echo --- Disable unauthorized user account discovery (anonymous SAM enumeration)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v "RestrictAnonymousSAM" /t REG_DWORD /d 1 /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----Disable anonymous access to named pipes and shares----
:: ----------------------------------------------------------
echo --- Disable anonymous access to named pipes and shares
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanManServer\Parameters" /v "RestrictNullSessAccess" /t REG_DWORD /d 1 /f
:: ----------------------------------------------------------


:: Disable hidden remote file access via administrative shares (breaks remote system management software)
echo --- Disable hidden remote file access via administrative shares (breaks remote system management software)
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters' /v 'AutoShareWks' /t 'REG_DWORD' /d '0' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---------Disable anonymous enumeration of shares----------
:: ----------------------------------------------------------
echo --- Disable anonymous enumeration of shares
reg add "HKLM\SYSTEM\CurrentControlSet\Control\LSA" /v "RestrictAnonymous" /t REG_DWORD /d "1" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------Disable "Telnet Client" feature--------------
:: ----------------------------------------------------------
echo --- Disable "Telnet Client" feature
:: Disable the "TelnetClient" feature
PowerShell -ExecutionPolicy Unrestricted -Command "$featureName = 'TelnetClient'; $feature = Get-WindowsOptionalFeature -FeatureName "^""$featureName"^"" -Online -ErrorAction Stop; if (-Not $feature) {; Write-Output "^""Skipping: The feature `"^""$featureName`"^"" is not found. No action required."^""; Exit 0; }; if ($feature.State -eq [Microsoft.Dism.Commands.FeatureState]::Disabled) {; Write-Output "^""Skipping: The feature `"^""$featureName`"^"" is already disabled. No action required."^""; Exit 0; }; try {; Write-Host "^""Disabling feature: `"^""$featureName`"^""."^""; Disable-WindowsOptionalFeature -FeatureName "^""$featureName"^"" -Online -NoRestart -LogLevel ([Microsoft.Dism.Commands.LogLevel]::Errors) -WarningAction SilentlyContinue -ErrorAction Stop | Out-Null; } catch {; Write-Error "^""Failed to disable the feature `"^""$featureName`"^"": $($_.Exception.Message)"^""; Exit 1; }; Write-Output "^""Successfully disabled the feature `"^""$featureName`"^""."^""; Exit 0"
:: ----------------------------------------------------------


:: Remove "RAS Connection Manager Administration Kit (CMAK)" capability
echo --- Remove "RAS Connection Manager Administration Kit (CMAK)" capability
PowerShell -ExecutionPolicy Unrestricted -Command "Get-WindowsCapability -Online -Name 'RasCMAK.Client*' | Remove-WindowsCapability -Online"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------Disable Windows Remote Assistance feature---------
:: ----------------------------------------------------------
echo --- Disable Windows Remote Assistance feature
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v "fAllowToGetHelp" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v "fAllowFullControl" /t REG_DWORD /d 0 /f
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' /v 'AllowBasic' /t 'REG_DWORD' /d '0' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------Disable "Net.TCP Port Sharing" feature----------
:: ----------------------------------------------------------
echo --- Disable "Net.TCP Port Sharing" feature
:: Disable the "WCF-TCP-PortSharing45" feature
PowerShell -ExecutionPolicy Unrestricted -Command "$featureName = 'WCF-TCP-PortSharing45'; $feature = Get-WindowsOptionalFeature -FeatureName "^""$featureName"^"" -Online -ErrorAction Stop; if (-Not $feature) {; Write-Output "^""Skipping: The feature `"^""$featureName`"^"" is not found. No action required."^""; Exit 0; }; if ($feature.State -eq [Microsoft.Dism.Commands.FeatureState]::Disabled) {; Write-Output "^""Skipping: The feature `"^""$featureName`"^"" is already disabled. No action required."^""; Exit 0; }; try {; Write-Host "^""Disabling feature: `"^""$featureName`"^""."^""; Disable-WindowsOptionalFeature -FeatureName "^""$featureName"^"" -Online -NoRestart -LogLevel ([Microsoft.Dism.Commands.LogLevel]::Errors) -WarningAction SilentlyContinue -ErrorAction Stop | Out-Null; } catch {; Write-Error "^""Failed to disable the feature `"^""$featureName`"^"": $($_.Exception.Message)"^""; Exit 1; }; Write-Output "^""Successfully disabled the feature `"^""$featureName`"^""."^""; Exit 0"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---------------Disable "SMB Direct" feature---------------
:: ----------------------------------------------------------
echo --- Disable "SMB Direct" feature
:: Disable the "SmbDirect" feature
PowerShell -ExecutionPolicy Unrestricted -Command "$featureName = 'SmbDirect'; $feature = Get-WindowsOptionalFeature -FeatureName "^""$featureName"^"" -Online -ErrorAction Stop; if (-Not $feature) {; Write-Output "^""Skipping: The feature `"^""$featureName`"^"" is not found. No action required."^""; Exit 0; }; if ($feature.State -eq [Microsoft.Dism.Commands.FeatureState]::Disabled) {; Write-Output "^""Skipping: The feature `"^""$featureName`"^"" is already disabled. No action required."^""; Exit 0; }; try {; Write-Host "^""Disabling feature: `"^""$featureName`"^""."^""; Disable-WindowsOptionalFeature -FeatureName "^""$featureName"^"" -Online -NoRestart -LogLevel ([Microsoft.Dism.Commands.LogLevel]::Errors) -WarningAction SilentlyContinue -ErrorAction Stop | Out-Null; } catch {; Write-Error "^""Failed to disable the feature `"^""$featureName`"^"": $($_.Exception.Message)"^""; Exit 1; }; Write-Output "^""Successfully disabled the feature `"^""$featureName`"^""."^""; Exit 0"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------------Disable "TFTP Client" feature---------------
:: ----------------------------------------------------------
echo --- Disable "TFTP Client" feature
:: Disable the "TFTP" feature
PowerShell -ExecutionPolicy Unrestricted -Command "$featureName = 'TFTP'; $feature = Get-WindowsOptionalFeature -FeatureName "^""$featureName"^"" -Online -ErrorAction Stop; if (-Not $feature) {; Write-Output "^""Skipping: The feature `"^""$featureName`"^"" is not found. No action required."^""; Exit 0; }; if ($feature.State -eq [Microsoft.Dism.Commands.FeatureState]::Disabled) {; Write-Output "^""Skipping: The feature `"^""$featureName`"^"" is already disabled. No action required."^""; Exit 0; }; try {; Write-Host "^""Disabling feature: `"^""$featureName`"^""."^""; Disable-WindowsOptionalFeature -FeatureName "^""$featureName"^"" -Online -NoRestart -LogLevel ([Microsoft.Dism.Commands.LogLevel]::Errors) -WarningAction SilentlyContinue -ErrorAction Stop | Out-Null; } catch {; Write-Error "^""Failed to disable the feature `"^""$featureName`"^"": $($_.Exception.Message)"^""; Exit 1; }; Write-Output "^""Successfully disabled the feature `"^""$featureName`"^""."^""; Exit 0"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------Remove "RIP Listener" capability-------------
:: ----------------------------------------------------------
echo --- Remove "RIP Listener" capability
PowerShell -ExecutionPolicy Unrestricted -Command "Get-WindowsCapability -Online -Name 'RIP.Listener*' | Remove-WindowsCapability -Online"
:: ----------------------------------------------------------


:: Remove "Simple Network Management Protocol (SNMP)" capability
echo --- Remove "Simple Network Management Protocol (SNMP)" capability
PowerShell -ExecutionPolicy Unrestricted -Command "Get-WindowsCapability -Online -Name 'SNMP.Client*' | Remove-WindowsCapability -Online"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------Remove "SNMP WMI Provider" capability-----------
:: ----------------------------------------------------------
echo --- Remove "SNMP WMI Provider" capability
PowerShell -ExecutionPolicy Unrestricted -Command "Get-WindowsCapability -Online -Name 'WMI-SNMP-Provider.Client*' | Remove-WindowsCapability -Online"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----Disable Cloud Clipboard (breaks clipboard sync)------
:: ----------------------------------------------------------
echo --- Disable Cloud Clipboard (breaks clipboard sync)
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\System' /v 'AllowCrossDeviceClipboard' /t 'REG_DWORD' /d '0' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKCU\Software\Microsoft\Clipboard' /v 'CloudClipboardAutomaticUpload' /t 'REG_DWORD' /d '0' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------------Disable clipboard history-----------------
:: ----------------------------------------------------------
echo --- Disable clipboard history
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKCU\Software\Microsoft\Clipboard' /v 'EnableClipboardHistory' /t 'REG_DWORD' /d '0' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\System' /v 'AllowClipboardHistory' /t 'REG_DWORD' /d '0' /f"
:: ----------------------------------------------------------


:: Disable background clipboard data collection (`cbdhsvc`) (breaks clipboard history and sync)
echo --- Disable background clipboard data collection (`cbdhsvc`) (breaks clipboard history and sync)
PowerShell -ExecutionPolicy Unrestricted -Command "$serviceQuery = 'cbdhsvc'; <# -- 1. Skip if service does not exist #>; $service = Get-Service -Name $serviceQuery -ErrorAction SilentlyContinue; if(!$service) {; Write-Host "^""Service query `"^""$serviceQuery`"^"" did not yield any results, no need to disable it."^""; Exit 0; }; $serviceName = $service.Name; Write-Host "^""Disabling service: `"^""$serviceName`"^""."^""; <# -- 2. Stop if running #>; if ($service.Status -eq [System.ServiceProcess.ServiceControllerStatus]::Running) {; Write-Host "^""`"^""$serviceName`"^"" is running, trying to stop it."^""; try {; Stop-Service -Name "^""$serviceName"^"" -Force -ErrorAction Stop; Write-Host "^""Stopped `"^""$serviceName`"^"" successfully."^""; } catch {; Write-Warning "^""Could not stop `"^""$serviceName`"^"", it will be stopped after reboot: $_"^""; }; } else {; Write-Host "^""`"^""$serviceName`"^"" is not running, no need to stop."^""; }; <# -- 3. Skip if service info is not found in registry #>; $registryKey = "^""HKLM:\SYSTEM\CurrentControlSet\Services\$serviceName"^""; if(!(Test-Path $registryKey)) {; Write-Host "^""`"^""$registryKey`"^"" is not found in registry, cannot enable it."^""; Exit 0; }; <# -- 4. Skip if already disabled #>; if( $(Get-ItemProperty -Path "^""$registryKey"^"").Start -eq 4) {; Write-Host "^""`"^""$serviceName`"^"" is already disabled from start, no further action is needed."^""; Exit 0; }; <# -- 5. Disable service #>; try {; Set-ItemProperty $registryKey -Name Start -Value 4 -Force -ErrorAction Stop; Write-Host "^""Disabled `"^""$serviceName`"^"" successfully."^""; } catch {; Write-Error "^""Could not disable `"^""$serviceName`"^"": $_"^""; }"
PowerShell -ExecutionPolicy Unrestricted -Command "$serviceQuery = 'cbdhsvc_*'; <# -- 1. Skip if service does not exist #>; $service = Get-Service -Name $serviceQuery -ErrorAction SilentlyContinue; if(!$service) {; Write-Host "^""Service query `"^""$serviceQuery`"^"" did not yield any results, no need to disable it."^""; Exit 0; }; $serviceName = $service.Name; Write-Host "^""Disabling service: `"^""$serviceName`"^""."^""; <# -- 2. Stop if running #>; if ($service.Status -eq [System.ServiceProcess.ServiceControllerStatus]::Running) {; Write-Host "^""`"^""$serviceName`"^"" is running, trying to stop it."^""; try {; Stop-Service -Name "^""$serviceName"^"" -Force -ErrorAction Stop; Write-Host "^""Stopped `"^""$serviceName`"^"" successfully."^""; } catch {; Write-Warning "^""Could not stop `"^""$serviceName`"^"", it will be stopped after reboot: $_"^""; }; } else {; Write-Host "^""`"^""$serviceName`"^"" is not running, no need to stop."^""; }; <# -- 3. Skip if service info is not found in registry #>; $registryKey = "^""HKLM:\SYSTEM\CurrentControlSet\Services\$serviceName"^""; if(!(Test-Path $registryKey)) {; Write-Host "^""`"^""$registryKey`"^"" is not found in registry, cannot enable it."^""; Exit 0; }; <# -- 4. Skip if already disabled #>; if( $(Get-ItemProperty -Path "^""$registryKey"^"").Start -eq 4) {; Write-Host "^""`"^""$serviceName`"^"" is already disabled from start, no further action is needed."^""; Exit 0; }; <# -- 5. Disable service #>; try {; Set-ItemProperty $registryKey -Name Start -Value 4 -Force -ErrorAction Stop; Write-Host "^""Disabled `"^""$serviceName`"^"" successfully."^""; } catch {; Write-Error "^""Could not disable `"^""$serviceName`"^"": $_"^""; }"
:: ----------------------------------------------------------


:: Mitigate Spectre Variant 2 and Meltdown in host operating system
echo --- Mitigate Spectre Variant 2 and Meltdown in host operating system
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /t REG_DWORD /d 3 /f
wmic cpu get name | findstr "Intel" >nul && (
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d 0 /f
)
wmic cpu get name | findstr "AMD" >nul && (
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d 64 /f
)
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----Mitigate Spectre Variant 2 and Meltdown in Hyper-V----
:: ----------------------------------------------------------
echo --- Mitigate Spectre Variant 2 and Meltdown in Hyper-V
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Virtualization' /v 'MinVmVersionForCpuBasedMitigations' /t 'REG_SZ' /d '1.0' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------Enable Data Execution Prevention (DEP)----------
:: ----------------------------------------------------------
echo --- Enable Data Execution Prevention (DEP)
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer' /v 'NoDataExecutionPrevention' /t 'REG_DWORD' /d '0' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\System' /v 'DisableHHDEP' /t 'REG_DWORD' /d '0' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---------------Disable AutoPlay and AutoRun---------------
:: ----------------------------------------------------------
echo --- Disable AutoPlay and AutoRun
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' /v 'NoDriveTypeAutoRun' /t 'REG_DWORD' /d '255' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' /v 'NoAutorun' /t 'REG_DWORD' /d '1' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer' /v 'NoAutoplayfornonVolume' /t 'REG_DWORD' /d '1' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------Disable lock screen camera access-------------
:: ----------------------------------------------------------
echo --- Disable lock screen camera access
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Personalization' /v 'NoLockScreenCamera' /t 'REG_DWORD' /d '1' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----Disable storage of the LAN Manager password hashes----
:: ----------------------------------------------------------
echo --- Disable storage of the LAN Manager password hashes
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v "NoLMHash" /t REG_DWORD /d "1" /f
:: ----------------------------------------------------------


:: Disable "Always install with elevated privileges" in Windows Installer
echo --- Disable "Always install with elevated privileges" in Windows Installer
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Installer' /v 'AlwaysInstallElevated' /t 'REG_DWORD' /d '0' /f"
:: ----------------------------------------------------------


:: Enable Structured Exception Handling Overwrite Protection (SEHOP)
echo --- Enable Structured Exception Handling Overwrite Protection (SEHOP)
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel' /v 'DisableExceptionChainValidation' /t 'REG_DWORD' /d '0' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----------Disable "Windows Connect Now" wizard-----------
:: ----------------------------------------------------------
echo --- Disable "Windows Connect Now" wizard
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\Software\Policies\Microsoft\Windows\WCN\UI' /v 'DisableWcnUi' /t 'REG_DWORD' /d '1' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars' /v 'DisableFlashConfigRegistrar' /t 'REG_DWORD' /d '0' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars' /v 'DisableInBand802DOT11Registrar' /t 'REG_DWORD' /d '0' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars' /v 'DisableUPnPRegistrar' /t 'REG_DWORD' /d '0' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars' /v 'DisableWPDRegistrar' /t 'REG_DWORD' /d '0' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars' /v 'EnableRegistrars' /t 'REG_DWORD' /d '0' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------------Block Dropbox telemetry hosts---------------
:: ----------------------------------------------------------
echo --- Block Dropbox telemetry hosts
:: Add hosts entries for telemetry.dropbox.com
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='telemetry.dropbox.com'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for telemetry.v.dropbox.com
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='telemetry.v.dropbox.com'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------------Block Spotify Live Tile hosts---------------
:: ----------------------------------------------------------
echo --- Block Spotify Live Tile hosts
:: Add hosts entries for spclient.wg.spotify.com
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='spclient.wg.spotify.com'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------Block Windows crash report hosts-------------
:: ----------------------------------------------------------
echo --- Block Windows crash report hosts
:: Add hosts entries for oca.telemetry.microsoft.com
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='oca.telemetry.microsoft.com'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for oca.microsoft.com
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='oca.microsoft.com'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for kmwatsonc.events.data.microsoft.com
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='kmwatsonc.events.data.microsoft.com'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----------Block Windows error reporting hosts------------
:: ----------------------------------------------------------
echo --- Block Windows error reporting hosts
:: Add hosts entries for watson.telemetry.microsoft.com
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='watson.telemetry.microsoft.com'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for umwatsonc.events.data.microsoft.com
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='umwatsonc.events.data.microsoft.com'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for ceuswatcab01.blob.core.windows.net
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='ceuswatcab01.blob.core.windows.net'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for ceuswatcab02.blob.core.windows.net
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='ceuswatcab02.blob.core.windows.net'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for eaus2watcab01.blob.core.windows.net
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='eaus2watcab01.blob.core.windows.net'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for eaus2watcab02.blob.core.windows.net
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='eaus2watcab02.blob.core.windows.net'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for weus2watcab01.blob.core.windows.net
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='weus2watcab01.blob.core.windows.net'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for weus2watcab02.blob.core.windows.net
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='weus2watcab02.blob.core.windows.net'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for co4.telecommand.telemetry.microsoft.com
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='co4.telecommand.telemetry.microsoft.com'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for cs11.wpc.v0cdn.net
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='cs11.wpc.v0cdn.net'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for cs1137.wpc.gammacdn.net
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='cs1137.wpc.gammacdn.net'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for modern.watson.data.microsoft.com
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='modern.watson.data.microsoft.com'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------Block telemetry and user experience hosts---------
:: ----------------------------------------------------------
echo --- Block telemetry and user experience hosts
:: Add hosts entries for functional.events.data.microsoft.com
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='functional.events.data.microsoft.com'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for browser.events.data.msn.com
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='browser.events.data.msn.com'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for self.events.data.microsoft.com
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='self.events.data.microsoft.com'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for v10.events.data.microsoft.com
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='v10.events.data.microsoft.com'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for v10c.events.data.microsoft.com
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='v10c.events.data.microsoft.com'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for us-v10c.events.data.microsoft.com
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='us-v10c.events.data.microsoft.com'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for eu-v10c.events.data.microsoft.com
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='eu-v10c.events.data.microsoft.com'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for v10.vortex-win.data.microsoft.com
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='v10.vortex-win.data.microsoft.com'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for vortex-win.data.microsoft.com
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='vortex-win.data.microsoft.com'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for telecommand.telemetry.microsoft.com
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='telecommand.telemetry.microsoft.com'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for www.telecommandsvc.microsoft.com
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='www.telecommandsvc.microsoft.com'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for umwatson.events.data.microsoft.com
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='umwatson.events.data.microsoft.com'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for watsonc.events.data.microsoft.com
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='watsonc.events.data.microsoft.com'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for eu-watsonc.events.data.microsoft.com
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='eu-watsonc.events.data.microsoft.com'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------Block remote configuration sync hosts-----------
:: ----------------------------------------------------------
echo --- Block remote configuration sync hosts
:: Add hosts entries for settings-win.data.microsoft.com
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='settings-win.data.microsoft.com'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for settings.data.microsoft.com
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='settings.data.microsoft.com'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------Block maps data and updates hosts-------------
:: ----------------------------------------------------------
echo --- Block maps data and updates hosts
:: Add hosts entries for maps.windows.com
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='maps.windows.com'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for ecn.dev.virtualearth.net
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='ecn.dev.virtualearth.net'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for ecn-us.dev.virtualearth.net
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='ecn-us.dev.virtualearth.net'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for weathermapdata.blob.core.windows.net
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='weathermapdata.blob.core.windows.net'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------Block location data sharing hosts-------------
:: ----------------------------------------------------------
echo --- Block location data sharing hosts
:: Add hosts entries for inference.location.live.net
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='inference.location.live.net'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for location-inference-westus.cloudapp.net
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='location-inference-westus.cloudapp.net'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------Block Spotlight ads and suggestions hosts---------
:: ----------------------------------------------------------
echo --- Block Spotlight ads and suggestions hosts
:: Add hosts entries for arc.msn.com
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='arc.msn.com'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for ris.api.iris.microsoft.com
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='ris.api.iris.microsoft.com'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for api.msn.com
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='api.msn.com'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for assets.msn.com
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='assets.msn.com'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for c.msn.com
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='c.msn.com'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for g.msn.com
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='g.msn.com'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for ntp.msn.com
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='ntp.msn.com'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for srtb.msn.com
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='srtb.msn.com'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for www.msn.com
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='www.msn.com'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for fd.api.iris.microsoft.com
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='fd.api.iris.microsoft.com'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for staticview.msn.com
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='staticview.msn.com'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for mucp.api.account.microsoft.com
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='mucp.api.account.microsoft.com'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for query.prod.cms.rt.microsoft.com
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='query.prod.cms.rt.microsoft.com'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------Block Cortana and Live Tiles hosts------------
:: ----------------------------------------------------------
echo --- Block Cortana and Live Tiles hosts
:: Add hosts entries for business.bing.com
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='business.bing.com'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for c.bing.com
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='c.bing.com'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for th.bing.com
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='th.bing.com'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for edgeassetservice.azureedge.net
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='edgeassetservice.azureedge.net'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for c-ring.msedge.net
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='c-ring.msedge.net'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for fp.msedge.net
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='fp.msedge.net'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for I-ring.msedge.net
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='I-ring.msedge.net'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for s-ring.msedge.net
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='s-ring.msedge.net'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for dual-s-ring.msedge.net
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='dual-s-ring.msedge.net'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for creativecdn.com
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='creativecdn.com'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for a-ring-fallback.msedge.net
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='a-ring-fallback.msedge.net'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for fp-afd-nocache-ccp.azureedge.net
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='fp-afd-nocache-ccp.azureedge.net'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for prod-azurecdn-akamai-iris.azureedge.net
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='prod-azurecdn-akamai-iris.azureedge.net'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for widgetcdn.azureedge.net
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='widgetcdn.azureedge.net'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for widgetservice.azurefd.net
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='widgetservice.azurefd.net'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for fp-vs.azureedge.net
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='fp-vs.azureedge.net'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for ln-ring.msedge.net
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='ln-ring.msedge.net'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for t-ring.msedge.net
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='t-ring.msedge.net'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for t-ring-fdv2.msedge.net
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='t-ring-fdv2.msedge.net'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: Add hosts entries for tse1.mm.bing.net
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='tse1.mm.bing.net'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------Block Edge experimentation hosts-------------
:: ----------------------------------------------------------
echo --- Block Edge experimentation hosts
:: Add hosts entries for config.edge.skype.com
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='config.edge.skype.com'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---------------Block Photos app sync hosts----------------
:: ----------------------------------------------------------
echo --- Block Photos app sync hosts
:: Add hosts entries for evoke-windowsservices-tas.msedge.net
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='evoke-windowsservices-tas.msedge.net'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------------Block OneNote Live Tile hosts---------------
:: ----------------------------------------------------------
echo --- Block OneNote Live Tile hosts
:: Add hosts entries for cdn.onenote.net
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='cdn.onenote.net'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------------Block Weather Live Tile hosts---------------
:: ----------------------------------------------------------
echo --- Block Weather Live Tile hosts
:: Add hosts entries for tile-service.weather.microsoft.com
PowerShell -ExecutionPolicy Unrestricted -Command "$domain ='tile-service.weather.microsoft.com'; $hostsFilePath = "^""$env:WINDIR\System32\drivers\etc\hosts"^""; $comment = "^""managed by privacy.sexy"^""; $hostsFileEncoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Utf8; $blockingHostsEntries = @(; @{ AddressType = "^""IPv4"^"";  IPAddress = '0.0.0.0'; }; @{ AddressType = "^""IPv6"^"";  IPAddress = '::1'; }; ); try {; $isHostsFilePresent = Test-Path -Path $hostsFilePath -PathType Leaf -ErrorAction Stop; } catch {; Write-Error "^""Failed to check hosts file existence. Error: $_"^""; exit 1; }; if (-Not $isHostsFilePresent) {; Write-Output "^""Creating a new hosts file at $hostsFilePath."^""; try {; New-Item -Path $hostsFilePath -ItemType File -Force -ErrorAction Stop | Out-Null; Write-Output "^""Successfully created the hosts file."^""; } catch {; Write-Error "^""Failed to create the hosts file. Error: $_"^""; exit 1; }; }; foreach ($blockingEntry in $blockingHostsEntries) {; Write-Output "^""Processing addition for $($blockingEntry.AddressType) entry."^""; try {; $hostsFileContents = Get-Content -Path "^""$hostsFilePath"^"" -Raw -Encoding $hostsFileEncoding -ErrorAction Stop; } catch {; Write-Error "^""Failed to read the hosts file. Error: $_"^""; continue; }; $hostsEntryLine = "^""$($blockingEntry.IPAddress)`t$domain $([char]35) $comment"^""; if ((-Not [String]::IsNullOrWhiteSpace($hostsFileContents)) -And ($hostsFileContents.Contains($hostsEntryLine))) {; Write-Output 'Skipping, entry already exists.'; continue; }; try {; Add-Content -Path $hostsFilePath -Value $hostsEntryLine -Encoding $hostsFileEncoding -ErrorAction Stop; Write-Output 'Successfully added the entry.'; } catch {; Write-Error "^""Failed to add the entry. Error: $_"^""; continue; }; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------------Disable online tips--------------------
:: ----------------------------------------------------------
echo --- Disable online tips
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\System' /v 'AllowOnlineTips' /t 'REG_DWORD' /d '0' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------Disable "Internet File Association" service--------
:: ----------------------------------------------------------
echo --- Disable "Internet File Association" service
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' /v 'NoInternetOpenWith' /t 'REG_DWORD' /d '1' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----------Disable "Order Prints" picture task------------
:: ----------------------------------------------------------
echo --- Disable "Order Prints" picture task
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' /v 'NoOnlinePrintsWizard' /t 'REG_DWORD' /d '1' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --Disable "Publish to Web" option for files and folders---
:: ----------------------------------------------------------
echo --- Disable "Publish to Web" option for files and folders
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' /v 'NoPublishingWizard' /t 'REG_DWORD' /d '1' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------Disable provider list downloads for wizards--------
:: ----------------------------------------------------------
echo --- Disable provider list downloads for wizards
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' /v 'NoWebServices' /t 'REG_DWORD' /d '1' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------Remove "3D Objects" from dialog boxes-----------
:: ----------------------------------------------------------
echo --- Remove "3D Objects" from dialog boxes
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{31C0DD25-9439-4F12-BF41-7FF4EDA38722}\PropertyBag" /v "ThisPCPolicy" /t REG_SZ /d "Hide" /f
reg add "HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{31C0DD25-9439-4F12-BF41-7FF4EDA38722}\PropertyBag" /v "ThisPCPolicy" /t REG_SZ /d "Hide" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------Remove "Movies" from dialog boxes-------------
:: ----------------------------------------------------------
echo --- Remove "Movies" from dialog boxes
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{35286a68-3c57-41a1-bbb1-0eae73d76c95}\PropertyBag" /v "ThisPCPolicy" /t REG_SZ /d "Hide" /f
reg add "HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{35286a68-3c57-41a1-bbb1-0eae73d76c95}\PropertyBag" /v "ThisPCPolicy" /t REG_SZ /d "Hide" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------Remove "Music" from dialog boxes-------------
:: ----------------------------------------------------------
echo --- Remove "Music" from dialog boxes
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{a0c69a99-21c8-4671-8703-7934162fcf1d}\PropertyBag" /v "ThisPCPolicy" /t REG_SZ /d "Hide" /f
reg add "HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{a0c69a99-21c8-4671-8703-7934162fcf1d}\PropertyBag" /v "ThisPCPolicy" /t REG_SZ /d "Hide" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----------Remove "Pictures" from dialog boxes------------
:: ----------------------------------------------------------
echo --- Remove "Pictures" from dialog boxes
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{0ddd015d-b06c-45d5-8c4c-f59713854639}\PropertyBag" /v "ThisPCPolicy" /t REG_SZ /d "Hide" /f
reg add "HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{0ddd015d-b06c-45d5-8c4c-f59713854639}\PropertyBag" /v "ThisPCPolicy" /t REG_SZ /d "Hide" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------Disable history of recently opened documents-------
:: ----------------------------------------------------------
echo --- Disable history of recently opened documents
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoRecentDocsHistory" /t REG_DWORD /d 1 /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----Clear recently opened document history upon exit-----
:: ----------------------------------------------------------
echo --- Clear recently opened document history upon exit
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer' /v 'ClearRecentDocsOnExit' /t 'REG_DWORD' /d '1' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------Disable lock screen app notifications-----------
:: ----------------------------------------------------------
echo --- Disable lock screen app notifications
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\System' /v 'DisableLockScreenAppNotifications' /t 'REG_DWORD' /d '1' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------Disable Live Tiles push notifications-----------
:: ----------------------------------------------------------
echo --- Disable Live Tiles push notifications
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKCU\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications' /v 'NoTileApplicationNotification' /t 'REG_DWORD' /d '1' /f"
:: ----------------------------------------------------------


:: Disable the display of recently used files in Quick Access
echo --- Disable the display of recently used files in Quick Access
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer' /v 'ShowRecent' /t 'REG_DWORD' /d '0' /f"
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HomeFolderDesktop\NameSpace\DelegateFolders\{3134ef9c-6b18-4996-ad04-ed5912e00eb5}" /f
if not %PROCESSOR_ARCHITECTURE%==x86 ( REM is 64 bit?
    reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\HomeFolderDesktop\NameSpace\DelegateFolders\{3134ef9c-6b18-4996-ad04-ed5912e00eb5}" /f
)
:: ----------------------------------------------------------


:: Disable hibernation for faster startup and to avoid sensitive data storage
echo --- Disable hibernation for faster startup and to avoid sensitive data storage
powercfg -h off
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------------Disable app usage tracking----------------
:: ----------------------------------------------------------
echo --- Disable app usage tracking
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKCU\Software\Policies\Microsoft\Windows\EdgeUI' /v 'DisableMFUTracking' /t 'REG_DWORD' /d '1' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------------Disable recent apps--------------------
:: ----------------------------------------------------------
echo --- Disable recent apps
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKCU\Software\Policies\Microsoft\Windows\EdgeUI' /v 'DisableRecentApps' /t 'REG_DWORD' /d '1' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------------Kill OneDrive process-------------------
:: ----------------------------------------------------------
echo --- Kill OneDrive process
:: Check and terminate the running process "OneDrive.exe"
tasklist /fi "ImageName eq OneDrive.exe" /fo csv 2>NUL | find /i "OneDrive.exe">NUL && (
    echo OneDrive.exe is running and will be killed.
    taskkill /f /im OneDrive.exe
) || (
    echo Skipping, OneDrive.exe is not running.
)
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---------------Remove OneDrive from startup---------------
:: ----------------------------------------------------------
echo --- Remove OneDrive from startup
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "OneDrive" /f 2>nul
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------Remove OneDrive through official installer--------
:: ----------------------------------------------------------
echo --- Remove OneDrive through official installer
if exist "%SYSTEMROOT%\System32\OneDriveSetup.exe" (
    "%SYSTEMROOT%\System32\OneDriveSetup.exe" /uninstall
) else (
    if exist "%SYSTEMROOT%\SysWOW64\OneDriveSetup.exe" (
        "%SYSTEMROOT%\SysWOW64\OneDriveSetup.exe" /uninstall
    ) else (
        echo Failed to uninstall, uninstaller could not be found. 1>&2
    )
)
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------Remove OneDrive user data and synced folders-------
:: ----------------------------------------------------------
echo --- Remove OneDrive user data and synced folders
:: Delete directory  : "%USERPROFILE%\OneDrive*"
PowerShell -ExecutionPolicy Unrestricted -Command "$pathGlobPattern = "^""$($directoryGlob = '%USERPROFILE%\OneDrive*'; if (-Not $directoryGlob.EndsWith('\')) { $directoryGlob += '\' }; $directoryGlob )"^""; $expandedPath = [System.Environment]::ExpandEnvironmentVariables($pathGlobPattern); Write-Host "^""Searching for items matching pattern: `"^""$($expandedPath)`"^""."^""; $deletedCount = 0; $failedCount = 0; $oneDriveUserFolderPattern = [System.Environment]::ExpandEnvironmentVariables('%USERPROFILE%\OneDrive') + '*'; while ($true) { <# Loop to control the execution of the subsequent code #>; try {; $userShellFoldersRegistryPath = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders'; if (-not (Test-Path $userShellFoldersRegistryPath)) {; Write-Output "^""Skipping verification: The registry path for user shell folders is missing: `"^""$userShellFoldersRegistryPath`"^"""^""; break;; }; $userShellFoldersRegistryKeys = Get-ItemProperty -Path $userShellFoldersRegistryPath; $userShellFoldersEntries = @($userShellFoldersRegistryKeys.PSObject.Properties); if ($userShellFoldersEntries.Count -eq 0) {; Write-Warning "^""Skipping verification: No entries found for user shell folders in the registry: `"^""$userShellFoldersRegistryPath`"^"""^""; break;; }; Write-Output "^""Initiating verification: Checking if any of the ${userShellFoldersEntries.Count} user shell folders point to the OneDrive user folder pattern ($oneDriveUserFolderPattern)."^""; $userShellFoldersInOneDrive = @(); foreach ($registryEntry in $userShellFoldersEntries) {; $userShellFolderName = $registryEntry.Name; $userShellFolderPath = $registryEntry.Value; if (!$userShellFolderPath) {; Write-Output "^""Skipping: The user shell folder `"^""$userShellFolderName`"^"" does not have a defined path."^""; continue; }; $expandedUserShellFolderPath = [System.Environment]::ExpandEnvironmentVariables($userShellFolderPath); if(-not ($expandedUserShellFolderPath -like $oneDriveUserFolderPattern)) {; continue; }; $userShellFoldersInOneDrive += [PSCustomObject]@{ Name = $userShellFolderName;  Path = $expandedUserShellFolderPath }; }; if ($userShellFoldersInOneDrive.Count -gt 0) {; $warningMessage = 'To keep your computer running smoothly, OneDrive user folder will not be deleted.'; $warningMessage += "^""`nIt's being used by the OS as a user shell directory for the following folders:"^""; $userShellFoldersInOneDrive.ForEach({; $warningMessage += "^""`n- $($_.Name): $($_.Path)"^""; }); Write-Warning $warningMessage; exit 0; }; Write-Output "^""Successfully verified that none of the $($userShellFoldersEntries.Count) user shell folders point to the OneDrive user folder pattern."^""; break;; } catch {; Write-Warning "^""An error occurred during verification of user shell folders. Skipping prevent potential issues. Error: $($_.Exception.Message)"^""; exit 0; }; }; $foundAbsolutePaths = @(); Write-Host 'Iterating files and directories recursively.'; try {; $foundAbsolutePaths += @(; Get-ChildItem -Path $expandedPath -Force -Recurse -ErrorAction Stop | Select-Object -ExpandProperty FullName; ); } catch [System.Management.Automation.ItemNotFoundException] {; <# Swallow, do not run `Test-Path` before, it's unreliable for globs requiring extra permissions #>; }; try {; $foundAbsolutePaths += @(; Get-Item -Path $expandedPath -ErrorAction Stop | Select-Object -ExpandProperty FullName; ); } catch [System.Management.Automation.ItemNotFoundException] {; <# Swallow, do not run `Test-Path` before, it's unreliable for globs requiring extra permissions #>; }; $foundAbsolutePaths = $foundAbsolutePaths | Select-Object -Unique | Sort-Object -Property { $_.Length } -Descending; if (!$foundAbsolutePaths) {; Write-Host 'Skipping, no items available.'; exit 0; }; Write-Host "^""Initiating processing of $($foundAbsolutePaths.Count) items from `"^""$expandedPath`"^""."^""; foreach ($path in $foundAbsolutePaths) {; try {; if (Test-Path -Path $path -PathType Leaf) {; Write-Warning "^""Retaining file `"^""$path`"^"" to safeguard your data."^""; continue;; } elseif (Test-Path -Path $path -PathType Container) {; if ((Get-ChildItem "^""$path"^"" -Recurse | Measure-Object).Count -gt 0) {; Write-Warning "^""Preserving non-empty folder `"^""$path`"^"" to protect your files."^""; continue;; }; }; } catch {; Write-Warning "^""An error occurred while processing `"^""$path`"^"". Skipping to protect your data. Error: $($_.Exception.Message)"^""; continue;; }; if (-not (Test-Path $path)) { <# Re-check existence as prior deletions might remove subsequent items (e.g., subdirectories). #>; Write-Host "^""Successfully deleted: $($path) (already deleted)."^""; $deletedCount++; continue; }; try {; Remove-Item -Path $path -Force -Recurse -ErrorAction Stop; $deletedCount++; Write-Host "^""Successfully deleted: $($path)"^""; } catch {; $failedCount++; Write-Warning "^""Unable to delete $($path): $_"^""; }; }; Write-Host "^""Successfully deleted $($deletedCount) items."^""; if ($failedCount -gt 0) {; Write-Warning "^""Failed to delete $($failedCount) items."^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------Remove OneDrive installation files and cache-------
:: ----------------------------------------------------------
echo --- Remove OneDrive installation files and cache
:: Delete directory (with additional permissions) : "%LOCALAPPDATA%\Microsoft\OneDrive"
PowerShell -ExecutionPolicy Unrestricted -Command "$pathGlobPattern = "^""$($directoryGlob = '%LOCALAPPDATA%\Microsoft\OneDrive'; if (-Not $directoryGlob.EndsWith('\')) { $directoryGlob += '\' }; $directoryGlob )"^""; $expandedPath = [System.Environment]::ExpandEnvironmentVariables($pathGlobPattern); Write-Host "^""Searching for items matching pattern: `"^""$($expandedPath)`"^""."^""; <# Not using `Get-Acl`/`Set-Acl` to avoid adjusting token privileges #>; $parentDirectory = [System.IO.Path]::GetDirectoryName($expandedPath); $fileName = [System.IO.Path]::GetFileName($expandedPath); if ($parentDirectory -like '*[*?]*') {; throw "^""Unable to grant permissions to glob path parent directory: `"^""$parentDirectory`"^"", wildcards in parent directory are not supported by ``takeown`` and ``icacls``."^""; }; if (($fileName -ne '*') -and ($fileName -like '*[*?]*')) {; throw "^""Unable to grant permissions to glob path file name: `"^""$fileName`"^"", wildcards in file name is not supported by ``takeown`` and ``icacls``."^""; }; Write-Host "^""Taking ownership of `"^""$expandedPath`"^""."^""; $cmdPath = $expandedPath; if ($cmdPath.EndsWith('\')) {; $cmdPath += '\' <# Escape trailing backslash for correct handling in batch commands #>; }; $takeOwnershipCommand = "^""takeown /f `"^""$cmdPath`"^"" /a"^"" <# `icacls /setowner` does not succeed, so use `takeown` instead. #>; if (-not (Test-Path -Path "^""$expandedPath"^"" -PathType Leaf)) {; $localizedYes = 'Y' <# Default 'Yes' flag (fallback) #>; try {; $choiceOutput = cmd /c "^""choice <nul 2>nul"^""; if ($choiceOutput -and $choiceOutput.Length -ge 2) {; $localizedYes = $choiceOutput[1]; } else {; Write-Warning "^""Failed to determine localized 'Yes' character. Output: `"^""$choiceOutput`"^"""^""; }; } catch {; Write-Warning "^""Failed to determine localized 'Yes' character. Error: $_"^""; }; $takeOwnershipCommand += "^"" /r /d $localizedYes"^""; }; $takeOwnershipOutput = cmd /c "^""$takeOwnershipCommand 2>&1"^"" <# `stderr` message is misleading, e.g. "^""ERROR: The system cannot find the file specified."^"" is not an error. #>; if ($LASTEXITCODE -eq 0) {; Write-Host "^""Successfully took ownership of `"^""$expandedPath`"^"" (using ``$takeOwnershipCommand``)."^""; } else {; Write-Host "^""Did not take ownership of `"^""$expandedPath`"^"" using ``$takeOwnershipCommand``, status code: $LASTEXITCODE, message: $takeOwnershipOutput."^""; <# Do not write as error or warning, because this can be due to missing path, it's handled in next command. #>; <# `takeown` exits with status code `1`, making it hard to handle missing path here. #>; }; Write-Host "^""Granting permissions for `"^""$expandedPath`"^""."^""; $adminSid = New-Object System.Security.Principal.SecurityIdentifier 'S-1-5-32-544'; $adminAccount = $adminSid.Translate([System.Security.Principal.NTAccount]); $adminAccountName = $adminAccount.Value; $grantPermissionsCommand = "^""icacls `"^""$cmdPath`"^"" /grant `"^""$($adminAccountName):F`"^"" /t"^""; $icaclsOutput = cmd /c "^""$grantPermissionsCommand"^""; if ($LASTEXITCODE -eq 3) {; Write-Host "^""Skipping, no items available for deletion according to: ``$grantPermissionsCommand``."^""; exit 0; } elseif ($LASTEXITCODE -ne 0) {; Write-Host "^""Take ownership message:`n$takeOwnershipOutput"^""; Write-Host "^""Grant permissions:`n$icaclsOutput"^""; Write-Warning "^""Failed to assign permissions for `"^""$expandedPath`"^"" using ``$grantPermissionsCommand``, status code: $LASTEXITCODE."^""; } else {; $fileStats = $icaclsOutput | ForEach-Object { $_ -match '\d+' | Out-Null; $matches[0] } | Where-Object { $_ -ne $null } | ForEach-Object { [int]$_ }; if ($fileStats.Count -gt 0 -and ($fileStats | ForEach-Object { $_ -eq 0 } | Where-Object { $_ -eq $false }).Count -eq 0) {; Write-Host "^""Skipping, no items available for deletion according to: ``$grantPermissionsCommand``."^""; exit 0; } else {; Write-Host "^""Successfully granted permissions for `"^""$expandedPath`"^"" (using ``$grantPermissionsCommand``)."^""; }; }; $deletedCount = 0; $failedCount = 0; $foundAbsolutePaths = @(); Write-Host 'Iterating files and directories recursively.'; try {; $foundAbsolutePaths += @(; Get-ChildItem -Path $expandedPath -Force -Recurse -ErrorAction Stop | Select-Object -ExpandProperty FullName; ); } catch [System.Management.Automation.ItemNotFoundException] {; <# Swallow, do not run `Test-Path` before, it's unreliable for globs requiring extra permissions #>; }; try {; $foundAbsolutePaths += @(; Get-Item -Path $expandedPath -ErrorAction Stop | Select-Object -ExpandProperty FullName; ); } catch [System.Management.Automation.ItemNotFoundException] {; <# Swallow, do not run `Test-Path` before, it's unreliable for globs requiring extra permissions #>; }; $foundAbsolutePaths = $foundAbsolutePaths | Select-Object -Unique | Sort-Object -Property { $_.Length } -Descending; if (!$foundAbsolutePaths) {; Write-Host 'Skipping, no items available.'; exit 0; }; Write-Host "^""Initiating processing of $($foundAbsolutePaths.Count) items from `"^""$expandedPath`"^""."^""; foreach ($path in $foundAbsolutePaths) {; if (-not (Test-Path $path)) { <# Re-check existence as prior deletions might remove subsequent items (e.g., subdirectories). #>; Write-Host "^""Successfully deleted: $($path) (already deleted)."^""; $deletedCount++; continue; }; try {; Remove-Item -Path $path -Force -Recurse -ErrorAction Stop; $deletedCount++; Write-Host "^""Successfully deleted: $($path)"^""; } catch {; $failedCount++; Write-Warning "^""Unable to delete $($path): $_"^""; }; }; Write-Host "^""Successfully deleted $($deletedCount) items."^""; if ($failedCount -gt 0) {; Write-Warning "^""Failed to delete $($failedCount) items."^""; }"
:: Delete directory  : "%PROGRAMDATA%\Microsoft OneDrive"
PowerShell -ExecutionPolicy Unrestricted -Command "$pathGlobPattern = "^""$($directoryGlob = '%PROGRAMDATA%\Microsoft OneDrive'; if (-Not $directoryGlob.EndsWith('\')) { $directoryGlob += '\' }; $directoryGlob )"^""; $expandedPath = [System.Environment]::ExpandEnvironmentVariables($pathGlobPattern); Write-Host "^""Searching for items matching pattern: `"^""$($expandedPath)`"^""."^""; $deletedCount = 0; $failedCount = 0; $foundAbsolutePaths = @(); Write-Host 'Iterating files and directories recursively.'; try {; $foundAbsolutePaths += @(; Get-ChildItem -Path $expandedPath -Force -Recurse -ErrorAction Stop | Select-Object -ExpandProperty FullName; ); } catch [System.Management.Automation.ItemNotFoundException] {; <# Swallow, do not run `Test-Path` before, it's unreliable for globs requiring extra permissions #>; }; try {; $foundAbsolutePaths += @(; Get-Item -Path $expandedPath -ErrorAction Stop | Select-Object -ExpandProperty FullName; ); } catch [System.Management.Automation.ItemNotFoundException] {; <# Swallow, do not run `Test-Path` before, it's unreliable for globs requiring extra permissions #>; }; $foundAbsolutePaths = $foundAbsolutePaths | Select-Object -Unique | Sort-Object -Property { $_.Length } -Descending; if (!$foundAbsolutePaths) {; Write-Host 'Skipping, no items available.'; exit 0; }; Write-Host "^""Initiating processing of $($foundAbsolutePaths.Count) items from `"^""$expandedPath`"^""."^""; foreach ($path in $foundAbsolutePaths) {; if (-not (Test-Path $path)) { <# Re-check existence as prior deletions might remove subsequent items (e.g., subdirectories). #>; Write-Host "^""Successfully deleted: $($path) (already deleted)."^""; $deletedCount++; continue; }; try {; Remove-Item -Path $path -Force -Recurse -ErrorAction Stop; $deletedCount++; Write-Host "^""Successfully deleted: $($path)"^""; } catch {; $failedCount++; Write-Warning "^""Unable to delete $($path): $_"^""; }; }; Write-Host "^""Successfully deleted $($deletedCount) items."^""; if ($failedCount -gt 0) {; Write-Warning "^""Failed to delete $($failedCount) items."^""; }"
:: Delete directory  : "%SYSTEMDRIVE%\OneDriveTemp"
PowerShell -ExecutionPolicy Unrestricted -Command "$pathGlobPattern = "^""$($directoryGlob = '%SYSTEMDRIVE%\OneDriveTemp'; if (-Not $directoryGlob.EndsWith('\')) { $directoryGlob += '\' }; $directoryGlob )"^""; $expandedPath = [System.Environment]::ExpandEnvironmentVariables($pathGlobPattern); Write-Host "^""Searching for items matching pattern: `"^""$($expandedPath)`"^""."^""; $deletedCount = 0; $failedCount = 0; $foundAbsolutePaths = @(); Write-Host 'Iterating files and directories recursively.'; try {; $foundAbsolutePaths += @(; Get-ChildItem -Path $expandedPath -Force -Recurse -ErrorAction Stop | Select-Object -ExpandProperty FullName; ); } catch [System.Management.Automation.ItemNotFoundException] {; <# Swallow, do not run `Test-Path` before, it's unreliable for globs requiring extra permissions #>; }; try {; $foundAbsolutePaths += @(; Get-Item -Path $expandedPath -ErrorAction Stop | Select-Object -ExpandProperty FullName; ); } catch [System.Management.Automation.ItemNotFoundException] {; <# Swallow, do not run `Test-Path` before, it's unreliable for globs requiring extra permissions #>; }; $foundAbsolutePaths = $foundAbsolutePaths | Select-Object -Unique | Sort-Object -Property { $_.Length } -Descending; if (!$foundAbsolutePaths) {; Write-Host 'Skipping, no items available.'; exit 0; }; Write-Host "^""Initiating processing of $($foundAbsolutePaths.Count) items from `"^""$expandedPath`"^""."^""; foreach ($path in $foundAbsolutePaths) {; if (-not (Test-Path $path)) { <# Re-check existence as prior deletions might remove subsequent items (e.g., subdirectories). #>; Write-Host "^""Successfully deleted: $($path) (already deleted)."^""; $deletedCount++; continue; }; try {; Remove-Item -Path $path -Force -Recurse -ErrorAction Stop; $deletedCount++; Write-Host "^""Successfully deleted: $($path)"^""; } catch {; $failedCount++; Write-Warning "^""Unable to delete $($path): $_"^""; }; }; Write-Host "^""Successfully deleted $($deletedCount) items."^""; if ($failedCount -gt 0) {; Write-Warning "^""Failed to delete $($failedCount) items."^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------------Remove OneDrive shortcuts-----------------
:: ----------------------------------------------------------
echo --- Remove OneDrive shortcuts
PowerShell -ExecutionPolicy Unrestricted -Command "$shortcuts = @(; @{ Revert = $True;  Path = "^""$env:APPDATA\Microsoft\Windows\Start Menu\Programs\OneDrive.lnk"^""; }; @{ Revert = $False; Path = "^""$env:USERPROFILE\Links\OneDrive.lnk"^""; }; @{ Revert = $False; Path = "^""$env:WINDIR\ServiceProfiles\LocalService\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\OneDrive.lnk"^""; }; @{ Revert = $False; Path = "^""$env:WINDIR\ServiceProfiles\NetworkService\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\OneDrive.lnk"^""; }; ); foreach ($shortcut in $shortcuts) {; if (-Not (Test-Path $shortcut.Path)) {; Write-Host "^""Skipping, shortcut does not exist: `"^""$($shortcut.Path)`"^""."^""; continue; }; try {; Remove-Item -Path $shortcut.Path -Force -ErrorAction Stop; Write-Output "^""Successfully removed shortcut: `"^""$($shortcut.Path)`"^""."^""; } catch {; Write-Error "^""Encountered an issue while attempting to remove shortcut at: `"^""$($shortcut.Path)`"^""."^""; }; }"
PowerShell -ExecutionPolicy Unrestricted -Command "Set-Location "^""HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace"^""; Get-ChildItem | ForEach-Object {Get-ItemProperty $_.pspath} | ForEach-Object {; $leftnavNodeName = $_."^""(default)"^"";; if (($leftnavNodeName -eq "^""OneDrive"^"") -Or ($leftnavNodeName -eq "^""OneDrive - Personal"^"")) {; if (Test-Path $_.pspath) {; Write-Host "^""Deleting $($_.pspath)."^""; Remove-Item $_.pspath;; }; }; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------------Disable OneDrive usage------------------
:: ----------------------------------------------------------
echo --- Disable OneDrive usage
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive' /v 'DisableFileSyncNGSC' /t 'REG_DWORD' /d '1' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive' /v 'DisableFileSync' /t 'REG_DWORD' /d '1' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---------Disable automatic OneDrive installation----------
:: ----------------------------------------------------------
echo --- Disable automatic OneDrive installation
PowerShell -ExecutionPolicy Unrestricted -Command "reg delete "^""HKCU\Software\Microsoft\Windows\CurrentVersion\Run"^"" /v "^""OneDriveSetup"^"" /f 2>$null"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------Remove OneDrive folder from File Explorer---------
:: ----------------------------------------------------------
echo --- Remove OneDrive folder from File Explorer
reg add "HKCR\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /v "System.IsPinnedToNameSpaceTree" /d "0" /t REG_DWORD /f
reg add "HKCR\Wow6432Node\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /v "System.IsPinnedToNameSpaceTree" /d "0" /t REG_DWORD /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------Disable OneDrive scheduled tasks-------------
:: ----------------------------------------------------------
echo --- Disable OneDrive scheduled tasks
:: Disable scheduled task(s): `\OneDrive Reporting Task-*`
PowerShell -ExecutionPolicy Unrestricted -Command "$taskPathPattern='\'; $taskNamePattern='OneDrive Reporting Task-*'; Write-Output "^""Disabling tasks matching pattern `"^""$taskNamePattern`"^""."^""; $tasks = @(Get-ScheduledTask -TaskPath $taskPathPattern -TaskName $taskNamePattern -ErrorAction Ignore); if (-Not $tasks) {; Write-Output "^""Skipping, no tasks matching pattern `"^""$taskNamePattern`"^"" found, no action needed."^""; exit 0; }; $operationFailed = $false; foreach ($task in $tasks) {; $taskName = $task.TaskName; if ($task.State -eq [Microsoft.PowerShell.Cmdletization.GeneratedTypes.ScheduledTask.StateEnum]::Disabled) {; Write-Output "^""Skipping, task `"^""$taskName`"^"" is already disabled, no action needed."^""; continue; }; try {; $task | Disable-ScheduledTask -ErrorAction Stop | Out-Null; Write-Output "^""Successfully disabled task `"^""$taskName`"^""."^""; } catch {; Write-Error "^""Failed to disable task `"^""$taskName`"^"": $($_.Exception.Message)"^""; $operationFailed = $true; }; }; if ($operationFailed) {; Write-Output 'Failed to disable some tasks. Check error messages above.'; exit 1; }"
:: Disable scheduled task(s): `\OneDrive Standalone Update Task-*`
PowerShell -ExecutionPolicy Unrestricted -Command "$taskPathPattern='\'; $taskNamePattern='OneDrive Standalone Update Task-*'; Write-Output "^""Disabling tasks matching pattern `"^""$taskNamePattern`"^""."^""; $tasks = @(Get-ScheduledTask -TaskPath $taskPathPattern -TaskName $taskNamePattern -ErrorAction Ignore); if (-Not $tasks) {; Write-Output "^""Skipping, no tasks matching pattern `"^""$taskNamePattern`"^"" found, no action needed."^""; exit 0; }; $operationFailed = $false; foreach ($task in $tasks) {; $taskName = $task.TaskName; if ($task.State -eq [Microsoft.PowerShell.Cmdletization.GeneratedTypes.ScheduledTask.StateEnum]::Disabled) {; Write-Output "^""Skipping, task `"^""$taskName`"^"" is already disabled, no action needed."^""; continue; }; try {; $task | Disable-ScheduledTask -ErrorAction Stop | Out-Null; Write-Output "^""Successfully disabled task `"^""$taskName`"^""."^""; } catch {; Write-Error "^""Failed to disable task `"^""$taskName`"^"": $($_.Exception.Message)"^""; $operationFailed = $true; }; }; if ($operationFailed) {; Write-Output 'Failed to disable some tasks. Check error messages above.'; exit 1; }"
:: Disable scheduled task(s): `\OneDrive Per-Machine Standalone Update`
PowerShell -ExecutionPolicy Unrestricted -Command "$taskPathPattern='\'; $taskNamePattern='OneDrive Per-Machine Standalone Update'; Write-Output "^""Disabling tasks matching pattern `"^""$taskNamePattern`"^""."^""; $tasks = @(Get-ScheduledTask -TaskPath $taskPathPattern -TaskName $taskNamePattern -ErrorAction Ignore); if (-Not $tasks) {; Write-Output "^""Skipping, no tasks matching pattern `"^""$taskNamePattern`"^"" found, no action needed."^""; exit 0; }; $operationFailed = $false; foreach ($task in $tasks) {; $taskName = $task.TaskName; if ($task.State -eq [Microsoft.PowerShell.Cmdletization.GeneratedTypes.ScheduledTask.StateEnum]::Disabled) {; Write-Output "^""Skipping, task `"^""$taskName`"^"" is already disabled, no action needed."^""; continue; }; try {; $task | Disable-ScheduledTask -ErrorAction Stop | Out-Null; Write-Output "^""Successfully disabled task `"^""$taskName`"^""."^""; } catch {; Write-Error "^""Failed to disable task `"^""$taskName`"^"": $($_.Exception.Message)"^""; $operationFailed = $true; }; }; if ($operationFailed) {; Write-Output 'Failed to disable some tasks. Check error messages above.'; exit 1; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----------Clear OneDrive environment variable------------
:: ----------------------------------------------------------
echo --- Clear OneDrive environment variable
reg delete "HKCU\Environment" /v "OneDrive" /f 2>nul
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------------Remove "Widgets" from taskbar---------------
:: ----------------------------------------------------------
echo --- Remove "Widgets" from taskbar
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' /v 'TaskbarDa' /t 'REG_DWORD' /d '0' /f"
:: Suggest restarting explorer.exe for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'This script will not take effect until you restart explorer.exe. You can restart explorer.exe by restarting your computer or by running following on command prompt: `taskkill /f /im explorer.exe & start explorer`.'; $ignoreWindows10 =  $false; $ignoreWindows11 =  $false; $warn =  $false; $osVersion = [System.Environment]::OSVersion.Version; function Test-IsWindows10 { ($osVersion.Major -eq 10) -and ($osVersion.Build -lt 22000) }; function Test-IsWindows11 { ($osVersion.Major -gt 10) -or (($osVersion.Major -eq 10) -and ($osVersion.Build -ge 22000)) }; if (($ignoreWindows10 -and (Test-IsWindows10)) -or ($ignoreWindows11 -and (Test-IsWindows11))) {; echo "^""Skipping"^""; exit 0 <# Skip #>; }; if ($warn) {; Write-Warning "^""$message"^""; } else {; Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --Remove "Windows Web Experience Pack" (breaks Widgets)---
:: ----------------------------------------------------------
echo --- Remove "Windows Web Experience Pack" (breaks Widgets)
:: Uninstall 'MicrosoftWindows.Client.WebExperience' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'MicrosoftWindows.Client.WebExperience' | Remove-AppxPackage"
:: Mark 'MicrosoftWindows.Client.WebExperience' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\MicrosoftWindows.Client.WebExperience_cw5n1h2txyewy" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----------Remove "Meet Now" icon from taskbar------------
:: ----------------------------------------------------------
echo --- Remove "Meet Now" icon from taskbar
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer' /v 'HideSCAMeetNow' /t 'REG_DWORD' /d '1' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----------------Disable Copilot feature------------------
:: ----------------------------------------------------------
echo --- Disable Copilot feature
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot' /v 'TurnOffWindowsCopilot' /t 'REG_DWORD' /d '1' /f"
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKCU\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot' /v 'TurnOffWindowsCopilot' /t 'REG_DWORD' /d '1' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------------Disable Copilot access------------------
:: ----------------------------------------------------------
echo --- Disable Copilot access
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKCU\Software\Microsoft\Windows\Shell\Copilot\BingChat' /v 'IsUserEligible' /t 'REG_DWORD' /d '0' /f"
:: Suggest restarting computer for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'For the changes to fully take effect, please restart your computer.'; $ignoreWindows10 =  $false; $ignoreWindows11 =  $false; $warn =  $false; $osVersion = [System.Environment]::OSVersion.Version; function Test-IsWindows10 { ($osVersion.Major -eq 10) -and ($osVersion.Build -lt 22000) }; function Test-IsWindows11 { ($osVersion.Major -gt 10) -or (($osVersion.Major -eq 10) -and ($osVersion.Build -ge 22000)) }; if (($ignoreWindows10 -and (Test-IsWindows10)) -or ($ignoreWindows11 -and (Test-IsWindows11))) {; echo "^""Skipping"^""; exit 0 <# Skip #>; }; if ($warn) {; Write-Warning "^""$message"^""; } else {; Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----------Disable Copilot auto-launch on start-----------
:: ----------------------------------------------------------
echo --- Disable Copilot auto-launch on start
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings' /v 'AutoOpenCopilotLargeScreens' /t 'REG_DWORD' /d '0' /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------Remove "Copilot" icon from taskbar------------
:: ----------------------------------------------------------
echo --- Remove "Copilot" icon from taskbar
PowerShell -ExecutionPolicy Unrestricted -Command "reg add 'HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' /v 'ShowCopilotButton' /t 'REG_DWORD' /d '0' /f"
:: Suggest restarting explorer.exe for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'This script will not take effect until you restart explorer.exe. You can restart explorer.exe by restarting your computer or by running following on command prompt: `taskkill /f /im explorer.exe & start explorer`.'; $ignoreWindows10 =  $false; $ignoreWindows11 =  $false; $warn =  $false; $osVersion = [System.Environment]::OSVersion.Version; function Test-IsWindows10 { ($osVersion.Major -eq 10) -and ($osVersion.Build -lt 22000) }; function Test-IsWindows11 { ($osVersion.Major -gt 10) -or (($osVersion.Major -eq 10) -and ($osVersion.Build -ge 22000)) }; if (($ignoreWindows10 -and (Test-IsWindows10)) -or ($ignoreWindows11 -and (Test-IsWindows11))) {; echo "^""Skipping"^""; exit 0 <# Skip #>; }; if ($warn) {; Write-Warning "^""$message"^""; } else {; Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: Pause the script to view the final state
pause
:: Restore previous environment settings
endlocal
:: Exit the script successfully
exit /b 0
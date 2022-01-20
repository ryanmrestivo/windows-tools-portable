#
	
# Setting up directories for values
	Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
	
#Choco
	Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
	choco feature enable -n=allowGlobalConfirmation
	choco feature enable -n=useFipsCompliantChecksums
	choco feature enable -n=useEnhancedExitCodes
	choco config set commandExecutionTimeoutSeconds 14400
	choco config set --name="'cacheLocation'" --value="'C:\temp\chococache'"
	choco config set --name="'proxyBypassOnLocal'" --value="'true'"
	choco upgrade all

# refreshenv
	refreshenv

#Choco Applications

#Do not suggest ways I can finish setting up my device to get the most out of Windows
    New-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\UserProfileEngagement" -Force
    New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\UserProfileEngagement" -Name "ScoobeSystemSettingEnabled" -PropertyType "DWORD" -Value "0" -Force

#Show hidden items in explorer
    New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Hidden" -PropertyType "DWORD" -Value "1" -Force

#Show file extentions in explorer
    New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "HideFileExt" -PropertyType "DWORD" -Value "0" -Force

#Open to "this pc" in explorer
    New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "LaunchTo" -PropertyType "DWORD" -Value "1" -Force

#Hide cortana taskbar button
    New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowCortanaButton" -PropertyType "DWORD" -Value "0" -Force

#Hide task view button in explorer
    New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowTaskViewButton" -PropertyType "DWORD" -Value "0" -Force

#Hide people button in taskbar
    New-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" -Force
    New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" -Name"PeopleBand" -PropertyType "DWORD" -Value "0" -Force

#Verbose BSoD
    New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\CrashControl" -Name "DisplayParameters" -PropertyType "DWORD" -Value "1"

# Disable Wi-Fi Sense
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots" -Name "Value" -Value 0

	New-Item -Path "HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting" -Force | Out-Null
	New-ItemProperty -Path "HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting" -Name "Value" -PropertyType DWord -Value 0

# Disable Wi-Fi network sharing
	Write-Host "Disabling Wi-Fi network sharing..."
	$user = New-Object System.Security.Principal.NTAccount($env:UserName)
	$sid = $user.Translate([System.Security.Principal.SecurityIdentifier]).value
	New-Item  -Path ("HKLM:\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\features\" + $sid) -Force | Out-Null
	New-ItemProperty -Path ("HKLM:\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\features\" + $sid) -Name "FeatureStates" -PropertyType DWord -Value 0x33c
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\features" -Name "WiFiSenseCredShared" -Value 0
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\features" -Name "WiFiSenseOpen" -Value 0

# Disable Bing Search in Start Menu
	Write-Host "Disabling Bing Search in Start Menu..."
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "BingSearchEnabled" -Value 0

# Disable Location Tracking
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" -Name "SensorPermissionState" -Value 0
	Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Services\lfsvc\Service\Configuration" -Name "Status" -Value 0

# Disable Feedback
	New-Item -Path "HKCU:\Software\Microsoft\Siuf\Rules" -Force | Out-Null
    New-ItemProperty -Path "HKCU:\Software\Microsoft\Siuf\Rules" -Name "NumberOfSIUFInPeriod" -PropertyType DWord -Value 0

# Disable Advertising ID
	New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" -Force | Out-Null
    New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" -Name "Enabled" -PropertyType DWord -Value 0
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" -Name "Enabled" -Value 0

# Restrict Windows Update P2P only to local network
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" -Name "DODownloadMode" -Value 1

    New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\DeliveryOptimization" | Out-Null
	New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\DeliveryOptimization" -Name "SystemSettingsDownloadMode" -PropertyType DWord -Value 3 | Out-Null

# Change default Explorer view to "Computer"
	Write-Host "Changing default Explorer view to `"Computer`"..."
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "LaunchTo" -Value 1

# Disable Autoplay
	Write-Host "Disabling Autoplay..."
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers" -Name "DisableAutoplay" -Value 1

# Disable Autorun for all drives
	Write-Host "Disabling Autorun for all drives..."
	New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" | Out-Null
	New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "NoDriveTypeAutoRun" -PropertyType DWord -Value 255 | Out-Null

# Show known file extensions
	Write-Host "Showing known file extensions..."
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "HideFileExt" -Value 0

# Show hidden files
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Hidden" -Value 1
	Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowSyncProviderNotifications" -Value 0

# Turn off Sleep Timeout 
	Start-Process powercfg.exe -ArgumentList "/change standby-timeout-ac 0" -NoNewWindow -Wait

# Windows Update
#	choco Install PSWindowsUpdate
#	Get-WindowsUpdate
#	Install-WindowsUpdate
	
# refreshenv
	refreshenv

Start-Job -Name "Mitigations" -ScriptBlock {
# Disable TCP Timestamps
    netsh int tcp set global timestamps=disabled

# Enable LSA Protection/Auditing
#https://adsecurity.org/?p=3299
    New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\" -Name "LSASS.exe" -Force
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\LSASS.exe" -Name "AuditLevel" -Type "DWORD" -Value 8 -Force
    
# Disable WDigest
#https://adsecurity.org/?p=3299
    Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\SecurityProviders\Wdigest" -Name "UseLogonCredential" -Type "DWORD" -Value 0 -Force

# Block Untrusted Fonts
#https://adsecurity.org/?p=3299
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Kernel\" -Name "MitigationOptions" -Type "QWORD" -Value "1000000000000" -Force

# Disable Hibernate
    powercfg -h off
}

Start-Job -Name "PowerShell Hardening" -ScriptBlock {

# Enable PowerShell Logging
# You can change the directory from C:\PowershellLogs
    New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\" -Name "Transcription" -Force
    New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\Transcription" -Name "OutputDirectory" -Type "STRING" -Value "C:\PowershellLogs" -Force
    New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging\" -Name "EnableScriptBlockLogging" -Type "DWORD" -Value "1" -Force
    New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\Transcription\" -Name "EnableTranscripting" -Type "DWORD" -Value "1" -Force
    New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\Transcription\" -Name "EnableInvocationHeader" -Type "DWORD" -Value "1" -Force
    Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\Transcription" -Name "OutputDirectory" -Type "STRING" -Value "C:\PowershellLogs" -Force
    Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging\" -Name "EnableScriptBlockLogging" -Type "DWORD" -Value "1" -Force
    Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\Transcription\" -Name "EnableTranscripting" -Type "DWORD" -Value "1" -Force
    Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\Transcription\" -Name "EnableInvocationHeader" -Type "DWORD" -Value "1" -Force
}

# Debloating Scripts

Start-Job -Name "Remove-Keys" -ScriptBlock {  
    #These are the registry keys that it will delete.  
    $Keys = @(
   
Start-Job -Name "Protect-Privacy" -ScriptBlock {
    #Disables live tiles
    Write-Output "Disabling live tiles"
    $Live = 'HKCU:\Software\Policies\Microsoft\Windows\CurrentVersion\PushNotifications'    
    If (!(Test-Path $Live)) {
        mkdir $Live -ErrorAction SilentlyContinue     
        New-ItemProperty $Live -Name NoTileApplicationNotification -Value 1 -Verbose
    }
    
    #Disables People icon on Taskbar
    Write-Output "Disabling People icon on Taskbar"
    $People = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People'
    If (Test-Path $People) {
        Set-ItemProperty $People -Name PeopleBand -Value 0 -Verbose
    }

    #Disables suggestions on start menu
    Write-Output "Disabling suggestions on the Start Menu"
    $Suggestions = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager'    
    If (Test-Path $Suggestions) {
        Set-ItemProperty $Suggestions -Name SystemPaneSuggestionsEnabled -Value 0 -Verbose
    }

    ###Disable Game Bar features ###
    ###The Game DVR is a feature of the Xbox app that lets you use the Game bar (Win+G) to record and share game clips and screenshots in Windows 10. However, you can also use the Game bar to record videos and take screenshots of any app in Windows 10. ###
    ###This Policy will disable the Windows Game Recording and Broadcasting.
    If (!(Test-Path "HKLM:\Software\Policies\Microsoft\Windows\GameDVR")) {
        New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\GameDVR" -Force | Out-Null
    }
    New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\GameDVR" -Name "AllowGameDVR" -Type "DWORD" -Value 0 -Force

Start-Job -Name "Image Cleanup" -ScriptBlock {
    #Delete "windows.old" folder
    #Cmd.exe /c Cleanmgr /sageset:65535 
    Cmd.exe /c Cleanmgr /sagerun:65535
    Write-Verbose "Removing .tmp, .etl, .evtx, thumbcache*.db, *.log files not in use"
    Get-ChildItem -Path c:\ -Include *.tmp, *.dmp, *.etl, *.evtx, thumbcache*.db, *.log -File -Recurse -Force -ErrorAction SilentlyContinue | Remove-Item -ErrorAction SilentlyContinue

# Windows Update
#	choco Install PSWindowsUpdate
#	Get-WindowsUpdate
#	Install-WindowsUpdate

##########
# Restart
##########

Write-Host
Write-Host "Press any key to restart your system..." -ForegroundColor Black -BackgroundColor White
$key = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
Write-Host "Restarting..."
Restart-Computer

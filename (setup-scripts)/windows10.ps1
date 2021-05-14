Start-Job -Name "Install and Configure Chocolatey" -ScriptBlock {
    Write-Host "Installing Chocolatey"
    # Setting up directories for values
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    choco feature enable -n=allowGlobalConfirmation
    choco feature enable -n=useFipsCompliantChecksums
    choco feature enable -n=useEnhancedExitCodes
    choco config set commandExecutionTimeoutSeconds 14400
    choco config set --name="'cacheLocation'" --value="'C:\temp\chococache'"
    choco config set --name="'proxyBypassOnLocal'" --value="'true'"
    choco upgrade all
    refreshenv
    Start-Job -Name "Installing Windows Updates" -ScriptBlock {
        Write-Host "Install Latest Windows Updates"
        choco install pswindowsupdate
        Set-Executionpolicy -ExecutionPolicy RemoteSigned -Force
        Import-Module PSWindowsUpdate -Force
        Add-WUServiceManager -ServiceID 7971f918-a847-4430-9279-4a52d1efe18d -Confirm:$false
        Install-WindowsUpdate -MicrosoftUpdate -AcceptAll -Install
        Get-WuInstall -AcceptAll -IgnoreReboot -IgnoreUserInput -nottitle 'preview'
        Get-WindowsUpdate –Install
    }
}

Start-Job -Name "Installing Optional Windows Features" -ScriptBlock {
    #https://www.ghacks.net/2017/07/14/use-windows-powershell-to-install-optional-features/
    #Enable-WindowsOptionalFeature -Online -FeatureName "" -All
    ForEach ($OptionalFeature in ("Client-ProjFS", "ClientForNFS-Infrastructure", "DataCenterBridging", "DirectoryServices-ADAM-Client", "Microsoft-Windows-Subsystem-Linux", "NFS-Administration", "ServicesForNFS-ClientOnly", "SimpleTCP", "WindowsMediaPlayer")) {
        Enable-WindowsOptionalFeature -Online -FeatureName "$OptionalFeature" -All -NoRestart -WarningAction SilentlyContinue | Out-Null
    }
    
    #https://docs.microsoft.com/en-us/powershell/scripting/gallery/installing-psget?view=powershell-7.1
    Install-PackageProvider -Name "NuGet -Force

    #https://github.com/PowerShell/PowerShellGetv2/issues/303
    Set-PSRepository -Name "PSGallery -InstallationPolicy Trusted
    Install-PackageProvider -Name "PowerShellGet -Force -Scope CurrentUser
    
    #https://github.com/PowerShell/PowerShellGetv2/issues/295
    Invoke-WebRequest -Uri https://aka.ms/psget-nugetexe -OutFile "$env:ProgramData\Microsoft\Windows\PowerShell\PowerShellGet\NuGet.exe"

    #https://www.powershellgallery.com/packages/AnonUpload/1.2
    #https://www.powershellgallery.com/packages/Carbon/2.9.4
    #https://www.powershellgallery.com/packages/PoshInternals/1.0.34
    #https://www.powershellgallery.com/packages/powershellprotools/5.7.2
    #https://www.powershellgallery.com/packages/PSWindowsUpdate/2.2.0.2
    #https://www.powershellgallery.com/packages/SpeculationControl/1.0.14
    #https://www.powershellgallery.com/packages/xCertificate/3.2.0.0
    ForEach ($module in ("AnonUpload", "Carbon", "PoshInternals", "PowerShellGet", "PowerShellProTools", "PSWindowsUpdate", "ReportHTML", "xCertificate")) {
        Update-Module -Name "$module -Force
    Install-Module -Name "$module -Force
        Import-Module -Name "$module -Force
}
refreshenv

Start-Job -Name "Installing Software" -Scriptblock {
    Start-Sleep 60
    refreshenv
    Write-Host "Installing Browsers"
    choco install googlechrome firefox chromium microsoft-edge tor-Browser

    Write-Host "Installing Administration Tools"
    choco install putty winscp.install teamviewer anydesk.install sysinternals driverbooster sdio etcher rufus.install veracrypt windirstat mysql.workbench rsat sql-server-management-studio laps wumt

    Write-Host "Installing Networking Tools"
    choco install openvpn wireguard wireshark nmap winbox tor

    Write-Host "Installing Security Tools"
    #java will be installed in "C:\ProgramData\chocolatey\lib\openjdk.portable\tools\jdk-12.0.2\bin"
    choco install cheatengine sleuthkit hxd ida-free ghidra ossec-client burp-suite-free-edition zap openstego accessenum accesschk 
  
    Write-Host "Installing Logging Tools"
    #choco install splunk-universalforwarder winlogbeat
    choco install sysmon
  
    Write-Host "Installing Terminals"
    #choco install docker-desktop docker-compose docker-cli azure-cli awstools.powershell awscli kubernetes-cli 
    choco install powershell4 powershell powershellhere-elevated powershell.portable microsoft-windows-terminal powertoys carbon

    Write-Host "Installing Java"
    #choco install jdk11 javaruntime
    choco install jre8 openjdk openjdk.portable
  
    Write-Host "Installing Hugo and Node Stack Tools"
    choco install hugo hugo-extended nodejs --force

    Write-Host "Installing IDE and Dev Tools"
    #choco install visualstudio2019enterprise visualstudio2017-powershelltools arduino vscode-arduino vscode-puppet vscode-ruby 
    choco install vscode vscodium vscode-ansible vscode-python chocolatey-vscode vscode-prettier vscode-java vscode-yaml vscode-haskell vscode-mongo vscode-beautify vscode-intellicode vscode-pull-request-github vscode-kubernetes-tools vscode-autofilename vscode-codespellchecker vscode-icons vscode-csharp dsc.powershellcommunity notepadplusplus.install python pip 

    Write-Host "Installing GIT Tools"
    #choco install postman markdownmonster 
    choco install github-desktop gh git.install git-lfx gnupg gpg4win openssh 

    Write-Host "Installing Windows Subsystem for Linux"
    #choco install wsl-ubuntu-2004 wsl-debiangnulinux wsl-kalilinux
    choco install wsl wsl2
  
    Write-Host "Installing Android Debugging Tools"
    choco install adb universal-adb-drivers windows-adk-all
  
    Start-Sleep 240
    Write-Host "Installing Runtimes and Developer Packs"
    choco install dotnetfx vcredist-all 
  
    Write-Host "Installing Complile & Build Tools"
    choco install microsoft-visual-cpp-build-tools

    Write-Host "Installing Chat Clients"
    #choco install microsoft-teams.install
    choco install rocketchat discord pidgin signal 

    Write-Host "Installing Steam"
    choco install steam 

    Write-host "Installing Media Software"
    choco install vlc gimp k-litecodecpackfull audacity audacity-lame screentogif

  
    Write-Host "Installing Misc."
    #choco install greenshot
    choco install installroot 7zip.install curl cpu-z.install
  
    Start-Sleep 240
  
}

Start-Job -Name "Configuring Windows - Optimizations, Debloating, and Hardening" -ScriptBlock {
    Start-Sleep 120
    Write-Host "Configuring Windows - Optimizations, Debloating, and Hardening"
    New-Item "C:\" -Name "temp" -ItemType "directory" -Force
    Invoke-WebRequest -useb 'https://simeononsecurity.ch/scripts/windowsoptimizeandharden.ps1' | Invoke-Expression
    Start-Job -Name "System Wide Ad and Tracker Blocking" -ScriptBlock {
        Invoke-WebRequest -useb 'https://raw.githubusercontent.com/simeononsecurity/System-Wide-Windows-Ad-Blocker/main/sos-system-wide-windows-ad-block.ps1' | Invoke-Expression
    }
    #Fix high performance timers to get better performance from Windows 10.
    bcdedit /deletevalue useplatformclock
    bcdedit /set useplatformclock false
    bcdedit /set useplatformtick yes
    bcdedit /set disabledynamictick yes
    bcdedit /set tscsyncpolicy Enhanced

    #Removes Paint3D stuff from context menu
    $Paint3Dstuff = @(
        "HKCR:\SystemFileAssociations\.3mf\Shell\3D Edit"
        "HKCR:\SystemFileAssociations\.bmp\Shell\3D Edit"
        "HKCR:\SystemFileAssociations\.fbx\Shell\3D Edit"
        "HKCR:\SystemFileAssociations\.gif\Shell\3D Edit"
        "HKCR:\SystemFileAssociations\.jfif\Shell\3D Edit"
        "HKCR:\SystemFileAssociations\.jpe\Shell\3D Edit"
        "HKCR:\SystemFileAssociations\.jpeg\Shell\3D Edit"
        "HKCR:\SystemFileAssociations\.jpg\Shell\3D Edit"
        "HKCR:\SystemFileAssociations\.png\Shell\3D Edit"
        "HKCR:\SystemFileAssociations\.tif\Shell\3D Edit"
        "HKCR:\SystemFileAssociations\.tiff\Shell\3D Edit"
    )
    #Rename reg key to remove it, so it's revertible
    foreach ($Paint3D in $Paint3Dstuff) {
        If (Test-Path $Paint3D) {
            $rmPaint3D = $Paint3D + "_"
            Set-Item $Paint3D $rmPaint3D
        }
    }

    Write-Host "Disabling Action Center..."
    If (!(Test-Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Explorer")) {
        New-Item -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Explorer" | Out-Null
    }
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Explorer" -Name "DisableNotificationCenter" -Type "DWORD" -Value 1
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\PushNotifications" -Name "ToastEnabled" -Type "DWORD" -Value 0

    #Do not suggest ways I can finish setting up my device to get the most out of Windows
    if (-not (Test-Path -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\UserProfileEngagement")) {
        New-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\UserProfileEngagement" -Force
    }
    New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\UserProfileEngagement" -Name "ScoobeSystemSettingEnabled" -PropertyType "DWORD" -Value "0" -Force

        #Do not offer tailored experiences based on the diagnostic data setting
        New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Privacy" -Name "TailoredExperiencesWithDiagnosticDataEnabled" -PropertyType "DWORD" -Value "0" -Force

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
        if (-not (Test-Path -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People")) {
            New-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" -Force
        }
        New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" -Name "PeopleBand" -PropertyType "DWORD" -Value "0" -Force

        #Hide "3D Objects" in explorer
        if (-not (Test-Path -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{ 31C0DD25-9439-4F12-BF41-7FF4EDA38722 }\PropertyBag")) {
            New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{ 31C0DD25-9439-4F12-BF41-7FF4EDA38722 }\PropertyBag" -Force
        }
        New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{ 31C0DD25-9439-4F12-BF41-7FF4EDA38722 }\PropertyBag" -Name "ThisPCPolicy" -PropertyType "String" -Value "Hide" -Force

        #Verbose BSoD
        New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\CrashControl" -Name "DisplayParameters" -PropertyType "DWORD" -Value "1" -Force

        #Enable Sandboxing for Windows Defender
        setx /M MP_FORCE_USE_SANDBOX 1

        # Dismiss Microsoft Defender offer in the Windows Security about signing in Microsoft account
        New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows Security Health\State" -Name "AccountProtection_MicrosoftAccount_Disconnected" -PropertyType "DWORD" -Value "1" -Force

        #Enable PowerShell Module Logging
        if (-not (Test-Path -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ModuleLogging\ModuleNames")) {
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ModuleLogging\ModuleNames" -Force
            }
            New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ModuleLogging" -Name "EnableModuleLogging" -PropertyType "DWORD" -Value "1" -Force
            New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ModuleLogging\ModuleNames" -Name "*" -PropertyType "String" -Value "*" -Force

            #Enable Windows Sandbox
            if (Get-WindowsEdition -Online | Where-Object -FilterScript { $_.Edition -eq "Professional" -or $_.Edition -like "Enterprise*" }) {
                # Checking whether x86 virtualization is enabled in the firmware
                if ((Get-CimInstance -ClassName CIM_Processor).VirtualizationFirmwareEnabled -eq $true) {
                    Enable-WindowsOptionalFeature -FeatureName Containers-DisposableClientVM -All -Online -NoRestart
                }
                else {
                    try {
                        # Determining whether Hyper-V is enabled
                        if ((Get-CimInstance -ClassName CIM_ComputerSystem).HypervisorPresent -eq $true) {
                            Enable-WindowsOptionalFeature -FeatureName Containers-DisposableClientVM -All -Online -NoRestart
                        }
                    }
                    catch [System.Exception] {
                        Write-Error -Message $Localization.EnableHardwareVT -ErrorAction SilentlyContinue
                    }
                }
            }
        }
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

Start-Job -Name "Installing Browsers" -Scriptblock {
  Write-Host "Installing Browsers"
  choco install googlechrome firefox microsoft-edge
}

Start-Job -Name "Installing Administrative, Networking, and Security Tools " -Scriptblock {
  Write-Host "Installing Administration Tools"
  choco install driverbooster
  
  Write-Host "Installing Logging Tools"
  choco install sysmon
  
  Write-Host "Installing Terminals"
  choco install powershell4 powershell powershellhere-elevated powershell.portable microsoft-windows-terminal
}

Start-Job -Name "Installing Dev Tools" -Scriptblock {
  Write-Host "Installing Java"
  choco install jre8 openjdk openjdk.portable
}
 
Start-Job -Name "Installing Other Tools and Software" -Scriptblock {
  Write-host "Installing PatchMyPCHome"
  choco install patch-my-pc --ignore-checksum

  Write-host "Installing Media Software"
  choco install vlc

  Write-Host "Installing Document Readers and Editors"
  choco install adobereader onlyoffice joplin
  
  Write-Host "Installing Misc."
  choco install 7zip.install
}

Start-Job -Name "Configuring Windows - Optimizations And Debloating" -ScriptBlock {
  Write-Host "Configuring Windows - Optimizations, Debloating, and Hardening"
  New-Item "C:\" -Name "temp" -ItemType "directory" -Force
  Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://simeononsecurity.ch/scripts/windowsoptimizeanddebloat.ps1'))
}

Start-Job -Name "Customizations" -ScriptBlock {
  #Set Screen Timeout to 15 Minutes
  powercfg -change -monitor-timeout-ac 15

  Write-Host "Enable Darkmode"
  New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Force | Out-Null
  New-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name AppsUseLightTheme -Type "DWORD" -Value "00000000" -Force | Out-Null
  New-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name SystemUsesLightTheme -Type "DWORD" -Value "00000000" -Force | Out-Null
  New-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name ColorPrevalence -Type "DWORD" -Value "00000000" -Force | Out-Null
  New-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name EnableTransparency -Type "DWORD" -Value "00000001" -Force | Out-Null
  Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name AppsUseLightTheme -Type "DWORD" -Value "00000000" -Force | Out-Null
  Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name SystemUsesLightTheme -Type "DWORD" -Value "00000000" -Force | Out-Null
  Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name ColorPrevalence -Type "DWORD" -Value "00000000" -Force | Out-Null
  Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name EnableTransparency -Type "DWORD" -Value "00000001" -Force | Out-Null

  Write-Host "Setting OEM Information"
  Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation" -Name Manufacturer -Type String -Value "SimeonOnSecurity" -Force
  Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation" -Name Model -Type String -Value "Super Secure Super Optimized PC" -Force
  Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation" -Name SupportHours -Type String -Value "0800-1800 Central" -Force
  Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation" -Name SupportPhone -Type String -Value "1-800-555-1234" -Force
  Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation" -Name SupportURL -Type String -Value "https://simeononsecurity.ch" -Force
  Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation" -Name HelpCustomized -Type DWORD -Value "0" -Force

  Write-Host "Setting Registered Information"
  Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation" -Name RegisteredOwner -Type String -Value "SimeonOnSecurity" -Force
  Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation" -Name RegisteredOrganization -Type String -Value "SimeonOnSecurity" -Force

  #Clear Start Menu
  #https://github.com/builtbybel/privatezilla/blob/master/scripts/Unpin%20Startmenu%20Tiles.ps1
  $START_MENU_LAYOUT = @"
<LayoutModificationTemplate xmlns:defaultlayout="http://schemas.microsoft.com/Start/2014/FullDefaultLayout" xmlns:start="http://schemas.microsoft.com/Start/2014/StartLayout" Version="1" xmlns:taskbar="http://schemas.microsoft.com/Start/2014/TaskbarLayout" xmlns="http://schemas.microsoft.com/Start/2014/LayoutModification">
    <LayoutOptions StartTileGroupCellWidth="6" />
    <DefaultLayoutOverride>
        <StartLayoutCollection>
            <defaultlayout:StartLayout GroupCellWidth="6" />
        </StartLayoutCollection>
    </DefaultLayoutOverride>
</LayoutModificationTemplate>
"@
  $layoutFile = "C:\Windows\StartMenuLayout.xml"

  #Delete layout file if it already exists
  If (Test-Path $layoutFile) {
    Remove-Item $layoutFile
  }
  #Creates the blank layout file
  $START_MENU_LAYOUT | Out-File $layoutFile -Encoding ASCII
  $regAliases = @("HKLM", "HKCU")
  #Assign the start layout and force it to apply with "LockedStartLayout" at both the machine and user level
  foreach ($regAlias in $regAliases) {
    $basePath = $regAlias + ":\SOFTWARE\Policies\Microsoft\Windows"
    $keyPath = $basePath + "\Explorer" 
    IF (!(Test-Path -Path $keyPath)) { 
      New-Item -Path $basePath -Name "Explorer"
    }
    Set-ItemProperty -Path $keyPath -Name "LockedStartLayout" -Value 1
    Set-ItemProperty -Path $keyPath -Name "StartLayoutFile" -Value $layoutFile
  }
  #Restart Explorer, open the start menu (necessary to load the new layout), and give it a few seconds to process
  Stop-Process -Force -name explorer
  Start-Sleep -s 5
  $wshell = New-Object -ComObject wscript.shell; $wshell.SendKeys('^{ESCAPE}')
  Start-Sleep -s 5
  #Enable the ability to pin items again by disabling "LockedStartLayout"
  foreach ($regAlias in $regAliases) {
    $basePath = $regAlias + ":\SOFTWARE\Policies\Microsoft\Windows"
    $keyPath = $basePath + "\Explorer" 
    Set-ItemProperty -Path $keyPath -Name "LockedStartLayout" -Value 0
  }
  #Restart Explorer and delete the layout file
  Stop-Process -Force -name explorer
  #Uncomment the next line to make clean start menu default for all new users
  Import-StartLayout -LayoutPath $layoutFile -MountPath $env:SystemDrive\
  Remove-Item $layoutFile

  Write-Host "Disabling Action Center..."
  If (!(Test-Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Explorer")) {
    New-Item -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Explorer" | Out-Null
  }
  Set-ItemProperty -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Explorer" -Name "DisableNotificationCenter" -Type DWord -Value 1
  Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\PushNotifications" -Name "ToastEnabled" -Type DWord -Value 0
}

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
#https://chocolatey.org/install
    choco install 7zip.install
    choco install adobereader
    choco install apimonitor
    choco install bleachbit.install
    choco install ccleaner
    choco install chromium
    choco install cpu-z.install
    choco install curl
    choco install defraggler
    choco install discord.install
    choco install dotnetfx
    choco install emsisoft-emergency-kit
    choco install etcher
    choco install firefox
    choco install flashplayerplugin
    choco install geforce-experience
    choco install gh
    choco install git.install
    choco install github-desktop
    choco install git-lfs
    choco install git-lfx
    choco install googlechrome
    choco install googledrive
    choco install gpu-z
    choco install greenshot
    choco install hosts.editor
    choco install hwinfo.install
    choco install javaruntime
    choco install jdk11
    choco install jre8
    choco install lockhunter
    choco install microsoft-edge
    choco install microsoft-visual-cpp-build-tools
    choco install microsoft-windows-terminal
    choco install nmap
    choco install nodejs.install
    choco install nomacs
    choco install notepadplusplus.install
    choco install notepadplusplus.install 
    choco install openjdk 
    choco install openjdk.portable
    choco install openjdk11
    choco install openvpn
    choco install pip
    choco install postman
    choco install powershell.portable 
    choco install powershell4
    choco install powershellhere-elevated 
    choco install processhacker
    choco install procexp
    choco install procmon
    choco install python2
    choco install python3
    choco install qbittorrent
    choco install r.project
	choco install recuva
    choco install rufus
    choco install rufus.install
    choco install speccy
    choco install steam
    choco install sudo
    choco install sysinternals
    choco install sysmon
    choco install teamviewer
    choco install tor-browser
    choco install veracrypt
    choco install visualstudio2019community
    choco install vlc
    choco install vscode
    choco install wget
    choco install windirstat
    choco install winlogbeat
    choco install wireshark
    choco install yumi
    choco install zap
    choco install zoom
    choco install visualstudio2017-powershelltools
    choco install vscode-ruby vscodium vscode-ansible vscode-python chocolatey-vscode vscode-prettier vscode-java vscode-yaml vscode-haskell vscode-mongo vscode-beautify vscode-intellicode vscode-pull-request-github vscode-kubernetes-tools vscode-autofilename vscode-codespellchecker vscode-icons vscode-csharp dsc.powershellcommunity

# Windows Update
#	choco Install PSWindowsUpdate
#	Get-WindowsUpdate
#	Install-WindowsUpdate
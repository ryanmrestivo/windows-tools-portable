# If this script isn't working, you should:
# Open PowerShell at this file location as admin
# Set-ExecutionPolicy unrestricted
# confirm
# ./choco-setup.ps1

# NOTE:  Run this script before doing any hardening or these installs will take substantially longer


Set-ExecutionPolicy unrestricted -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
# refreshenv
	refreshenv

# Set PowerShell execution policy for the current process to unrestricted
Set-ExecutionPolicy unrestricted -Scope Process -Force

# Set Security Protocol
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072

# Function to install a Chocolatey package and validate installation
function Install-ChocoPackage {
    param (
        [string]$packageName
    )
    try {
        # Installing Chocolatey package
        Write-Host "Installing $packageName..."
        choco install $packageName -y
        # Validating installation
        if (Get-Command $packageName -ErrorAction SilentlyContinue) {
            Write-Host "$packageName installed successfully."
        } else {
            Write-Host "Unable to validate installation of $packageName."
        }
    } catch {
        Write-Host "Error occurred while installing $packageName."
    }
}

# Installing Chocolatey if not already installed
try {
    iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
} catch {
    Write-Host "Error occurred while installing Chocolatey."
}

# Refresh environment variables
refreshenv

# Install winget using Chocolatey
Install-ChocoPackage -packageName "winget"

# Install Oh-My-Posh using winget and setup the configuration
try {
    winget install JanDeDobbeleer.OhMyPosh -s winget
    oh-my-posh init pwsh --config 'C:\Users\admin\AppData\Local\Programs\oh-my-posh\themes\montys.omp.json' | Invoke-Expression
    New-Item -Path $PROFILE -Type File -Force
} catch {
    Write-Host "Error occurred while installing Oh-My-Posh."
}

# List of Chocolatey packages to install
$chocoPackages = @(
    '7zip.install',
    'adobereader',
    'cmder',
    'curl',
    'discord.install',
    'docker-desktop',
    'dotnetfx',
    'ecm',
    'everything',
    'firefox',
    'geforce-experience',
    'gh',
    'git.install',
    'github-desktop',
    'git-lfs',
    'googlechrome',
    'greenshot',
    'hosts.editor',
    'javaruntime',
    'jdk11',
    'jre8',
    'lockhunter',
    'microsoft-edge',
    'nmap',
    'nodejs.install',
    'nomacs',
    'notepadplusplus.install',
    'onionshare',
    'openjdk',
    'openjdk11',
    'powershellhere-elevated',
    'processhacker',
    'protonvpn',
    'python',
    'pip',
    'qbittorrent',
    'rustdesk',
    'tor-browser',
    'vlc',
    'wget',
    'zoom',
    'visualstudio-installer',
    'visualstudio2022community'
)

# Install each Chocolatey package from the list
foreach ($package in $chocoPackages) {
    Install-ChocoPackage -packageName $package
}

# Install additional Python packages using pip
try {
    pip install poetry
    pip install windows-curses
    pip install glances
} catch {
    Write-Host "Error occurred while installing Python packages."
}

# Windows Update

# Install and configure PSWindowsUpdate module for managing Windows updates
try {
    Install-Module -Name PSWindowsUpdate -Force
    Get-Package -Name PSWindowsUpdate
    get-command -module PSWindowsUpdate
    # Fetch and install available Windows updates
    Get-WindowsUpdate
    Get-WindowsUpdate -AcceptAll -Install -AutoReboot
} catch {
    Write-Host "Error occurred while handling Windows updates."
}

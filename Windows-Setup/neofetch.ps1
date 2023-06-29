# Script Name: scoop-setup.ps1
# Description: This script is used to automate the setup of development tools using Scoop package manager. It should not be run as an administrator.
# Optional: Needed to run a remote script the first time
# Set-ExecutionPolicy RemoteSigned -Scope CurrentUser 

# Set PowerShell execution policy for the current user to RemoteSigned to allow running of remote scripts
try {
    Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
} catch {
    Write-Host "Error occurred while setting the execution policy. Please make sure you're not running the script as an administrator."
    exit 1
}

# Install Scoop package manager if not already installed
if (-not (Get-Command scoop -ErrorAction SilentlyContinue)) {
    try {
        irm get.scoop.sh | iex
    } catch {
        Write-Host "Error occurred while installing Scoop."
        exit 1
    }
} else {
    Write-Host "Scoop is already installed."
}

# Function to install a Scoop package and validate installation
function Install-ScoopPackage {
    param (
        [string]$packageName
    )
    try {
        # Installing Scoop package
        Write-Host "Installing $packageName..."
        scoop install $packageName
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

# Add the main bucket to Scoop
try {
    scoop bucket add main
} catch {
    Write-Host "Error occurred while adding the main bucket."
}

# List of Scoop packages to install
$scoopPackages = @(
    'git',
    'neofetch'
)

# Install each Scoop package from the list
foreach ($package in $scoopPackages) {
    Install-ScoopPackage -packageName $package
}

# Update Scoop
try {
    Write-Host "Updating Scoop..."
    scoop update
    Write-Host "Scoop updated successfully."
} catch {
    Write-Host "Error occurred while updating Scoop."
}
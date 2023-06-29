Write-Host "Glances Web Interface Setup" -ForegroundColor Cyan
Write-Host ""

# Check if Glances is installed
try {
    $glancesVersion = & glances --version
    Write-Host "Glances is already installed (version: $glancesVersion)." -ForegroundColor Green
} catch {
    # Installing Glances
    Write-Host "Glances not found. Installing Glances..." -ForegroundColor Yellow
    & pip install glances
    Write-Host "Glances installed successfully!" -ForegroundColor Green
}
Write-Host ""

# Setting system variables to Python executable folder
# You might need to provide the actual path if it's not set already
Write-Host "Setting system variables..." -ForegroundColor Yellow
$env:Path += ";C:\Python311\Scripts"
Write-Host "System variables set successfully!" -ForegroundColor Green
Write-Host ""

# Displaying IP Configuration
Write-Host "IP Configuration:" -ForegroundColor Yellow
ipconfig | Select-String "IPv4"
Write-Host ""
Write-Host "To view Glances web interface, enter the above IPv4 Address followed by :61208 in your browser. For example: http://192.168.1.2:61208" -ForegroundColor Yellow
Write-Host ""

# Starting Glances in normal mode
Write-Host "Starting Glances..." -ForegroundColor Yellow
Start-Process PowerShell -ArgumentList "-NoProfile -Command & {C:\Python311\Scripts\glances.exe}"

# Starting Glances in web server mode
Write-Host "Starting Glances in web server mode..." -ForegroundColor Yellow
Start-Process PowerShell -ArgumentList "-NoProfile -Command & {C:\Python311\Scripts\glances.exe -w}"

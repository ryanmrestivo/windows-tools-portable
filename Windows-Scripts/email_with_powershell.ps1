param(
    [string]$From,
    [string]$To,
    [string]$Attachment,
    [string]$Subject,
    [string]$Body,
    [string]$SMTPServer,
    [int]$SMTPPort
)

# Prompt for credentials
$Creds = Get-Credential -Message "Please enter your email credentials"

# Validate From and To email addresses
if (-not $From) {
    $From = Read-Host -Prompt 'Enter the sender email address'
}
if ($From -notmatch "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$") {
    Write-Host "Error: Invalid sender email address."
    exit 1
}

if (-not $To) {
    $To = Read-Host -Prompt 'Enter the recipient email address'
}
if ($To -notmatch "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$") {
    Write-Host "Error: Invalid recipient email address."
    exit 1
}

# Input for Subject and Body
if (-not $Subject) {
    $Subject = Read-Host -Prompt 'Enter the subject of the email'
}

if (-not $Body) {
    $Body = Read-Host -Prompt 'Enter the body of the email'
}

# SMTP Server and Port from configuration file or use default values
$defaultSMTPServer = "smtp.gmail.com"
$defaultSMTPPort = 587

if (-not $SMTPServer -or -not $SMTPPort) {
    if (Test-Path 'config.json') {
        $config = Get-Content 'config.json' | ConvertFrom-Json
        $SMTPServer = $config.SMTPServer
        $SMTPPort = $config.SMTPPort
    } else {
        $SMTPServer = $defaultSMTPServer
        $SMTPPort = $defaultSMTPPort
    }
}

# Send email
try {
    if (-not [string]::IsNullOrWhiteSpace($Attachment)) {
        if (-not (Test-Path $Attachment)) {
            Write-Host "Error: Attachment file not found."
            exit 1
        }
    }
    
    Send-MailMessage -From $From -To $To -Subject $Subject `
    -Body $Body -SmtpServer $SMTPServer -Port $SMTPPort -UseSsl `
    -Credential $Creds -Attachments $Attachment
    Write-Host "Email sent successfully."
} catch {
    Write-Host "Error sending email: $_"
}

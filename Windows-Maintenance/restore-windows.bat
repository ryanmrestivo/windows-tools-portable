:: If this script isn't working, run in PowerShell.

sfc /scannow && DISM.exe /Online /Cleanup-image /Scanhealth && DISM.exe /Online /Cleanup-image /Restorehealth
Write-Output "Step 1: Click the iCloud icon on the system tray, and then click Open iCloud Settings to bring up the iCloud app." 
Write-Output "Step 2: Uncheck the box next to iCloud Drive, and then click Apply." 
Write-Output "Step 3: Click Delete From PC on the confirmation box."
Write-Output "	This will delete all downloaded iCloud Drive files and folders from your computer."
Write-Output "Exit the iCloud app."
Write-Output "Step 4: Create a new folder within the partition you want to change the iCloud Drive storage location to."
Write-Output "	You can insert any name, but I prefer naming it to 'iCloud Drive' to prevent confusion."
Write-Output "Step 5: Change this script to match your needs cmd /c mklink /J “C:\Users\username\iCloudDrive” “D:\iCloud\iCloud Drive”"
 
#Changeme cmd /c mklink /J "C:\Users\username\iCloudDrive" "D:\iCloud\iCloud Drive"

pause

File: README.TXT for Windows 11 Debloater Tool (Version 1.0) from www.FreeTimeTech.com
Based on 2 PowerShell Scripts (1) Chris Titus Tech GitHub PowerShell Scripts (2020-21): https://github.com/ChrisTitusTech/win10script
and (2) farag2 Sophia Script for Windows GitHub PowerShell Scripts (2021): https://github.com/farag2/Sophia-Script-for-Windows

►Link: https://freetimetech.com/windows-11-debloater-tool-debloat-gui/
►YouTube: Coming Soon!

Check our Windows 10 Debloater from www.FreeTimeTech.com website: 
►Link: http://freetimetech.com/windows-10-clean-up-debloat-tool-by-ftt/

Check our other version of Windows 10/11 Debloater called 'Sophia Script for Windows' on BenchTweakGaming.com website: 
►Link: https://benchtweakgaming.com/2020/10/27/windows-10-debloat-tool/
This other version is made in collaboration with farag2 (Dmitry Nefedov).

INTRODUCTION
------------
Please read this document to understand how to use this program.

There is a 'EZ Debloater' tab page as main front of the program. It allows you to run common
PowerShell scripts to debloat Windows 11. There are several restore/undo scripts you can choose from 
after if you choose. Some buttons in the 'EZ Debloater' tab page has ToolTips (message popups) for 
more information.

Each button has a script you can see to modify if you want before running.

The other tabs allows you to create a PowerShell script file that you can run to finely tweak/'Debloat' 
Windows 11.

The options are arranged in different tabs and there is a preset 'Debloat Preset' in the Options menu. 
You can choose a preset first and add your own choices. There is a 'Windows Default Preset' to revert
back to Windows Default setttings. You can also create your own radiobutton presets and share. There 
is also a 'Opposite' menu choice to select the alternate radiobutton choices. This is good to revert 
the changes in a script to run.

You can directly run the PowerShell script from the program after creating your script.
Click the 'Run Powershell' button after you fill in the radiobutton choices and click the 
'Output PowerShell' button. The "Run PowerShell" button creates a PowerShell script called
'runpsscript.ps1' in the same directory and runs it.

OR save the PowerShell script as whatever you wish in the same directory with the other files then 
run it using the following commands.

But first, launch PowerShell (Run as administrator) and navigate to where your script is.

1. Set-ExecutionPolicy Unrestricted 
2. ./YOUR_SCRIPT_NAME.ps1

YOUR_SCRIPT_NAME is the name of the PowerShell script you just saved.

FILES
-----
There needs to be 8 files for this program to run properly.

►Windows11Debloater.exe : The GUI program.
►ezdebloater.txt : contains the PowerShell scripts for the 'EZDebloater' tab page.
►data.txt : 	contains the options(function names) to select from (usually only 2 
		options that something is Enable or Disable). Notice the sections 
		and how a comma and double quotes separate them. The last option in 
		each section does not have a comma. Add or substract from the set.
►functions.txt : contains the complete functions named from data.txt. These are the 
		commands that get run. Add or substract from the set.
►debloatpreset.txt : contains debloat preset. Click this option from the menu in program.
►defaultpreset.txt : contains default preset. Click this option from the menu in program.
►tooltips.txt :	Contains ToolTips for each radiobutton option. In English.

►ooshutup10.cfg : O&O ShutUp10 config for silent install.

►README.txt : This text file for information and link resources.
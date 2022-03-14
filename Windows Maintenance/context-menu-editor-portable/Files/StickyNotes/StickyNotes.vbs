'www.sordum.org - Velociraptor & BlueLife - 29.06.2021

Set objWMIService = GetObject("winmgmts:{impersonationLevel=impersonate}!\\.\root\cimv2")
Set colOperatingSystems = objWMIService.ExecQuery ("Select * from Win32_OperatingSystem")
Set WshShell = WScript.CreateObject("Shell.Application")

For Each objOperatingSystem in colOperatingSystems
	if instr(objOperatingSystem.Caption, "Windows 10") Or instr(objOperatingSystem.Caption, "Windows 11") Then
		WshShell.ShellExecute "shell:Appsfolder\Microsoft.MicrosoftStickyNotes_8wekyb3d8bbwe!App"
	Else
		StikyNotPath = WScript.CreateObject("Wscript.Shell").ExpandEnvironmentStrings("%SystemRoot%\system32\StikyNot.exe")
		WshShell.ShellExecute StikyNotPath
	End If
Next

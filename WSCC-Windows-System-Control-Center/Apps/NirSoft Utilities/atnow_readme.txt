***********************************
AtNow v1.1
Copyright (c) 2002 - 2004 Nir Sofer

Web site: http://nirsoft.mirrorz.com
***********************************

Description
===========
AtNow is a command-line utility that schedules programs and commands to run in the near future.
By default, the commands are executed within 70 seconds or less from the moment that you run the AtNow utility with the desired command. 


Syntax
======
AtNow [\\ComputerName] [Delay] [/interactive] "command" [parameters]

\\ComputerName 	Specifies a remote computer. If this parameter is omitted,
		the commands are executed on the local computer

Delay		Specifies when the command is to run, expressed as a number of seconds from the current time. 
		The default is 70 seconds. In most cases, you should not change this value (See the notice below)
		Notice: In most systems, there is a nasty bug in Microsoft Scheduler Service:
		When you schedule a command for a specific time, the seconds in the scheduled time are always truncated. 
		For example: if a command is scheduled to execute at 16:35:32, it'll actually be executed at 16:35:00.
		Due to this bug, the delay value must be greater than 60 seconds. Otherwise, the command might not be executed.
 

/interactive	If this parameter is specified, the executed program can
		interact with the desktop of user who is currently logged on.
		(Similar to /interactive parameter in AT command) 

"command"	Specifies the Windows NT command or program. If the command
		contains space characters, you must enclose the command with quotes.


Parameters	Specifies the parameters of the program.


Examples
========

AtNow \\COMP1 /interactive "c:\winnt\system32\regedt32.exe"
AtNow "c:\program files\cmds\cmd2.cmd"
AtNow "c:\program files\MySoft\test1.exe" /p /m

Remarks
========
* This utility is designed for Windows NT/2000/XP. You cannot run it on Windows 95/98/ME.
* Schedule Service must be running on the target computer in order to execute a command or a program.
* You must have administrative privilege on the target computer in order to execute commands. 
* This utility is similar to the Soon utility provided by Microsoft, but it has a few advantages over the Microsoft's utility:
  1. The AtNow utility is a standalone program. It doesn't use the at.exe as Microsoft's Soon utility does.
  2. The AtNow utility doesn't require any installation process. In contrast, the Soon utility has redundant installation process.
  3. The Soon utility doesn't work properly if the time setting of the remote computer is different from the time setting of the local computer. The AtNow utility always works properly, independently of the local time settings.



License
=======
This utility is released as freeware. You can freely use and distribute it.
If you distribute this utility, you must include all files in the distribution package including the readme.txt, without any modification !
 

Disclaimer
==========
The software is provided "AS IS" without any warranty, either expressed or implied,
including, but not limited to, the implied warranties of merchantability and fitness
for a particular purpose. The author will not be liable for any special, incidental,
consequential or indirect damages due to loss of data or any other reason. 


Feedback
========
If you have any problem, suggestion, comment, or you found a bug in my utility, you can send a message to nirsofer@yahoo.com

			
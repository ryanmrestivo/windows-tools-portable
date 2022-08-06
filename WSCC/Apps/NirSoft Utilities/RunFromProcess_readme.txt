

RunFromProcess v1.07
Copyright (c) 2011 - 2021 Nir Sofer
Web site: https://www.nirsoft.net



Description
===========

RunFromProcess is a command-line utility that allows you to run a program
from another process that you choose.
The program that you run will be executed as a child of the specified
process and it'll run with the same user and security context of the
specified parent process.



Versions History
================


* Version 1.07 - Fixed issue: RunFromProcess caused the parent process
  to crash if the process creation was very slow.
* Version 1.06 - Fixed bug: RunFromProcess failed with 'Error 2: The
  system cannot find the file specified.' if the process to run was
  enclosed with quotes.
* Version 1.05 - Added admin parameter, which allows you to easily
  execute RunFromProcess as administrator.
* Version 1.00 - First release.



Using RunFromProcess
====================

RunFromProcess requires 2 command-line parameters:
RunFromProcess.exe [Parent Process Name/ID] [Process To Run]

The first parameter is the process name (for example: myprocess.exe) or
process ID of the parent process that will run the program you need.
The second parameter is the full path filename of the program that you
want to run. You can also specify command-line parameters for the
specified program.

Optionally, you can specify 'nomsg' prefix before the 2 major parameters
if you want that RunFromProcess won't display any error message.


Optionally, you can specify 'admin' prefix before all other parameters if
you want to execute RunFromProcess as administrator.

Examples:
RunFromProcess.exe 761 c:\temp\myprog.exe
RunFromProcess.exe explorer.exe "c:\program files\abcd\mm.exe" 34 abc dd
RunFromProcess.exe nomsg explorer.exe "c:\software\soft.exe"
RunFromProcess.exe admin winlogon.exe "c:\software\soft.exe"




What you can do with this tool
==============================

Here's an example of what you can do with this tool:
when you run a program from the schedule service of Windows, the program
will run under a SYSTEM account, for example:
at 18:00 c:\software\myprogram.exe

If you want to run the program with the current logged-on user, you can
do it in this way:
at 18:00 c:\software\RunFromProcess.exe nomsg explorer.exe
c:\software\myprogram.exe

If you want to run a program with SYSTEM user, you can do it in this way:
(The admin parameter is needed to get admin rights on Windows Vista/7/8
when UAC is turned on)
RunFromProcess.exe admin winlogon.exe c:\windows\regedit.exe

If you execute the above command on Windows 7/Vista, RegEdit will be
opened with a SYSTEM account, and you'll be able to see all secret
Registry keys that are not available for any other user.



Using RunFromProcess on 64-bit system
=====================================

If you want to run a program from a 64-bit process, you should use the
x64 executable of RunFromProcess - RunFromProcess-x64.exe
In all other cases, you should use the 32-bit version of RunFromProcess
(RunFromProcess.exe)



Security Restrictions
=====================


* If you run the RunFromProcess utility without administrator
  privileges, you cannot execute a program from a process running with
  another user.



License
=======

This utility is released as freeware. You are allowed to freely
distribute this utility via floppy disk, CD-ROM, Internet, or in any
other way, as long as you don't charge anything for this and you don't
sell it as a part of commercial product. If you distribute this utility,
you must include all files in the distribution package, without any
modification !



Disclaimer
==========

The software is provided "AS IS" without any warranty, either expressed
or implied, including, but not limited to, the implied warranties of
merchantability and fitness for a particular purpose. The author will not
be liable for any special, incidental, consequential or indirect damages
due to loss of data or any other reason.



Feedback
========

If you have any problem, suggestion, comment, or you found a bug in my
utility, you can send a message to nirsofer@yahoo.com

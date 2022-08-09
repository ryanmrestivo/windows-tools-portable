


StartBlueScreen v1.00
Copyright (c) 2007 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

This utility, just as it sounds, allows your to crash the Windows
operating system by initiating a Blue Screen of Death according to 5
parameters that you specify from command-line.



How does it work ?
==================

StartBlueScreen.exe loads a very small device driver named
NirSoftBlueScreenDriver.sys that calls the crash API function of Windows
Kernel (KeBugCheckEx) with the 5 crash parameters that you specify in the
command-line.



System Requirements
===================

This utility works on Windows 2000, Windows XP, Windows Server 2003, and
Windows Vista (32-bit). Previous versions of Windows are not supported.
Also, you must login as Administrator in order to initiate a Blue Screen
of Death.



Using StartBlueScreen Utility
=============================

In order to get a blue screen, you must specify 5 parameters in the
command-line of StartBlueScreen.exe
Running StartBlueScreen.exe without specifying the 5 command-line
parameters won't crash your system.

The first parameter in the command-line specifies the Bug Check Code. You
can find the list of codes here. The other 4 parameters specifies the
additional Bug Check parameters that are displayed in the blue screen
crash. For all 5 parameters, you can specify a decimal number (e.g: 1234)
or an hexadecimal number (e.g: 0x04d2).
Here's a few examples:
StartBlueScreen.exe 0x10 0x1111 0x2222 0x3333 0x4444
StartBlueScreen.exe 25 30 1234 1111 2222
StartBlueScreen.exe 0x12 0 0 0 0



Notice:
=======

By default, when a blue screen crash is activated, Windows XP creates a
memory dump file and then immediately reboot the system, so you have a
very little time to view the blue screen. If you want to cancel the
automatic reboot after a crash, Right-click on 'My Computer', select
'Properties' , and then go to Advanced->Startup and Recovery, and uncheck
the "Automatically Restart" option.



License
=======

This utility is released as freeware. You are allowed to freely
distribute this utility via floppy disk, CD-ROM, Internet, or in any
other way, as long as you don't charge anything for this. If you
distribute this utility, you must include all files in the distribution
package, without any modification !



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

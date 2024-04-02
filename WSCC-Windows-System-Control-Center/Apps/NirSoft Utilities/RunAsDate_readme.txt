


RunAsDate v1.41
Copyright (c) 2007 - 2022 Nir Sofer
Web site: https://www.nirsoft.net



Description
===========

RunAsDate is a small utility that allows you to run a program in the date
and time that you specify. This utility doesn't change the current system
date and time of your computer, but it only injects the date/time that
you specify into the desired application.
You can run multiple applications simultaneously, each application works
with different date and time, while the real date/time of your system
continues to run normally.



How does it work ?
==================

RunAsDate intercepts the kernel API calls that returns the current date
and time (GetSystemTime, GetLocalTime, GetSystemTimeAsFileTime,
NtQuerySystemTime, GetSystemTimePreciseAsFileTime), and replaces the
current date/time with the date/time that you specify.



System Requirements
===================

RunAsDate works under Windows 2000, Windows XP, Windows Server 2003,
Windows Server 2008, Windows Vista, Windows 7, Windows 8, and Windows 10.
Older versions of Windows are not supported. There is also x64 version
available in a separated download, for using with x64 applications.

Important Notice !!
I get many email messages that say something like "I tried to extend the
trial period of xyz software with RunAsDate and it didn't work". Running
a software with different date/time can be used for many legitimate
purposes and for these purposes RunAsDate was created. I have never said
implicitly or explicitly that RunAsDate can be used for extending the
trial period of a software. For some shareware programs, RunAsDate might
really work, but many shareware creators are smart enough to detect that
the date/time was modified and when they detect the time change, they end
the trial period immediately.
Please don't bother yourself to send me a question about extending the
trial period of a software, because these kind of messages are simply
deleted without answering.



Versions History
================


* Version 1.41:
  o You can now attach to a process from command-line. You can
    specify the process filename or process ID, for example:
    RunAsDate.exe 25\04\2005 17:12:15 Attach:Outlook.exe
    RunAsDate.exe 25\04\2005 17:12:15 Attach:2756

* Version 1.40:
  o Added 'Attach To Process' option. Before using this feature, read
    this.

* Version 1.37:
  o Fixed bug: RunAsDate failed to work properly when using the
    32-bit and the 64-bit versions in the same time.
  o Also, the DLL file of RunAsDate is now deleted automatically when
    you close the main window of RunAsDate (If it's not locked).

* Version 1.36:
  o Added 'Run As Administrator' button to easily run RunAsDate as
    Administrator. You have to run RunAsDate as Administrator when the
    program you want to run with RunAsDate requires elevation.

* Version 1.35:
  o RunAsDate now displays an error message if you try to run 32-bit
    program with 64-bit version of RunAsDate or 64-bit program with
    32-bit version of RunAsDate.
  o RunAsDate now displays an error message if it fails to run the
    specified .exe file.
  o RunAsDate now also intercepts the NtQuerySystemTime and
    GetSystemTimePreciseAsFileTime API functions.
  o RunAsDate now also intercepts the date/time functions on
    kernelbase.dll (in addition to kernel32.dll). This change solves the
    issue with cmd.exe on Windows 10 (it uses the APIs on kernelbase.dll )

* Version 1.31:
  o Fixed bug: When a program executed with RunAsDate requested to
    get the current time in GMT (GetSystemTime and
    GetSystemTimeAsFileTime API), RunAsDate provided the wrong time with
    a difference of one hour if the computer date was in summer (With
    daylight saving time) but the selected RunAsDate date was in winter
    (Without daylight saving time) and vice versa...

* Version 1.30:
  o Added option to set the date/time relative to the current time.
    You can add (positive number) or subtract (negative number) the
    following time units: seconds, minutes, hours, days, months, and
    years.
  o Added 'Start in folder' option.
  o RunAsDate now saves the last settings to config file
    (RunAsDate.cfg)

* Version 1.21:
  o Fixed bug with 'Move the time forward according to the real time'
    option: After around 7 minutes from the time that the application was
    started, RunAsDate failed to calculate the time properly.

* Version 1.20:
  o Added 'Return to the current date/time after xx seconds' option.

* Version 1.16:
  o Fixed bug: RunAsDate removed a quote character when using it in
    the {Program parameters} section of the command-line string.

* Version 1.15:
  o Fixed RunAsDate to work properly on Windows 8 64-bit.

* Version 1.11:
  o Added Drag & Drop support: You can now choose the .exe file to
    run by dragging it from Explorer into the main window of RunAsDate.

* Version 1.10:
  o Added auto complete support in the filename field.
  o Added x64 version.

* Version 1.05:
  o Fixed bug: When using 'Create Desktop Shortcut', the /immediate
    and /movetime options were not added to the shortcut's command-line

* Version 1.04:
  o The main dialog-box is now resizable.

* Version 1.03:
  o Added 'Immediate Mode' - Change the date immediately when the
    program starts.

* Version 1.02:
  o New option: Move the time forward according to the real time.

* Version 1.01:
  o New option: Create a shortcut on your desktop that will run a
    program with the date/time that you specify.
  o When you don't specify the time in the command-line, the current
    time will be used, instead of 00:00:00.

* Version 1.00 - First release.



Using RunAsDate
===============

RunAsDate doesn't require any installation process or additional DLL
files. In order to start using it, simply copy the executable file
(RunAsDate.exe) to any folder you like, and run it.
In the main window of RunAsDate, select the desired date and time and the
application that you want to run. Optionally, you can also specify the
command-line parameters to run the program. Press the "Run" button to
start the application with the specified date/time.



Immediate Mode
==============

In versions prior to 1.03, RunAsDate always waited until the kernel was
fully loaded, and only then injected the desired date/time. This mean
that some programs that get the date/time im very early stage, received
the real current date/time, instead of the fake date/time of RunAsDate.
Starting from version 1.03, when the 'Immediate Mode' is turned on,
RunAsDate inject the date/time immediately when the process starts,
without waiting to the kernel loading. However, this mode can also cause
troubles to some applications, especially if they were written in .NET

If executing an application from RunAsDate cause it to crash, you should
turn off the 'Immediate Mode'.



Attach To Process
=================

Starting from version 1.40, RunAsDate allows you to attach a running
process, instead of creating a new one. After the dll of RunAsDate is
attached to the process, the process will see the current date/time
according to the settings you selected in the main window of RunAsDate.
In order to use this feature, select the desired date/time settings,
click the 'Attach To Process' , select the desired process, and then
click the 'Attach To Selected Process' button.

Before start using this feature, be aware:
* Currently, there is no option to detach from process.
* If you attach to a process more than once, the newer time settings
  will override the previous time settings. It's important to say that
  this tool is not designed for attaching a process multiple times. It's
  just a side effect that may be useful for some people.
* When using the 'Attach To Process' feature, there is higher risk that
  the application will crash.
* It's highly recommended to avoid from attaching a system process or
  critical process.
* In order to attach a 64-bit process, you have to use the 64-bit
  version of RunAsDate.
* In order to attach an elevated process, you have to run the RunAsDate
  tool as Administrator.



Using RunAsDate from Command-Line
=================================

You can also use RunAsDate from command-line, with the following syntax:
RunAsDate.exe {/immediate} {/movetime} {/startin [folder]} {/returntime
[seconds] } [dd\mm\yyyy] {hh:mm:ss} [Program to run] {Program parameters}

Examples:
RunAsDate.exe 22\10\2002 12:35:22 "C:\Program Files\Microsoft
Office\OFFICE11\OUTLOOK.EXE"
RunAsDate.exe 14\02\2005 "c:\temp\myprogram.exe" param1 param2
RunAsDate.exe /movetime 11\08\2004 16:21:42 "C:\Program Files\Microsoft
Office\OFFICE11\OUTLOOK.EXE"
RunAsDate.exe /movetime /returntime 15 10\12\2001 11:41:26
"c:\temp\myprogram.exe"
RunAsDate.exe Hours:-10 "C:\Program Files\Microsoft
Office\OFFICE11\OUTLOOK.EXE"
RunAsDate.exe 22\03\2008 10:10:25 Attach:Outlook.exe
RunAsDate.exe 20\08\2003 20:20:45 Attach:2744



RunAsDate Limitations
=====================


* RunAsDate will not affect applications that take the current
  date/time from another source. For example: application that loads the
  current date from remote server.
* RunAsDate may cause some applications to crash.



Translating RunAsDate To Another Language
=========================================

RunAsDate allows you to easily translate all dialog-boxes and other
strings to other languages.
In order to do that, follow the instructions below:
1. Run RunAsDate with /savelangfile parameter:
   RunAsDate.exe /savelangfile
   A file named RunAsDate_lng.ini will be created in the folder of
   RunAsDate utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate the dialog-boxes and string entries to the desired
   language.
4. After you finish the translation, Run RunAsDate, and all translated
   strings will be loaded from the language file.
   If you want to run RunAsDate without the translation, simply rename
   the language file, or move it to another folder.



License
=======

This utility is released as freeware. You are allowed to freely
distribute this utility via floppy disk, CD-ROM, Internet, or in any
other way, as long as you don't charge anything for this. If you
distribute this utility, you must include all files in the distribution
package, without any modification !
Be aware that selling this utility as a part of a software package is not
allowed !



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

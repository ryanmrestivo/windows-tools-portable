


WinCrashReport v1.25
Copyright (c) 2011 - 2016 Nir Sofer
Web site: http://www.nirsoft.net/utils/application_crash_report.html



Description
===========

WinCrashReport provides an alternative to the built-in crash reporting
program of Windows operating system. When application crashes in your
system and Windows displays the internal crash window of the operating
system, you can run WinCrashReport, and get extensive report about the
crashed application. The crash report of WinCrashReport is displayed as
simple text or in HTML, and includes the following information: Crash
memory address, Exception code, Exception description, Strings found in
the stack, call stack, processor registers, modules list, threads list,
and more...



System Requirements And Limitations
===================================


* This utility work on any version of Windows, starting from Windows
  2000 and up to Windows 10.
* If the crashed application is 32-bit, you should use the 32-bit
  version of WinCrashReport. If the crashed application is 64-bit, you
  should use the 64-bit version of WinCrashReport.
* On Windows 7/2008/Vista/8: If the crashed application is running with
  administrator privilege, you must execute WinCrashReport with 'Run As
  Administrator' in order to get the crash report about this application.
* in some circumstances, a program may crash without displaying any
  crash window (The program simply disappears from the screen), in these
  cases, WinCrashReport won't be able the create a crash report.



Versions History
================


* Version 1.25:
  o Added R8 - R15 processor registers to the 64-bit crash report.
  o Fixed bug: WinCrashReport freezed if the crashed thread had a
    very large stack.
  o Changed the default report type to HTML.

* Version 1.23:
  o Fixed bug: WinCrashReport failed to remember the last
    size/position of the main window if it was not located in the primary
    monitor.
  o Added 'Run As Administrator' option (Ctrl+F11), which allows you
    to easily run WinCrashReport as administrator on Windows
    Vista/7/8/2008.

* Version 1.22:
  o Added 'Always On Top' option.
  o The path of the selected crashed .exe file is now displayed in
    the window title.

* Version 1.21:
  o Added /ShowInternalExceptions command-line option.

* Version 1.20:
  o Added 64-bit build of WinCrashReport to generate a crash report
    for 64-bit programs.

* Version 1.15:
  o Added option to generate a crash report from command-line, for
    example:
    WinCrashReport.exe /SaveReport html c:\temp\crash.html

* Version 1.10:
  o Added 'Start As Hidden' option. When this option and 'Put Icon On
    Tray' option are turned on, the main window of WinCrashReport will be
    invisible on start.

* Version 1.05:
  o Added 'Put Icon On Tray' option.

* Version 1.00 - First release.



WinCrashReport vs Crash Reporting of Windows
============================================

The crash reporting window of Windows operating system is confusing and
behaves differently from one version of Windows to another. Here's the
description of Windows crash reporting module on different versions of
Windows:
* On Windows 2000, 'Application Error' window is displayed with very
  little information about the crash, and ask you to click Ok to
  terminate the application. If a debugger is installed, it also allows
  you to debug the crashed program, by pressing the cancel button.



* On Windows XP, a crash window with the following message is
  displayed: "abcd.exe has encountered a problem and needs to close. We
  are sorry for the inconvenience."
  the crash window offers the user to send the crash report to Microsoft,
  which is somewhat silly, because most of the application crashes are
  caused by 3-party software, and Microsoft won't be able to fix them.
  This crash window also allows you to view the crash report, but there
  is no any easy way to save the report into a file, and copy/paste of
  the report doesn't work either.



* On Windows 7/2008/Vista, the crash window of the operating system
  allows you to view some information about the crash, by clicking the
  'View Problem Details' link, but the crash report is not extensive as
  the report of Windows XP. It also offers you to check for solution for
  the crash problem in the online database of Microsoft.

  The crash module of Windows 7/2008/Vista, known as the 'Windows Error
  Reporting' (WER), also saves every crash report as simple text file
  into the user profile, at
  C:\Users\[profile]\AppData\Local\Microsoft\Windows\WER\ReportArchive .




As opposed to Microsoft crash reporting module, WinCrashReport allows you
to get the same report format for all versions of Windows, starting from
Windows 2000 and up to Windows 7. It also allows you to easily save the
crash report into text file or HTML file.
Be aware that for now, WinCrashReport doesn't replace the existing crash
module of Microsoft and you have to manually run it when application
crash occurs on your system. It's possible that in future versions,
WinCrashReport will also provide an option to replace the existing crash
reporter of Microsoft.





Start Using WinCrashReport
==========================

WinCrashReport doesn't require any installation process or additional dll
files. When application crashes in your system, simply run the executable
of WinCrashReport (WinCrashReport.exe), and the crash report will be
displayed in the lower pane of WinCrashReport.
If the upper pane contains more than a single crash item, you may need to
choose the correct crash item. Also, if you don't see any crash item in
the upper pane, you may try to turn on the 'Show Internal Exceptions'
option (Under the Options menu), and then try to locate the right crash
item.

By default, WinCrashReport displays the report in simple text only, but
you can easily switch to HTML report mode by pressing F8. Be aware that
HTML report mode is much slower than the text report mode.

You can also save the report into text or html file, by using the 'Save
This Crash Report' option (Ctrl+S)



About The Crash Report of WinCrashReport
========================================

Every crash report created by WinCrashReport contains the following
sections:
* General Exception Information: Provides general information about the
  crash, including the date/time that the report was generated, the full
  path of the crashed application, the process/thread ID that caused the
  crash, product name/version/company of the crashed application, crash
  address, exception code, exception description, and exception
  parameters.
* Strings in the stack: Provides a list of all strings (Ascii and
  Unicode) found in the stack of the crashed application. Looking at
  these strings may give you a clue for locating the the cause of the
  crash.
* Call Stack (Method 1 + Method 2): Provides the call stack of the
  crashed application. WinCrashReport uses 2 different methods to locate
  the calls made by the application just before the crash.
* Processor Registers: Provides the values of common processor
  registers at the momemnt of the crash. If a processor register points
  to a memory address, WinCrashReport will display the content of the
  memory address.
* Modules List: Provides the list of all DLLs loaded into the crashed
  application. For every loaded module, the following information is
  displayed: module name, address range, module size, product name,
  product version, file version ,file description, company name, file
  size, file modified time, and full path of the dll.
* All Threads: Provides the list of all running threads in the crashed
  application. For every thread, the following information is displayed:
  Thread ID, start address, stack base, stack size, context switch count,
  status, priority, creation time, user time, and kernel time.
* Full Stack Data: Provides the list of all values found in the crashed
  application, at the moment of the crash.



Command-Line Options
====================



/SaveReport <Report Type> <Filename>
Locates the crashed application and generates a report as text or html
file.
For Example:
WinCrashReport.exe /SaveReport text c:\temp\crash1.txt
WinCrashReport.exe /SaveReport html c:\temp\crash1.html

/ShowInternalExceptions <0 | 1>
Specifies whether to show internal exceptions. 0 = No, 1 = Yes.



Translating WinCrashReport to other languages
=============================================

In order to translate WinCrashReport to other language, follow the
instructions below:
1. Run WinCrashReport with /savelangfile parameter:
   WinCrashReport.exe /savelangfile
   A file named WinCrashReport_lng.ini will be created in the folder of
   WinCrashReport utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run WinCrashReport, and all
   translated strings will be loaded from the language file.
   If you want to run WinCrashReport without the translation, simply
   rename the language file, or move it to another folder.



License
=======

This utility is released as freeware. You are allowed to freely
distribute this utility via floppy disk, CD-ROM, Internet, or in any
other way, as long as you don't charge anything for using this tool and
you don't sell it or distribute it as a part of commercial product. If
you distribute this utility, you must include all files in the
distribution package, without any modification !



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

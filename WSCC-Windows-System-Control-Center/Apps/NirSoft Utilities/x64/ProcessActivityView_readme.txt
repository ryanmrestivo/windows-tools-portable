


ProcessActivityView v1.16
Copyright (c) 2008 - 2014 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

ProcessActivityView creates a summary of all files and folders that the
selected process tries to access. For each file that the process access,
the following information is displayed: Number of times that the file was
opened and closed, number of read/write calls, total number of read/write
bytes, the dll that made the last open-file call, and more...



System Requirements
===================

This utility works on Windows 2000, Windows XP, Windows Server 2003,
Windows Vista, Windows Server 2008, Windows 7, and Windows 8. Older
versions of Windows are not supported. There is a separated download for
x64 applications.



Versions History
================


* Version 1.16:
  o Fixed ProcessActivityView to avoid from BSOD when trying to
    attach to smss.exe (Be aware that ProcessActivityView will still fail
    to capture the smss.exe process)

* Version 1.15:
  o When ProcessActivityView fails to load a dll into the program you
    want to trace, it now displays the correct error code and error
    message of Windows, instead of error 65535.

* Version 1.13:
  o When you try to trace 32-bit program from ProcessActivityView
    64-bit, it now clearly instructs you to use the 32-bit version of
    ProcessActivityView.

* Version 1.12:
  o Fixed issue: On systems with multiple monitors, the dialog-boxes
    of ProcessActivityView opened in the wrong monitors, instead of the
    monitor where the main window is located.

* Version 1.11:
  o Fixed bug: On some Windows 7 systems, ProcessActivityView failed
    to attach a process or to created a new process and crashed it.

* Version 1.10:
  o ProcessActivityView now works properly with Windows 7.
  o Added x64 version to work with x64 applications.

* Version 1.06:
  o ProcessActivityView now automatically stops when the process that
    you inspect is terminated.
  o ProcessActivityView now remembers that last sort in select
    process dialog-box.

* Version 1.05:
  o Added command-line support
  o Added Drag & Drop support.

* Version 1.04:
  o New option: Open Selected File.
  o New option: Copy Filename String.

* Version 1.03:
  o Added option to start a new process.

* Version 1.02:
  o Removed the automatic requirement to run as admin under Vista.

* Version 1.01:
  o Fixed bug: The handle of helper dll remained opened after
    detaching from the inspected process.
  o Fixed bug: IE7 in Vista crashed when detaching from the IE
    process.

* Version 1.00 - First release.



Using ProcessActivityView
=========================

ProcessActivityView doesn't require any installation process or
additional dll files. In order to start using it, simply run the
executable file - ProcessActivityView.exe
After running it, select the process that you want to inspect, and click
Ok. After clicking Ok, ProcessActivityView will start to display the
information about any file that is opened by the selected process.



Using ProcessActivityView In Windows Vista
==========================================

ProcessActivityView can work in Vista even when UAC (User Account
Control) is turned on, as long as the process that you wish to inspect
run in the same account and security context of ProcessActivityView.
However, if you want to inspect a process that runs under administrator
account, you must also run ProcessActivityView as administrator.
(right-click on ProcessActivityView.exe and choose 'Run As Administrator')



How Does It Work ?
==================

After you select a process, ProcessActivityView inject a special helper
dll (ProcessActivityViewHelper.dll) into the selected process. This dll
intercepts the internal file I/O API of Windows, and sends the
information back to ProcessActivityView utility.



Command-Line Options
====================



/RunProcess <exe filename>
Run the specified process

/ProcessParams <parameters>
Specify parameters for the process that you run with /RunProcess.

/StartImmediately <0 | 1>
Specify the "Start Immediately" value (0 or 1).



Translating ProcessActivityView to other languages
==================================================

In order to translate ProcessActivityView to other language, follow the
instructions below:
1. Run ProcessActivityView with /savelangfile parameter:
   ProcessActivityView.exe /savelangfile
   A file named ProcessActivityView_lng.ini will be created in the folder
   of ProcessActivityView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run ProcessActivityView, and all
   translated strings will be loaded from the language file.
   If you want to run ProcessActivityView without the translation, simply
   rename the language file, or move it to another folder.



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

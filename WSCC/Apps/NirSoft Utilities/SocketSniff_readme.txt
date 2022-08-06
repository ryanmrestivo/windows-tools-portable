


SocketSniff v1.11
Copyright (c) 2008 - 2014 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

SocketSniff allows you to watch the Windows Sockets (WinSock) activity of
the selected process.
For each created socket, the following information is displayed: socket
handle, socket type, local and remote addresses, local and remote ports,
total number of send/receive bytes, and more. You can also watch the
content of each send or receive call, in Ascii mode or as Hex Dump.



System Requirements
===================

This utility works on Windows 2000, Windows XP, Windows Server 2003,
Windows Server 2008, Windows Vista, and Windows 7 (32-bit only). Older
versions of Windows are not supported. On x64 version of Windows,
SocketSniff can only work with 32-bit programs.



Versions History
================


* Version 1.11:
  o Fixed SocketSniff to avoid from BSOD when trying to attach to
    smss.exe (Be aware that SocketSniff will still fail to capture the
    smss.exe process)

* Version 1.10:
  o Added /Start command-line option, to start the socket capturing
    process from command-line.

* Version 1.08:
  o Fixed issue: On systems with multiple monitors, the dialog-boxes
    of SocketSniff opened in the wrong monitors, instead of the monitor
    where the main window is located.

* Version 1.07:
  o Fixed bug: On some Windows 7 systems, SocketSniff failed to
    attach a process and crashed it.

* Version 1.06:
  o Added horizontal scrollbar to the lower pane.

* Version 1.05:
  o SocketSniff now also works on Windows 7.

* Version 1.02:
  o SocketSniff now automatically stops when the process that you
    inspect is terminated.
  o SocketSniff now remembers that last sort in select process
    dialog-box.

* Version 1.01 - Add more information for error 65521.
* Version 1.00 - First release.



Using SocketSniff
=================

SocketSniff doesn't require any installation process or additional dll
files. In order to start using it, simply run the executable file -
SocketSniff.exe
After running it, select the process that you want to inspect, and click
Ok. You must select a process that already loaded the winsock library,
otherwise, the action will fail. After clicking Ok, SocketSniff will
start showing the activity of Windows socket for the selected process.
The upper pane displays the list of all created sockets. When selecting a
socket in the upper pane, the lower pane displays the receive and send
calls of the selected socket.



Using SocketSniff In Windows Vista
==================================

SocketSniff can work in Vista even when UAC (User Account Control) is
turned on, as long as the process that you wish to inspect run in the
same account and security context of SocketSniff. However, if you want to
inspect a process that runs under administrator account, you must also
run SocketSniff as administrator. (right-click on SocketSniff.exe and
choose 'Run As Administrator')



Start Capture Sockets from Command-Line
=======================================

Starting from version 1.10, you can start capturing sockets of a process,
by using /Start command-line option. You can specify the process filename
or process ID, for example:
SocketSniff.exe /Start firefox.exe
SocketSniff.exe /Start 4722



Translating SocketSniff to other languages
==========================================

In order to translate SocketSniff to other language, follow the
instructions below:
1. Run SocketSniff with /savelangfile parameter:
   SocketSniff.exe /savelangfile
   A file named SocketSniff_lng.ini will be created in the folder of
   SocketSniff utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run SocketSniff, and all
   translated strings will be loaded from the language file.
   If you want to run SocketSniff without the translation, simply rename
   the language file, or move it to another folder.



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

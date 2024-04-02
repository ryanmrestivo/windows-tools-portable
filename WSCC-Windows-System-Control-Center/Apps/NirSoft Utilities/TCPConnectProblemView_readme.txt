


TCPConnectProblemView v1.05
Copyright (c) 2021 - 2022 Nir Sofer
Web site: https://www.nirsoft.net/utils/tcp_connect_problem_view.html



Description
===========

TCPConnectProblemView is a tool for Windows that monitors the TCP
connections on your system and displays an alert when a software tries to
initiate a TCP connection and there is no response from the server.
When a problem with a TCP connection is detected , TCPConnectProblemView
adds a new entry with the following information: Process Name, Process
ID, Detected On (date/time), Local Port, Local IP, Remote Port, Remote
IP, Remote Host.

TCPConnectProblemView also allows you to automatically close any TCP
socket with no response from the server, in order to decrease the time
you wait for any software to display an error message (IPv4 only).



System Requirements
===================

This tool works on any version of Windows, starting from Windows XP, and
up to Windows 11. Both 32-bit and 64-bit systems are supported.



Version History
===============


* Version 1.05:
  o Added 'Always On Top' option.

* Version 1.04:
  o Added 'Add Header Line To CSV/Tab-Delimited File' option (Turned
    on by default).

* Version 1.03:
  o Added option to change the sorting column from the menu (View ->
    Sort By). Like the column header click sorting, if you click again
    the same sorting menu item, it'll switch between ascending and
    descending order. Also, if you hold down the shift key while choosing
    the sort menu item, you'll get a secondary sorting.

* Version 1.02:
  o Added 'Copy Clicked Cell' option to the right-click context menu,
    which copies to the clipboard the text of cell that you right-clicked
    with the mouse.

* Version 1.01:
  o Added option to choose another font (name and size) to display in
    the main window.

* Version 1.00 - First release.



Start Using TCPConnectProblemView
=================================

TCPConnectProblemView doesn't require any installation process or
additional DLL files. In order to start using it, simply run the
executable file - TCPConnectProblemView.exe
After running TCPConnectProblemView, the main window displays the list of
TCP conection problems when they are detected.
In order to check if TCPConnectProblemView really works on your system,
simply open your Web browser, type any inactive IP address on your LAN
(For example: https://192.168.0.200 ), your Web browser will try to
connect this address, and then short time after there is no response from
the server, TCPConnectProblemView will display an alert about the
problem. It's possible that you'll see multiple alerts because Web
browsers usually try to connect multiple times before displaying failure
error message.



Tray Icon
=========

In order to put the TCPConnectProblemView tool on the tray icon, simple
enable the 'Put Icon On Tray' option (Under the Options menu) and then
close the main window.
If you want to get an alert in a tray balloon when a TCP connection
problem is detected, simply enable the 'Show Tray Balloon On New Alert'
option (Under the Options menu).



Automatically Close All Items (IPv4 only)
=========================================

When you enable the 'Automatically Close All Items' option,
TCPConnectProblemView automatically closes any TCP socket with no
response from the server.
The advantage of this feature - It mostly decreases the time you wait for
displaying an error message, because the software that tries to connect
the unresponsive server doesn't wait until the timeout is passed.
The effect on the time you have to wait for showing an error message
works with almost any software, including Web browsers, tools of Windows
operating system that connect a remote computer (e.g: RegEdit, Event
Viewer), and also all NirSoft tools that support connecting a remote
computer....

Also, you should be aware of the following limitations:
* In order to use this feature you have to run TCPConnectProblemView as
  Administrator (Help -> Run As Administrator or simply press Ctrl+F11)
* This feature currently works only with IPv4 connections, simply
  because there is no official support for closing IPv6 connections in
  Windows operating system...
* When this feature is turned on - the error message displayed by the
  software that tries to connect the unresponsive server might be
  different from the usual message.

You can also manually close the selected items by using the 'Close
Selected Items' (Ctrl+Delete).



Command-Line Options
====================



/stext <Filename>
Save the current TCP connection problems to a simple text file.

/stab <Filename>
Save the current TCP connection problems to a tab-delimited text file.

/scomma <Filename>
Save the current TCP connection problems to a comma-delimited text file
(csv).

/shtml <Filename>
Save the current TCP connection problems to HTML5 file (Horizontal).

/sverhtml <Filename>
Save the current TCP connection problems to HTML5 file (Vertical).

/sxml <Filename>
Save the current TCP connection problems to XML file.

/sjson <Filename>
Save the current TCP connection problems to JSON file.



Translating TCPConnectProblemView to other languages
====================================================

In order to translate TCPConnectProblemView to other language, follow the
instructions below:
1. Run TCPConnectProblemView with /savelangfile parameter:
   TCPConnectProblemView.exe /savelangfile
   A file named TCPConnectProblemView_lng.ini will be created in the
   folder of TCPConnectProblemView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run TCPConnectProblemView, and
   all translated strings will be loaded from the language file.
   If you want to run TCPConnectProblemView without the translation,
   simply rename the language file, or move it to another folder.



License
=======

This utility is released as freeware. You are allowed to freely
distribute this utility via CD-ROM, DVD, Internet, or in any other way,
as long as you don't charge anything for this and you don't sell it or
distribute it as a part of commercial product. If you distribute this
utility, you must include all files in the distribution package, without
any modification !



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
utility, you can send a message to support@nirsoft.net

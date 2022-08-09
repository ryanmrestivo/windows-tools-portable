


WinLogOnView v1.41
Copyright (c) 2013 - 2021 Nir Sofer
Web site: https://www.nirsoft.net



Description
===========

WinLogOnView is a simple tool for Windows 10/8/7/Vista/2008 that analyses
the security event log of Windows operating system, and detects the
date/time that users logged on and logged off. For every time that a user
log on/log off to your system, the following information is displayed:
Logon ID, User Name, Domain, Computer, Logon Time, Logoff Time, Duration,
and network address.
WinLogOnView also allows you to easily export the logon sessions
information to tab-delimited/comma-delimited/html/xml file.



System Requirements
===================


* This utility works on Windows Vista/7/8/2008/10. Both 32-bit and
  64-bit systems are supported. On Windows 10 April Update (1803) you
  have to turn on the 'Use New Event Log API' option. Older systems are
  not supported because the log on/log off information is not added to
  the security event log.



Known Limitations
=================


* This tool is based on the security event log of Windows, and the
  accuracy of the displayed information depends on the availability and
  accuracy of the data stored inside the security event log. It's
  possible that some of the information will be missing, like a logon
  session without logoff time. Bw aware that WinLogOnView currently uses
  the following events: 4648 (Logon), 4647 (LogOff), 4624 (Logon), 4800
  (Workstation lock).



Versions History
================


* Version 1.41:
  o When connecting a remote computer and the 'Use New Event Log API'
    option is turned on, the loading process is now much faster than the
    previous versions.

* Version 1.40:
  o Added option to specify user name and password to connect a
    remote computer (In the 'Advanced Options' window). (Only when the
    'Use New Event Log API' option is turned on)
  o Fixed to display error on status bar when WinLogOnView fails to
    access the event log. (Only when the 'Use New Event Log API' option
    is turned on)

* Version 1.35:
  o When choosing to load the data from external drive or remote
    computer, the external drive path or the remote computer is displayed
    in the window title.

* Version 1.33:
  o Added 'Add Header Line To CSV/Tab-Delimited File' option (Turned
    on by default).
  o The 'Use New Event Log API' option is now turned on by default.

* Version 1.32:
  o The loading process is now faster when using the 'Use New Event
    Log API' option.

* Version 1.31:
  o Fixed bug: WinLogOnView failed to remember the last size/position
    of the main window if it was not located in the primary monitor.

* Version 1.30:
  o Added 'Use New Event Log API' option. You should turn on this
    option if you have Windows 10 with April Update (1803) and
    WinLogOnView stopped working. Be aware that currently when using the
    'Use New Event Log API' option, the loading process is slower than
    the old API mode.

* Version 1.25:
  o Added option to connect multiple remote computers (In 'Advanced
    Options' window).

* Version 1.21:
  o Added 'Save All' (Shift+Ctrl+S).
  o Added option to choose another font (name and size) to display in
    the main window.

* Version 1.20:
  o WinLogOnView now reads archive log files also on a remote
    computer ( from \\Computer\Admin$\System32\Winevt\Logs).
  o You can now choose whether to read the archive log files in the
    'Advanced Options' window.

* Version 1.16:
  o WinLogOnView now displays the logoff time from workstation lock
    event (Event ID 4800, available only if 'Audit Other Login/Logoff
    Events' option is enabled in the audit policy configuraion of Windows)

* Version 1.15:
  o WinLogOnView now reads archive log files
    (Archive-Security-*.evtx) when using the external disk mode and local
    computer mode.

* Version 1.11:
  o Fixed bug: WinLogOnView failed to display the logoff time even
    when there was 4647 event.

* Version 1.10:
  o Added new command-line options: /Source , /Server ,
    /ExternalFolder

* Version 1.05:
  o Added 'Logon Type' column.

* Version 1.03:
  o Fixed bug: On some systems, WinLogOnView displayed the domain
    name instead of computer name.

* Version 1.02:
  o Fixed to display date/time properly according to daylight saving
    time settings.

* Version 1.01:
  o Added browse button in the 'Advanced Options' window to choose
    the external folder.

* Version 1.00 - First release.



Start Using WinLogOnView
========================

WinLogOnView doesn't require any installation process or additional dll
files. In order to start using it, simply run the executable file -
WinLogOnView.exe
After running it, the main window of WinLogOnView displays the list of
all logon sessions detected on your system. You can easily export the
list to html/xml/tab-delimited/comma-delimited file by using the 'Save
Selected Items' option. You can also copy the selected items to the
clipboard (Ctrl+C) and then paste them into Excel with Ctrl+V.

If you want to get the logon/logoff information of a remote computer on
your network, simply go to the Advanced Options window (F9), choose
'Remote Computer' as data source, and then type the name of the remote
computer to connect.
If you want to get the logon/logoff information from external disk,
simply choose 'External Disk' as data source and then type the path of
the event log (Usually located under C:\Windows\System32\winevt\Logs)



Command-Line Options
====================



/Source <1-3>
Specifies the type of data source. 1 = Local Computer, 2 = Remote
Computer, 3 = External Disk

/Server <Remote Computer>
Specifies the remote computer to load. (For using with /Source 2 )

/ExternalFolder <Folder>
Specifies the folder in external disk to load. (For using with /Source 3 )

/stext <Filename>
Save the list of all logon sessions into a regular text file.

/stab <Filename>
Save the list of all logon sessions into a tab-delimited text file.

/scomma <Filename>
Save the list of all logon sessions into a comma-delimited text file
(csv).

/stabular <Filename>
Save the list of all logon sessions into a tabular text file.

/shtml <Filename>
Save the list of all logon sessions into HTML file (Horizontal).

/sverhtml <Filename>
Save the list of all logon sessions into HTML file (Vertical).

/sxml <Filename>
Save the list of all logon sessions to XML file.

/sort <column>
This command-line option can be used with other save options for sorting
by the desired column. If you don't specify this option, the list is
sorted according to the last sort that you made from the user interface.
The <column> parameter can specify the column index (0 for the first
column, 1 for the second column, and so on) or the name of the column,
like "User Name" and "Logon Time". You can specify the '~' prefix
character (e.g: "~User Name") if you want to sort in descending order.
You can put multiple /sort in the command-line if you want to sort by
multiple columns.

Examples:
WinLogOnView.exe /shtml "f:\temp\logon.html" /sort 2 /sort ~1
WinLogOnView.exe /shtml "f:\temp\logon.html" /sort "User Name" /sort
"Logon Time"

/nosort
When you specify this command-line option, the list will be saved without
any sorting.



Translating WinLogOnView to other languages
===========================================

In order to translate WinLogOnView to other language, follow the
instructions below:
1. Run WinLogOnView with /savelangfile parameter:
   WinLogOnView.exe /savelangfile
   A file named WinLogOnView_lng.ini will be created in the folder of
   WinLogOnView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run WinLogOnView, and all
   translated strings will be loaded from the language file.
   If you want to run WinLogOnView without the translation, simply rename
   the language file, or move it to another folder.



License
=======

This utility is released as freeware. You are allowed to freely
distribute this utility via floppy disk, CD-ROM, Internet, or in any
other way, as long as you don't charge anything for this and you don't
sell it or distribute it as a part of commercial product. If you
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

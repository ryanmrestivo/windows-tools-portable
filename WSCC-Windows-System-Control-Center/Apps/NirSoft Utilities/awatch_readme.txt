


AdapterWatch v1.05
Copyright (c) 2004 - 2009 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

AdapterWatch displays useful information about your network adapters: IP
addresses, Hardware address, WINS servers, DNS servers, MTU value, Number
of bytes received or sent, The current transfer speed, and more. In
addition, it displays general TCP/IP/UDP/ICMP statistics for your local
computer.



System Requirements
===================

This utility works perfectly on Windows 2000, Windows XP, Windows Server
2003, and Windows Vista. You can also use this utility on Windows 98/ME,
but under these operating systems, some of the adapter information may
not be displayed properly.



Versions History
================


* Version 1.05:
  o Fixed bug: AdapterWatch displayed wrong MTU value returned by
    Windows API. Now the MTU value is loaded from the Registry.
  o Added 'Copy Selected Cell' option.

* Version 1.04:
  o Fixed bug: The dates displayed in system locale, instead of user
    locale.

* Version 1.03:
  o Fixed bug: The main window lost the focus when the user switched
    to another application and then returned back to AdapterWatch.

* Version 1.02:
  o The configuration is now saved to a file, instead of the Registry.
  o Fix the foreground color problem on the first yellow column.

* Version 1.01:
  o Added command-line support.
  o Added support for Windows XP style.

* Version 1.00 - First Release.



Using AdapterWatch
==================

AdapterWatch doesn't require any installation process or additional DLLs.
Just copy the executable (awatch.exe) to any folder you like, and run it.
The main window of AdapterWatch displays the current configuration and
information about your network adapters. You can also view general
TCP/IP/UDP/ICMP statistics for your local computer, by clicking the
desired tab.



Release/renew IP address
========================

On 'Network Adapters' tab, you can also release and renew IP addresses
obtained through DHCP server. In order to do that, select the desired
network adapter by clicking on its header, and then from the File menu
(or from the popup menu), choose the desired action.



Command-Line Options
====================



/stab <Filename> <Tab Number>
Save adapters information into a tab-delimited text file. The tab number
should be from 1 (for the first tab) to 5.

/shtml <Filename> <Tab Number>
Save adapters information into HTML file.

Examples:
awatch.exe /shtml "c:\temp\report1.html" 1
awatch.exe /shtml "c:\temp\report2.html" 2
awatch.exe /stab "c:\temp\tab3.txt" 3



Translating AdapterWatch To Another Language
============================================

AdapterWatch allows you to easily translate all menus, dialog-boxes, and
other strings to other languages.
In order to do that, follow the instructions below:
1. Run AdapterWatch with /savelangfile parameter:
   awatch.exe /savelangfile
   A file named awatch_lng.ini will be created in the folder of
   AdapterWatch utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all menus, dialog-boxes, and string entries to the
   desired language.
4. After you finish the translation, Run AdapterWatch, and all
   translated strings will be loaded from the language file.
   If you want to run AdapterWatch without the translation, simply rename
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

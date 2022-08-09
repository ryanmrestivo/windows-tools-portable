


URLProtocolView v1.15
Copyright (c) 2007 - 2009 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

URLProtocolView is a simple utility that displays all URL protocols (for
example: ftp:, telnet:, mailto:) that are currently installed on your
system. For each URL protocol, the following information is displayed:
The protocol name, the protocol description, the command-line that is
executed when you type or click the URL, the product name, and the
company name.
This utility also allows you to easily enable/disable the URL protocols.



System Requirements
===================

This utility works on the following operating systems: Windows 98/ME,
Windows 2000, Windows XP, Windows Server 2003, and Windows Vista.



Versions History
================


* Version 1.15:
  o Added support for x64 systems. (In previous versions,
    URLProtocolView displayed the files path of 32-bit applications)
  o Added sorting support from command-line.

* Version 1.12:
  o Added 'Modified Time' column

* Version 1.11:
  o Fixed bug: The main window lost the focus when the user switched
    to another application and then returned back to URLProtocolView.

* Version 1.10:
  o Added support for pluggable protocol handlers.

* Version 1.02:
  o Fixed bug: Product Name and Company Name displayed wrong values
    from another item.
  o Improved Product Name and Company Name detection.

* Version 1.01 - Under Vista, URLProtocolView now automatically
  requires to run as administrator.
* Version 1.00 - First release.



Using URLProtocolView
=====================

URLProtocolView doesn't require any installation process or additional
DLLs. Just copy the executable file (URLProtocolView.exe) to any folder
you like, and run it.
The main window of URLProtocolView displays all URL protocols installed
on your system. You can easily disable a protocol by selecting it and
pressing F8. To enable it back, press F7.



Warning: don't disable the mailto protocol
==========================================

Windows operating system has a strange bug with mailto: protocol.
When the mailto protocol is disabled (which means that there is no
default email program for handling 'mailto:' URLs), and you click or type
a mailto: URL, Windows displays an error message saying that there is no
default email program, and then, unexpectedly, dozens of Internet
Explorer windows (35 - 55) are opened quite rapidly, until there are no
system resources to open more windows...
Due to this bug, it's recommended to avoid disabling the mailto protocol.

However, if you want to watch this bug, just for fun, here's the steps to
reproduce it:
1. Run URLProtocolView, select the 'mailto' protocol entry, and press
   F8 to disable it.
2. Go to the 'Run' dialog-box of Windows or to the address bar of
   Internet explorer and type something that begins with mailto: , for
   example - mailto:nirsoft@nirsoft.net (You can type any email you like)
   press enter to activate the URL, and wait 5 - 20 seconds.
3. Windows will display an error message. click the 'OK' button
4. Watch the opening windows show :-)

This bug is reproducible on Windows 98 SE, Windows XP/SP2, Windows Vista,
and possibly on other versions of Windows.



Command-Line Options
====================



/stext <Filename>
Save the list of all URL Protocol entries into a regular text file.

/stab <Filename>
Save the list of all URL Protocol entries into a tab-delimited text file.

/stabular <Filename>
Save the list of all URL Protocol entries into a tabular text file.

/shtml <Filename>
Save the list of all URL Protocol entries into HTML file (Horizontal).

/sverhtml <Filename>
Save the list of all URL Protocol entries into HTML file (Vertical).

/sxml <Filename>
Save the list of all URL Protocol entries to XML file.

/sort <column>
This command-line option can be used with other save options for sorting
by the desired column. If you don't specify this option, the list is
sorted according to the last sort that you made from the user interface.
The <column> parameter can specify the column index (0 for the first
column, 1 for the second column, and so on) or the name of the column,
like "Description" and "URL Name". You can specify the '~' prefix
character (e.g: "~URL Name") if you want to sort in descending order. You
can put multiple /sort in the command-line if you want to sort by
multiple columns.

Examples:
URLProtocolView.exe /shtml "f:\temp\u.html" /sort 2 /sort ~1
URLProtocolView.exe /shtml "f:\temp\u.html" /sort "Type" /sort "URL Name"

/nosort
When you specify this command-line option, the list will be saved without
any sorting.

/wow64
Only for x64 systems. By default, URLProtocolView displays the URL
Protocol information for x64 applications. If you specify this parameter,
URLProtocolView displays the URL Protocol for 32-bit applications running
under WOW64.



Translating URLProtocolView to other languages
==============================================

In order to translate URLProtocolView to other language, follow the
instructions below:
1. Run URLProtocolView with /savelangfile parameter:
   URLProtocolView.exe /savelangfile
   A file named URLProtocolView_lng.ini will be created in the folder of
   URLProtocolView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run URLProtocolView, and all
   translated strings will be loaded from the language file.
   If you want to run URLProtocolView without the translation, simply
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

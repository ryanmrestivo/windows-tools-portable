


InstalledDriversList v1.05
Copyright (c) 2014 - 2015 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

InstalledDriversList is a simple tool for Windows that lists all device
drivers that are currently installed on your system. For every device
driver, the following information is displayed: Driver Name, Display
Name, Description, Startup Type, Driver type, Driver Group, Filename,
File Size, Modified/Created Time of the driver file, and version
information of the driver file.
If the driver is currently running on Windows kernel, the following
information is also displayed: Base Memory Address, End Address, Memory
Size, and Load Count.



System Requirements
===================

This utility works on any version of Windows, starting from Windows 2000
and up to Windows 8. On 64-bit systems, you must use the 64-bit version
of InstalledDriversList.



Versions History
================


* Version 1.05:
  o Added 'Open In RegEdit' option, which opens the Registry key of
    the driver in RegEdit.

* Version 1.01:
  o Added secondary sorting support: You can now get a secondary
    sorting, by holding down the shift key while clicking the column
    header. Be aware that you only have to hold down the shift key when
    clicking the second/third/fourth column. To sort the first column you
    should not hold down the Shift key.
  o Fixed to display local date/time values according to daylight
    saving time settings.

* Version 1.00 - First release.



Start Using InstalledDriversList
================================

InstalledDriversList doesn't require any installation process or
additional dll files. In order to start using it, simply run the
executable file - InstalledDriversList.exe

After running it, the main window of InstalledDriversList displays the
list of all drivers installed on your system. You can select one or more
items (or select all items with Ctrl+A), and then copy them to the
clipboard (Ctrl+C) and paste them into Excel or other spreadsheet
application. You can also use the 'Save Selected Items' option (Ctrl+S)
to export the selected items into csv/tab-delimited/xml/html file.



Meaning of green/yellow/red icons
=================================


* Green Icon - The driver is running on Windows kernel.
* Yellow Icon - The driver is not running on Windows kernel.
* Red Icon - The driver is not running on Windows kernel, but it should
  be loaded automatically when Windows starts. When you see a red icon,
  it's possible that something is wrong with the driver. Be aware that on
  Windows 8, there are 2 drivers of the operating system that are
  normally displayed with red icon.



Command-Line Options
====================



/stext <Filename>
Save the installed drivers list into a regular text file.

/stab <Filename>
Save the installed drivers list into a tab-delimited text file.

/scomma <Filename>
Save the installed drivers list into a comma-delimited text file (csv).

/stabular <Filename>
Save the installed drivers list into a tabular text file.

/shtml <Filename>
Save the installed drivers list into HTML file (Horizontal).

/sverhtml <Filename>
Save the installed drivers list into HTML file (Vertical).

/sxml <Filename>
Save the installed drivers list into XML file.

/sort <column>
This command-line option can be used with other save options for sorting
by the desired column. If you don't specify this option, the list is
sorted according to the last sort that you made from the user interface.
The <column> parameter can specify the column index (0 for the first
column, 1 for the second column, and so on) or the name of the column,
like "Display Name" and "Driver Name". You can specify the '~' prefix
character (e.g: "~Visit Time") if you want to sort in descending order.
You can put multiple /sort in the command-line if you want to sort by
multiple columns.

Examples:
InstalledDriversList.exe /shtml "f:\temp\drivers.html" /sort 2 /sort ~1
InstalledDriversList.exe /shtml "f:\temp\drivers.html" /sort "Driver
Type" /sort "Display Name"



Translating InstalledDriversList to other languages
===================================================

In order to translate InstalledDriversList to other language, follow the
instructions below:
1. Run InstalledDriversList with /savelangfile parameter:
   InstalledDriversList.exe /savelangfile
   A file named InstalledDriversList_lng.ini will be created in the
   folder of InstalledDriversList utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run InstalledDriversList, and all
   translated strings will be loaded from the language file.
   If you want to run InstalledDriversList without the translation,
   simply rename the language file, or move it to another folder.



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

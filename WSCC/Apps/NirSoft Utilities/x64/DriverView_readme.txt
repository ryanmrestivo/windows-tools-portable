


DriverView v1.50
Copyright (c) 2003 - 2020 Nir Sofer



Description
===========

DriverView utility displays the list of all device drivers currently
loaded on your system. For each driver in the list, additional useful
information is displayed: load address of the driver, description,
version, product name, company that created the driver, and more.



System Requirement
==================

This utility works under Windows 2000, Windows NT, Windows XP, Windows
Vista, Windows 7, Windows Server 2003/2008, Windows 8, and Windows 10.
Windows 98 and Windows ME are not supported. If you want to run this
utility on Windows NT, you should download the 'psapi.dll' and place it
in your system32 directory.



Versions History
================


* Version 1.50:
  o Fixed bug: On 64-bit systems, DriverView always displayed zero in
    the upper 32-bits of the memory address instead of the correct value.

* Version 1.47:
  o Fixed to display the correct driver version on Windows 10.

* Version 1.46:
  o Added secondary sorting support: You can now get a secondary
    sorting, by holding down the shift key while clicking the column
    header. Be aware that you only have to hold down the shift key when
    clicking the second/third/fourth column. To sort the first column you
    should not hold down the Shift key.

* Version 1.45:
  o Added 'Digital Signature' column, which displays the signer name
    if the driver is signed with a digital signature. This column is
    active only when 'Read Digital Signatures' option (Under the Options
    menu) is turned on. (by default it's turned off)

* Version 1.43:
  o Added secondary sorting: When clicking the column headers of
    'File Type', 'Company', and other columns , the list is sorted by the
    selected column first, and then by the 'Driver Name' column.

* Version 1.42:
  o Fixed the flickering occurred while scrolling the drivers list.

* Version 1.41:
  o Fixed issue: On Windows 7/2008/Vista, DriverView displayed the
    incorrect driver version for some driver files.

* Version 1.40:
  o Added 'Beep On Drivers Change' option. (For using when 'Automatic
    Refresh' is turned on)

* Version 1.36:
  o You can now drag one or more driver files from the window of
    DriverView into Explorer window or other application.

* Version 1.35:
  o Added 'Service Name' and 'Service Display Name' columns.

* Version 1.31:
  o Added 'End Address' column.

* Version 1.30:
  o Added 3 new columns: Size, Load Count, and Index.

* Version 1.25:
  o Added 'Add Header Line To CSV/Tab-Delimited File' option. When
    this option is turned on, the column names are added as the first
    line when you export to csv or tab-delimited file.

* Version 1.21:
  o Improved the Microsoft drivers detection - DriverView can now
    also detect Microsoft drivers in non-English languages.

* Version 1.20:
  o Added sorting command-line options.

* Version 1.17:
  o Added 'Google Search' option, which opens a Google search of the
    current selected driver filename in your default Web browser.

* Version 1.16:
  o Added new option: Hide Microsoft drivers.

* Version 1.15:
  o Added new option: Mark Non-Microsoft Drivers.

* Version 1.14:
  o Fixed bug: The main window lost the focus when the user switched
    to another application and then returned back to DriverView.

* Version 1.13:
  o Added support for saving as comma-delimited text file.

* Version 1.12:
  o Added support for x64, as a separated download.

* Version 1.11:
  o The configuration is now saved to a file, instead of the Registry.

* Version 1.10:
  o Find dialog-box
  o New column: Created Date.
  o Added support for translating to other languages.
  o Added support for XP style.
  o Save to XML.
  o "Copy Selected Items" now copy the items as tab-delimited text.

* Version 1.00 - First release.



Using The DriverView Utility
============================

This utility is a standalone executable, so it doesn't require any
installation process or additional DLLs. Just run the executable
(driverview.exe) and start using it. There is only one exception: If you
want to run this utility on Windows NT, you should download the
'psapi.dll', and copy it into the system32 folder.

The main window of DriverView utility displays the list of all loaded
drivers on your system. You can select one or more drivers from the list,
and then copy the details of these drivers to the clipboard, save them to
text or HTML file, or watch them as HTML report in your browser.
In addition, you can change the order of the columns in the drivers table
by dragging them to the desired position, or by using the 'Choose
Columns' dialog-box.



Command-Line Options
====================




/stext <Filename>
Saves the list of all drivers into a regular text file.

/stab <Filename>
Saves the list of all drivers into a tab-delimited text file.

/scomma <Filename>
Saves the list of all drivers into a comma-delimited text file.

/stabular <Filename>
Saves the list of all drivers into a tabular text file.

/shtml <Filename>
Saves the list of all drivers into horizontal HTML file.

/sverhtml <Filename>
Saves the list of all drivers into vertical HTML file.

/sxml <Filename>
Saves the list of all drivers into XML file.

/sort <column>
This command-line option can be used with other save options for sorting
by the desired column. If you don't specify this option, the list is
sorted according to the last sort that you made from the user interface.
The <column> parameter can specify the column index (0 for the first
column, 1 for the second column, and so on) or the name of the column,
like "Address" and "File Type". You can specify the '~' prefix character
(e.g: "~Driver Name") if you want to sort in descending order. You can
put multiple /sort in the command-line if you want to sort by multiple
columns.

Examples:
DriverView.exe /shtml "f:\temp\drivers.html" /sort 2 /sort ~1
DriverView.exe /shtml "f:\temp\drivers.html" /sort "File Type" /sort
"Driver Name"

/nosort
When you specify this command-line option, the list will be saved without
any sorting.



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



Translating DriverView to other languages
=========================================

In order to translate DriverView to other language, follow the
instructions below:
1. Run DriverView with /savelangfile parameter:
   DriverView.exe /savelangfile
   A file named DriverView_lng.ini will be created in the folder of
   DriverView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run DriverView, and all
   translated strings will be loaded from the language file.
   If you want to run DriverView without the translation, simply rename
   the language file, or move it to another folder.



Feedback
========

If you have any problem, suggestion, comment, or you found a bug in my
utility, you can send a message to nirsofer@yahoo.com



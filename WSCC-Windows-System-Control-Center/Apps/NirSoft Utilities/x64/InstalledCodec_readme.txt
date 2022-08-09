


InstalledCodec v1.30
Copyright (c) 2007 - 2013 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

InstalledCodec is a small utility displays the list of all Codec drivers
and DirectShow filters currently installed on your system. For each
component the following information is displayed: Display Name, Type,
Disabled Status, Installed/Modified Time, Description, Company Name,
Filename, and more...
It allows you to easily disable or enable any Codec/DirectShow component
or export the list into text/xml/html file.



Versions History
================


* Version 1.30:
  o Added 'Auto Size Columns+Headers' option.
  o Added 64-bit build.

* Version 1.25:
  o Added 'Show Time In GMT' option.
  o Added 'Add Header Line To CSV/Tab-Delimited File' option. When
    this option is turned on, the column names are added as the first
    line when you export to csv or tab-delimited file.
  o Added 'Mark Odd/Even Rows' option, under the View menu. When it's
    turned on, the odd and even rows are displayed in different color, to
    make it easier to read a single line.

* Version 1.20:
  o Added /enable and /disable command-line options, which allow you
    to disable/enable Codec drivers and DirectShow filters from
    command-line.

* Version 1.15:
  o Added 'x64 Mode' in the Options menu (for x64 systems only). When
    this option is checked, InstalledCodec displays the 64-bit
    filters/drivers.
  o Added more command-line options.

* Version 1.10:
  o Added 'File Created Time' and 'File Modified Time' columns.
  o Added sorting command-line options.

* Version 1.06:
  o Added 'Explorer Copy' option - Allows you to copy the selected
    files and then paste them into a folder in Explorer.

* Version 1.05:
  o Added 'Filename Only' column.
  o Added 'Open In RegEdit' option.

* Version 1.02 - Fixed bug: The main window lost the focus when the
  user switched to another application and then returned back to
  InstalledCodec.
* Version 1.01 - Added support for saving as comma-delimited text file.
* Version 1.00 - First release.



System Requirements
===================

This utility works with Windows 2000,XP,2003, and Vista.
For older versions of Windows (Windows 98/ME), you can use the old
version of this utility - MMCompView



Locations In the Registry
=========================

InstalledCodec extract the information from 2 places in the Registry:
* The Codec drivers list is loaded from
  HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows
  NT\CurrentVersion\Drivers32
* The DirectShow filters list is loaded from
  HKEY_CLASSES_ROOT\CLSID\{083863F1-70DE-11d0-BD40-00A0C911CE86}\Instance



Using InstalledCodec
====================

InstalledCodec doesn't require any installation process or additional DLL
files. Just copy the executable file (InstalledCodec.exe) to any folder
you like, and run it.
The main window of InstalledCodec displays the list of all Codec drivers
and DirectShow filters. You can easily select one or more components, and
then disable or enable them, export the information into text/xml/html
file, or copy the information to the clipboard, and then paste it to
Excel or OpenOffice spreadsheet.



Disable/Enable Codec drivers and DirectShow filters
===================================================

If you install multiple Codec packages and other multimedia software on
the same computer, you might find out that some multimedia files are not
played properly as before. This problem is occurred if Windows Media
Player (or any other player) uses the codec or filter of the newly
installed multimedia software. If you install a new Codec package and
something goes wrong, you can try to fix the problem disabling the newly
installed components. To easily find out the newly installed components,
try to click the 'Installed/Modfied Time' column, the components list
will be sorted by installation time, and then you'll find most of the
newly installed Codec or DirectShow filters in the end of the list.



Command-Line Options
====================



/stext <Filename>
Save the list of all Codec drivers and filters into a regular text file.

/stab <Filename>
Save the list of all Codec drivers and filters into a tab-delimited text
file.

/scomma <Filename>
Save the list of all Codec drivers and filters into a comma-delimited
text file.

/stabular <Filename>
Save the list of all Codec drivers and filters into a tabular text file.

/shtml <Filename>
Save the list of all Codec drivers and filters into HTML file
(Horizontal).

/sverhtml <Filename>
Save the list of all Codec drivers and filters into HTML file (Vertical).

/sxml <Filename>
Save the list of all Codec drivers and filters to XML file.

/sort <column>
This command-line option can be used with other save options for sorting
by the desired column. If you don't specify this option, the list is
sorted according to the last sort that you made from the user interface.
The <column> parameter can specify the column index (0 for the first
column, 1 for the second column, and so on) or the name of the column,
like "Type" and "Display Name". You can specify the '~' prefix character
(e.g: "~Display Name") if you want to sort in descending order. You can
put multiple /sort in the command-line if you want to sort by multiple
columns.

Examples:
InstalledCodec.exe /shtml "f:\temp\codec.html" /sort 2 /sort ~1
InstalledCodec.exe /shtml "f:\temp\codec.html" /sort "Type" /sort
"Display Name"

/nosort
When you specify this command-line option, the list will be saved without
any sorting.

/ShowDirectShowFilters <0 | 1>
Specifies whether to show DirectShow filters. 0 = No, 1 = Yes.

/ShowVideoDrivers <0 | 1>
Specifies whether to show video drivers. 0 = No, 1 = Yes.

/ShowAudioDrivers <0 | 1>
Specifies whether to show audio drivers. 0 = No, 1 = Yes.

/Modex64 <0 | 1>
x64 Mode - only for x64 systems. 0 = No, 1 = Yes.

/disable <Name>
Disable Codec driver or DirectShow filter. The name parameter specifies
the item that you want to disable. For DirectShow filter, you should
specify the value displayed under the CLSID column. For Codec driver, you
should specify the value displayed under the Driver Key column.

For example:
InstalledCodec.exe /disable {CD8743A1-3736-11D0-9E69-00C04FD7C15B}
InstalledCodec.exe /disable VIDC.I420

/enable <Name>
Enable Codec driver or DirectShow filter. The name parameter specifies
the item that you want to enable. For DirectShow filter, you should
specify the value displayed under the CLSID column. For Codec driver, you
should specify the value displayed under the Driver Key column.

For example:
InstalledCodec.exe /enable {CD8743A1-3736-11D0-9E69-00C04FD7C15B}
InstalledCodec.exe /enable VIDC.I420



Translating InstalledCodec to other languages
=============================================

In order to translate InstalledCodec to other language, follow the
instructions below:
1. Run InstalledCodec with /savelangfile parameter:
   InstalledCodec.exe /savelangfile
   A file named InstalledCodec_lng.ini will be created in the folder of
   InstalledCodec utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run InstalledCodec, and all
   translated strings will be loaded from the language file.
   If you want to run InstalledCodec without the translation, simply
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

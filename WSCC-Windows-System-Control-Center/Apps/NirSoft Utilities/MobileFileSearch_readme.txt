


MobileFileSearch v1.48
Copyright (c) 2019 - 2024 Nir Sofer
Web site: https://www.nirsoft.net/utils/mobile_device_file_search.html



Description
===========

MobileFileSearch is a tool for Windows that allows you to search files
inside a mobile device (Smartphone or Tablet) plugged to the USB port on
your computer, with Media Transfer Protocol (MTP). You can search files
by their size, their created time, their modified time, or their name
(using wildcard).
After finding the files on your Smartphone / Tablet, you can optionally
delete them, copy them to a folder on your computer, or export the files
list to csv/tab-delimited/html/xml/JSON file.

MobileFileSearch also allows you to activate the search from command-line
and then export the result to a file, or copy the found files to the
desired folder on your computer.



System Requirements
===================


* This tool works on any version of Windows, starting from Windows
  Vista and up to Windows 11. Both 32-bit and 64-bit systems are
  supported.
* Be aware that this tool is useful if your Smartphone/Tablet uses the
  Media Transfer Protocol (MTP) to view and transfer files via USB. If
  you have an option to connect your Smartphone/Tablet as mass storage
  device (with drive letter), then this tool is not needed, and you can
  search files with any other search tool, like SearchMyFiles.



Versions History
================


* Version 1.48
  o Fixed issue: When copying data to the clipboard or exporting to
    tab-delimited file, every line contained an empty field in the end of
    the line.

* Version 1.47
  o Fixed bug: MobileFileSearch failed to load the From/To size
    values from the .cfg file.
  o Fixed typo in the 'File Extension' column.

* Version 1.46
  o Added 'Sort By' button to the toolbar.

* Version 1.45
  o Updated to stop the search process when you press the Esc key.

* Version 1.44
  o Added 'Automatically Scroll Down On New Items' option.

* Version 1.43
  o Fixed the default columns size in high DPI mode.
  o When the main window of MobileFileSearch is large, the status bar
    section that shows the path while searching is also enlarged.

* Version 1.42
  o Added 'Copy Explorer Path' option, which copies to the clipboard
    the Windows Explorer path of the selected file. If you paste this
    path string into the path text-box of Explorer Windows, the file will
    be opened with the default program.

* Version 1.41
  o Added /OpenFolder command line option, which allows you to open
    the specified folder of the plugged mobile device in Windows
    Explorer, for example:
    MobileFileSearch.exe /OpenFolder "SD card\DCIM\Camera"
  o Added 'Copy Clicked Cell' option to the right-click context menu,
    which copies to the clipboard the text of cell that you right-clicked
    with the mouse.

* Version 1.40
  o Added 'Open Folder In Windows Explorer' option.

* Version 1.38
  o Added option to change the sorting column from the menu (View ->
    Sort By). Like the column header click sorting, if you click again
    the same sorting menu item, it'll switch between ascending and
    descending order. Also, if you hold down the shift key while choosing
    the sort menu item, you'll get a secondary sorting.

* Version 1.37
  o Added 'Open Location In Google Maps' option. You can use this
    option for .jpg files with GPS information (Geo-tagging). When there
    is a .jpg file with GPS information, this option allows you to easily
    open the location of the image in Google Maps.

* Version 1.36
  o Fixed some display issues in high DPI mode (Toolbar and
    Properties window).

* Version 1.35
  o Added 'File Size Unit' to set the unit to display the 'File Size'
    column: Bytes, kB, KiB, MB, MiB, GB, GiB, or Automatic.
  o The bottom status bar now displays the total size of the selected
    files.
  o Added 'Start As Hidden' option. When this option and 'Put Icon On
    Tray' option are turned on, the main window of MobileFileSearch will
    be invisible on start.

* Version 1.30
  o Added 'Exclude Folders' option. You can specify one or more paths
    to exclude from the search (comma-delimited list), wildcards are
    allowed. For example: Internal storage\Pictures*, *WhatsApp*

* Version 1.26
  o Added 'Add Header Line To CSV/Tab-Delimited File' option (Turned
    on by default).

* Version 1.25
  o Added 'Preview Pane' option (Ctrl+P). When it's turned on,
    MobileFileSearch displays a preview of the selected image file (.jpg,
    .png) in the lower pane.

* Version 1.21
  o Fixed the /cfg command-line option to load the .cfg file from the
    current directory if full path is not specified.

* Version 1.20
  o Added 'Resolution' column (For media and image files) and 'Media
    Duration' column (for media files).

* Version 1.15
  o Added 'Put Icon On Tray' option.

* Version 1.10
  o Added option to choose another font (name and size) to display in
    the main window.
  o Added 'Select All' and 'Deselect All' to the 'Column Settings'
    window.

* Version 1.07
  o Added 'Enter Key Action' option (Under the Options menu), which
    allows you to choose what to do when you press the Enter key: None,
    Open Properties Window, Open Selected File, Open Selected File With.

* Version 1.06
  o Added new date/time option: 'Specified time range and date range,
    separately'. For example... You can search all files that their
    modified date is between 01/01/2019 - 01/01/2020 and their modified
    time is between 08:00 - 10:00.

* Version 1.05
  o Added 'Double-Click Action' option (Under the Options menu),
    which allows you to choose what to do when you double-click a file -
    Open Properties Window (Default), Open Selected File, or Open
    Selected File With...

* Version 1.00 - First release.



Start Using MobileFileSearch
============================

MobileFileSearch doesn't require any installation process or additional
DLL files. In order to start using it, simply run the executable file -
MobileFileSearch.exe
After running MobileFileSearch, the 'Search Options' window is opened,
you should choose the desired search configuration (see below) and then
click the 'Start Search' button to start searching files in your
Smartphone/tablet.



Search Options
==============

The following options are available in the 'Search Options' window:
* Device:If you have only one device plugged to the USB port on your
  system, you should leave this option as 'Search in all devices'. If you
  have multiple devices, you can choose to search only in a specific
  mobile device.
* Base Folders:If this field is empty, MobileFileSearch will search in
  all folders of your mobile device. You can also specify one or more
  folders (comma-delimited list), for example: Internal
  storage\Android,Internal storage\WhatsApp,SD card\Android
  You can get the right path by looking at the 'Full Path' column of the
  search result.
* Subfolders Depth: The depth of subfolders to search - Infinite, or 0
  - 15.
* Wildcard: Specifies the wildcard to search (* to search all files).
  You can specify multiple wildcards, delimited by comma. For example:
  *.mp4, *.mov
* Exclude Folders: You can also specify one or more folders
  (comma-delimited list) to exclude from the search. Wildcards are also
  allowed. For example: Internal storage\Pictures*, *WhatsApp*
* File size is at least: Allows you to search only files that their
  size is at least the size you specify. For example, you can search
  files that their size is 50 MB or larger (Useful to find large files on
  your Smartphone or tablet in order to free up some space)
* File size is at most: Allows you to search only files that their size
  is at most the size you specify. For example, you can search files that
  their size is 1000 bytes or smaller.
* Created Time: Allows you to search files according to the created
  time of the file. You can search files created in the last xx
  days/hours/minutes/seconds, or you can search files in specific
  date/time range.
* Modified Time: Allows you to search files according to the modified
  time of the file. You can search files modified in the last xx
  days/hours/minutes/seconds, or you can search files in specific
  date/time range.



Search Result Options
=====================

After the search is finished, you can select one or more files and then
use the following options:
* Open Selected File: (Only for single file) Copy the selected file to
  a temporary folder (%temp%\MobileFileSearch) and open it with the
  default program, according to the file type. All temporary files are
  deleted when you exit from MobileFileSearch.
* Open Selected File With... : Similar to 'Open Selected File', but
  allows you to choose the program to open file.
* Copy Selected Files To: Allows you to copy the selected files to a
  folder on your computer.
* Delete Selected Files: Allows you to delete the selected files on
  your Smartphone / Tablet. Be careful when you use this option !
* Export Selected Items: Allows you to export the selected files list
  to comma-delimited/tab-delimited/html5/xml/JSON file.
* Copy Selected Items To Clipboard: Allows you to copy the list of
  selected files as tab-delimited format. You can paste the copied data
  to Excel.



Command-Line Options
====================



/stext <Filename>
Save the search result to a simple text file.

/stab <Filename>
Save the search result to a tab-delimited text file.

/scomma <Filename>
Save the search result to a comma-delimited text file (csv).

/shtml <Filename>
Save the search result to HTML5 file (Horizontal).

/sverhtml <Filename>
Save the search result to HTML5 file (Vertical).

/sxml <Filename>
Save the search result to XML file.

/sjson <Filename>
Save the search result to JSON file.

/sort <column>
This command-line option can be used with other save options for sorting
by the desired column. The <column> parameter can specify the column
index (0 for the first column, 1 for the second column, and so on) or the
name of the column, like "Object Name" and "Filename". You can specify
the '~' prefix character (e.g: "~Object ID") if you want to sort in
descending order. You can put multiple /sort in the command-line if you
want to sort by multiple columns.

/cfg <Config Filename&gt
Start MobileFileSearch with the specified config file.

/CreatedTime.FindMode <Mode>
/ModifiedTime.FindMode <Mode>
Specifies the find mode for created time and modified time:
0 = Any time
1 = Time range (Local Time)
2 = Time range (GMT)
3 = Last XX seconds
4 = Last XX minutes
5 = Last XX hours
6 = Last XX days
7 = Time range and date range, separately

/CreatedTime.LastXX <Number>
/ModifiedTime.LastXX <Number>
Specifies the number of seconds/minutes/hours/days, when
/CreatedTime.FindMode or /ModifiedTime.FindMode is 3 - 6

/CreatedTime.From <Date Time>
/CreatedTime.To <Date Time>
/ModifiedTime.From <Date Time>
/ModifiedTime.To <Date Time>
Specifies the date/time range when /CreatedTime.FindMode or
/ModifiedTime.FindMode is 1 - 2. The format of <Date Time> is 'dd-mm-yyyy
hh:mm:ss'

/UseFromSize <0 | 1>
/UseToSize <0 | 1>
Specifies whether the from/to size filters are enabled, 0 = No, 1 = Yes.

/FromSize <Number>
/ToSize <Number>
Specifies the file size range to filter. The units are specified in
/FromSizeUnit and /ToSizeUnit

/FromSizeUnit <Unit>
/ToSizeUnit <Unit>
Specifies the size range units:
1 = Bytes
2 = KB
3 = MB
4 = GB

/Wildcard <Wildcard>
Specifies the wildcard for searching files.

/BasePath <Path>
Specifies the base path for searching files.

/CopyFiles
Activate the search and then copy all found files into a folder on your
computer. You can specify the destination folder in /CopyFiles.Folder
command-line option

/CopyFiles.Folder <Folder>
Specifies to destination folder to copy the files found in the search.

/OpenFolder <Folder>
Open the specified folder of the device plugged to your computer in
Windows Explorer



Command-Line Examples
=====================


* Find all files that their size is 20 MB or larger, sort the list by
  file size, and save the result into html file - phone-large-files.html
  MobileFileSearch .exe /UseFromSize 1 /FromSize 20 /FromSizeUnit 3 /sort
  "File Size" /shtml c:\temp\phone-large-files.html
* Find all files created in the last 5 hours, sort the files list by
  created time, and then export the result to csv file -
  phone-last-5hours.csv
  MobileFileSearch .exe /CreatedTime.FindMode 5 /CreatedTime.LastXX 5
  /sort "Created Time" /scomma c:\temp\phone-last-5hours.csv
* Copy the files modified in the last 2 days into the
  c:\shared\my-phone-files folder
  MobileFileSearch .exe /ModifiedTime.FindMode 6 /ModifiedTime.LastXX 2
  /CopyFiles.Folder "c:\shared\my-phone-files" /CopyFiles
* copy all .mp4 files created in the last 20 minutes into the
  c:\shared\my-phone-files folder
  MobileFileSearch .exe /Wildcard "*.mp4" /CreatedTime.FindMode 4
  /CreatedTime.LastXX 20 /CopyFiles.Folder "c:\shared\my-phone-files"
  /CopyFiles
* Open the 'Internal storage\Pictures\Screenshots' path of your plugged
  mobile device in Windows Explorer
  MobileFileSearch .exe /OpenFolder "Internal
  storage\Pictures\Screenshots"



Translating MobileFileSearch to other languages
===============================================

In order to translate MobileFileSearch to other language, follow the
instructions below:
1. Run MobileFileSearch with /savelangfile parameter:
   MobileFileSearch.exe /savelangfile
   A file named MobileFileSearch_lng.ini will be created in the folder of
   MobileFileSearch utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run MobileFileSearch, and all
   translated strings will be loaded from the language file.
   If you want to run MobileFileSearch without the translation, simply
   rename the language file, or move it to another folder.



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

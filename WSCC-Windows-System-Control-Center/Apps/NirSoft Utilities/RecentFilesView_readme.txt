


RecentFilesView v1.33
Copyright (c) 2007 - 2017 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

Each time that you open a file from Windows Explorer or from a standard
open/save dialog-box, the name of the file that you opened is recorded by
the operating system. Some of the names are saved into the 'Recent'
folder. Other are saved into the Registry.
This utility display the list of all recently opened files, and allows
you to delete unwanted filename entries. You can also save the files list
into text/html/xml file.



System Requirements
===================

This utility works on any version of Windows, from Windows 2000 to
Windows 10.



Versions History
================


* Version 1.33:
  o Fixed bug: When pressing Delete key inside the text-box of the
    Find window, RecentFilesView asked you if you want to delete the
    selected item instead of deleting a character inside the find
    text-box.

* Version 1.32:
  o Added 'File Only' column (without full path).

* Version 1.31:
  o Explorer context menu inside RecentFilesView: When you
    right-click on a single item while holding down the shift key,
    RecentFilesView now displays the context menu of Windows Explorer,
    instead of the RecentFilesView context menu. This feature only works
    for existing files.
  o Added 'Open File Folder' option.
  o When using the 'Open Selected File With' option, the 'Always use
    the selected program to open this kind of file' check-box is now
    turned off and disabled.

* Version 1.30:
  o Added 'Advanced Options' window (F9), which allows you to load
    the recent files information from external source. Be aware that in
    order to read a Registry file (ntuser.dat) from external source on
    Windows Vista/7/8, you have to run RecentFilesView as Administrator.

* Version 1.20:
  o Added support for extracting the recent files information from
    the Registry under Windows Vista, Windows 7, and Windows 8.

* Version 1.15:
  o Added 'Open Selected File With' option to open a file with
    non-default program.
  o Added 'Add Header Line To CSV/Tab-Delimited File' option. When
    this option is turned on, the column names are added as the first
    line when you export to csv or tab-delimited file.
  o The missing files mark is now in a darker color to view it more
    easily, and you can also manually change the background/foreground
    colors in the config file with MarkMissingFilesBackColor and
    MarkMissingFilesForeColor values (RGB values).

* Version 1.10:
  o Added sorting command-line options.

* Version 1.09:
  o In HTML report, filenames are now created as links.

* Version 1.08:
  o Added file extension column, so you can sort the files list by
    the file extension.

* Version 1.07:
  o Double-click now opens the selected file.

* Version 1.06:
  o Fixed bug: RecentFilesView sometimes failed to save into files
    when using the command-line save options.
  o Fixed bug: The main window lost the focus when the user switched
    to another application and then returned back to RecentFilesView.

* Version 1.05 - Added support for saving as comma-delimited text files
  (.csv)
* Version 1.04 - Fixed critical bug under Windows 98 - Icons
  disappeared in the 'start' menu.
* Version 1.03 - Fixed bug in Unicode version: wrong characters added
  to clipboard copy option.
* Version 1.02 - Added 'FF FE' characters in the beginning of the saved
  Unicode files (Unicode version only).
* Version 1.01 - Added 'Open Selected File' option.
* Version 1.00 - First release.



The Location Of Recent Files Information
========================================

The recent opened files list is stored in 2 places:
* Recent Folder: The recent folder is usually located under
  C:\Documents and Settings\[Your Profile]\Recent (The path is different
  under Windows Vista), and it contains shortcuts to the recently opened
  files.
* Registry: Each time that a file is selected in save/open dialog-box,
  the filename is added to the files list under
  HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\ComD
  lg32\OpenSaveMRU



Using RecentFilesView
=====================

RecentFilesView doesn't require any installation process or additional
dll files. In order to start using it, simply run the executable file
(RecentFilesView.exe)
The main window of RecentFilesView display the list of all files that you
recently opened. You can select one or more items, and then save them
into text/html/xml file. You can also delete unwanted entries by using
'Delete Selected Items' option.



Command-Line Options
====================



/stext <Filename>
Save the files list into a regular text file.

/stab <Filename>
Save the files list into a tab-delimited text file.

/scomma <Filename>
Save the files list into a comma-delimited text file.

/stabular <Filename>
Save the files list into a tabular text file.

/shtml <Filename>
Save the files list into HTML file (Horizontal).

/sverhtml <Filename>
Save the files list into HTML file (Vertical).

/sxml <Filename>
Save the files list to XML file.

/sort <column>
This command-line option can be used with other save options for sorting
by the desired column. If you don't specify this option, the list is
sorted according to the last sort that you made from the user interface.
The <column> parameter can specify the column index (0 for the first
column, 1 for the second column, and so on) or the name of the column,
like "Modified Time" and "Created Time". You can specify the '~' prefix
character (e.g: "~Created Time") if you want to sort in descending order.
You can put multiple /sort in the command-line if you want to sort by
multiple columns.

Examples:
RecentFilesView.exe /shtml "f:\temp\recent.html" /sort 2 /sort ~1
RecentFilesView.exe /shtml "f:\temp\recent.html" /sort "StoredIn" /sort
"Modified Time"

/nosort
When you specify this command-line option, the list will be saved without
any sorting.



Translating RecentFilesView to other languages
==============================================

In order to translate RecentFilesView to other language, follow the
instructions below:
1. Run RecentFilesView with /savelangfile parameter:
   RecentFilesView.exe /savelangfile
   A file named RecentFilesView_lng.ini will be created in the folder of
   RecentFilesView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run RecentFilesView, and all
   translated strings will be loaded from the language file.
   If you want to run RecentFilesView without the translation, simply
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

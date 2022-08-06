


DiskCountersView v1.27
Copyright (c) 2010 - 2017 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

DiskCountersView displays the system counters of each disk drive in your
system, including the total number of read/write operations and the total
number of read/write bytes. It also displays general drive information,
like disk name, partition number, partition location, and so on.



System Requirements
===================

This utility works on Windows XP,2003, 2008, 2012, Vista, Windows 7,
Windows 8, and Windows 10.
Windows 2000 is also partly supported, but if you have one disk with
multiple partitions, all partitions will be displayed with the same
counters.



Known Issues
============


* Sometimes, from unknown reason, the disk counters suddenly get
  unexpected negative numbers. When it happens, you can use the 'Reset
  All Counter Values' option to start the counters from zero.
* On Windows Vista/7, the counters of USB flash drives are also
  displayed in the list. On Windows XP, the counters of USB flash drives
  are not displayed, simply because the operating system doesn't support
  them.



Versions History
================


* Version 1.27:
  o Added 'Reset Maximum Speed Values' (F6).

* Version 1.26:
  o Added 'Align Numeric Columns To Right' option.
  o Added 'Save All Items'.

* Version 1.25:
  o Added 'Maximum Read Speed' and 'Maximum Write Speed' columns.

* Version 1.21:
  o When a new drive is plugged, DiskCountersView now automatically
    detects it and adds it to the drives list. (In previous versions you
    had to close DiskCountersView and start it again in order to see the
    new drive...)

* Version 1.20:
  o Added 'Put Icon On Tray' option.

* Version 1.15:
  o Added 'Read Speed' and 'Write Speed' columns. The speed values
    are calculated according to the bytes counter change, and they are
    updated around every 3 seconds.

* Version 1.10:
  o Added 'Mark Odd/Even Rows' option, under the View menu. When it's
    turned on, the odd and even rows are displayed in different color, to
    make it easier to read a single line.
  o Fixed issue: The properties dialog-box and other windows opened
    in the wrong monitor, on multi-monitors system.
  o Added 'Auto Size Columns+Headers' option, which allows you to
    automatically resize the columns according to the row values and
    column headers.

* Version 1.05 - Added 'Add Header Line To CSV/Tab-Delimited File'
  option. When this option is turned on, the column names are added as
  the first line when you export to csv or tab-delimited file.
* Version 1.00 - First release.



Using DiskCountersView
======================

DiskCountersView doesn't require any installation process or additional
DLL files. In order to start using it, simply run the executable file -
DiskCountersView.exe
The main window of DiskCountersView displays the list of disk drives and
their counters and other information. If you want to view the counters
starting from a specific time, simply choose 'Reset All Counter Values'
from the File menu (or press F7), and all counters will start from zero.
You can always return back to the real system counters value by pressing
F8.



Command-Line Options
====================



/stext <Filename>
Save the current disk counters into a regular text file.

/stab <Filename>
Save the current disk counters into a tab-delimited text file.

/scomma <Filename>
Save the current disk counters into a comma-delimited text file (csv).

/stabular <Filename>
Save the current disk counters into a tabular text file.

/shtml <Filename>
Save the current disk counters into HTML file (Horizontal).

/sverhtml <Filename>
Save the current disk counters into HTML file (Vertical).

/sxml <Filename>
Save the current disk counters into XML file.

/sort <column>
This command-line option can be used with other save options for sorting
by the desired column. If you don't specify this option, the list is
sorted according to the last sort that you made from the user interface.
The <column> parameter can specify the column index (0 for the first
column, 1 for the second column, and so on) or the name of the column,
like "Driver Letter" and "ReadCount". You can specify the '~' prefix
character (e.g: "~Write Bytes") if you want to sort in descending order.
You can put multiple /sort in the command-line if you want to sort by
multiple columns.

Examples:
DiskCountersView.exe /shtml "f:\temp\counters.html" /sort 2 /sort ~1
DiskCountersView.exe /shtml "f:\temp\counters.html" /sort "Driver Letter"

/nosort
When you specify this command-line option, the list will be saved without
any sorting.



Translating DiskCountersView to other languages
===============================================

In order to translate DiskCountersView to other language, follow the
instructions below:
1. Run DiskCountersView with /savelangfile parameter:
   DiskCountersView.exe /savelangfile
   A file named DiskCountersView_lng.ini will be created in the folder of
   DiskCountersView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run DiskCountersView, and all
   translated strings will be loaded from the language file.
   If you want to run DiskCountersView without the translation, simply
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

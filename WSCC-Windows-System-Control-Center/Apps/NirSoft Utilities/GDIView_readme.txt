


GDIView v1.26
Copyright (c) 2007 - 2016 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

GDIView is a unique tool that displays the list of GDI handles (brushes,
pens, fonts, bitmaps, and others) opened by every process. It displays
the total count for each type of GDI handle, as well as detailed
information about each handle.
This tool can be useful for developers that need to trace GDI resources
leak in their software.



System Requirements
===================

This utility can work on Windows 2000, Windows XP, Windows Server 2003,
Windows Vista, Windows 7/2008, Windows 8, and Windows 10. (Earlier
versions of Windows are not supported). there is also x64 version
available as a separated download.



Versions History
================


* Version 1.26:
  o Added 'Save All Items' menu item.

* Version 1.25:
  o Added 2 new columns: 'Process Path' and 'Process User'.
  o Removed the wrong XML encoding from the XML files.

* Version 1.20:
  o Added 'Run As Administrator' option (Ctrl+F11), which allows you
    to easily run GDIView as administrator on Windows Vista/7/8/2008.

* Version 1.17:
  o Fixed bug: When selecting smss.exe with 'Display Handle Extended
    Information' option turned on, Windows crashed with a blue screen.

* Version 1.16:
  o Added 'Auto Size Columns+Headers' option, which allows you to
    automatically resize the columns according to the row values and
    column headers.
  o Fixed issue: The properties dialog-box and other windows opened
    in the wrong monitor, on multi-monitors system.

* Version 1.15:
  o Added 'Put Icon On Tray' option.

* Version 1.10:
  o Added 'Detect Counter' column to the handles list in the lower
    pane. When handle is detected in the first time (new handle), this
    column displays '1'. This number is increased on every refresh that
    the same handle is still detected.
  o Added 'Detected On' column, which displays the date/time that the
    handle was first detcted.
  o Added 'Mark New Handle' option. When it's turned on, new detected
    handles (with Detect Counter = 1) are marked in pink color.

* Version 1.06:
  o Fixed bug: On some Windows 7 systems, GDIView crashed the
    inspected process if the 'Display Handle Extended Information' was
    turned on.

* Version 1.05:
  o Added 'GDI Total' column. (See the remark below)

* Version 1.04:
  o Added sorting command-line options.

* Version 1.03:
  o Fixed bug: The main window lost the focus when the user switched
    to another application and then returned back to GDIView.

* Version 1.02:
  o Added option: Always On Top.
  o Added support for saving comma-delimited (.csv) files.

* Version 1.01 - Fixed label size problems in 'Properties' and 'Choose
  Columns' windows.
* Version 1.00 - First release.



Using GDIView
=============

GDIView doesn't require any installation process or additional DLLs. Just
copy the executable file (GDIView.exe) to any folder you like and run it.
The main window has 2 panes:
* The upper pane displays the GDI handles count for each process.
* The lower pane displays all GDI handles of the selected process in
  the upper pane.



The Upper Pane
==============

The upper pane of GDIView displays counters of GDI handles for every
process in your system.
You can view the counters in 3 modes:
* Show Counters Only (F2): Displays only the total counters of GDI
  handles
* Show Counters + Changes (F3): Displays the total counters of GDI
  handles, as well as the number of handles added (positive value) or
  released (negative value) since the last counters reset (F8).
* Show Changes Only (F4): Displays the number of handles added
  (positive value) or released (negative value) since the last counters
  reset (F8).
The counters are updated according to the interval that you select in
Options->Auto Refresh.



The Lower Pane
==============

The lower pane of GDIView displays the details of all GDI handles of the
selected process in the upper pane.
For each handle, the following information is displayed:
* Handle: The handle value of the GDI resource.
* Object Type: Bitmap, Brush, Pen, DC, and so on...
* Kernel Address: The memory address in Windows Kernel that contains
  the data structure of this handle. Regular Windows application cannot
  read from this address, only device drivers can access it. However, you
  can view the content this memory by using WinDbg in kernel debugging
  mode.
* Extended Information: Displays more information for brushes (color
  and style), pens (style/color/width), fonts (font
  name/width/height/weight), and bitmaps (width/height/bits per pixel).
  By default, displaying the extended information is disabled. You can
  enable it by selecting 'Display Handle Extended Information' from the
  Options menu. Be aware that extracting the extended information is more
  aggressive than the regular mode, so it's recommended to use it only
  when you really need it.




'GDI Total' and 'All GDI' columns
=================================

The 'GDI Total' column (a new column added on v1.05) displays the total
number of all GDI handles found in the GDI table for the specified
process. This means that 'GDI Total' column display the sum of the
following columns: Pen, ExtPen, Brush, Bitmap, Font, Palette, Region, DC,
Metafile DC, Enhanced Metafile DC, and Other GDI.
The 'All GDI' value is taken from Windows API call (GetGuiResources), and
it usually contains a value larger than 'GDI Total', probably because it
also counts some internal kernel GDI objects that are not included in the
GDI objects table of the process.

Notice: If you have a problem that the 'All GDI' value is increased,
while there is no leak with the other GDI values, it means that you
probably have a leak in the creation of icons or cursors (Icons and
cursors are created without destroying them later).



Command-Line Options
====================



/stext <Filename>
Save the list of all GDI counters into a regular text file.

/stab <Filename>
Save the list of all GDI counters into a tab-delimited text file.

/scomma <Filename>
Save the list of all GDI counters into a comma-delimited text file.

/stabular <Filename>
Save the list of all GDI counters into a tabular text file.

/shtml <Filename>
Save the list of all GDI counters into HTML file (Horizontal).

/sverhtml <Filename>
Save the list of all GDI counters into HTML file (Vertical).

/sxml <Filename>
Save the list of all GDI counters to XML file.

/sort <column>
This command-line option can be used with other save options for sorting
by the desired column. If you don't specify this option, the list is
sorted according to the last sort that you made from the user interface.
The <column> parameter can specify the column index (0 for the first
column, 1 for the second column, and so on) or the name of the column,
like "Pen" and "Brush". You can specify the '~' prefix character (e.g:
"~All GDI") if you want to sort in descending order. You can put multiple
/sort in the command-line if you want to sort by multiple columns.

Examples:
GDIView.exe /shtml "f:\temp\gdi.html" /sort 2 /sort ~1
GDIView.exe /shtml "f:\temp\gdi.html" /sort "~Pen"

/nosort
When you specify this command-line option, the list will be saved without
any sorting.



Translating GDIView to other languages
======================================

In order to translate GDIView to other language, follow the instructions
below:
1. Run GDIView with /savelangfile parameter:
   GDIView.exe /savelangfile
   A file named GDIView_lng.ini will be created in the folder of GDIView
   utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run GDIView, and all translated
   strings will be loaded from the language file.
   If you want to run GDIView without the translation, simply rename the
   language file, or move it to another folder.



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

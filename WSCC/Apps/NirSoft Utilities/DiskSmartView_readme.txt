


DiskSmartView v1.21
Copyright (c) 2010 - 2016 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

DiskSmartView is a small utility that retrieves the S.M.A.R.T information
(S.M.A.R.T = Self-Monitoring, Analysis, and Reporting Technology) from
IDE/SATA disks. This information includes the disk model/firmware/serial
number, cylinders/heads, power-on hours (POH), internal temperature, disk
errors rate, and more. You can use the S.M.A.R.T information retrieved by
DiskSmartView to find out whether there is any significant problem in
your disk drive.



System Requirements
===================


* Any version of Windows, starting from Windows 2000, and up to Windows
  10.
* IDE/SATA/USB disk.



Versions History
================


* Version 1.21:
  o You can now turn on/off the features added on version 1.20 ('Use
    ATA Command' and 'Retrieve S.M.A.R.T from USB Drives') Be aware that
    the 'Use ATA Command' option is now turned off by default, because I
    got report that it caused a blue screen on RAID 1 system.

* Version 1.20:
  o Added support for external USB hard drives.
  o DiskSmartView now uses additional technique to retrieve S.M.A.R.T
    data, in order to make it compatiable with more systems.
  o Added 'Smooth Refresh' option. When it's turned on and you press
    F5 (Refresh), DiskSmartView updates the existing table with the
    updated S.M.A.R.T values instead of reloading the entire table.

* Version 1.12:
  o Added 'Put Icon On Tray' option.

* Version 1.11:
  o Added 3 new lines to 'General Information' section: Disk Number,
    Registry Key, and Location Information.

* Version 1.10:
  o Fixed bug: DiskSmartView failed to display S.M.A.R.T information
    for some of the disks, on systems with more than one disk.

* Version 1.05:
  o Added 'Mark Odd/Even Rows' option, under the View menu. When it's
    turned on, the odd and even rows are displayed in different color, to
    make it easier to read a single line.
  o Fixed issue: The properties dialog-box and other windows opened
    in the wrong monitor, on multi-monitors system.
  o Added 'Auto Size Columns+Headers' option, which allows you to
    automatically resize the columns according to the row values and
    column headers.

* Version 1.02 - Fixed DiskSmartView to work properly with multiple
  disks.
* Version 1.01 - Fixed bug: the letters in model, serial number,
  firmware displayed in the wrong order.
* Version 1.00 - First release.



Using DiskSmartView
===================

DiskSmartView doesn't require any installation process or additional dll
files. In order to start using it, simply run the executable file -
DiskSmartView.exe
After running it, DiskSmartView displays all S.M.A.R.T information and
attributes retrieved from your IDE disks. You can select one or more
lines and then save them to HTML/text/xml/csv file (Ctrl+S) or copy them
to the clipboard (Ctrl+C) and paste them to Excel or other spreadsheet.
If you want to learn more about how to analyze the S.M.A.R.T information
displayed by DiskSmartView, You can read the S.M.A.R.T page in Wikipedia
Web site.



Command-Line Options
====================



/stext <Filename>
Save the S.M.A.R.T information into a regular text file.

/stab <Filename>
Save the S.M.A.R.T information into a tab-delimited text file.

/scomma <Filename>
Save the S.M.A.R.T information into a comma-delimited text file (csv).

/stabular <Filename>
Save the S.M.A.R.T information into a tabular text file.

/shtml <Filename>
Save the S.M.A.R.T information into HTML file (Horizontal).

/sverhtml <Filename>
Save the S.M.A.R.T information into HTML file (Vertical).

/sxml <Filename>
Save the S.M.A.R.T information into XML file.



Translating DiskSmartView to other languages
============================================

In order to translate DiskSmartView to other language, follow the
instructions below:
1. Run DiskSmartView with /savelangfile parameter:
   DiskSmartView.exe /savelangfile
   A file named DiskSmartView_lng.ini will be created in the folder of
   DiskSmartView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run DiskSmartView, and all
   translated strings will be loaded from the language file.
   If you want to run DiskSmartView without the translation, simply
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

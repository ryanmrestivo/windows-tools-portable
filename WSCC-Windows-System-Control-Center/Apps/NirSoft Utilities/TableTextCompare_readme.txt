


TableTextCompare v1.20
Copyright (c) 2011 - 2015 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

TableTextCompare is a small utility that allows you to easily compare 2
tab-delimited or comma-delimited (csv) files, and find out the difference
between the 2 files. You can use this tool for comparing 2 different
snapshots of data, created by other NirSoft utilities, like DriverView,
ServiWin, USBDeview, CurrPorts, WirelessNetView, ShellExView, and many
others...
For example, You can use DriverView utility to save 2 snapshots of loaded
drivers list into a tab-delimited file, and then use TableTextCompare to
easily find out which device drivers were added, removed, or changed
since the time that the first snapshot was taken.

TableTextCompare can make the comparison even if the records of the 2
files are not sorted in the same order, or if the fields are not
positioned in the same order.




Versions History
================


* Version 1.20:
  o Fixed bug: on some files, TableTextCompare detected added lines
    as modified lines.
  o Added /FastMode parameter to specify whether to use fast mode (1
    = yes, 0 = no)
  o Fixed TableTextCompare to save the Fast Mode settings to the
    config file.

* Version 1.15:
  o Added 'Fast Mode', which works much faster if you have 2 large
    files the are sorted by the same field and have a small amount of
    differences.

* Version 1.10:
  o Added option to create a comparison report from command-line, for
    example:
    TableTextCompare.exe /compare "c:\temp\report1.txt"
    "c:\temp\filename1.txt" "c:\temp\filename2.txt" 1

* Version 1.06:
  o Fixed bug: In some cases, TableTextCompare failed to detected
    added/removed lines.

* Version 1.05:
  o Added 'Show Line Numbers' option. If you turn it off, the line
    numbers of modified/added/removed lines will not be displayed.

* Version 1.00 - First release.



System Requirements And Limitations
===================================


* This utility works on any verion of Windows, starting from Windows
  2000, and up to Windows 7/2008, including x64 versions of Windows.
* This utility uses a very complex algorithm to detect the changes that
  have been occurred between the 2 csv/tab-delimited files. However, this
  algorithm is not 100% perfect, and it's possible that with very complex
  files and a lot of changes, the comparison report won't be 100%
  accurate.



What You Can Do With This Tool
==============================

Here's some examples of what you can do with this TableTextCompare
utility:
* Save 2 snapshots of loaded drivers list into a tab-delimited file, by
  using DriverView utility, and then use TableTextCompare to find out
  which device drivers were added, removed, or changed since the time
  that the first snapshot was taken.
* Save 2 snapshots of services list into a tab-delimited file, by using
  ServiWin utility, and then use TableTextCompare to find out which
  services were added, removed, or changed since the time that the first
  snapshot was taken.
* If you want to compare snapshots of data from other software, and
  that software displays the data in a standard ListView of Windows, you
  can use the SysExporter utility to grab the data and export it into csv
  or comma-delimited file, and then you'll be able to use
  TableTextCompare to compare different snapshots of data.
* If you have 2 different Excel files with tables that you want to
  compare, you can export these tables into 2 .csv files, and then use
  TableTextCompare to compare the exported csv files.



General Guidelines
==================


* When you export data from any NirSoft tool to csv/tab-delimited
  files, for using with TableTextCompare, it's recommended to turn on the
  'Add Header Line To CSV/Tab-Delimited File' option, and then in
  TableTextCompare, turn on the 'First line contains the column names'
  option.
* Using csv/tab-delimited files with column names in the first line
  ensures that the comparison process will be accurate even if the
  columns are positioned in different order. Also, the column names will
  be used in the report for specifying which field has been changed.



Using TableTextCompare
======================

TableTextCompare utility doesn't require any installation process or
additional dll files. In order to start using it, simply run the
executable file - TableTextCompare.exe

After running TableTextCompare, choose or type the 2 csv/tab-delimited
files that you wish to compare, and then press the 'Ok' button to get the
comparison report. You can also drag the 2 files from Windows Explorer
into the main window of TableTextCompare.
Be aware that if the first line of every file contains the column names
('Add Header Line To CSV/Tab-Delimited File' option in NirSoft
utilities), you should check the 'First line contains the column names'
option.

The comparison report contains up to 3 different sections:
* New lines found in Filename 2: This section displays all lines that
  exist on the second filename, but doesn't exist on the first one.
* Lines in Filename 1 that are missing on Filename 2: This section
  displays all lines that exist on the first filename, but doesn't exist
  on the second file.
* Modified lines: This section displays the difference of lines that
  exist in both files.



Running from command-line
=========================

You can use /compare command-line switch to generate a comparison report
from command line:
TableTextCompare.exe /compare [Report File] [Filename1] [Filename2]
[Contain Column Names - 0 or 1]

For example:
TableTextCompare.exe /compare "c:\temp\report1.txt"
"c:\temp\filename1.txt" "c:\temp\filename2.txt" 1
TableTextCompare.exe /FastMode 1 /compare "c:\temp\report1.txt"
"c:\temp\filename1.txt" "c:\temp\filename2.txt" 0



More Command-Line Options
=========================



/FastMode <0 | 1>
Specifies whether to use fast mode (0 = no, 1 = yes).

/ShowLineNumber <0 | 1>
Specifies whether to show line numbers (0 = no, 1 = yes).

/Filename1 <Filename>
Specifies the first filename to compare (in GUI)

/Filename2 <Filename>
Specifies the second filename to compare (in GUI)



Comparison Report Sample
========================

Here's an example of report created with TableTextCompare, comparing 2
comma-delimited files of device drivers list generated by DriverView
utility.
By looking in this report, you can see that 3 new device drivers were
found in the second csv file: Dbgv.sys, NirSoftOpenedFilesDriver.sys, and
PROCMON20.SYS
Also, there are 3 device drivers that were existed on the first file, but
they are missing in the second csv file: usbccgp.sys, usbprint.sys, and
BrScnUsb.sys

On the 'Modified lines' section, you can see the Load Count of USBD.SYS
has been changed from 5 (in the first file) to 2 (in the second file)
Also, for USBSTOR.SYS - the address has been changed from 0xF5E8C000 to
0xF794E000, and the index from 136 to 139.

Text File Comparison Report
Created by using TableTextCompare
http://www.nirsoft.net/utils/csv_file_comparison.html

Filename 1:  Z:\Temp\Samples\driverview.csv
Filename 2:  Z:\Temp\Samples\driverview3.csv


Filename 1 generated on 17/07/2011 14:14:49, and contains 143 lines with 14 fields on each line.
Filename 2 generated on 30/07/2011 23:41:13, and contains 143 lines with 15 fields on each line.

New lines found in Filename 2:
Line 29:  Dbgv.sys,0xA89A2000,0xA89A6000,0x00004000,1,Unknown,136,,,,,N/A,N/A,F:\WINDOWS\system32\Drivers\Dbgv.sys
Line 39:  NirSoftOpenedFilesDriver.sys,0xF784E000,0xF7853000,0x00005000,1,Unknown,138,,,,,N/A,N/A,F:\WINDOWS\system32\drivers\NirSoftOpenedFilesDriver.sys
Line 69:  PROCMON20.SYS,0xA7884000,0xA788F000,0x0000b000,1,Unknown,140,,,,,N/A,N/A,F:\WINDOWS\system32\Drivers\PROCMON20.SYS

Lines in Filename 1 that are missing on Filename 2:
Line 139:  usbccgp.sys,0xF784E000,0x00008000,1,137,Dynamic Link Library,USB Common Class Generic Parent Driver,5.1.2600.2180 (xpsp_sp2_rtm.040803-2158),Microsoft Corporation,Microsoft® Windows® Operating System,03/08/2004 23:08:48,16/08/2008 10:49:25,F:\WINDOWS\system32\DRIVERS\usbccgp.sys,A
Line 140:  usbprint.sys,0xF5E4C000,0x00007000,1,138,Dynamic Link Library,USB Printer driver,5.1.2600.2180 (xpsp_sp2_rtm.040803-2158),Microsoft Corporation,Microsoft® Windows® Operating System,03/08/2004 23:01:26,16/08/2008 10:49:28,F:\WINDOWS\system32\DRIVERS\usbprint.sys,A
Line 141:  BrScnUsb.sys,0xA83B4000,0x00004000,1,139,Driver,Brother USB Scanner Driver,1,0,2,1,Brother Industries Ltd.,Brother MFC Scanner,15/10/2004 12:50:20,16/08/2008 10:48:45,F:\WINDOWS\system32\DRIVERS\BrScnUsb.sys,A

Modified lines:

Line 78:  USBD.SYS,0xF7AC4000,0x00002000,5,76,Dynamic Link Library,Universal Serial Bus Driver,5.1.2600.0 (XPClient.010817-1148),Microsoft Corporation,Microsoft® Windows® Operating System,04/08/2004 03:07:00,04/08/2004 03:07:00,F:\WINDOWS\system32\DRIVERS\USBD.SYS,A
Load Count:  5 => 2


Line 138:  USBSTOR.SYS,0xF5E8C000,0x00007000,1,136,Dynamic Link Library,USB Mass Storage Class Driver,5.1.2600.2180 (xpsp_sp2_rtm.040803-2158),Microsoft Corporation,Microsoft® Windows® Operating System,03/08/2004 23:08:48,03/04/2007 15:17:22,F:\WINDOWS\system32\DRIVERS\USBSTOR.SYS,A
Address:  0xF5E8C000 => 0xF794E000
Index:  136 => 139


Line 142:  kmixer.sys,0xA7DB4000,0x0002a000,1,140,Dynamic Link Library,Kernel Mode Audio Mixer,5.1.2600.2180 (xpsp_sp2_rtm.040803-2158),Microsoft Corporation,Microsoft® Windows® Operating System,03/08/2004 23:07:50,02/04/2007 01:10:06,F:\WINDOWS\system32\drivers\kmixer.sys,A
Address:  0xA7DB4000 => 0xA6B54000
Index:  140 => 138


Line 143:  ntdll.dll,0x7C900000,0x000b0000,1,141,Dynamic Link Library,NT Layer DLL,5.1.2600.2180 (xpsp_sp2_rtm.040803-2158),Microsoft Corporation,Microsoft® Windows® Operating System,04/08/2004 03:07:00,04/08/2004 03:07:00,F:\WINDOWS\system32\ntdll.dll,A
Index:  141 => 139





Translating TableTextCompare to other languages
===============================================

In order to translate TableTextCompare to other language, follow the
instructions below:
1. Run TableTextCompare with /savelangfile parameter:
   TableTextCompare.exe /savelangfile
   A file named TableTextCompare_lng.ini will be created in the folder of
   TableTextCompare utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run TableTextCompare, and all
   translated strings will be loaded from the language file.
   If you want to run TableTextCompare without the translation, simply
   rename the language file, or move it to another folder.



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

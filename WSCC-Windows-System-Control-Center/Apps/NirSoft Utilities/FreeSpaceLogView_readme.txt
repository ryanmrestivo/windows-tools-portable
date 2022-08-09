


FreeSpaceLogView v1.05
Copyright (c) 2020 - 2022 Nir Sofer
Web site: https://www.nirsoft.net/utils/free_disk_space_log_view.html



Description
===========

FreeSpaceLogView is a tool for Windows 10 and Windows 11 that displays a
log of free disk space on your system. This tool only works for NTFS
formatted disks. For every log item, the following information is
displayed: Log Time, Volume Name, Volume Guid, Lowest Free Space, Highest
Free Space, Is Boot Volume (Yes/No), Volume Size (Windows 11 only),
Lowest Free Space Percent (Windows 11 only), Highest Free Space Percent
(Windows 11 only).
The free space log information is taken from the following event log
channel: Microsoft-Windows-Ntfs/Operational

FreeSpaceLogView allows you to get the disk free space information from
your local computer, from remote computer on your network, and from
external hard drive plugged to your computer.



System Requirements
===================

This tool works only on Windows 10 and Windows 11. Both 32-bit and 64-bit
systems are supported. This tool doesn't work on older versions of
Windows, because the operating system doesn't record the free disk space
information in the event log of Windows.



Versions History
================


* Version 1.05:
  o Updated to work properly on Windows 11.
  o Added new columns for Windows 11: Volume Size, Lowest Free Space
    Percent, Highest Free Space Percent.
  o Added 'Computer Name' column.

* Version 1.00 - First release.



Start Using FreeSpaceLogView
============================

FreeSpaceLogView doesn't require any installation process or additional
DLL files. In order to start using it, simply run the executable file -
FreeSpaceLogView.exe
After running FreeSpaceLogView, the main window displays the log of free
disk space on your local system. If you want to view the information from
remote computer on your network or from external hard drive, open the
'Choose Data Source' window (F7), and choose the desired data source to
load.



Command-Line Options
====================



/stext <Filename>
Save the free space log records to a simple text file.

/stab <Filename>
Save the free space log records to a tab-delimited text file.

/scomma <Filename>
Save the free space log records to a comma-delimited text file (csv).

/shtml <Filename>
Save the free space log records to HTML5 file (Horizontal).

/sverhtml <Filename>
Save the free space log records to HTML5 file (Vertical).

/sxml <Filename>
Save the free space log records to XML file.

/sjson <Filename>
Save the free space log records to JSON file.



Translating FreeSpaceLogView to other languages
===============================================

In order to translate FreeSpaceLogView to other language, follow the
instructions below:
1. Run FreeSpaceLogView with /savelangfile parameter:
   FreeSpaceLogView.exe /savelangfile
   A file named FreeSpaceLogView_lng.ini will be created in the folder of
   FreeSpaceLogView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run FreeSpaceLogView, and all
   translated strings will be loaded from the language file.
   If you want to run FreeSpaceLogView without the translation, simply
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

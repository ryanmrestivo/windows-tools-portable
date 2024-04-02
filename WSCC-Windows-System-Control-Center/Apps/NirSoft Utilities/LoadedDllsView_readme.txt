


LoadedDllsView v1.06
Copyright (c) 2017 - 2022 Nir Sofer
Web site: https://www.nirsoft.net



Description
===========

LoadedDllsView is a simple tool for Windows that scans all running
processes on your system and displays the list of all DLL files loaded by
these processes and the number of processes that load each DLL in the
list. When selecting a DLL file in the upper pane of LoadedDllsView, the
lower pane displays the list of all processes that use the selected DLL
file. You can also select one or more DLL files and then export the list
into comma-delimited/tab-delimited/html/xml file.



System Requirements
===================

This tool works on any version of Windows, starting from Windows XP and
up to Windows 10. Both 32-bit and 64-bit systems are supported.



Versions History
================


* Version 1.06:
  o Fixed a bug that caused a token handles leak.

* Version 1.05:
  o Added 'Process ID' column to the lower pane.
  o Fixed some high DPI mode issues (Toolbar, Properties Window).

* Version 1.01:
  o Fixed bug: The text-box of quick filter disappeared when pressing
    Enter or Esc key.

* Version 1.00 - First release.



Start Using LoadedDllsView
==========================

LoadedDllsView doesn't require any installation process or additional DLL
files. In order to starting using it, simply run the executable file -
LoadedDllsView.exe
After running LoadedDllsView, the upper pane on the main window displays
the list of all DLL files currently loaded on your system and when you
select a DLL file in the upper pane, the lower pane displays the list of
processes that loaded the selected DLL file.



DLLs Columns (Upper Pane)
=========================


* Filename:Name of the DLL file.
* Processes Count:Total number of processes that loaded the specified
  DLL.
* DLL Type:Type of DLL - 32-bit or 64-bit.
* Product Name:'Product Name' value from the version resource of the
  DLL file.
* File Description:'File Description' value from the version resource
  of the DLL file.
* File Version:'File Version' value from the version resource of the
  DLL file.
* Product Version:'Product Version' value from the version resource of
  the DLL file.
* Company Name:'Company Name' value from the version resource of the
  DLL file.
* Internal Name:'Internal Name' value from the version resource of the
  DLL file.
* Copyright:'Copyright' value from the version resource of the DLL file.
* Original Filename:'Original Filename' value from the version resource
  of the DLL file.
* File Created Time:Creation time of the DLL file.
* File Modified Time:Modified time of the DLL file.
* Entry Modified Time:Entry modified time of the DLL file (Only on
  Windows Vista or later with NTFS file system).
* File Attributes:Attributes of the DLL file.
* File Size:Size of the DLL file.
* Full Path:Full path of the DLL file.



Processes Columns (Lower Pane)
==============================


* Process File:Name of the process file.
* Created On:Date/Time that the process was created.
* Process User:The user that created the process.
* Elevated:Specifies whether the process is elevated (This column is
  empty for system processes that LoadedDllsView cannot access)
* Product Name:'Product Name' value from the version resource of the
  process file.
* File Description:'File Description' value from the version resource
  of the process file.
* File Version:'File Version' value from the version resource of the
  process file.
* Product Version:'Product Version' value from the version resource of
  the process file.
* Company Name:'Company Name' value from the version resource of the
  process file.
* Internal Name:'Internal Name' value from the version resource of the
  process file.
* Copyright:'Copyright' value from the version resource of the process
  file.
* Original Filename:'Original Filename' value from the version resource
  of the process file.
* File Created Time:Creation time of the process file.
* File Modified Time:Modified time of the process file.
* File Attributes:Attributes of the process file.
* File Size:Size of the process file.



Filtering DLL List
==================

You can use the following options to filter the DLL files list in the
upper pane:
* Options -> Show 32-bit DLLs:If you turn off this option,
  LoadedDllsView will not display 32-bit DLLs.
* Options -> Show 64-bit DLLs:If you turn off this option,
  LoadedDllsView will not display 64-bit DLLs.
* Options -> Show Only Non-Microsoft DLLs:If you turn on this option,
  LoadedDllsView will only display DLL files that their company name is
  not Microsoft.
* View -> Use Quick Filter (Ctrl+Q): When you turn on the 'Use Quick
  Filter' option, a text-box is inserted below the toolbar. You can type
  a string or multiple strings (Depending on the search option you
  choose) in this text-box and then LoadedDllsView will instantly display
  only the DLL entries that contain the string you type. For example: If
  you type 'Intel' in the filter text-box, DLL files created by Intel
  (With 'Intel' in the company name) will be displayed.
  There is also an option to filter the DLL files by multiple wildcards,
  for exmaple: nt*.dll, msv*.dll ('Find filename by wildcards' option).



Command-Line Options
====================



/stext <Filename>
Save the loaded DLL files list into a simple text file.

/stab <Filename>
Save the loaded DLL files list into a tab-delimited text file.

/scomma <Filename>
Save the loaded DLL files list into a comma-delimited text file (csv).

/stabular <Filename>
Save the loaded DLL files list into a tabular text file.

/shtml <Filename>
Save the loaded DLL files list into HTML file (Horizontal).

/sverhtml <Filename>
Save the loaded DLL files list into HTML file (Vertical).

/sxml <Filename>
Save the loaded DLL files list into XML file.

/sort <column>
This command-line option can be used with other save options for sorting
by the desired column. The <column> parameter can specify the column
index (0 for the first column, 1 for the second column, and so on) or the
name of the column, like "Filename" and "Processes Count". You can
specify the '~' prefix character (e.g: "~Processes Count") if you want to
sort in descending order. You can put multiple /sort in the command-line
if you want to sort by multiple columns.





Translating LoadedDllsView to other languages
=============================================

In order to translate LoadedDllsView to other language, follow the
instructions below:
1. Run LoadedDllsView with /savelangfile parameter:
   LoadedDllsView.exe /savelangfile
   A file named LoadedDllsView_lng.ini will be created in the folder of
   LoadedDllsView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run LoadedDllsView, and all
   translated strings will be loaded from the language file.
   If you want to run LoadedDllsView without the translation, simply
   rename the language file, or move it to another folder.



License
=======

This utility is released as freeware. You are allowed to freely
distribute this utility via CD-ROM, DVD, USB Flash Drive, Internet, or in
any other way, as long as you don't charge anything for this and you
don't sell it or distribute it as a part of commercial product. If you
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

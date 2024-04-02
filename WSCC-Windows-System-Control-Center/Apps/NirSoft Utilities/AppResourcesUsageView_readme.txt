


AppResourcesUsageView v1.05
Copyright (c) 2022 - 2023 Nir Sofer
Web site: https://www.nirsoft.net/utils/app_resources_usage_view.html



Description
===========

AppResourcesUsageView extracts and displays the application resources
usage information stored in the SRUDB.dat database of Windows 10 and
Windows 11.
The application resources usage data is automatically collected by
Windows operating systems and includes the following information: Record
ID, Timestamp, Application, User, Cycle Time (Foreground/Background),
Face Time, Context Switches (Foreground/Background), Bytes Read/Written
(Foreground/Background), Read/Write Operations Count
(Foreground/Background).



System Requirements
===================


* This tool works on Windows 10 and Windows 11. Both 32-bit and 64-bit
  systems are supported.
* This tool is just a small standalone .exe file that you can run on
  any system without installing anything.



Data Source
===========

The application resources usage data is taken from the following database
file: C:\Windows\System32\sru\SRUDB.dat
The following table contains the application resources usage data:
{D10CA2FE-6FCF-4F6D-848E-B2E99266FA89}



Version History
===============


* Version 1.05:
  o Added option to change the sorting column from the menu (View ->
    Sort By). Like the column header click sorting, if you click again
    the same sorting menu item, it'll switch between ascending and
    descending order. Also, if you hold down the shift key while choosing
    the sort menu item, you'll get a secondary sorting.
  o Also added 'Sort By' button to the toolbar.

* Version 1.01:
  o Added 'Align Numeric Columns To Right' option.

* Version 1.00 - First release.



Start Using AppResourcesUsageView
=================================

AppResourcesUsageView doesn't require any installation process or
additional DLL files. In order to start using it, simply run the
executable file - AppResourcesUsageView.exe
After running AppResourcesUsageView - if the SRUDB.dat database file is
locked , AppResourcesUsageView will ask you whether you want to run it as
administrator in order to access the locked file. If the file is not
locked, AppResourcesUsageView will load it instantly.



'Advanced Options' Window
=========================

In the 'Advanced Options' window (F9), you can choose to load the
SRUDB.dat database from external drive or from a remote computer on your
network. Be aware that loading the application resources usage
information from a remote computer works only when the database file on
the remote computer is not locked.

You can also choose to load the application resources usage data from the
last xx days hours or from the specified date/time range.



Command-Line Options
====================



/stext <Filename>
Save the app resources usage information to a simple text file.

/stab <Filename>
Save the app resources usage information to a tab-delimited text file.

/scomma <Filename>
Save the app resources usage information to a comma-delimited text file
(csv).

/shtml <Filename>
Save the app resources usage information to HTML5 file (Horizontal).

/sverhtml <Filename>
Save the app resources usage information to HTML5 file (Vertical).

/sxml <Filename>
Save the app resources usage information to XML file.

/sjson <Filename>
Save the app resources usage information to JSON file.

/sort <column>
This command-line option can be used with other save options for sorting
by the desired column. The <column> parameter can specify the column
index (0 for the first column, 1 for the second column, and so on) or the
name of the column, like "Timestamp" and "App Name". You can specify the
'~' prefix character (e.g: "~User Name") if you want to sort in
descending order. You can put multiple /sort in the command-line if you
want to sort by multiple columns.

/cfg <Config Filename&gt
Start AppResourcesUsageView with the specified config file.

/Columns <Comma Delimited Columns List>
Allows you to set the columns to display or the columns to export from
command-line. You have to specify the column names, delimited by comma,
for example:
AppResourcesUsageView.exe /scomma c:\temp\app-resources.csv /Columns
"Timestamp,App Name,App Description,User Name,Foreground Bytes
Read,Foreground Bytes Written"

You can also specify the column names without space characters, for
example:
AppResourcesUsageView.exe /Columns "Timestamp,AppName,App
Description,UserName,ForegroundBytesRead,ForegroundBytesWritten"



Translating AppResourcesUsageView to other languages
====================================================

In order to translate AppResourcesUsageView to other language, follow the
instructions below:
1. Run AppResourcesUsageView with /savelangfile parameter:
   AppResourcesUsageView.exe /savelangfile
   A file named AppResourcesUsageView_lng.ini will be created in the
   folder of AppResourcesUsageView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run AppResourcesUsageView, and
   all translated strings will be loaded from the language file.
   If you want to run AppResourcesUsageView without the translation,
   simply rename the language file, or move it to another folder.



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

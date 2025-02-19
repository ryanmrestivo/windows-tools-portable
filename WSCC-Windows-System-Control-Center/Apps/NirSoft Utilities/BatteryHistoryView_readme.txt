


BatteryHistoryView v1.06
Copyright (c) 2022 - 2024 Nir Sofer
Web site: https://www.nirsoft.net/utils/battery_history_view.html



Description
===========

BatteryHistoryView extracts and displays the history information of the
laptop battery stored in the SRUDB.dat database of Windows 10 and Windows
11.
The battery history information is automatically collected by Windows
operating systems and includes the following information: Timestamp,
Cycle Count, Designed Capacity, Full Charged Capacity, Charge Level,
Charge Percent, Active AC Time, CS AC Time, Active DC Time, CS DC Time,
Active Discharge Time, CS Discharge Time, Active Energy, CS Energy.



System Requirements
===================


* This tool works on Windows 10 and Windows 11. Both 32-bit and 64-bit
  systems are supported.
* This tool is just a small standalone .exe file that you can run on
  any system without installing anything.



Data Source
===========

The battery history data is taken from the following database file:
C:\Windows\System32\sru\SRUDB.dat
The following tables contain the battery history information:
{FEE4E14F-02A9-4550-B5CE-5FA2DA202E37}LT and
{FEE4E14F-02A9-4550-B5CE-5FA2DA202E37}



Version History
===============


* Version 1.06:
  o Fixed issue: BatteryHistoryView crashed while reading the
    SRUDB.dat database created by Windows 11 24H2.
  o Added 'Black Background' option (Under the View menu). When it's
    turned on, the main table is displayed in black background and white
    text, instead of default system colors.

* Version 1.05:
  o Added option to change the sorting column from the menu (View ->
    Sort By). Like the column header click sorting, if you click again
    the same sorting menu item, it'll switch between ascending and
    descending order.
  o Added 'Sort By' toolbar button.

* Version 1.01:
  o Added 'Align Numeric Columns To Right' option.

* Version 1.00 - First release.



Start Using BatteryHistoryView
==============================

BatteryHistoryView doesn't require any installation process or additional
DLL files. In order to start using it, simply run the executable file -
BatteryHistoryView.exe
After running BatteryHistoryView - if the SRUDB.dat database file is
locked , BatteryHistoryView will ask you whether you want to run it as
administrator in order to access the locked file. If the file is not
locked, BatteryHistoryView will load it instantly.

Be aware: BatteryHistoryView loads the battery history from 2 different
tables, and thus you'll get in this tool 2 types of records. The first
type of record only displays the following fields: Timestamp, Cycle
Count, Designed Capacity, Full Charged Capacity, Charge Level, Charge
Percent. The second type of record displays the rest of the fields.



'Advanced Options' Window
=========================

In the 'Advanced Options' window (F9), you can choose to load the
SRUDB.dat database from external drive or from a remote computer on your
network. Be aware that loading the battery history information from a
remote computer works only when the database file on the remote computer
is not locked.

You can also choose to load the battery history information from the last
xx days hours or from the specified date/time range.



Command-Line Options
====================



/stext <Filename>
Save the battery history information to a simple text file.

/stab <Filename>
Save the battery history information to a tab-delimited text file.

/scomma <Filename>
Save the battery history information to a comma-delimited text file (csv).

/shtml <Filename>
Save the battery history information to HTML5 file (Horizontal).

/sverhtml <Filename>
Save the battery history information to HTML5 file (Vertical).

/sxml <Filename>
Save the battery history information to XML file.

/sjson <Filename>
Save the battery history information to JSON file.

/sort <column>
This command-line option can be used with other save options for sorting
by the desired column. The <column> parameter can specify the column
index (0 for the first column, 1 for the second column, and so on) or the
name of the column, like "Timestamp" and "Cycle Count". You can specify
the '~' prefix character (e.g: "~Full Charged Capacity") if you want to
sort in descending order. You can put multiple /sort in the command-line
if you want to sort by multiple columns.

/cfg <Config Filename&gt
Start BatteryHistoryView with the specified config file.

/Columns <Comma Delimited Columns List>
Allows you to set the columns to display or the columns to export from
command-line. You have to specify the column names, delimited by comma,
for example:
BatteryHistoryView.exe /shtml c:\temp\battery-report.html /Columns
"Timestamp,Cycle Count,Designed Capacity,Full Charged Capacity"

You can also specify the column names without space characters, for
example:
BatteryHistoryView.exe /Columns
"Timestamp,CycleCount,DesignedCapacity,FullChargedCapacity"



Translating BatteryHistoryView to other languages
=================================================

In order to translate BatteryHistoryView to other language, follow the
instructions below:
1. Run BatteryHistoryView with /savelangfile parameter:
   BatteryHistoryView.exe /savelangfile
   A file named BatteryHistoryView_lng.ini will be created in the folder
   of BatteryHistoryView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run BatteryHistoryView, and all
   translated strings will be loaded from the language file.
   If you want to run BatteryHistoryView without the translation, simply
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

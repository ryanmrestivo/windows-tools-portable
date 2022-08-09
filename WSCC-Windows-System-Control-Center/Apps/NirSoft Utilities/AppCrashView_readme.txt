


AppCrashView v1.35
Copyright (c) 2009 - 2018 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

AppCrashView is a small utility for Windows Vista and Windows 7 that
displays the details of all application crashes occurred in your system.
The crashes information is extracted from the .wer files created by the
Windows Error Reporting (WER) component of the operating system every
time that a crash is occurred. AppCrashView also allows you to easily
save the crashes list to text/csv/html/xml file.



System Requirements
===================

For now, this utility only works on Windows Vista, Windows 7, Windows
Server 2008, Windows 8, and Windows 10. simply because the earlier
versions of Windows don't save the crash information into .wer files.
It's possible that in future versions, I'll also add support for Windows
XP/2000/2003 by using Dr. Watson (Drwtsn32.exe) or other debug component
that capture the crash information.



Versions History
================


* Version 1.35
  o Added 'Quick Filter' feature (View -> Use Quick Filter or
    Ctrl+Q). When it's turned on, you can type a string in the text-box
    added under the toolbar and AppCrashView will instantly filter the
    application crashes list, showing only lines that contain the string
    you typed.

* Version 1.31
  o Added 'Run As Administrator' option (Ctrl+F11), which allows you
    to easily run AppCrashView as administrator for viewing crash reports
    that are not accessible for non-admin user.
  o Fixed bug: AppCrashView failed to remember the last size/position
    of the main window if it was not located in the primary monitor.

* Version 1.30
  o Added 'Exception Code Description' column.

* Version 1.25
  o Added option to delete the selected reports.

* Version 1.21
  o Fixed to display date/time values according to daylight saving
    time settings.

* Version 1.20
  o Added 'Open Report File Folder' option.
  o Added 'Open Process Folder' option.

* Version 1.15
  o Added /ReportsFolder command-line option, which allows you to
    specify the exact reports folder you want to load, for example:
    AppCrashView.exe /ReportsFolder "c:\temp\wer"

* Version 1.12
  o Fixed bug: The crash items located under 'All Users' profile
    displayed twice.
  o Added 'Auto Size Columns+Headers' option.

* Version 1.11
  o Added 'Mark Odd/Even Rows' option, under the View menu. When it's
    turned on, the odd and even rows are displayed in different color, to
    make it easier to read a single line.

* Version 1.10
  o Added 'Add Header Line To CSV/Tab-Delimited File' option. When
    this option is turned on, the column names are added as the first
    line when you export to csv or tab-delimited file.

* Version 1.07
  o Fixed issue: removed the encoding from the xml string, which
    caused problems to some xml viewers.

* Version 1.06
  o Added /ShowReportQueue and /ShowReportArchive command-line options

* Version 1.05
  o Added more WER folders.
  o Added 'Show ReportArchive Files' and 'Show ReportQueue Files'
    options. 'Show ReportQueue Files' option is turned off by default,
    because the ReportQueue folder doesn't contain crashes or critical
    errors.
  o Added /ProgramData command-line option.

* Version 1.00 - First release.



Using AppCrashView
==================

AppCrashView doesn't require any installation process or additional dll
files. In order to start using it, simply run the executable file -
AppCrashView.exe

The main window of AppCrashView contains 2 pane. The upper pane displays
the list of all crashes found in your system, while the lower pane
displays the content of the crash file that you select in the upper pane.
You can select one or more crashes in the upper pane, and then save them
(Ctrl+S) into text/html/xml/csv file or copy them to the clipboard ,and
paste them into Excel or other spreadsheet application.



Command-Line Options
====================



/ProfilesFolder <Folder>
Specifies the user profiles folder (e.g: c:\users) to load. If this
parameter is not specified, the profiles folder of the current operating
system is used.

/ReportsFolder <Folder>
Specifies the folder that contains the WER files you wish to load.

/ShowReportQueue <0 | 1>
Specifies whether to enable the 'Show ReportQueue Files' option. 1 =
enable, 0 = disable

/ShowReportArchive <0 | 1>
Specifies whether to enable the 'Show ReportArchive Files' option. 1 =
enable, 0 = disable

/stext <Filename>
Save the list of application crashes into a regular text file.

/stab <Filename>
Save the list of application crashes into a tab-delimited text file.

/scomma <Filename>
Save the list of application crashes into a comma-delimited text file
(csv).

/stabular <Filename>
Save the list of application crashes into a tabular text file.

/shtml <Filename>
Save the list of application crashes into HTML file (Horizontal).

/sverhtml <Filename>
Save the list of application crashes into HTML file (Vertical).

/sxml <Filename>
Save the list of application crashes into XML file.

/sort <column>
This command-line option can be used with other save options for sorting
by the desired column. If you don't specify this option, the list is
sorted according to the last sort that you made from the user interface.
The <column> parameter can specify the column index (0 for the first
column, 1 for the second column, and so on) or the name of the column,
like "Event Name" and "Process File". You can specify the '~' prefix
character (e.g: "~Event Time") if you want to sort in descending order.
You can put multiple /sort in the command-line if you want to sort by
multiple columns.

Examples:
AppCrashView.exe /shtml "f:\temp\crashlist.html" /sort 2 /sort ~1
AppCrashView.exe /shtml "f:\temp\crashlist.html" /sort "Process File"

/nosort
When you specify this command-line option, the list will be saved without
any sorting.



Translating AppCrashView to other languages
===========================================

In order to translate AppCrashView to other language, follow the
instructions below:
1. Run AppCrashView with /savelangfile parameter:
   AppCrashView.exe /savelangfile
   A file named AppCrashView_lng.ini will be created in the folder of
   AppCrashView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run AppCrashView, and all
   translated strings will be loaded from the language file.
   If you want to run AppCrashView without the translation, simply rename
   the language file, or move it to another folder.



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

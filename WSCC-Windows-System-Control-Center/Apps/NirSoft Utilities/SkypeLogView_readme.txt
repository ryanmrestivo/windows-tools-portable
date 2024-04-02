


SkypeLogView v1.55
Copyright (c) 2008 - 2014 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

SkypeLogView reads the log files created by Skype application, and
displays the details of incoming/outgoing calls, chat messages, and file
transfers made by the specified Skype account. You can select one or more
items from the logs list, and then copy them to the clipboard, or export
them into text/html/csv/xml file.



System Requirements
===================

This utility works on any version of Windows starting from Windows 2000
and up to Windows 8. You don't have to install Skype in order to use this
utility. You only need the original log files created by skype, even if
they are on an external drive.



Versions History
================


* Version 1.55:
  o Fixed to find the correct item when typing the string you want to
    search into the main List View.
  o Added secondary sorting support: You can now get a secondary
    sorting, by holding down the shift key while clicking the column
    header. Be aware that you only have to hold down the shift key when
    clicking the second/third/fourth column. To sort the first column you
    should not hold down the Shift key.

* Version 1.52:
  o Fixed SkypeLogView to work while Skype is running.

* Version 1.51:
  o Added 'End Time' column. (Available only for records with
    duration value)

* Version 1.50:
  o Added new actions: Voicemails and chats.
  o Added 'Copy Selected Messages' option (Ctrl+M) - Copy only the
    messages of all selected items.
  o Fixed to display date/time properly according to daylight saving
    time settings.

* Version 1.42:
  o Fixed bug: SkypeLogView crashed when exporting long chat message
    to html file.
  o Fixed issue: The properties and the other windows opened in the
    wrong monitor, on multi-monitors system.

* Version 1.41:
  o You can now specify directly the main.db filename, instead of the
    skype folder where main.db is located. (This feature works from the
    user interface and with the /logsfolder command-line option)

* Version 1.40:
  o Added Duration Display Format option: HH:MM:SS, Seconds, Minutes,
    or Hours.

* Version 1.36:
  o Fixed a problem with /SaveDirect command-line option.

* Version 1.35:
  o Added 'Stop' menu item which allows you to stop the loading
    process of the Skype logs.
  o SkypeLogView now loads the log items much faster and with less
    memory usage, especially if you have a large amount of items in the
    log.
  o Added support for SMS messages.

* Version 1.30:
  o Added 'Show Select Folder On Start' option. When it's turned on,
    the 'Select Skype Logs Folder' window appears on the screen before
    loading the logs of Skype, so you can choose the correct folder
    and/or choose a specific date/time range.
  o Fixed bug: SkypeLogView failed to load the log file if the path
    contained non-English characters.
  o Added /SaveDirect command line option, for using with the other
    save command-line options (/scomma, /stab, /sxml, and so on...)
    When you use the SaveDirect mode, the log lines of Skype are saved
    directly to the disk, without loading them into the memory first.
    This means that you can save a list with large amount of log lines
    into your disk without any memory problem, as long as you have enough
    disk space to store the saved file. The drawback of this mode: You
    cannot sort the log lines according to the column you choose with
    /sort command-line option.
  o The date/time range is now saved in the config file.
  o Added 3 command-line options to set the date/time range:
    /UseTimeRange , /FromTime and /ToTime

* Version 1.21 - Fixed a crash problem when saving to HTML.
* Version 1.20 - Added option to load only the log records in the
  specified date/time range. (In the 'Select Logs Folder' window)
* Version 1.16 - SkypeLogView now displays an error message if Skype 5
  is opened and locks the log file.
* Version 1.15 - Fixed bug: For some records, SkypeLogView displayed a
  wrong date/time, with year 2065-2067.
* Version 1.13 - Fixed issue: Removed the wrong encoding from the xml
  string, which caused problems to some xml viewers.
* Version 1.12 - Added command-line option for sorting.
* Version 1.11 - Fixed bug: SkypeLogView crashed on saving to html.
* Version 1.10 - Added support for the new 'main.db' that is created
  and used by Skype 4. When this file is detected, SkypeLogView
  automatically loads the logs from this file instead of the old .dbb
  files.
* Version 1.06 - Added error message when Skype locks the log files.
* Version 1.05 - Added filter by action type (In Options menu).
* Version 1.00 - First release.



Skype Log Files Location
========================

Skype Log files are stored under C:\Documents and Settings\[Profile
Name]\Application Data\Skype\[Skype User]. In Windows Vista and 2008, the
log files are stored under C:\Documents and Settings\[Profile
Name]\AppData\Roaming\Skype\[Skype User].



Using SkypeLogView
==================

SkypeLogView doesn't require any installation process or additional dll
files. In order to start using it, simply run the executable file -
SkypeLogView.exe
If Skype is installed on your system, SkypeLogView automatically detect
the last used account, and loads the logs from it. You can select to view
the logs of another account by using the "Select Logs Folder" option.
After you loaded the right logs, you can select one or more items from
the list, and then save them to text/csv/html/xml file.



A Few Points To Notice...
=========================


* When Skype is opened, it also locks the logs file. before using
  SkypeLogView, you should close Skype completely.
* For calls and file transfers, the 'User Name' and 'Display Name'
  columns always display the user in the other side. As opposed to calls
  and file transfers, in chat messages these columns always display the
  the user that sent the message. This means that if you are the one that
  sent the message, you'll see your own name in these columns.
* For chat messages, the ChatID column is identical for all messages in
  the same chat session.
* The duration column is only displayed for incoming/outgoing calls.
  Also, for calls tries that have been failed, the duration column won't
  display any value.



Command-Line Options
====================



/SaveDirect
Save the log lines in SaveDirect mode. For using with the other save
command-line options ( /scomma, /stab, /sxml, and so on...)
When you use the SaveDirect mode, the log lines of Skype are saved
directly to the disk, without loading them into the memory first. This
means that you can save a list with large amount of log lines into your
disk without any memory problem, as long as you have enough disk space to
store the saved file. The drawback of this mode: You cannot sort the log
lines according to the column you choose with /sort command-line option.

/UseTimeRange <0 | 1>
0 = Load all records. 1 = Load only records according to the specified
date/time range.

/FromTime <date/time>
/ToTime <date/time>
Specifies the date/time range. You must specify the date/time in the
following format: dd-mm-yyyy hh:mm:ss
For example:
SkypeLogView.exe /UseTimeRange 1 /FromTime "22-06-2011 10:40:17" /ToTime
"25-07-2011 14:20:10"

/stext <Filename>
Save the list of all log items into a regular text file.

/stab <Filename>
Save the list of all log items into a tab-delimited text file.

/scomma <Filename>
Save the list of all log items into a comma-delimited text file.

/stabular <Filename>
Save the list of all log items into a tabular text file.

/shtml <Filename>
Save the list of all log items into HTML file (Horizontal).

/sverhtml <Filename>
Save the list of all log items into HTML file (Vertical).

/sxml <Filename>
Save the list of all log items to XML file.

/logsfolder <Logs Folder>
Start SkypeLogView with the specified logs folder. You can also specify
the main.db filename instead of the log folder.

/sort <column>
This command-line option can be used with other save options for sorting
by the desired column. If you don't specify this option, the list is
sorted according to the last sort that you made from the user interface.
The <column> parameter can specify the column index (0 for the first
column, 1 for the second column, and so on) or the name of the column,
like "Record Number" and "Action Time". You can specify the '~' prefix
character (e.g: "~User Name") if you want to sort in descending order.
You can put multiple /sort in the command-line if you want to sort by
multiple columns.

Examples:
SkypeLogView.exe /shtml "f:\temp\logs.html" /sort 2 /sort ~1
SkypeLogView.exe /shtml "f:\temp\logs.html" /sort "User Name" /sort
"Record Number"

/nosort
When you specify this command-line option, the list will be saved without
any sorting.



Translating SkypeLogView to other languages
===========================================

In order to translate SkypeLogView to other language, follow the
instructions below:
1. Run SkypeLogView with /savelangfile parameter:
   SkypeLogView.exe /savelangfile
   A file named SkypeLogView_lng.ini will be created in the folder of
   SkypeLogView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run SkypeLogView, and all
   translated strings will be loaded from the language file.
   If you want to run SkypeLogView without the translation, simply rename
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

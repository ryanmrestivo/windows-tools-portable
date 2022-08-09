


ChromeHistoryView v1.50
Copyright (c) 2011 - 2022 Nir Sofer
Web site: https://www.nirsoft.net



Description
===========

ChromeHistoryView is a small utility that reads the history data file of
Google Chrome Web browser, and displays the list of all visited Web pages
in the last days. For each visited Web page, the following information is
displayed: URL, Title, Visit Date/Time, Number of visits, number of times
that the user typed this address (Typed Count), Referrer, and Visit ID.
You can select one or more history items, and them export them into
html/xml/csv/text file, or copy the information to the clipboard and
paste it into Excel.

You can also use this tool to read the history of other Chromium-based
Web browsers, like Microsoft Edge, Opera, Vivaldi, and others...



Versions History
================


* Version 1.50
  o Added 'Visit Duration' column.
  o Improved the 'Referrer' column in new versions of Chrome.

* Version 1.46
  o Updated to read the history database file of the latest versions
    of Chrome Web browser.

* Version 1.45
  o You can now choose the desired encoding (ANSI, UTF-8, UTF-16) to
    save the csv/xml/text/html files. (Options -> Save File Encoding )
  o Updated to work properly in high DPI mode.

* Version 1.42
  o Fixed bug: ChromeHistoryView crashed if there was an history
    record with missing URL.

* Version 1.41
  o Added 'Edge History File' button to the 'Advanced Options'
    window. When you click this button, ChromeHistoryView automatically
    fills the history file of Chromium-based Edge Web browser, and then
    you can view the history of Edge Web browser.

* Version 1.40
  o Added new option: 'Delete Selected History Records', which allows
    you to select one or more items and then delete the Chrome history
    records.
  o Added 'History File' column.

* Version 1.37
  o When pressing F5 (Refresh) the refresh process is smoother,
    keeping the selected item and scroll position.

* Version 1.36
  o Added 'Add Header Line To CSV/Tab-Delimited File' option (Turned
    on by default).

* Version 1.35
  o Added 'Quick Filter' feature (View -> Use Quick Filter or
    Ctrl+Q). When it's turned on, you can type a string in the text-box
    added under the toolbar and ChromeHistoryView will instantly filter
    the history table, showing only items that contain the string you
    typed.

* Version 1.32
  o Added 'Auto Size Columns+Headers' option.

* Version 1.31
  o You can now specify the base User Data folder of Chrome (e.g:
    C:\Users\user1\AppData\Local\Google\Chrome\User Data ) in 'Advanced
    Options' window for loading the history of all profiles.

* Version 1.30
  o Added new columns: 'Transition Type' and 'Transition Qualifiers'.
    You can read about the meaning of these fields here and here.

* Version 1.25
  o Added new buttons to easily choose the history file of
    Chrome-base Web browsers: 'Vivaldi History File', 'Yandex History
    File' (Advanced Options window).

* Version 1.22
  o Added 'URL Length' column.

* Version 1.21
  o Added 'Opera History File' button to the 'Advanced Options'
    window, which allows you to easily use this tool to view the history
    of Opera Web browser. (Opera is now based on the code of Chrome Web
    browser...)

* Version 1.20
  o ChromeHistoryView now displays the history of all Chrome profiles.
  o Added 'Profile' column.
  o You can now specify environment variables in the history file on
    the 'Advanced options' window, for example:
    %LocalAppData%\Google\Chrome\User Data\default\History

* Version 1.17
  o Fixed to display local date/time values according to daylight
    saving time settings.

* Version 1.16
  o You can now click the URL in the HTML report to open the URL in
    your Web browser.

* Version 1.15
  o Added new command-line options: /UseHistoryFile, /HistoryFile,
    /UseVisitTimeFilter, /VisitTimeFilter, /UseTimeRange, /TimeRangeFrom,
    /TimeRangeTo

* Version 1.11
  o Fixed bug: ChromeHistoryView failed to load the history if the
    history path contained non-English characters.

* Version 1.10
  o Added option to view only the URLs visited in the specified time
    range. (In Advanced Options window)
  o Added option to view only the URLs visited in the last xx days.
    (In Advanced Options window)

* Version 1.05
  o Fixed ChromeHistoryView to work properly when Chrome is opened
    and locks the history file.

* Version 1.00 - First release.



Using ChromeHistoryView
=======================

ChromeHistoryView doesn't require any installation process or additional
DLL files. In order ti start using it, simply copy the executable file
(ChromeHistoryView.exe) to any folder you like, and run it.

After you run it, the main window displays the list of visited Web pages
loaded from the history file of Chrome Web browser. If you want to load
the history file of another profile, simply use the Advanced Options
window (F9) to choose another history file.

You can select one or more history items, and then export the list into
html/xml/csv/text file ('Save Selected Items' option - Ctrl+S). You can
also copy the selected items to the clipboard, and then paste them to
Excel or to OpenOffice spreadsheet.



Command-Line Options
====================



/stext <Filename>
Save the Chrome browsing history into a regular text file.

/stab <Filename>
Save the Chrome browsing history into a tab-delimited text file.

/scomma <Filename>
Save the Chrome browsing history into a comma-delimited text file (csv).

/stabular <Filename>
Save the Chrome browsing history into a tabular text file.

/shtml <Filename>
Save the Chrome browsing history into HTML file (Horizontal).

/sverhtml <Filename>
Save the Chrome browsing history into HTML file (Vertical).

/sxml <Filename>
Save the Chrome browsing history into XML file.

/sort <column>
This command-line option can be used with other save options for sorting
by the desired column. If you don't specify this option, the list is
sorted according to the last sort that you made from the user interface.
The <column> parameter can specify the column index (0 for the first
column, 1 for the second column, and so on) or the name of the column,
like "Title" and "URL". You can specify the '~' prefix character (e.g:
"~Visited On") if you want to sort in descending order. You can put
multiple /sort in the command-line if you want to sort by multiple
columns.

Examples:
ChromeHistoryView.exe /shtml "f:\temp\history.html" /sort 2 /sort ~1
ChromeHistoryView.exe /shtml "f:\temp\history.html" /sort "URL" /sort
"Visited On"

/nosort
When you specify this command-line option, the list will be saved without
any sorting.

/UseHistoryFile <0 | 1>
If this value is set to 1, the history file specified in the /HistoryFile
parameter will be used.

/HistoryFile <Filename>
Specifies the history file to load.

Example:
ChromeHistoryView.exe /UseHistoryFile 1 /HistoryFile "C:\Documents and
Settings\admin\Local Settings\Application Data\Google\Chrome\User
Data\Default\History"

/UseVisitTimeFilter <0 | 1>
If this value is set to 1, the filter of /VisitTimeFilter parameter will
be used.

/VisitTimeFilter <Days>
Loads the history items only from the last xx days.

/UseTimeRange <0 | 1>
If this value is set to 1, /TimeRangeFrom and /TimeRangeTo parameters
will be used.

/TimeRangeFrom <Time>
/TimeRangeTo <Time>
Specifies the time range to load the history.

Example:
ChromeHistoryView.exe /UseTimeRange 1 /TimeRangeFrom "15-02-2012
10:50:00" /TimeRangeTo "16-02-2012 12:50:00"



Translating ChromeHistoryView to other languages
================================================

In order to translate ChromeHistoryView to other language, follow the
instructions below:
1. Run ChromeHistoryView with /savelangfile parameter:
   ChromeHistoryView.exe /savelangfile
   A file named ChromeHistoryView_lng.ini will be created in the folder
   of ChromeHistoryView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run ChromeHistoryView, and all
   translated strings will be loaded from the language file.
   If you want to run ChromeHistoryView without the translation, simply
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

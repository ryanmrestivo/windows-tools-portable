


FirefoxDownloadsView v1.40
Copyright (c) 2011 - 2019 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

This utility displays the list of the latest files that you downloaded
with Firefox. For every download record, the following information is
displayed: Download URL, Download Filename (with full path), Referrer,
MIME Type, File Size, Start/End Time, Download Duration, and Average
Download Speed.

You can easily select one or more downloads, and then save the list into
xml/html/text/csv file or copy the downloads information to the clipboard
and paste it into Excel or other spreadsheet application.



System Requirements
===================

This utility works with Firefox 3 or later on Windows
2000/XP/Vista/7/8.x/2003/2008. Previous versions of Firefox are not
supported.



Known Issues
============


* The value of 'Average Speed' column is calculated according to
  downloaded bytes and start/end download time. This calculated value
  might be distorted when the file size is very small or when the file
  was sent with gzip compression.
* Starting from version 20 of Firefox, there is a new downloads
  manager. In order to view the downloads of the new downloads manager,
  you have to turn on the following option: Options -> Use New Firefox 20
  Download Manager
  Be aware that some of the information, like Start Time, End Time,
  Duration is missing in the new download manager of Firefox, and thus
  FirefoxDownloadsView cannot display it.
  You can still switch to the old download manager and get full downloads
  information: Simply type 'About:Config' in Firefox, and then set the
  browser.download.useToolkitUI option to true.



Versions History
================


* Version 1.40:
  o Fixed to work with the latest versions of Firefox.

* Version 1.39:
  o When using the 'Open Selected File With' option, the 'Always use
    the selected program to open this kind of file' check-box is now
    turned off and disabled.

* Version 1.38:
  o The 'Use New Firefox 20 Download Manager' option is now turned on
    by default.

* Version 1.37:
  o Added /cfg command-line option, which instructs
    FirefoxDownloadsView to use a config file in another location instead
    if the default config file, for example:
    FirefoxDownloadsView.exe /cfg "%AppData%\FirefoxDownloadsView.cfg"
  o Fixed the flickering problem occurred on Windows 7, while
    scrolling the downloads list.

* Version 1.36:
  o Added /UseNewFirefoxDM command-line option.

* Version 1.35:
  o Added support for the new download manager of Firefox 20. In
    order to activate it, you have to turn on the following option:
    Options -> Use New Firefox 20 Download Manager.
    Be aware that some of the information, like Start Time, End Time,
    Duration is missing in the new download manager of Firefox, and thus
    FirefoxDownloadsView cannot display it.
    You can still switch to the old download manager and get full
    downloads information: Simply type 'About:Config' in Firefox, and
    then set the browser.download.useToolkitUI option to true.

* Version 1.33:
  o Added 'Auto Size Columns+Headers' option, which allows you to
    automatically resize the columns according to the row values and
    column headers.
  o Fixed issue: The properties and the other windows opened in the
    wrong monitor, on multi-monitors system.

* Version 1.32:
  o Fixed bug: FirefoxDownloadsView failed to load the downloads list
    if the profile path contained non-English characters.

* Version 1.31:
  o Fixed bug: FirefoxDownloadsView froze for a few seconds if a
    downloaded filename was located on disconnected network drive.

* Version 1.30:
  o Added 'Put Icon On Tray'.

* Version 1.25:
  o The refresh option now works more smoothly, without loading the
    entire list again.
  o Added Auto Refresh option. When it's turned on, the downloads
    list is automatically refreshed every time that a change in the
    downloads database file is detected.

* Version 1.20:
  o Added 'Status' column - Succeeded, Failed, or Canceled.

* Version 1.15:
  o You can now drag one or more files from the window of
    FirefoxDownloadsView into a folder of Windows Explorer or any other
    software that supports drag & drop of files.

* Version 1.11:
  o Added 'Open Filename Folder' option (F6)
  o Also, Added 'Open Filename Folder' option to choose as
    Double-Click Action.

* Version 1.10:
  o Added 'Open Selected File With...' option.
  o Added 'Double-Click Action' option, which allows you to choose
    what to do when you double-click on a single item - Open Properties
    Window, Open Selected URL, Open Selected File, or Open Selected File
    With.
  o Added 'Mark Odd/Even Rows' option, under the View menu. When it's
    turned on, the odd and even rows are displayed in different color, to
    make it easier to read a single line.

* Version 1.05:
  o Added 'Advanced Options' window (Under the Options menu) which
    allows you to choose another Firefox profile, instead of the default
    one.
  o Added /profile command-line option, to set the profile folder
    from command-line.
  o Added 'Download ID' column.

* Version 1.00 - First release.



Using FirefoxDownloadsView
==========================

FirefoxDownloadsView doesn't require any installation process or
additional DLL files. In order to start using it, simply run the
executable file - FirefoxDownloadsView.exe

After your run it, the main window displays the list of all downloads
stored in the Firefox database.

You can select one or more download items and then:
* Press Ctrl+S and save the downloads list into text/csv/html/xml file.
* Press Ctrl+C to copy the downloads list into the clipbaord, and then
  paste the list into Excel or other application.
* Press Ctrl+E (Explorer Copy) and then paste the downloaded files
  (Ctrl+V) into folder of Explorer that you wish to copy the files.
* Press Ctrl+E (Explorer Copy) and then paste the list (Ctrl+V) into
  HashMyFiles utility, in order to calculate the MD5/SHA1 hashes of the
  downloaded files.
* Press F7 (Open Selected URL) to open the URL in your default browser
  and download this file again.
* Press F8 (Open Selected Filename) to open the selected downloaded
  filename with the default application (like double-click on the file in
  Explorer)
* Press Ctrl+U to copy to the clipboard only the URLs.



Command-Line Options
====================



/cfg <Filename>
Start FirefoxDownloadsView with the specified configuration file. For
example:
FirefoxDownloadsView.exe /cfg "c:\config\fdv.cfg"
FirefoxDownloadsView.exe /cfg "%AppData%\FirefoxDownloadsView.cfg"

/profile <Profile Folder>
Specifies the profile folder of Firefox to use.
For example:
FirefoxDownloadsView.exe /profile "C:\Documents and
Settings\Administrator\Application
Data\Mozilla\Firefox\Profiles\1c0agx3u.default"

/UseNewFirefoxDM <0 | 1>
Specifies whether to use the new download manager of Firefox 20. 0 = No,
1 = Yes.

/stext <Filename>
Save the Firefox downloads list into a regular text file.

/stab <Filename>
Save the Firefox downloads list into a tab-delimited text file.

/scomma <Filename>
Save the Firefox downloads list into a comma-delimited text file (csv).

/stabular <Filename>
Save the Firefox downloads list into a tabular text file.

/shtml <Filename>
Save the Firefox downloads list into HTML file (Horizontal).

/sverhtml <Filename>
Save the Firefox downloads list into HTML file (Vertical).

/sxml <Filename>
Save the Firefox downloads list into XML file.

/sort <column>
This command-line option can be used with other save options for sorting
by the desired column. If you don't specify this option, the list is
sorted according to the last sort that you made from the user interface.
The <column> parameter can specify the column index (0 for the first
column, 1 for the second column, and so on) or the name of the column,
like "URL" and "ID". You can specify the '~' prefix character (e.g:
"~Mime Type") if you want to sort in descending order. You can put
multiple /sort in the command-line if you want to sort by multiple
columns.

Examples:
FirefoxDownloadsView.exe /shtml "f:\temp\downloads.html" /sort 2 /sort ~1
FirefoxDownloadsView.exe /shtml "f:\temp\downloads.html" /sort "Mime
Type" /sort "URL"

/nosort
When you specify this command-line option, the list will be saved without
any sorting.



Translating FirefoxDownloadsView to other languages
===================================================

In order to translate FirefoxDownloadsView to other language, follow the
instructions below:
1. Run FirefoxDownloadsView with /savelangfile parameter:
   FirefoxDownloadsView.exe /savelangfile
   A file named FirefoxDownloadsView_lng.ini will be created in the
   folder of FirefoxDownloadsView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run FirefoxDownloadsView, and all
   translated strings will be loaded from the language file.
   If you want to run FirefoxDownloadsView without the translation,
   simply rename the language file, or move it to another folder.



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




BrowserDownloadsView v1.45
Copyright (c) 2019 - 2023 Nir Sofer
Web site: https://www.nirsoft.net/utils/web_browser_downloads_view.html



Description
===========

BrowserDownloadsView is a tool for Windows that displays the details of
downloaded files of Chrome and Firefox Web browsers. For every download,
the following information is displayed: Filename, Download URL, Web Page
URL, Start Time, End Time, Download Duration, Download Size, Web Browser,
and more...
BrowserDownloadsView allows you to load the downloads list from your
current running system (your user or all user profiles), from remote
computer on your network , and from external hard drive.
After BrowserDownloadsView loads the downloads list, you can select one
or more downloads and then export them to
comma-delimited/tab-delimited/html5/xml/JSON file or calculate the
MD5/SHA1/SHA256/SHA512 hash of the downloaded files.



System Requirements
===================

This tool works on any version of Windows, starting from Windows XP and
up to Windows 11. Both 32-bit and 64-bit system are supported. It works
with Chrome, Firefox, and other Web browsers based on these Web browsers
(SeaMonkey, Opera, Yandex, Vivaldi, Brave, Chromium-Based Edge). It
doesn't show the files downloaded when the Web browser was in private
mode, because in private mode the details of downloaded files are not
saved to the database.



Versions History
================


* Version 1.45
  o Added 'Black Background' option (Under the View menu). When it's
    turned on, the main table is displayed in black background and white
    text, instead of default system colors.
  o Added 'Full Screen' mode (View -> Full Screen or F11 key).

* Version 1.44
  o Added 'Sort By' dropdown to the toolbar.

* Version 1.43
  o Added 'Server Modified Time' column, which displays the timestamp
    of downloaded file on the Web server. This column is available only
    for Web browsers based on Chrome.
  o Fixed the quick-filter text-box to copy to the clipboard when
    pressing Ctrl+C.

* Version 1.42
  o Added /Columns command-line option, which allows you to set the
    columns to display or the columns to export from command-line, for
    example:
    BrowserDownloadsView.exe /Columns "Full Path Filename,Download URL
    1,Download Size,Start Time,Web Browser"

* Version 1.41
  o Explorer context menu inside BrowserDownloadsView: When you
    right-click on a single item while holding down the shift key,
    BrowserDownloadsView now displays the context menu of Windows
    Explorer, instead of the BrowserDownloadsView context menu. This
    feature only works for existing downloaded files.

* Version 1.40
  o Added 'Open Filename Folder' to the 'Double-Click Action' and
    'Enter Action' options.

* Version 1.39
  o Added 'Copy Clicked Cell' option to the right-click context menu,
    which copies to the clipboard the text of cell that you right-clicked
    with the mouse.

* Version 1.38
  o Added option to change the sorting column from the menu (View ->
    Sort By). Like the column header click sorting, if you click again
    the same sorting menu item, it'll switch between ascending and
    descending order. Also, if you hold down the shift key while choosing
    the sort menu item, you'll get a secondary sorting.

* Version 1.37
  o Fixed issue with downloads of Chrome Web browser: In previous
    versions, when there was a download item with multiple URLs, every
    URL was displayed as separate download item. Now it's displayed as
    one download item, and there are 3 URL columns to display multiple
    URLs (Download URL 1, Download URL 2, Download URL 3).

* Version 1.36
  o Added support for Waterfox and Pale Moon Web browsers.

* Version 1.35
  o The bottom status bar now displays the total size of the selected
    downloads.
  o Fixed some high DPI mode issues.

* Version 1.33
  o Added 'File Size Unit' to set the unit for the 'Download Size'
    and 'File Size' columns: Bytes, kB, KiB, MB, MiB, GB, GiB, or
    Automatic.
  o Added support for Brave Web browser.

* Version 1.32
  o Added 'Start As Hidden' option. When this option and 'Put Icon On
    Tray' option are turned on, the main window of BrowserDownloadsView
    will be invisible on start.

* Version 1.31
  o Added 'Add Header Line To CSV/Tab-Delimited File' option (Turned
    on by default).

* Version 1.30
  o You can now use any variable inside the .cfg file in order to set
    the configuration from command line, for example:
    BrowserDownloadsView.exe /DownloadsSource 5 /ComputerName 192.168.0.50

* Version 1.25
  o Added 'File Exists' column, which tells you whether the
    downloaded file still exists on your drive (This feature works only
    for local drive).
  o Added 'File Size' column, which displays the actual size of the
    downloaded file on your drive (This feature works only for local
    drive).

* Version 1.20
  o Added 'Save All Items' option (Shift+Ctrl+S).
  o Added /cfg command-line option to start BrowserDownloadsView with
    the specified config file.

* Version 1.18
  o Fixed all filename options (MD5/SHA1/SHA256/SHA512 hash, Open/Run
    Selected Filename, Open Filename Folder) to work properly when
    connecting a remote computer.
  o When choosing to view the downloads on remote computer or on
    another profile, the remote computer name/profile path is now
    displayed in the window title.

* Version 1.17
  o Added 'File Properties' option, which displays the
    file-properties window for the selected file.
  o Added 'Open File Properties' to the 'Double-Click Action' and
    'Enter Action' option.

* Version 1.16
  o Added 'Show Time In GMT' option.

* Version 1.15
  o Added option to view the Web browser downloads only in the
    specified date/time range or in the last xx
    days/hours/minutes/seconds.

* Version 1.10
  o Added option to choose another font (name and size) to display in
    the main window.
  o Added 'Select All' and 'Deselect All' to the 'Column Settings'
    window.

* Version 1.05
  o Added 'Double-Click Action' option, which allows you to choose
    what to do when you double-click a download item with the mouse:
    None, Open Properties Window, Open/Run Selected Filename, Open
    Selected File With, Open Selected Download URL, Open Selected Web
    Page.
  o Added 'Enter Action' option, which allows you to choose what to
    do when you press the Enter key: None, Open Properties Window,
    Open/Run Selected Filename, Open Selected File With, Open Selected
    Download URL, Open Selected Web Page.
  o You can now copy downloaded files by dragging them from the main
    window of BrowserDownloadsView into a folder on Windows Explorer.

* Version 1.00 - First release.



Start Using BrowserDownloadsView
================================

BrowserDownloadsView doesn't require any installation process or
additional DLL files. In order to start using it, simply run the
executable file - BrowserDownloadsView.exe
After running BrowserDownloadsView, it loads the list of downloads from
your Firefox and Chrome Web browsers and displays it in the main window.
If you want to view the Web browser downloads from other sources, simply
press F9 ('Advanced Options') and choose the data source to load.



Generate MD5 / SHA1 / SHA256 / SHA512 hash of downloaded files
==============================================================

BrowserDownloadsView allows you to easily generate MD5/SHA1/SHA256/SHA512
hash of the files you downloaded from your Chrome/Firefox Web browser, so
you'll be able to compare it with the hash provided on the web page and
verify that the downloaded file is ok.
In order to generate MD5/SHA1/SHA256/SHA512 Hash of downloaded file,
simply select one or more files in the main window of
BrowserDownloadsView, right-click with the mouse, and then choose one of
the hash menu items: MD5 Hash, SHA1 Hash, SHA256 Hash, or SHA512 Hash.
BrowserDownloadsView will calculate the hash you choose, and the hash
will be displayed under the 'Hash' column. After the hashes are
generated, you can press Ctrl+H (Copy Hashes) in order to copy the
generated hashes of the selected downloads into the clipboard.

Be aware that this feature works only when the downloaded file still
exists on your file system.



Export Web browser downloads list
=================================

In order to export the Chrome / Firefox downloads list into a file,
simply select one or more files in the main window (or press Ctrl+A to
select all items), press Ctrl+S (Save Selected Items) and then in the
save dialog-box choose the type of file to export (Text File, Tab
Delimited Text File, JSON File, HTML File - Horizontal, HTML File -
Vertical, XML File, or Comma Delimited Text File), type the filename to
save, and then click the Save button.

Optionally, you can also press Ctrl+C (Copy Selected Items) to copy the
downloads list as tab-delimited format, and then paste the downloads list
into Excel or other spreadsheet application.



Copy downloaded files to another folder
=======================================

If you want to copy the files you downloaded with Chrome or Firefox into
another folder, simply select the files you want to copy, press Ctrl+E
(Explorer Copy), and then open the folder you want to copy to files on
Windows Explorer and press Ctrl+V (paste).



Check downloaded file in VirusTotal Web site
============================================

BrowserDownloadsView allows you to easily check the file you downloaded
in VirusTotal Web site. It automatically calculates the SHA256 hash of
the downloaded file, and then opens your default Web browser with the
correct URL. This feature will work only for popular downloads when other
people have already updated the file to VirusTotal. In order to open the
downloaded file in VirusTotal Web site, simply right-click on the file,
and choose the 'Open File In VirusTotal Web Site' item from the context
menu.

Be Aware !! Many people mistakenly think that if VirusTotal shows
multiple detections for a file - then the file is probably infected, but
this assumption is incorrect. First... Antivirus engines have many false
positive problems, and statistically many downloaded files have 1 - 10
detections on VirusTotal without any reason.
Also, if you download a powerful tool that allows you to easily extract
passwords or other sensitive information (Like some of the tool you can
find in NirSoft Web site) , you might see many alerts in VirusTotal -
simply because Antivirus companies classify any software that can be used
for malicious purpose as a threat, even when the software itself will not
cause any harm to the user.



Other Actions
=============


* Open Selected Download URL: Open the URL of the downloaded file with
  your default Web browser.
* Open Selected Web Page: Open the Web page where the file was
  downloaded with your default Web browser.
* Open/Run Selected Filename: Open or run the selected download,
  according to its file type. If it's .exe file, BrowserDownloadsView
  will run it. If it's other file type (.zip, .pdf) BrowserDownloadsView
  will open the file with the default application for this file type.
* Open Selected File With: Similar to 'Open/Run Selected Filename'
  action, but allows you to select the application to open file.
* Open Filename Folder: Open the folder where the download is located
  in Windows Explorer.



Advanced Options
================

In the 'Advanced Options' window, you can choose to load the Web browser
download lists from other sources. You can open the 'Advanced Options'
windows by pressing F9.
Here's the list of options you have in the 'Load downloads from'
combo-box:
* Load downloads from the current running system (All users): Load the
  downloads list from all user profiles on your system. Read permission
  to the profile folders under C:\Users is required.
* Load downloads from the current running system (Only current user):
  Load the downloads list of the user that runs the BrowserDownloadsView
  tool.
* Load downloads from the specified profiles folder: Load the downloads
  list from external profiles folder (For example: K:\Users )
* Load downloads from the specified profile: Load the downloads list
  from external profile folder (For example: K:\Users\User01 )
* Load downloads from remote computer: Load the downloads list from the
  specified remote computer. This option requires access to admin share
  on the remote computer (e.g: \\192.168.0.100\C$ )
* Load downloads from the specified Web browser profile folders: Load
  the downloads list from the specified Chrome and Firefox profiles. You
  can specify multiple profiles as comma-delimited list.
  Example for Chrome profile:
  C:\Users\user5\AppData\Local\Google\Chrome\User Data\Default
  Example for Firefox profile:
  C:\Users\user5\AppData\Roaming\Mozilla\Firefox\Profiles\adespdcy.default



Command-Line Options
====================



/cfg <Filename>
Start BrowserDownloadsView with the specified configuration file. For
example:
BrowserDownloadsView.exe /cfg "c:\config\bdv.cfg"

/DownloadsSource [1 - 6]
/SourceFolder [Folder]
/ComputerName [Name]
/DownloadTimeFilterType [1 - 8]
/DownloadTimeFilterValue [Value]
.
.
.

You can use any variable inside the .cfg file in order to set the
configuration from command line, here's some examples:

Load the list of Web browser downloads from remote computer 192.168.0.100:
BrowserDownloadsView.exe /DownloadsSource 5 /ComputerName 192.168.0.100

Load the list of Web browser downloads from the last 5 hours:
BrowserDownloadsView.exe /DownloadTimeFilterType 4
/DownloadTimeFilterValue 5

Load the list of Web browser downloads from K:\Users folder
BrowserDownloadsView.exe /DownloadsSource 3 /SourceFolder "K:\Users"

/stext <Filename>
Save the Web browser download list to a simple text file.

/stab <Filename>
Save the Web browser download list to a tab-delimited text file.

/scomma <Filename>
Save the Web browser download list to a comma-delimited text file (csv).

/shtml <Filename>
Save the Web browser download list to HTML5 file (Horizontal).

/sverhtml <Filename>
Save the Web browser download list to HTML5 file (Vertical).

/sxml <Filename>
Save the Web browser download list to XML file.

/sjson <Filename>
Save the Web browser download list to JSON file.

/sort <column>
This command-line option can be used with other save options for sorting
by the desired column. The <column> parameter can specify the column
index (0 for the first column, 1 for the second column, and so on) or the
name of the column, like "Download URL" and "Filename". You can specify
the '~' prefix character (e.g: "~Start Time") if you want to sort in
descending order. You can put multiple /sort in the command-line if you
want to sort by multiple columns.

/Columns <Comma Delimited Columns List>
Allows you to set the columns to display or the columns to export from
command-line. You have to specify the column names, delimited by comma,
for example:
BrowserDownloadsView.exe /scomma c:\temp\web-browser-downloads-list.csv
/Columns "Full Path Filename,Download URL 1,Download Size,Start Time,Web
Browser"

You can also specify the column names without space characters, for
example:
BrowserDownloadsView.exe /Columns
"FullPathFilename,DownloadURL1,DownloadSize,StartTime,WebBrowser"



Translating BrowserDownloadsView to other languages
===================================================

In order to translate BrowserDownloadsView to other language, follow the
instructions below:
1. Run BrowserDownloadsView with /savelangfile parameter:
   BrowserDownloadsView.exe /savelangfile
   A file named BrowserDownloadsView_lng.ini will be created in the
   folder of BrowserDownloadsView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run BrowserDownloadsView, and all
   translated strings will be loaded from the language file.
   If you want to run BrowserDownloadsView without the translation,
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

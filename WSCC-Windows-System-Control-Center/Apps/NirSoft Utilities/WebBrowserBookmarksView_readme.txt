


WebBrowserBookmarksView v1.06
Copyright (c) 2021 - 2022 Nir Sofer
Web site: https://www.nirsoft.net/utils/web_browser_bookmarks_view.html



Description
===========

WebBrowserBookmarksView is a simple tool for Windows that displays the
details of all bookmarks stored in Chrome and Firefox Web browsers. For
every bookmark, the following information is displayed: Title, URL,
Folder Name, Folder Path, Position, Created Time, Modified Time (Only
Firefox), ID, Guid, Web Browser, and Bookmarks File.
WebBrowserBookmarksView allows you to load the bookmarks list from your
current running system (current logged in user or all user profiles),
from remote computer on your network , and from external hard drive.

You can also export the bookmarks list to csv/tab-delimited/html/xml
file, copy the bookmarks to the clipboard and then paste them to Excel or
other spreadsheet application, and open a Web site from your bookmark in
your Smartphone by using QR Code.



System Requirements
===================


* This tool works on any version of Windows, starting from Windows XP
  and up to Windows 11. Both 32-bit and 64-bit systems are supported.
* This tool is just a small standalone .exe file that you can run on
  any system without installing anything.



Supported Web Browsers
======================

WebBrowserBookmarksView automatically detects and scans the bookmarks of
the following Web browsers: Chrome, Firefox, Edge, Opera, Brave, Pale
Moon, SeaMonkey, Waterfox, Vivaldi.
Even if your Web browser is not in the list, but it's based on Chrome or
Firefox, you can try to load its bookmark, by choosing the 'Load
bookmarks from the specified Web browser profile folders' option in the
'Advanced Options' window, and then typing the profile folder of your Web
browser.



Version History
===============


* Version 1.06:
  o Added /Columns command-line option, which allows you to set the
    columns to display or the columns to export from command-line, for
    example:
    WebBrowserBookmarksView.exe /Columns "Title,URL,Folder Path,Modified
    Time,Web Browser"

* Version 1.05:
  o Added new quick filter option: Find a string begins with...

* Version 1.03:
  o Added 'Copy Clicked Cell' option to the right-click context menu,
    which copies to the clipboard the text of cell that you right-clicked
    with the mouse.

* Version 1.02:
  o Added 'Open URL In Web Browser' option.

* Version 1.01:
  o Added option to choose another font (name and size) to display in
    the main window.

* Version 1.00 - First release.



Start Using WebBrowserBookmarksView
===================================

WebBrowserBookmarksView doesn't require any installation process or
additional DLL files. In order to start using it, simply run the
executable file - WebBrowserBookmarksView.exe

After running WebBrowserBookmarksView, it scans the bookmarks on your
system and then displays all of them in the main window of
WebBrowserBookmarksView. If you want to view the bookmarks on remote
network computer (with admin access) or on external hard drive, go to the
'Advanced Options' window (F9), and choose the desired data source.



Quick Filter
============

You can easily search a bookmark by using the 'Quick Filter' feature.
Simply press Ctrl+Q, and then in the Filter text-box type the string you
want to search.
You can also choose to find a bookmark the contain one of the specified
strings/words ('Find multiple words' and 'Find multiple strings'
options), or to find a bookmark that contain all the specified
words/strings ('Find records with all words' and 'Find records with all
strings' options)



QR Code
=======

If you want to open a Web site from your bookmark in your Smartphone,
simply select the desired bookmark, press F2 (View -> Display QR Code),
and then scan the QR Code with QR Code reader on your Smartphone.



Command-Line Options
====================



/stext <Filename>
Save the bookmarks list to a simple text file.

/stab <Filename>
Save the bookmarks list to a tab-delimited text file.

/scomma <Filename>
Save the bookmarks list to a comma-delimited text file (csv).

/shtml <Filename>
Save the bookmarks list to HTML5 file (Horizontal).

/sverhtml <Filename>
Save the bookmarks list to HTML5 file (Vertical).

/sxml <Filename>
Save the bookmarks list to XML file.

/sjson <Filename>
Save the bookmarks list to JSON file.

/sort <column>
This command-line option can be used with other save options for sorting
by the desired column. The <column> parameter can specify the column
index (0 for the first column, 1 for the second column, and so on) or the
name of the column, like "Title" and "URL". You can specify the '~'
prefix character (e.g: "~Folder Name") if you want to sort in descending
order. You can put multiple /sort in the command-line if you want to sort
by multiple columns.

/cfg <Config Filename&gt
Start WebBrowserBookmarksView with the specified config file.

/Columns <Comma Delimited Columns List>
Allows you to set the columns to display or the columns to export from
command-line. You have to specify the column names, delimited by comma,
for example:
WebBrowserBookmarksView.exe /scomma
c:\temp\web-browser-bookmarks-list.csv /Columns "Title,URL,Folder
Path,Modified Time,Web Browser"

You can also specify the column names without space characters, for
example:
WebBrowserBookmarksView.exe /Columns
"Title,URL,FolderPath,ModifiedTime,WebBrowser"



Translating WebBrowserBookmarksView to other languages
======================================================

In order to translate WebBrowserBookmarksView to other language, follow
the instructions below:
1. Run WebBrowserBookmarksView with /savelangfile parameter:
   WebBrowserBookmarksView.exe /savelangfile
   A file named WebBrowserBookmarksView_lng.ini will be created in the
   folder of WebBrowserBookmarksView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run WebBrowserBookmarksView, and
   all translated strings will be loaded from the language file.
   If you want to run WebBrowserBookmarksView without the translation,
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

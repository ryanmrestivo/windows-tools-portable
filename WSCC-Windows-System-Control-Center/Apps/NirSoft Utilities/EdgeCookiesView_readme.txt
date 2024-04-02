


EdgeCookiesView v1.17
Copyright (c) 2018 - 2019 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

EdgeCookiesView is a tool for Windows that displays the cookies stored by
newer versions of Microsoft Edge Web browser (Starting from Fall Creators
Update 1709 of Windows 10). It also allows you to select one or more
cookies and then export them to tab-delimited, csv file, html file, or to
a file in cookies.txt format. You can read the cookies from the current
running system or from the WebCacheV01.dat database on external hard
drive.



EdgeCookiesView vs IECookiesView
================================

IECookiesView is very old tool originally developed in 2002 (!) and it
still works with earlier versions of Edge Web browser that store the
cookies in text files, exactly like Internet Explorer. But starting from
Fall Creators Update 1709 of Windows 10, the cookies of Microsoft Edge
Web browser are stored in the WebCacheV01.dat database together with the
history and cache information, so IECookiesView cannot read the cookies
of Edge anymore.
EdgeCookiesView is a new tool designed to read the cookies from the
WebCacheV01.dat database.



Versions History
================


* Version 1.17:
  o Added 'Add Remark Line To cookies.txt' option. When it's turned
    on, '# Netscape HTTP Cookie File' header line is added to cookies.txt
    file format.

* Version 1.16:
  o Added 'Save File Encoding'.

* Version 1.15:
  o Added 'Created In' column (Client or Server).
  o When choosing an external cookies file/folder in the 'Advanced
    Options' window, the path is now displayed in the window title.

* Version 1.11:
  o Added 'Add Header Line To CSV/Tab-Delimited File' option (Turned
    on by default).

* Version 1.10:
  o EdgeCookiesView now can also read the cookies folder of old
    versions of Edge/IE. In order to use this feature, open the 'Advanced
    Options' window (F9) , choose to load the cookies from 'Old cookies
    folder of Edge/IE' and then type the cookies folder.
  o Added /LoadFrom, /DatabaseFilename , /CookiesFolder command-line
    options to set the cookies database or folder from command-line.

* Version 1.07:
  o Added 'Save All Items' option (Shift+Ctrl+S).

* Version 1.06:
  o You can now resize the properties window, and the last size of
    this window is saved in the .cfg file.
  o You can now send the data to stdout by specifying empty string as
    filename, for example:
    EdgeCookiesView.exe /scomma "" | more

* Version 1.05:
  o Added option to choose another font (name and size) to display in
    the main window.

* Version 1.00: First release.



Start Using EdgeCookiesView
===========================

This utility doesn't require any installation process or additional DLL
files. In order to start using it, simply run the executable file -
EdgeCookiesView.exe
After running EdgeCookiesView, the main window displays the cookies
stored by Microsoft Edge Web browser (Assuming that you have Fall
Creators Update 1709 of Windows 10 or later updates). If you want to view
the cookies from external system, open the 'Advanced Options' window
(F9), choose the 'External database file' option and then select the
WebCacheV01.dat file in the external drive.



Quick Filter
============

If you want to find specific cookies, simply activate the 'Quick Filter'
feature by pressing Ctrl+Q and then type the host name or the cookie name
and EdgeCookiesView will display the desired cookies.



Command-Line Options
====================



/LoadFrom <Load From>
Specifies how to load the cookies:
1 - From local system
2 - From another MS-Edge database (Specify in /DatabaseFilename )
3 - From another cookies folder of old versions of Edge/IE (Specify in
/CookiesFolder)

/DatabaseFilename <Filename>
Specifies the database filename to load (When using /LoadFrom 2 )

/CookiesFolder <Filename>
Specifies the cookies folder to load (When using /LoadFrom 3 )

/scookiestxt <Filename>
Save the cookies of Edge Web browser in cookies.txt format.

/stext <Filename>
Save the cookies of Edge Web browser into a simple text file.

/stab <Filename>
Save the cookies of Edge Web browser into a tab-delimited text file.

/scomma <Filename>
Save the cookies of Edge Web browser into a comma-delimited text file
(csv).

/shtml <Filename>
Save the cookies of Edge Web browser into HTML file (Horizontal).

/sverhtml <Filename>
Save the cookies of Edge Web browser into HTML file (Vertical).

/sxml <Filename>
Save the cookies of Edge Web browser into XML file.

/sjson <Filename>
Save the cookies of Edge Web browser into JSON file.

/sort <column>
This command-line option can be used with other save options for sorting
by the desired column. The <column> parameter can specify the column
index (0 for the first column, 1 for the second column, and so on) or the
name of the column, like "Host Name" and "Name". You can specify the '~'
prefix character (e.g: "~Value") if you want to sort in descending order.
You can put multiple /sort in the command-line if you want to sort by
multiple columns.



Examples:
EdgeCookiesView.exe /LoadFrom 3 /CookiesFolder
"C:\Users\user10\AppData\Roaming\Microsoft\Windows\Cookies" /scomma
"c:\temp\MyCookies.csv"
EdgeCookiesView.exe /LoadFrom 2 /DatabaseFilename
"K:\Users\user20\AppData\Local\Microsoft\Windows\WebCache\WebCacheV01.dat" 
/scookiestxt "c:\temp\cookies.txt"



Translating EdgeCookiesView to other languages
==============================================

In order to translate EdgeCookiesView to other language, follow the
instructions below:
1. Run EdgeCookiesView with /savelangfile parameter:
   EdgeCookiesView.exe /savelangfile
   A file named EdgeCookiesView_lng.ini will be created in the folder of
   EdgeCookiesView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run EdgeCookiesView, and all
   translated strings will be loaded from the language file.
   If you want to run EdgeCookiesView without the translation, simply
   rename the language file, or move it to another folder.



License
=======

This utility is released as freeware. You are allowed to freely
distribute this utility via floppy disk, CD-ROM, Internet, or in any
other way, as long as you don't charge anything for this and you don't
sell it or distribute it as a part of commercial product. If you
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

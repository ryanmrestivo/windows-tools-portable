


SafariHistoryView v1.01
Copyright (c) 2011 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

SafariHistoryView is a simple utility for Windows that reads and parses
the history file of Safari Web browser (history.plist) and displays the
browsing history in a simple table. Every browsing history line includes
the following information: URL, Web Page Title, Last Visit Time, Visit
Count, Redirected To URL, and Record Index.
SafariHistoryView allows you to easily export the browsing history data
into text/csv/html/xml file, or copy the data to the clipboard and then
paste it into Excel.



System Requirements
===================


* This utility works on any version of Windows, starting from Windows
  2000 and up to Windows 7. By default, this utility reads the history
  file (history.plist) of the current user, created by the Safari Web
  browser installed on your system, but you can also choose the view the
  history file taken from other systems.




Versions History
================


* Version 1.01:
  o Fixed a crash problem that might occur with some history files.

* Version 1.00 - First release.



Using SafariHistoryView
=======================

SafariHistoryView doesn't require any installation process or additional
dll files. In order to start using it, simply run the executable file -
SafariHistoryView.exe
If Safari Web browser is installed on your system, SafariHistoryView
automatically locates your history file (history.plist) and displays your
browsing history on the main window. You can also manually choose the
desired history file, by using the 'Advanced Options' window (F9), or by
dragging the history file from Explorer into the window of
SafariHistoryView.

After loading the desired history file, you can easily select one or more
history items, and then export them into text/csv/html/xml file by using
the 'Save Selected Items' option, or copy them to the clipboard (Ctrl+C)




Command-Line Options
====================



/stext <Filename>
Save the list of Safari visited Web sites into a regular text file.

/stab <Filename>
Save the list of Safari visited Web sites into a tab-delimited text file.

/scomma <Filename>
Save the list of Safari visited Web sites into a comma-delimited text
file.

/stabular <Filename>
Save the list of Safari visited Web sites into a tabular text file.

/shtml <Filename>
Save the list of Safari visited Web sites into HTML file (Horizontal).

/sverhtml <Filename>
Save the list of Safari visited Web sites into HTML file (Vertical).

/sxml <Filename>
Save the list of Safari visited Web sites to XML file.

/loadfile <History File>
Loads the specified history filename instead of the default one.



Translating SafariHistoryView to other languages
================================================

In order to translate SafariHistoryView to other language, follow the
instructions below:
1. Run SafariHistoryView with /savelangfile parameter:
   SafariHistoryView.exe /savelangfile
   A file named SafariHistoryView_lng.ini will be created in the folder
   of SafariHistoryView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run SafariHistoryView, and all
   translated strings will be loaded from the language file.
   If you want to run SafariHistoryView without the translation, simply
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

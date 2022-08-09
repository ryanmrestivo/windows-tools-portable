


SafariCacheView v1.11
Copyright (c) 2011 - 2012 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

SafariCacheView is a simple utility for Windows that reads and parses the
cache file of Safari Web browser (cache.db) and displays the list of all
cached files in a simple table. Every cache information line includes the
following information: Filename, Content Type, URL, Content Length,
Server Name, Server Time, Expiration Time, Last Modified Time, Content
Encoding, and Referrer.

SafariCacheView also allows you to select one or more cache items and
then extract them into the desired folder or save the cache list into
html/text/xml/csv file.



System Requirements
===================


* This utility works on any version of Windows, starting from Windows
  2000 and up to Windows 7. By default, this utility reads the cache file
  (cache.db) of the current user, created by the Safari Web browser
  installed on your system, but you can also choose the view the cache
  file taken from other systems.




Versions History
================


* Version 1.11:
  o Fixed bug: SafariCacheView failed to load the cache if the cache
    path contained non-English characters.

* Version 1.10:
  o Added 'Stop' menu item, which allows you to stop the loading
    process of the cache files list.

* Version 1.05:
  o Added 'Etag' and 'Cache-Control' columns.

* Version 1.01:
  o Fixed a crash problem that might occur with some cache files.

* Version 1.00 - First release.



Using SafariCacheView
=====================

SafariCacheView doesn't require any installation process or additional
dll files. In order to start using it, simply run the executable file -
SafariCacheView.exe
If Safari Web browser is installed on your system, SafariCacheView
automatically locates your cache file (cache.db) and displays all your
cache items on the main window. You can also manually choose the desired
cache file, by using the 'Advanced Options' window (F9), or by dragging
the cache file from Explorer into the window of SafariCacheView.

After loading the desired cache file, you can easily select one or more
cache items, and then export them into text/csv/html/xml file by using
the 'Save Selected Items' option, or copy them to the clipboard (Ctrl+C)




Extracting Cache Files
======================

If you want to extract cached files from the cache file of Safari
(cache.db), simply select one or more files, and then use the 'Copy
Selected Cache Files To' option (F4) to extract the selected files into
the folder that you choose.



Command-Line Options
====================



/stext <Filename>
Save the list of Safari cache files into a regular text file.

/stab <Filename>
Save the list of Safari cache files into a tab-delimited text file.

/scomma <Filename>
Save the list of Safari cache files into a comma-delimited text file.

/stabular <Filename>
Save the list of Safari cache files into a tabular text file.

/shtml <Filename>
Save the list of Safari cache files into HTML file (Horizontal).

/sverhtml <Filename>
Save the list of Safari cache files into HTML file (Vertical).

/sxml <Filename>
Save the list of Safari cache files to XML file.

/loadfile <Cache File>
Loads the specified cache filename instead of the default one.



Translating SafariCacheView to other languages
==============================================

In order to translate SafariCacheView to other language, follow the
instructions below:
1. Run SafariCacheView with /savelangfile parameter:
   SafariCacheView.exe /savelangfile
   A file named SafariCacheView_lng.ini will be created in the folder of
   SafariCacheView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run SafariCacheView, and all
   translated strings will be loaded from the language file.
   If you want to run SafariCacheView without the translation, simply
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

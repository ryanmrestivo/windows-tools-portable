


URLStringGrabber v1.11
Copyright (c) 2010 - 2011 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

URLStringGrabber is a small utility that scans all opened windows of
Internet Explorer and grab the URLs stored in them, including clickable
links, images, script files, CSS files, RSS feeds, and flash (.swf) files.

The URLs list is displayed in table, and you can easily export some of
the URLs or the entire URLs list into text, csv, html, or xml file. You
can also copy the URLs list into the clipboard and paste them into Excel
or other spreadsheet application.



System Requirements
===================


* Any version of Windows, starting from Windows 2000 and up to Windows
  7.
* Internet Explorer 6.0 - 8.0



Versions History
================


* Version 1.11:
  o Fixed bug: URLStringGrabber crashed when trying to read empty
    html element.

* Version 1.10:
  o Added option to choose which type of links you want to capture:
    Options -> URL Types
  o Added options to filter links according to number of characters
    in the URL and the description text. (In Advanced Options window)
  o Added 'Add Header Line To CSV/Tab-Delimited File' option. When
    this option is turned on, the column names are added as the first
    line when you export to csv or tab-delimited file.

* Version 1.00 - First version.



What about Firefox ?
====================

I originally planned to create this tool for both Internet Explorer and
Firefox. However, in order to access the opened Web pages of Firefox,
Add-On must be installed on Firefox and then communicate with the main
application to transfer the URLs information. This means that the
development for Firefox is much more complex, and also requires to make
an installation for the software, which I always prefer to avoid. This is
the reason that for now, this tool only works with IE.



Using URLStringGrabber
======================

URLStringGrabber doesn't require any installation process or additional
DLL files. In order to use it, simply open Internet Explorer with the
desired Web sites, and then run URLStringGrabber.
URLStringGrabber will automatically scan the opened IE Windows, and then
it'll display all URLs found in them. In order to scan the opened IE
windows again, simply press F5 (refresh).

After URLStringGrabber grab the URLs list, you can select one or more
items, and then use the 'Save Selected Items' option (CTRL+S) to save the
desired URLs into text,csv,html, or XML file.



Command-Line Options
====================



/stext <Filename>
Save the list of URLs into a regular text file.

/stab <Filename>
Save the list of URLs into a tab-delimited text file.

/scomma <Filename>
Save the list of URLs into a comma-delimited text file (csv).

/stabular <Filename>
Save the list of URLs into a tabular text file.

/shtml <Filename>
Save the list of URLs into HTML file (Horizontal).

/sverhtml <Filename>
Save the list of URLs into HTML file (Vertical).

/sxml <Filename>
Save the list of URLs into XML file.

/sort <column>
This command-line option can be used with other save options for sorting
by the desired column. If you don't specify this option, the list is
sorted according to the last sort that you made from the user interface.
The <column> parameter can specify the column index (0 for the first
column, 1 for the second column, and so on) or the name of the column,
like "URL" and "URL Type". You can specify the '~' prefix character (e.g:
"~URL Type") if you want to sort in descending order. You can put
multiple /sort in the command-line if you want to sort by multiple
columns.

Examples:
URLStringGrabber.exe /shtml "f:\temp\urls.html" /sort 2 /sort ~1
URLStringGrabber.exe /shtml "f:\temp\urls.html" /sort "URL"

/nosort
When you specify this command-line option, the list will be saved without
any sorting.



Translating URLStringGrabber to other languages
===============================================

In order to translate URLStringGrabber to other language, follow the
instructions below:
1. Run URLStringGrabber with /savelangfile parameter:
   URLStringGrabber.exe /savelangfile
   A file named URLStringGrabber_lng.ini will be created in the folder of
   URLStringGrabber utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run URLStringGrabber, and all
   translated strings will be loaded from the language file.
   If you want to run URLStringGrabber without the translation, simply
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




FlashCookiesView v1.15
Copyright (c) 2009 - 2014 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

FlashCookiesView is a small utility that displays the list of cookie
files created by Flash component (Local Shared Object) in your Web
browser. For each cookie file, the lower pane of FlashCookiesView
displays the content of the file in readable format or as Hex dump.
You can also select one or more cookie files, and then copy them to the
clipboard, save them to text/html/xml file or delete them.



System Requirements
===================

This utility works on any version of Windows, starting from Windows 2000
and up to Windows 7. Also, FlashCookiesView can work with any Web
browser, because the Flash component always save flash cookies in the
same place and in the same format, regardless the Web browser that you
use.



Versions History
================


* Version 1.15:
  o Added option to remember the folder you choose in the 'Select
    Folder' window.

* Version 1.12:
  o Added 'Mark Odd/Even Rows' option, under the View menu. When it's
    turned on, the odd and even rows are displayed in different color, to
    make it easier to read a single line.
  o Added 'Add Header Line To CSV/Tab-Delimited File' option. When
    this option is turned on, the column names are added as the first
    line when you export to csv or tab-delimited file.

* Version 1.11:
  o Fixed issue: removed the wrong encoding from the xml string,
    which caused problems to some xml viewers.
  o Fixed focus issue after save.

* Version 1.10:
  o Added 'Automatically Delete Empty Folders': When this option is
    selected, and you delete a cookie, the folder of the cookie will also
    be deleted, if it's empty and there are no other cookies in it.
  o Added 'Open Folder Of Selected Cookie'.

* Version 1.05 - Added 'Automatic' mode, which displays the cookies in
  'Hex Dump' if the cookies file cannot be parsed.
* Version 1.00 - First release.



Location of Flash cookies files (Local Shared Object)
=====================================================

On Windows XP, the flash cookies are stored under C:\Documents and
Settings\[Your Profile]\Application Data\Macromedia\Flash
Player\#SharedObjects\[Random Name]\[Web Site Path]. On Windows 7/Vista,
the flash cookies are stored under C:\Users\[Your
Profile]\AppData\Roaming\Macromedia\Flash Player\#SharedObjects\[Random
Name]\[Web Site Path].
The flash cookie files are saved with .sol extension, and their content
is stored in binary format, and thus regular text editor/viewer cannot
display them.



Known Issues
============


* Some flash cookie files cannot be parsed by FlashCookiesView, and in
  these cases, the lower pane will be empty. If you want, you can view
  the raw content of the cookie file, by choosing 'Hex Dump' view from
  Options->Display Mode.



Using FlashCookiesView
======================

FlashCookiesView doesn't require any installation process or additional
DLL files. In order to start using it, simply copy the files to any
folder you like, and run the executable file - FlashCookiesView.exe
The main window of FlashCookiesView contains 2 panes: The upper pane
displays the list of all cookies files found in your flash cookies
folder. When you select a cookies file in the upper pane, the lower pane
displays the content of the cookie. By default, FlashCookiesView parse
the cookie file and display it in name/value format, but you can also
view the content of the cookie file as Hex Dump, by choosing 'Hex Dump'
view from Options->Display Mode (or simply by pressing F3).

You can also select one or more cookie files in the upper pane, and then
use 'Save Selected Items' option to export the cookies list to
text/html/xml/csv file, or 'Delete Selected Cookies Files' to delete
unneeded flash cookies.

If you want to view the Flash cookies of another computer/operating
system/user profile, simply press F9 and select the right base cookies
folder.



Command-Line Options
====================



/stext <Filename>
Save the list of Flash cookies into a regular text file.

/stab <Filename>
Save the list of Flash cookies into a tab-delimited text file.

/scomma <Filename>
Save the list of Flash cookies into a comma-delimited text file (csv).

/stabular <Filename>
Save the list of Flash cookies into a tabular text file.

/shtml <Filename>
Save the list of Flash cookies into HTML file (Horizontal).

/sverhtml <Filename>
Save the list of Flash cookies into HTML file (Vertical).

/sxml <Filename>
Save the list of Flash cookies into XML file.

/sort <column>
This command-line option can be used with other save options for sorting
by the desired column. If you don't specify this option, the list is
sorted according to the last sort that you made from the user interface.
The <column> parameter can specify the column index (0 for the first
column, 1 for the second column, and so on) or the name of the column,
like "Filename" and "URL". You can specify the '~' prefix character (e.g:
"~Created Time") if you want to sort in descending order. You can put
multiple /sort in the command-line if you want to sort by multiple
columns.

Examples:
FlashCookiesView.exe /shtml "f:\temp\cookies.html" /sort 2 /sort ~1
FlashCookiesView.exe /shtml "f:\temp\cookies.html" /sort "URL"

/nosort
When you specify this command-line option, the list will be saved without
any sorting.



Translating FlashCookiesView to other languages
===============================================

In order to translate FlashCookiesView to other language, follow the
instructions below:
1. Run FlashCookiesView with /savelangfile parameter:
   FlashCookiesView.exe /savelangfile
   A file named FlashCookiesView_lng.ini will be created in the folder of
   FlashCookiesView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run FlashCookiesView, and all
   translated strings will be loaded from the language file.
   If you want to run FlashCookiesView without the translation, simply
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

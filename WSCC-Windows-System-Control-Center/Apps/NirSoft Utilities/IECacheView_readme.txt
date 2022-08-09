


IECacheView v1.58
Copyright (c) 2007 - 2016 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

IECacheView is a small utility that reads the cache folder of Internet
Explorer, and displays the list of all files currently stored in the
cache. For each cache file, the following information is displayed:
Filename, Content Type, URL, Last Accessed Time, Last Modified Time,
Expiration Time, Number Of Hits, File Size, Folder Name, and full path of
the cache filename. You can easily save the cache information into
text/html/xml file, or copy the cache table to the clipboard and then
paste it to another application, like Excel or OpenOffice Spreadsheet.



Advantages over the 'Temporary Internet Files' viewer of Windows
================================================================


* IECacheView displays only the list of cache files, while the cache
  view of Windows displays a mix of cookies and cache files.
* IECacheView allows you to filter the cache files by file type (image,
  text, video, audio, or application).
* IECacheView allows you to view the cache files of another user or
  from another disk, while with the Windows viewer, you can only watch
  the cache of the current logged-on user.
* IECacheView displays some columns that are not displayed by the cache
  viewer of Windows: Content Type, Number of hits, Sub-folder name, and
  the full-path of the cached filename.
* With IECacheView, you can easily select the desired cache items, copy
  the information to the clipboard, and then paste it into Excel or
  OpenOffice Spreadsheet.



System Requirements
===================

This utility works with all version of Windows, from Windows 98 to
Windows 8, with Internet Explorer 6.0 - 11.0



Versions History
================


* Version 1.58:
  o Fixed another bug with 'Error -1:Unknown Error!' message randomly
    appeared on Windows 7/x64/IE11 systems.

* Version 1.57:
  o Fixed bug: On some systems with IE11, IECacheView displayed
    'Error -1:Unknown Error!' message and failed to load the cache
    information.

* Version 1.56:
  o When using the 'Open Selected File With' option, the 'Always use
    the selected program to open this kind of file' check-box is now
    turned off and disabled.

* Version 1.55:
  o Fixed to work with the latest build of Windows 10. On Windows 10,
    IECacheView shows the cache of both IE11 and Project
    Spartan/Microsoft Edge, which currently share the same cache database.

* Version 1.54:
  o Fixed issue: On some systems, IECacheView failed to read the
    cache of IE10/IE11 from WebCacheV01.dat

* Version 1.53:
  o Fixed bug: IECacheView failed to copy the cache files if 'Save
    the files in the directory structure of the Web site' option was
    turned on and the Web site used non-standard TCP port (Instead of
    port 80).
  o Fixed to display date/time values according to daylight saving
    time settings.

* Version 1.52:
  o Fixed bug: IECacheView failed to read the locked cache database
    of IE10 on 64-bit systems.

* Version 1.51:
  o Fixed bug: IECacheView failed to detect a few cache entries on
    Internet Explorer 6.0 - 9.0.
  o IECacheView now displays an error message if it fails to open the
    cache database of IE10.

* Version 1.50:
  o Added support for reading the cache of Internet Explorer 10:
    - The cache information of IE10 is stored inside
      WebCacheV01.dat or WebCacheV24.dat , located under c:\users\[User
      Profile]\AppData\Local\Microsoft\Windows\WebCache
    - IECacheView automatically detects IE10 and set the default
      cache folder to the WebCache location.
    - In order to ensure that all cache data of IE10 is saved to
      the disk, it's highly recommended to log off and then log on again,
      before using IECacheView with IE10. If you don't do that,
      IECacheView may hang or crash...


* Version 1.46:
  o You can now copy one or more cache files by dragging them from
    the window of IECacheView into a folder on Windows Explorer.

* Version 1.45:
  o Added 'Double-Click Action' option, which allows you to choose
    what to do when you double-click on cache item - Properties Window,
    Open File In Cache, Open URL In Browser, Open Cache Sub-Folder, or
    Open With...

* Version 1.40:
  o Added 'Mark Odd/Even Rows' option, under the View menu. When it's
    turned on, the odd and even rows are displayed in different color, to
    make it easier to read a single line.

* Version 1.38:
  o On Windows Vista/7/2008: The cache is now loaded from both the
    base cache folder and the 'Low' subfolder. (In the previous versions,
    only one of them was loaded, according to the last modified date/time
    of the index.dat file)

* Version 1.37:
  o Added 'Last Checked' column.

* Version 1.36:
  o The status bar now displays the total size of selected files in
    KB/MB. (Only existing files are accumulated)

* Version 1.35:
  o Added 'Open Selected File With' option.

* Version 1.33:
  o Added 'Add Header Line To CSV/Tab-Delimited File' option. When
    this option is turned on, the column names are added as the first
    line when you export to csv or tab-delimited file.

* Version 1.32:
  o Fixed bug: pressing the delete key in the find window deleted an
    item in the main window.

* Version 1.31:
  o Added command-line option to sort the list when you save from
    command-line.

* Version 1.30:
  o Added support for saving cache files from command-line.

* Version 1.28:
  o Added new option in 'Copy Selected Files': Copy as new name if
    filename already exists.

* Version 1.27:
  o Added new option in 'Copy Selected Files': Update the modified
    time of the copied files according to modified time in the Web server.

* Version 1.26:
  o Added 'Explorer Copy' option - Allows you to copy the selected
    files and then paste them into a folder in Explorer.

* Version 1.25:
  o Added support for cache filter. (Display only URLs which contain
    the specified filter strings)

* Version 1.21:
  o Added 'Hide Missing Files' option.

* Version 1.20:
  o New option in 'Copy Selected Files To...': Save the files in the
    directory structure of the Web site.

* Version 1.15:
  o Added AutoComplete to filename/folder text-boxes.
  o Dilog-boxes are now resizable.

* Version 1.12:
  o The URLs in HTML report are now created as links.
  o Fixed bug: The main window lost the focus when the user switched
    to another application and then returned back to IECacheView.

* Version 1.11:
  o Added support for saving as comma-delimited text file.

* Version 1.10:
  o Added 'Delete Selected Cache Files' option.
  o Added 'Missing File' column - Tells you whether a file was
    deleted from the cache.
  o Added 'Mark Missing Files' option.

* Version 1.03 - Another fix for Vista with User Account Control.
* Version 1.02 - Fixed the problem with Vista when User Account Control
  is turned on.
* Version 1.01 - Fixed bug: Failed to load/save configuration when the
  exectbale file path contained '.' character.
* Version 1.00 - First release.



The Location Of Internet Explorer Cache Folder
==============================================

The cache folder of Internet Explorer is located under C:\Documents and
Settings\[user Name]\Local Settings\Temporary Internet Files.
When you enter into this folder from Windows Explorer, you don't really
see the real content of the folder, but instead, the shell extension of
Windows displays a table containing the list of cache files and cookies.
If you want to view the real content of the 'Temporary Internet Files'
folder, you can try one of the following options:
1. Download and install the 7-Zip File Manager. This tool allows you
   to view the real content of folders.
2. Use ShellExView utility to disable the 'Temporary Internet Files'
   shell extension. After you disable this extension, you can view the
   real content of this folder from Windows Explorer.
3. Log on to your system with another user, and then go to the
   'Temporary Internet Files' of your real user. When you're logged on
   with another user, Explorer will show you the real content of the
   cache folder.



Using IECacheView
=================

IECacheView doesn't require any installation process or additional DLL
files. Just copy the executable file (IECacheView.exe) to any folder you
like, and run it. After you run it, the main window displays the list of
files currently stored in the cache of Internet Explorer for the current
logged-on user.
If you want to view the cache of another user or from another instance of
operating system, simply use the 'Select Cache Folder' option (F9) to
select the desired cache folder that you want to inspect.

You can select one or more cache files from the list, and than export the
list into text/html/xml file ('Save Selected Items' option), copy the URL
list to the clipboard (Ctrl+U), copy the entire table of cache files
(Ctrl+C), and then paste it to Excel or to OpenOffice spreadsheet. You
can also extract the actual files from the cache, and save them into
another folder, You can do that by using the 'Copy Selected Cache Files
To' option (F4).



Notice For Delete Option
========================

When you delete files from the cache, IECacheView delete the cache files,
but it doesn't delete the reference to them in the cache index file. This
means that even after you delete files from the cache, you'll still see
them in the list, but the 'Missing File' column will be turned from 'No'
to 'Yes'.



Command-Line Options
====================



/stext <Filename>
Save the list of all Internet Explorer cache files into a regular text
file.

/stab <Filename>
Save the list of all Internet Explorer cache files into a tab-delimited
text file.

/scomma <Filename>
Save the list of all Internet Explorer cache files into a comma-delimited
text file.

/stabular <Filename>
Save the list of all Internet Explorer cache files into a tabular text
file.

/shtml <Filename>
Save the list of all Internet Explorer cache files into HTML file
(Horizontal).

/sverhtml <Filename>
Save the list of all Internet Explorer cache files into HTML file
(Vertical).

/sxml <Filename>
Save the list of all Internet Explorer cache files to XML file.

/sort <column>
This command-line option can be used with other save options for sorting
by the desired column. If you don't specify this option, the list is
sorted according to the last sort that you made from the user interface.
The <column> parameter can specify the column index (0 for the first
column, 1 for the second column, and so on) or the name of the column,
like "Content Type" and "Last Accessed". You can specify the '~' prefix
character (e.g: "~Content Type") if you want to sort in descending order.
You can put multiple /sort in the command-line if you want to sort by
multiple columns.

/nosort
When you specify this command-line option, the list will be saved without
any sorting.

-folder <Cache Folder>
Start IECacheView with the specified cache folder.

/copycache <URL> <Content Type>
Copy files from the cache into the folder specified in /CopyFilesFolder
parameter. In the <URL> parameter, you can specify the URL of the Web
site (for example: http://www.nirsoft.net) or empty string ("") if you
want to copy files from all Web sites. In the <Content Type> parameter,
you can specify full content type (like image/png), partial content type
(like 'image') or empry string ("") if you want to copy all types of
files.

/CopyFilesFolder <Folder>
Specifies the folder to copy the cache files.

/UseWebSiteDirStructure 0 | 1
Save the files in the directory structure of the Web site. 0 = No, 1 = Yes

/UpdateModifiedTime 0 | 1
Update the modified time of the copied files according to modified time
in the Web server. 0 = No, 1 = Yes

/NewNameIfExist 0 | 1
Copy as new name if filename already exists. 0 = No, 1 = Yes

Examples:
IECacheView.exe -folder "C:\Documents and Settings\Administrator\Local
Settings\Temporary Internet Files"
IECacheView.exe -folder "C:\Documents and Settings\Administrator\Local
Settings\Temporary Internet Files" /shtml c:\temp\ie.html
IECacheView.exe /stext c:\temp\ie.txt
IECacheView.exe /shtml c:\temp\1.html /sort "~Content Type" /sort "Last
Accessed"
IECacheView.exe /shtml c:\temp\1.html /sort ~0 /sort ~2 /sort ~1
IECacheView.exe /shtml c:\temp\1.html /nosort

Copy Cache Examples:
* Copy all cache files of www.nirsoft.net to f:\temp in the directory
  structure of the Web site:
  /copycache "http://www.nirsoft.net" "" /CopyFilesFolder "f:\temp"
  /UseWebSiteDirStructure 1


* Copy all image cache files of www.nirsoft.net to f:\temp:
  /copycache "http://www.nirsoft.net" "image" /CopyFilesFolder "f:\temp"
  /UseWebSiteDirStructure 0


* Copy all .png files from the cache to f:\temp:
  /copycache "" "image/png" /CopyFilesFolder "f:\temp"
  /UseWebSiteDirStructure 0


* Copy all files from the cache to f:\temp:
  /copycache "" "" /CopyFilesFolder "f:\temp" /UseWebSiteDirStructure 0





Translating IECacheView to other languages
==========================================

In order to translate IECacheView to other language, follow the
instructions below:
1. Run IECacheView with /savelangfile parameter:
   IECacheView.exe /savelangfile
   A file named IECacheView_lng.ini will be created in the folder of
   IECacheView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run IECacheView, and all
   translated strings will be loaded from the language file.
   If you want to run IECacheView without the translation, simply rename
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

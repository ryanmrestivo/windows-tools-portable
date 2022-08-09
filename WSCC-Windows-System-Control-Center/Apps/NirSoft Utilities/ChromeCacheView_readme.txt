


ChromeCacheView v2.36
Copyright (c) 2008 - 2022 Nir Sofer
Web site: https://www.nirsoft.net



Description
===========

ChromeCacheView is a small utility that reads the cache folder of Google
Chrome Web browser, and displays the list of all files currently stored
in the cache. For each cache file, the following information is
displayed: URL, Content type, File size, Last accessed time, Expiration
time, Server name, Server response, and more.
You can easily select one or more items from the cache list, and then
extract the files to another folder, or copy the URLs list to the
clipboard.



The Location Of Chrome Cache Folder
===================================

The cache folder of Google Chrome is located under [User Profile]\Local
Settings\Application Data\Google\Chrome\User Data\Default\Cache



System Requirements
===================


* This utility works on any version of Windows, starting from Windows
  2000, and up to Windows 7/8/2008/10/11.



Using ChromeCacheView
=====================

ChromeCacheView doesn't require any installation process or additional
DLL files. Simply copy the executable file (ChromeCacheView.exe) to any
folder you like, and run it.
After you run it, the main window displays the list of files currently
stored in the cache of the default Google Chrome user.
You can select one or more cache files from the list, and then export the
list into text/html/xml file ('Save Selected Items' option), copy the URL
list to the clipboard (Ctrl+U), copy the entire table of cache files
(Ctrl+C), and then paste it to Excel or to OpenOffice spreadsheet. You
can also extract the actual files from the cache, and save them into
another folder, You can do that by using the 'Copy Selected Cache Files
To' option (F4).

Starting from version 2.10 - When you select image cache item ( gif, png,
jpg) or text-based cache item (HTML, CSS, JSON, Javascript), you can
watch the content of the cache file in the lower pane if the 'Show
Preview Pane' option is turned on (View -> Show Preview Pane or simply
press F8).



Versions History
================


* Version 2.36:
  o Updated to keep the selection and focus after refresh.

* Version 2.35:
  o Updated the time filter options, and now you can choose to view
    the cache files in the last xx seconds/minutes/hours.

* Version 2.31:
  o Fixed to automatically use the Cache_Data subfolder in the new
    versions of Chrome.
  o Fixed to automatically detect the last used profile of Chrome,
    when there are multiple profiles.

* Version 2.30:
  o Updated the preview pane to display webp image files.

* Version 2.27:
  o Updated to work properly with the cache partitioning string on
    the latest versions of Chrome.

* Version 2.26:
  o Added option to change the sorting column from the menu (View ->
    Sort By). Like the column header click sorting, if you click again
    the same sorting menu item, it'll switch between ascending and
    descending order. Also, if you hold down the shift key while choosing
    the sort menu item, you'll get a secondary sorting.
  o Added 'Copy Clicked Cell' option to the right-click context menu,
    which copies to the clipboard the text of cell that you right-clicked
    with the mouse.

* Version 2.25:
  o Updated to work properly with the new cache partitioning of
    Chrome. (In previous versions, URL was displayed with _dk_ prefix).
  o Added 2 new columns to display the information of the new cache
    partitioning feature: 'Web Site' and 'Frame'. These columns display
    the Web site and the frame that requested to load the specified cache
    item.

* Version 2.22:
  o Added 'Align Numeric Columns To Right' option (For 'File Size'
    and 'URL Length' columns).

* Version 2.21:
  o Added the 'Copy Selected Cache Files To...' option (F4) to the
    context menu.
  o Fixed the /cfg command-line option to load the .cfg file from the
    current directory if full path is not specified.

* Version 2.20:
  o Added 'Preview Copy' option (Ctrl+P), which allows you to copy to
    the clipboard the image or text displayed in the preview pane.

* Version 2.15:
  o Added 'Enter Key Action' option, which allows you to choose what
    to do when you press the Enter key: Properties Window, Open Selected
    Cache File, Open Link In Web Browser, Open Selected Cache File With.

* Version 2.10:
  o Added 'Show Preview Pane' option (View -> Show Preview Pane).
    When It's turned on, a preview pane is added and allows you to
    quickly view the selected image ( gif, png, jpg files) or text-based
    file (HTML, CSS, JSON, and so on).

* Version 2.05:
  o Added more options to the Quick Filter (Ctrl+Q).

* Version 2.00:
  o Added 'Delete Selected Cache Files' option (Ctrl+Delete). Be
    aware that this option can only delete Chrome cache items stored in
    separate file (The cache name is in f_xxxxxx format). It cannot
    delete cache data stored in data_1 , data_2, data_3 files.
  o Added 'Deleted File' column, which displays 'Yes' if the Chrome
    cache file is deleted.

* Version 1.96:
  o Added 'Edge Folder' button to the 'Select Cache Folder' window,
    which automatically fills the cache folder of Chromium-Based Edge Web
    browser.

* Version 1.95:
  o Added 'Open Selected Cache File With...' option.
  o Added 'Open Selected Cache File With...' to the 'Double-Click
    Action' menu.
  o The 'Open Selected Cache File' option is now displayed in the
    right-click context menu.

* Version 1.90:
  o Added support for decompressing Brotli compressed files (Content
    Encoding = br ).

* Version 1.87:
  o Fixed a problem with the 'Server IP Address' column.

* Version 1.86:
  o Added 'Add Header Line To CSV/Tab-Delimited File' option (Turned
    on by default).
  o Added /cfg command-line option to start ChromeCacheView with the
    specified config file.

* Version 1.85:
  o Added new column: 'Server IP Address'.

* Version 1.80:
  o Added support for the new 'Simple Cache for HTTP' cache format
    (chrome://flags/#enable-simple-cache-backend).

* Version 1.77:
  o Fixed bug: ChromeCacheView displayed wrong items when sorting
    while the 'Quick Filter' is active.
  o Added 'Auto Size Columns+Headers' option.

* Version 1.76:
  o Fixed bug: The Quick Filter window disappeared if you press the
    Esc key while it was in focus.

* Version 1.75:
  o Added 'Quick Filter' feature (View -> Use Quick Filter or
    Ctrl+Q). When it's turned on, you can type a string in the text-box
    added under the toolbar and ChromeCacheView will instantly filter the
    cache items, showing only lines that contain the string you typed.

* Version 1.70:
  o Added new buttons to easily choose the cache folder of
    Chrome-base Web browsers: 'Vivaldi Cache Folder', 'Yandex Cache
    Folder' , and 'Chrome Cache Folder' (Advanced Options window).

* Version 1.67:
  o Fixed issue: When loading large amount of cache items, some
    actions, like selecting items and copying selected items to the
    clipboard were very slow.

* Version 1.66:
  o Added 'URL Length' column.

* Version 1.65:
  o Fixed bug: ChromeCacheView failed to retrieve some of the long
    URLs.

* Version 1.62:
  o Added 'Opera Cache Folder' button to the 'Select Cache Folder'
    window, which allows you to easily use this tool to view the cache of
    Opera Web browser. (Opera is now based on the code of Chrome Web
    browser...)

* Version 1.61:
  o The 'Cache Name' column now displays information about cache
    files stored inside data files (data_1, data_2, data_3 ...). It
    displays the filename and the position the the file stream is stored.

* Version 1.60:
  o Fixed to find the correct item when typing the string you want to
    search into the main List View.
  o Added secondary sorting support: You can now get a secondary
    sorting, by holding down the shift key while clicking the column
    header. Be aware that you only have to hold down the shift key when
    clicking the second/third/fourth column. To sort the first column you
    should not hold down the Shift key.

* Version 1.56:
  o Fixed bug: ChromeCacheView failed to copy the cache files if
    'Save the files in the directory structure of the Web site' option
    was turned on and the Web site used non-standard TCP port (Instead of
    port 80).
  o Fixed to display date/time values according to daylight saving
    time settings.

* Version 1.55:
  o Fixed issue: ChromeCacheView loaded only 4 data files: data_0,
    data_1, data_2, data_3. It seems that when the cache of Chrome is
    large enough, it starts to create more cache data files (data_4,
    data_5...)
    Starting from this version, ChromeCacheView will read these
    additional cache data files.

* Version 1.50:
  o Added 'Load only files larger than...' and 'Load only files
    smaller than...' options. (In 'Select Cache Folder' window)

* Version 1.46:
  o Fixed bug: ChromeCacheView failed to decompress some of the files
    compressed with gzip.
  o Fixed issue: ChromeCacheView left multiple files under the temp
    folder when extracting files compressed with gzip.

* Version 1.45:
  o ChromeCacheView now loads the cache items much faster and with
    less memory usage, especially if you have a large amount of items in
    the cache.

* Version 1.40:
  o Added 'Stop' menu item, which allows you to stop the loading
    process of the cache files list.

* Version 1.35:
  o Added 'Load only cache files from the last xx days' option (In
    'Select Cache Folder' window).
  o Added 'Load only cache files in the following time range' option
    (In 'Select Cache Folder' window).

* Version 1.30:
  o Added 'Open Selected Cache File' option, which opens the selected
    cache file with the default file viewer.
  o Added 'Double-Click Action' option, which allows you to choose
    what to do when you double-click on cache item.

* Version 1.27:
  o The status bar now displays the total size of selected files in
    KB/MB.

* Version 1.26:
  o Fixed ChromeCacheView to read the cache when the latest version
    of Chrome is opened and locks the cache files.

* Version 1.25:
  o Added /copycache command-line option, which allows you to extract
    files from the cache without displaying any user interface.
  o Also added /CopyFilesFolder, /UseWebSiteDirStructure, and
    /NewNameIfExist command-line options, for using with the /copycache
    command-line option.

* Version 1.22:
  o Made a small fix that hopefully will solve a crash problem that
    some users experienced.

* Version 1.21:
  o Fixed bug: ChromeCacheView failed to copy cache files because the
    filenames contained invalid file characters (?, :, *, |, and others).

* Version 1.20:
  o Added new option in 'Copy Selected Cache Files': Update the
    modified time of the copied files according to modified time in the
    Web server.

* Version 1.15:
  o Added support for working with the cache files of Chrome 2.x

* Version 1.10:
  o Added 'Show Zero-Length Files' option.
  o Added fileter by file type. (text/html, image, audio, video,
    application)

* Version 1.05
  o New option in 'Copy Selected Files To...': Save the files in the
    directory structure of the Web site.

* Version 1.00 - First release.



Command-Line Options
====================



/stext <Filename>
Save the list of all cache files into a regular text file.

/stab <Filename>
Save the list of all cache files into a tab-delimited text file.

/scomma <Filename>
Save the list of all cache files into a comma-delimited text file.

/stabular <Filename>
Save the list of all cache files into a tabular text file.

/shtml <Filename>
Save the list of all cache files into HTML file (Horizontal).

/sverhtml <Filename>
Save the list of all cache files into HTML file (Vertical).

/sxml <Filename>
Save the list of all cache files to XML file.

-folder <Cache Folder>
Start ChromeCacheView with the specified cache folder.

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

/cfg <Filename>
Start ChromeCacheView with the specified configuration file. For example:
ChromeCacheView.exe /cfg "c:\config\ccv.cfg"
ChromeCacheView.exe /cfg "%AppData%\ChromeCacheView.cfg"

Examples:
ChromeCacheView.exe -folder "F:\Documents and
Settings\Administrator\Local Settings\Application Data\Google\Chrome\User
Data\Default\Cache"
ChromeCacheView.exe -folder "F:\Documents and Settings\User1\Local
Settings\Application Data\Google\Chrome\User Data\Default\Cache" /shtml
c:\temp\chrm.html
ChromeCacheView.exe /stext c:\temp\chrm.txt

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





Translating ChromeCacheView to other languages
==============================================

In order to translate ChromeCacheView to other language, follow the
instructions below:
1. Run ChromeCacheView with /savelangfile parameter:
   ChromeCacheView.exe /savelangfile
   A file named ChromeCacheView_lng.ini will be created in the folder of
   ChromeCacheView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run ChromeCacheView, and all
   translated strings will be loaded from the language file.
   If you want to run ChromeCacheView without the translation, simply
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

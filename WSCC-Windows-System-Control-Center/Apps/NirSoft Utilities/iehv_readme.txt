


IEHistoryView v1.70
Copyright (c) 2003 - 2011 Nir Sofer



Description
===========

Each time that you type a URL in the address bar or click on a link in
Internet Explorer browser, the URL address is automatically added to the
history index file. When you type a sequence of characters in the address
bar, Internet Explorer automatically suggests you all URLs that begins
with characters sequence that you typed (unless AutoComplete feature for
Web addresses is turned off). However, Internet Explorer doesn't allow
you to view and edit the entire URL list that it stores inside the
history file.

This utility reads all information from the history file on your
computer, and displays the list of all URLs that you have visited in the
last few days. It also allows you to select one or more URL addresses,
and then remove them from the history file or save them into text, HTML
or XML file. In addition, you are allowed to view the visited URL list of
other user profiles on your computer, and even access the visited URL
list on a remote computer, as long as you have permission to access the
history folder.



Versions History
================




13/12/2011
1.70

* Added 'File Position' column, which displays the position of the
  record inside the index.dat file.


11/08/2011
1.65

* Added 'Hide File:// Items' option. When it's turned on, all file
  system history entries won't be displayed.
* Added new command-line option: -hidefileitems and -showtypedurls


30/06/2011
1.62

* Fixed bug: IEHistoryView failed to work properly when using more than
  5 command-line values.


16/04/2011
1.61

* Fixed the URL and Title length limitation on HTML reports.


23/03/2011
1.60

* IEHistoryView now also reads the 'Low' subfolder located under the
  base history folder, on Windows 7/2008/Vista. You can control which
  folders to read by using 'Read History From Base Folder' and 'Read
  History From Low Folder' options (under the View menu).
* Also added 'Low Folder' column, which displays 'Yes' if the history
  item loaded from the 'Low' folder.


17/03/2011
1.57

* Added 'Mark Odd/Even Rows' option, under the View menu. When it's
  turned on, the odd and even rows are displayed in different color, to
  make it easier to read a single line.


30/01/2011
1.56

* Added -lastdays command-line option, for displaying/saving only the
  history items from the last xx days.


22/12/2010
1.55

* Added 'Show Time In GMT' option. When it's turned on, the date/time
  values are displayed in GMT, according to the time zone settings of
  Windows.


19/10/2010
1.52

* Fixed issue: IEHistoryView failed to locate the history folder of
  another profile on non-English versions of Windows.


13/10/2010
1.51

* You can now send the IE history information to stdout by specifying
  an empty filename ("") in the command-line of all save parameters.
  For example: iehv.exe /stab "" >> c:\temp\iehis.txt


25/09/2010
1.50

* Added support for loading the history of all profiles in the current
  running system. In order to use this feature, go to 'Select User
  Profile' (Ctrl+U) and choose 'Load all profiles'. Be aware that the
  delete option is not supported when working in multiple profiles mode.
* Added -allprofiles command-line option to save the history of all
  user profiles.


02/12/2009
1.45

* Fixed bug: The combination of -folder and save command-line
  parameters didn't work well.


27/10/2009
1.44

* Fixed bug: The 'Select By URL' was limited to 8 lines.
* Fixed the focus problems when a dialog-box is closed.


22/10/2009
1.43

* Fixed bug: IEHistoryView displayed 'Error 18' message if one of the
  history subfolders didn't contain index.dat filename.


18/10/2009
1.42

* Added sorting command-line options.


03/09/2009
1.41

* Added -allsubfolders option for saving the data of all history
  subfolders from command-line.


25/03/2009
1.40

* The 'View All Subfolders' option is now automatically selected by
  default.
* The settings of IEHistoryView are now saved into ini file instead of
  the Registry.
* When selecting a profile and the history folder name is in
  non-English language, IEHistoryView will try to locate the right
  history folder of the profile according to the history folder name of
  the current user.


26/05/2008
1.37

* Fixed bug: The main window lost the focus when the user switched to
  another application and then returned back to IEHistoryView.


08/09/2007
1.36

* Added new option: Show All Google Searches.


30/05/2007
1.35

* Updated the 'Select User Profile' option to work properly under Vista.


28/01/2007
1.34

* Dates are now formatted according to user locale, instead of system
  locale in previous versions.


21/07/2006
1.33

* A tooltip is displayed when a string in a column is longer than the
  column length.
* New option: Copy URL. (Copy to the clipboard only the URL)


30/06/2006
1.32

* Fixed bug: '???????????' string appeared in the title, while it
  should be empty.
* Fixed bug: Wrong 'Modified Date' values on IE6 with XP/SP2 and IE7.


03/12/2005
1.31

* -folder and -user options now can be used without a save command -
  for loading IEHistoryView with specified folder or user.


12/10/2005
1.30

* New option: View All Subfolders - View all subfolders in one chunk.
* New column: Subfolder - Display the Subfolder name when 'View all
  subfolders' option is turned on.
* Added XP style support.
* Fixed bug: Open links that doesn't contain the 'http://' string.
* Added more accelerator keys.


27/06/2004
1.22

* Bug fix: Typed URLs displayed even when this option is not selected.


01/06/2004
1.21

* Ability to translate to other languages.
* Copy to clipboard in tab-delimited format.
* Minor changes in HTML reports.


14/01/2004
1.20

* New option: View older URLs list from subfolders under the main
  history folder. ('Select History Subfolder' in File menu)
* New option to create URL shortcuts of the selected URLs.
* New option: Delete all items except...
* Improvement in HTML report display to avoid oversized columns.
* Clicking on the URL in HTML report opens the URL in new browser
  window.


21/12/2003
1.10
Added command-line support

01/11/2003
1.00
First Release



System Requirement
==================

This utility works on any version of Windows operating system with
Internet Explorer version 4.00 or greater.



Using IEHistoryView
===================

IEHistoryView is provided as standalone executable, so it doesn't require
any installation process or additional DLLs. Just copy the executable
(iehv.exe) to any folder you like, and run it.
After you run it, the main window displays the list of all URLs stored in
the history file of the current logged on user. If you want to view the
history information of other users on your computer, choose the "Select
User Profile" from the file menu, and select the desired user profile.
If you want to view the history information of another computer on a
network, connect to the desired network drive, and from the File menu,
choose "Select History Folder", and select the history folder in the
remote drive.



Notice: The Hits Column
=======================

Many poeple ask me about the meaning of the Hits column in the History
file of Internet Explorer. So here's a small explanation: Generally, the
Hits value should display the number of times that you visited the
specified URL. However, in many records, you may notice that when you
visit the URL, the number of hits grows by more than one. It might grow
by 2, 3, 5, or even 15.
I don't know the exact "formula" that Microsoft uses to calculate the
hits value. This means that you cannot use the Hits column to detemine
the exact number of times that you visited a Web site.



Notice: Time Zone
=================

When you use this tool to inspect the IE history of another computer, The
time zone settings of Windows (including Daylight saving time) in the
computer the runs IEHistoryView must be the same as the time zone
settings of the computer that created the history file. That's because
the Modified Time in some of the history records is saved in GMT, while
the Modified Time in other records is saved in local time, and
IEHistoryView has to correct the Modified Time according to the correct
time zone.



The Typed URLs List
===================

Most URLs that you visit are saved in the History folder. However,
Internet Explorer also saves the last 25 URLs that you typed in the
following Registry key: HKEY_CURRENT_USER\Software\Microsoft\Internet
Explorer\TypedURLs
By default, IEHistoryView doesn't display the URLs list from the
Registry, but you can change this setting by choosing the "Display Typed
URLs" option under the View menu. If this option is selected, the URLs
list in the Registry are displayed, in addition to the list of all URLs
stored in the History folder. You can distinguish between the 2 types of
URLs by looking at the 'Hits' column or at the one of the dates columns.
As opposed to the URLs extracted from the History folder, The URLs from
the Registry doesn't provide any additional information except the URL
itself, so the other columns contains 'N/A' string (Not Available).
Be aware that the typed URLs list can only be displayed for your local
system. You cannot view the typed URLs list if choose to watch the
history data from another computer or from another operating system.



Deleting URLs From The History File
===================================

IEHistoryView allows you to delete URL items from the history file and
from the typed URLs list in the Registry. In order to that, select the
URLs that you want to delete, and press the Del key.



Viewing Older History Information
=================================

In some circumstances, Internet Explorer saves some older history
information in subfolders located under the main history folder. Starting
from version 1.20, you can view the history information stored in these
subfolders by using the 'Select History Subfolder' option in the File
menu.



About The History Folder
========================

The location of the history folder is different from one operating system
to another.
On Windows 98, the history folder is located under your Windows
directory. For example: If your Windows 98 is installed under c:\win98,
the history folder is c:\win98\history
On Windows 2000/XP, the History folder is located inside "Local Settings"
folder of your user profile. For Example: C:\Documents and
Settings\Administrator\Local Settings\History. The "Local Settings"
folder is hidden by default, so you won't see this folder unless your
system is configured to display hidden files and folders.
In most systems, IEHistoryView automatically identify your current
History folder and uses it as default. However, you can always select
History folder from another location by using the "Select History Folder"
option under the File menu.

Be aware that when you watch the History folder from Windows environment,
it doesn't show you the real files inside this folder, but instead it
displays the history shell extension that provides limited information
about the sites you visited.



Command-Line Options
====================

Syntax: iehv [/Action] ["Destination File"] {-Source Type} {"Source"}


[/Action] can be one of the following options:


/stext
Saves the URLs list into a text file specified in ["Destination File"]
parameter.

/stab
Saves the URLs list into tab-delimited text file specified in
["Destination File"] parameter.

/shtml
Saves the URLs list into HTML file specified in ["Destination File"]
parameter.

/sverhtml
Saves the URLs list into vertical HTML file file specified in
["Destination File"] parameter.

/stabular
Saves the URLs list into tabular text file specified in ["Destination
File"] parameter.

/sxml
Saves the URLs list into xml file specified in ["Destination File"]
parameter.

/sort <column>
This command-line option can be used with other save options for sorting
by the desired column. If you don't specify this option, the list is
sorted according to the last sort that you made from the user interface.
The <column> parameter can specify the column index (0 for the first
column, 1 for the second column, and so on) or the name of the column,
like "URL" and "Modified Date". You can specify the '~' prefix character
(e.g: "~Modified Date") if you want to sort in descending order. You can
put multiple /sort in the command-line if you want to sort by multiple
columns.

Examples:
iehv.exe /shtml "f:\temp\iehv.html" /sort 2 /sort ~1
iehv.exe /shtml "f:\temp\iehv.html" /sort "~Modified Date"

/nosort
When you specify this command-line option, the list will be saved without
any sorting.

The {-Source Type} parameter is optional. If you don't specify it, the
URLs will be loaded from the default History folder on your system.
This parameter may contain one of the following values:


-folder
Loads the URLs list from the folder specified in {"Source"} parameter.

-user
Loads the URLs list of the user specified in {"Source"} parameter.

-allsubfolders [0 | 1]
Determines whether IEHistoryView should save the history items from all
subfolders. 1 = yes, 0 = no.

-allprofiles [0 | 1]
Determines whether IEHistoryView should save the history items from all
user profiles. 1 = yes, 0 = no.

-lastdays [days]
Loads only the history items from the last xx days.

-hidefileitems [0 | 1]
Determines whether IEHistoryView should hide the file system history
items. 1 = yes, 0 = no.

-showtypedurls [0 | 1]
Determines whether IEHistoryView should display the typed URLs list from
the Registry. 1 = yes, 0 = no.

Examples:
iehv -folder "c:\Documents and Settings\Administrator\Local
Settings\History"
iehv /shtml "c:\temp\urls.html"
iehv /stext "c:\temp\urls.txt" -user admin2
iehv /stext "c:\temp\urls1.txt" -folder "c:\windows\history"
iehv /shtml "c:\temp\urls.html" -allsubfolders 1
iehv /shtml "c:\temp\urls.html" -allsubfolders 1 /sort "URL"
iehv /shtml "c:\temp\urls.html" -allprofiles 1
iehv /shtml "c:\temp\urls.html" -lastdays 7



Translating to other languages
==============================

IEHistoryView allows you to easily translate all menus, dialog-boxes, and
other strings to other languages.
In order to do that, follow the instructions below:
1. Run IEHistoryView with /savelangfile parameter:
   iehv.exe /savelangfile
   A file named iehv_lng.ini will be created in the folder of
   IEHistoryView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all menus, dialog-boxes, and string entries to the
   desired language.
4. After you finish the translation, Run IEHistoryView, and all
   translated strings will be loaded from the language file.
   If you want to run IEHistoryView without the translation, simply
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



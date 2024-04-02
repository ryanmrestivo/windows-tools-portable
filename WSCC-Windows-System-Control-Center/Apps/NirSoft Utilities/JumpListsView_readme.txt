


JumpListsView v1.16
Copyright (c) 2013 - 2018 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

JumpListsView is a simple tool that displays the information stored by
the 'Jump Lists' feature of Windows 7 and Windows 8. For every record
found in the Jump Lists, the following information is displayed: The
filename that the user opened, the date/time of the file opening event,
the ID of the application that was used to open the file, the
size/time/attributes of the file on the time that the file was opened,
and more...
You can also export the Jump Lists records to csv/tab-delimited/xml/html
file.



System Requirements
===================

This utility works on Windows 7, Windows 8, and Windows 10. Both 32-bit
and 64-bit systems are supported. On previous version of Windows, the
'Jump Lists' feature doesn't exist, and thus JumpListsView won't display
any data, but... You can still read data from external hard-drive
containing installation of Windows 7/8 by using the 'Advanced Options'
window.



Jump Lists Folders
==================

The jump lists information is stored under the following folders:
C:\Users\[User
Profile]\AppData\Roaming\Microsoft\Windows\Recent\AutomaticDestinations
C:\Users\[User
Profile]\AppData\Roaming\Microsoft\Windows\Recent\CustomDestinations

Currently, JumpListsView only reads the information from the
AutomaticDestinations folder.



Versions History
================


* Version 1.16:
  o Added 'Quick Filter' feature (View -> Use Quick Filter or
    Ctrl+Q). When it's turned on, you can type a string in the text-box
    added under the toolbar and JumpListsView will instantly filter the
    table, showing only items that contain the string you typed.

* Version 1.15:
  o Added 'Application Name' column. JumpListsView searches the
    Application ID in JumpListsView_AppID.txt (Located in the same folder
    of the .exe file) and if it finds the ID, the name of the application
    is displayed in the 'Application Name' column.
  o Added 'File Extension' column.
  o Added 'Align Numeric Columns To Right' option.

* Version 1.11:
  o Fixed bug: JumpListsView crashed when it failed to open a jump
    list file.

* Version 1.10:
  o JumpListsView now reads the DestList structure of Windows 10.
  o Added 'Jump lists Filename' and 'Computer Name' columns.

* Version 1.04:
  o Fixed to display date/time values according to daylight saving
    time settings.

* Version 1.03:
  o Added 'Google Search - Application ID' option.

* Version 1.02:
  o Added /UseRecentFolder and /RecentFolder command-line options to
    set the Recent folder from command-line, for example:
    JumpListsView.exe /UseRecentFolder 1 /RecentFolder
    "d:\Users\admin1\AppData\Roaming\Microsoft\Windows\Recent" /shtml
    f:\temp\jl.html

* Version 1.01:
  o Fixed the flickering while scrolling the 'Jump Lists' items.

* Version 1.00 - First release.



Start Using JumpListsView
=========================

JumpListsView doesn't require any installation process or additional dll
files. In order to start using it, simply run the executable file -
JumpListsView.exe
After running JumpListsView.exe, it scans the jump lists on your system
and displays the information on the main window. You can select one or
more items, and then export them to xml/html/csv/tab-delimited file. You
can also copy the selected items to the clipboard (CTRL+C) and the paste
the data into Excel or other spreadsheet application.



JumpListsView Columns
=====================


* Filename and Full Path: The filename that the user probably opened.
* Record Time: Specifies the date/time that the user probably opened
  the specified filename.
* Created Time, Modified Time, Accessed Time, File Attributes, and File
  Size: Specifies the date/time, attributes, and file size, as recorded
  at the moment that the user opened the file. Be aware that the current
  time/size/attributes of the file might be different. Also, for some of
  the records, this time/size/attributes information is not available.
* Entry ID: The internal ID of the record.
* Application ID: Specifies the ID of the applications that was used to
  open the specified filename. It means that if you see 2 records with
  the same Application ID, then both files were opened by the same
  application.
  Currently, JumpListsView cannot detect the application, but you can
  find some common Application IDs in the Internet, like this IDs list.



Command-Line Options
====================



/UseRecentFolder {0 | 1}
Specifies whether to load from the specified Recent folder (/RecentFolder
parameter) instead of using the default one. 0 = No, 1 = Yes.

/RecentFolder <Folder>
Specifies the recent folder to load.

/stext <Filename>
Save the Jump List entries into a regular text file.

/stab <Filename>
Save the Jump List entries into a tab-delimited text file.

/scomma <Filename>
Save the Jump List entries into a comma-delimited text file (csv).

/stabular <Filename>
Save the Jump List entries into a tabular text file.

/shtml <Filename>
Save the Jump List entries into HTML file (Horizontal).

/sverhtml <Filename>
Save the Jump List entries into HTML file (Vertical).

/sxml <Filename>
Save the Jump List entries to XML file.



Translating JumpListsView to other languages
============================================

In order to translate JumpListsView to other language, follow the
instructions below:
1. Run JumpListsView with /savelangfile parameter:
   JumpListsView.exe /savelangfile
   A file named JumpListsView_lng.ini will be created in the folder of
   JumpListsView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run JumpListsView, and all
   translated strings will be loaded from the language file.
   If you want to run JumpListsView without the translation, simply
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




UserAssistView v1.02
Copyright (c) 2008 - 2010 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

This utility decrypt and displays the list of all UserAssist entries
stored under
HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAs
sist key in the Registry. The UserAssist key contains information about
the exe files and links that you open frequently. you can save the list
of UserAssist entries into text/html/xml/csv file, as well as you can
delete unwanted items.



System Requirements
===================

This utility works on Windows 2000, Windows XP, Windows Server 2003,
Windows Vista, and Windows 7.



Versions History
================


* Version 1.02 - Fixed to display the 'Modified Time' values under
  Windows 7.
* Version 1.01 - Fixed to work properly under Windows 7.
* Version 1.00 - First release.



Using UserAssistView
====================

UserAssistView doesn't require any installation process or additional DLL
files. In order to start using it, simply run the executable file -
UserAssistView.exe
After running it, the main window of UserAssistView displays the list of
all UserAssist items stored in your Registry. You can select one or more
items, and then same them to a file or delete them.



Command-Line Options
====================



/stext <Filename>
Save the list of UserAssist items into a regular text file.

/stab <Filename>
Save the list of UserAssist items into a tab-delimited text file.

/scomma <Filename>
Save the list of UserAssist items into a comma-delimited text file.

/stabular <Filename>
Save the list of UserAssist items into a tabular text file.

/shtml <Filename>
Save the list of UserAssist items into HTML file (Horizontal).

/sverhtml <Filename>
Save the list of UserAssist items into HTML file (Vertical).

/sxml <Filename>
Save the list of UserAssist items to XML file.



Translating UserAssistView to other languages
=============================================

In order to translate UserAssistView to other language, follow the
instructions below:
1. Run UserAssistView with /savelangfile parameter:
   UserAssistView.exe /savelangfile
   A file named UserAssistView_lng.ini will be created in the folder of
   UserAssistView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run UserAssistView, and all
   translated strings will be loaded from the language file.
   If you want to run UserAssistView without the translation, simply
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

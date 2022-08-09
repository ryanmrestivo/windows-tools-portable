


EventLogSourcesView v1.00
Copyright (c) 2013 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

EventLogSourcesView is a simple tool that displays the list of all event
log sources installed on your system. For every event log source, the
following information is displayed: Event Source Name, Event Type,
DLL/EXE Files containing the event message strings, Registry Modified
Time, and version information taken from the DLL/EXE file (Product Name,
Company, File Description, File Version)



System Requirements
===================


* This utility works on any version of Windows, starting from Windows
  2000 and up to Windows 8. Both 32-bit and 64-bit systems are supported.



Start Using EventLogSourcesView
===============================

EventLogSourcesView doesn't require any installation process or
additional dll files. In order to start using it, simply run the
executable file - EventLogSourcesView.exe
After running it, the main window of EventLogSourcesView displays the
list of all event log sources installed on your system.
You can select one or more items, and then export them to
html/xml/csv/tab-delimited file by using the 'Save Selected Items' option
(Ctrl+S) or copy the selected items to the clipboard (Ctrl+C) and then
paste them to Excel or other application.



Command-Line Options
====================



/stext <Filename>
Save the list of all event log sources into a regular text file.

/stab <Filename>
Save the list of all event log sources into a tab-delimited text file.

/scomma <Filename>
Save the list of all event log sources into a comma-delimited text file
(csv).

/stabular <Filename>
Save the list of all event log sources into a tabular text file.

/shtml <Filename>
Save the list of all event log sources into HTML file (Horizontal).

/sverhtml <Filename>
Save the list of all event log sources into HTML file (Vertical).

/sxml <Filename>
Save the list of all event log sources to XML file.



Translating EventLogSourcesView to other languages
==================================================

In order to translate EventLogSourcesView to other language, follow the
instructions below:
1. Run EventLogSourcesView with /savelangfile parameter:
   EventLogSourcesView.exe /savelangfile
   A file named EventLogSourcesView_lng.ini will be created in the folder
   of EventLogSourcesView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run EventLogSourcesView, and all
   translated strings will be loaded from the language file.
   If you want to run EventLogSourcesView without the translation, simply
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




MMCSnapInsView v1.00
Copyright (c) 2015 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

MMCSnapInsView is a simple tool for Windows that displays the details of
all MMC snap-ins installed on your system, including name, description,
CLSID, dll file, product name, company name, file version, and more...
You can also select multiple MMC snap-ins and then open them in MMC
application.



System Requirements
===================

This utility works on any version of Windows, starting from Windows XP
and up to Windows 10. Both 32-bit and 64-bit systems are supported.



Start Using MMCSnapInsView
==========================

This utility doesn't require any installation process or additional DLL
files. In order to start using it, simply run the executable file -
MMCSnapInsView.exe
After running it, the main window displays the list of all MMC snap-ins
installed on your system. You can select one or more snap-ins from the
list and then export them to csv/tab-delimited/xml/html file (Ctrl+S) or
open them in the MMC application using the 'Open Selected SnapIns In MMC'
option (F2).



Command-Line Options
====================



/stext <Filename>
Save the MMC snap-ins list into a simple text file.

/stab <Filename>
Save the MMC snap-ins list into a tab-delimited text file.

/scomma <Filename>
Save the MMC snap-ins list into a comma-delimited text file (csv).

/stabular <Filename>
Save the MMC snap-ins list into a tabular text file.

/shtml <Filename>
Save the MMC snap-ins list into HTML file (Horizontal).

/sverhtml <Filename>
Save the MMC snap-ins list into HTML file (Vertical).

/sxml <Filename>
Save the MMC snap-ins list into XML file.



Translating MMCSnapInsView to other languages
=============================================

In order to translate MMCSnapInsView to other language, follow the
instructions below:
1. Run MMCSnapInsView with /savelangfile parameter:
   MMCSnapInsView.exe /savelangfile
   A file named MMCSnapInsView_lng.ini will be created in the folder of
   MMCSnapInsView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run MMCSnapInsView, and all
   translated strings will be loaded from the language file.
   If you want to run MMCSnapInsView without the translation, simply
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

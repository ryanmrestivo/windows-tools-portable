


TimeZonesView v1.06
Copyright (c) 2017 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

TimeZonesView is a simple tool for Windows that displays all world time
zones. For every time zone, the following information is displayed: name,
description, current date/time in this time zone and date/time that
daylight saving time begins and ends.



System Requirements
===================

This utility works on any versions of Windows, starting from Windows XP
and up to Windows 10. Both 32-bit and 64-bit systems are supported. Be
aware that in order to display accurate time information, the current
time and time zone on your system must be correct (Including the settings
of daylight saving time). Also, the time zone information is taken from
the following Registry key: HKEY_LOCAL_MACHINE\Software\Microsoft\Windows
NT\CurrentVersion\Time Zones. So the information on this Registry key
must be correct too.



Versions History
================


* Version 1.06:
  o Added 'DST Active' column (Yes or No).

* Version 1.05:
  o Added option to choose another font (name and size) to display in
    the main window.

* Version 1.00 - First release.



Start Using TimeZonesView
=========================

TimeZonesView doesn't require any installation process or additional DLL
files. In order to start using it, simply run the executable file -
TimeZonesView.exe
After running TimeZonesView, the main window will display the list of all
time zones.



Command-Line Options
====================



/stext <Filename>
Save the time zones list into a simple text file.

/stab <Filename>
Save the time zones list into a tab-delimited text file.

/scomma <Filename>
Save the time zones list into a comma-delimited text file (csv).

/stabular <Filename>
Save the time zones list into a tabular text file.

/shtml <Filename>
Save the time zones list into HTML file (Horizontal).

/sverhtml <Filename>
Save the time zones list into HTML file (Vertical).

/sxml <Filename>
Save the time zones list into XML file.



Translating TimeZonesView to other languages
============================================

In order to translate TimeZonesView to other language, follow the
instructions below:
1. Run TimeZonesView with /savelangfile parameter:
   TimeZonesView.exe /savelangfile
   A file named TimeZonesView_lng.ini will be created in the folder of
   TimeZonesView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run TimeZonesView, and all
   translated strings will be loaded from the language file.
   If you want to run TimeZonesView without the translation, simply
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

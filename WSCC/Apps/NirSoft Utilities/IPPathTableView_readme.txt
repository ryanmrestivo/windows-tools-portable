


IPPathTableView v1.00
Copyright (c) 2022 Nir Sofer
Web site: https://www.nirsoft.net/utils/ip_path_table_view.html



Description
===========

IPPathTableView is a tool for Windows 11/10/8/7/Vista that displays the
IP path table of your local computer. For every IP path entry, the
following information is displayed: Source, Destination, Next Hop, MTU,
Reachaable (Yes/No), Adapter Name, Connection Name, Link Transmit Speed,
Link Receive Speed.
The IP path table contains the list of all IP Addresses that your
computer connected recently



System Requirements
===================

This tool works on any version of Windows, starting from Windows Vista
and up to Windows 11. Both 32-bit and 64-bit systems are supported.



Start Using IPPathTableView
===========================

IPPathTableView doesn't require any installation process or additional
DLL files. In order to start using it, simply run the executable file -
IPPathTableView.exe
Afer running IPPathTableView, the main window displays the current IP
path table of your system.

You can press F5 to refresh the display of IP path table, or you can
automatically refresh the display every 1 - 10 seconds by using the Auto
Refresh option (Under the Options menu).

You can select one or more items (or press Ctrl+A to select all of them)
and then use the 'Save Selected Items' option (Ctrl+S) to export the
table to comma-delimited/tab-delimited/HTML/XML/JSON file.



Command-Line Options
====================



/stext <Filename>
Save the IP path table to a simple text file.

/stab <Filename>
Save the IP path table to a tab-delimited text file.

/scomma <Filename>
Save the IP path table to a comma-delimited text file (csv).

/shtml <Filename>
Save the IP path table to HTML5 file (Horizontal).

/sverhtml <Filename>
Save the IP path table to HTML5 file (Vertical).

/sxml <Filename>
Save the IP path table to XML file.

/sjson <Filename>
Save the IP path table to JSON file.



Translating IPPathTableView to other languages
==============================================

In order to translate IPPathTableView to other language, follow the
instructions below:
1. Run IPPathTableView with /savelangfile parameter:
   IPPathTableView.exe /savelangfile
   A file named IPPathTableView_lng.ini will be created in the folder of
   IPPathTableView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run IPPathTableView, and all
   translated strings will be loaded from the language file.
   If you want to run IPPathTableView without the translation, simply
   rename the language file, or move it to another folder.



License
=======

This utility is released as freeware. You are allowed to freely
distribute this utility via CD-ROM, DVD, Internet, or in any other way,
as long as you don't charge anything for this and you don't sell it or
distribute it as a part of commercial product. If you distribute this
utility, you must include all files in the distribution package, without
any modification !



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
utility, you can send a message to support@nirsoft.net

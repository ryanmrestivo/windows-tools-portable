


IPNeighborsView v1.02
Copyright (c) 2020 - 2024 Nir Sofer
Web site: https://www.nirsoft.net/utils/ip_neighbors_view.html



Description
===========

IPNeighborsView is a tool for Windows 11/10/8/7/Vista that displays the
IP neighbor table of your local computer. For every IP neighbor entry,
the following information is displayed: IP Address, MAC Address, MAC
Address Company, State, State Time, Local Adapter Name, Local Connection
Name.

In the IP neighbor table, you can find the details of computers and
devices recently connected to your network. computers and devices are
listed only if Windows operating system detected them.



System Requirements
===================

This tool works on any version of Windows, starting from Windows Vista
and up to Windows 11. Both 32-bit and 64-bit systems are supported.



Versions History
================


* Version 1.02
  o Added 'Put Icon On Tray' option.

* Version 1.01
  o Fixed to sort properly the IP Address column.

* Version 1.00 - First release.



Start Using IPNeighborsView
===========================

IPNeighborsView doesn't require any installation process or additional
DLL files. In order to start using it, simply run the executable file -
IPNeighborsView.exe
Afer running IPNeighborsView, the main window displays the current IP
neighbor table of your system. By default, IPNeighborsView hides the
permanent items in the IP neighbor table, but you can view these items by
unchecking the 'Hide Permanent Items' options (Under the Options menu).

You can select one or more items (or press Ctrl+A to select all of them)
and then use the 'Save Selected Items' option (Ctrl+S) to export the
table to comma-delimited/tab-delimited/HTML/XML/JSON file.



Command-Line Options
====================



/stext <Filename>
Save the IP Neighbors items to a simple text file.

/stab <Filename>
Save the IP Neighbors items to a tab-delimited text file.

/scomma <Filename>
Save the IP Neighbors items to a comma-delimited text file (csv).

/shtml <Filename>
Save the IP Neighbors items to HTML5 file (Horizontal).

/sverhtml <Filename>
Save the IP Neighbors items to HTML5 file (Vertical).

/sxml <Filename>
Save the IP Neighbors items to XML file.

/sjson <Filename>
Save the IP Neighbors items to JSON file.



Translating IPNeighborsView to other languages
==============================================

In order to translate IPNeighborsView to other language, follow the
instructions below:
1. Run IPNeighborsView with /savelangfile parameter:
   IPNeighborsView.exe /savelangfile
   A file named IPNeighborsView_lng.ini will be created in the folder of
   IPNeighborsView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run IPNeighborsView, and all
   translated strings will be loaded from the language file.
   If you want to run IPNeighborsView without the translation, simply
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




NetworkInterfacesView v1.21
Copyright (c) 2013 - 2020 Nir Sofer
Web site: https://www.nirsoft.net



Description
===========

NetworkInterfacesView is a simple tool that displays the list of all
network adapters/interfaces installed on your system. It displays network
interfaces that are currently active, as well as network interfaces that
have been installed previously, and now they are not connected (like USB
wireless network adapters).
For every network interface found on your system, the following
information is displayed (if it's stored in the Registry): Device Name,
Connection Name, IP Address, Subnet Mask, Default Gateway, DHCP Server,
Status, MAC Address and more...
You can select one or more network interface items and then export them
to xml/html/csv/tab-delimited file, or copy them into the clipboard and
then paste them into Excel or other spreadsheet application.



System Requirements
===================

This utility works on any version of Windows, starting from Windows 2000
and up to Windows 10. Both 32-bit and 64-bit systems are supported.



Versions History
================


* Version 1.21:
  o Added 'Interface LUID' column.
  o Added 'Select All' and 'Deselect All' to the 'Column Settings'
    window.

* Version 1.20:
  o Added new option: 'Open Device Properties Window' (F2).

* Version 1.15:
  o Added /RunAsAdmin command-line option for running
    NetworkInterfacesView as administrator.
  o Added 'Interface Speed' column.
  o Added 'Open In RegEdit' option.

* Version 1.10:
  o Added option to disable and enable the selected network adapters.
    Be aware that these actions require elevation ('Run As
    Administrator'). Also, on 64-bit system, you must use the 64-bit
    version of NetworkInterfacesView
  o Added /enable and /disable command-line options.
  o Added 'Run As Administrator' option (Ctrl+F11), which allows you
    to easily run NetworkInterfacesView as administrator on Windows
    Vista/7/8/2008/10.
  o Added x64 build.

* Version 1.00 - First release.



Start Using NetworkInterfacesView
=================================

NetworkInterfacesView doesn't require any installation process or
additional DLL files. In order to start using it, simply run the
executable file - NetworkInterfacesView.exe
After you run NetworkInterfacesView, the main window displays the list of
all network interfaces found in the Registry of your system. You can
select one or more items, and then export them to
xml/csv/tab-delimited/html file by using the 'Save Selected Items' option
(Ctrl+S). You can also copy the selected items into the clipboard
(Ctrl+C), and then paste them into Excel or other spreadsheet application.



Command-Line Options
====================



/disable <Name1> <Name2> <Name3>...
Disables the specified network adapters. You can specify the Interface
GUID, the connection name , and the device name. For example:
NetworkInterfacesView.exe /disable "Local Area Connection"
NetworkInterfacesView.exe /disable {1BC6B2D1-1606-3029-256F-2EB709923499}
{F430061F-D117-29C0-B1A9-F11D473AD7CE}

/enable <Name1> <Name2> <Name3>...
Enables the specified network adapters. You can specify the Interface
GUID, the connection name , and the device name.

/RunAsAdmin
Runs NetworkInterfacesView as administrator.

/stext <Filename>
Save the list of all network interfaces into a regular text file.

/stab <Filename>
Save the list of all network interfaces into a tab-delimited text file.

/scomma <Filename>
Save the list of all network interfaces into a comma-delimited text file
(csv).

/stabular <Filename>
Save the list of all network interfaces into a tabular text file.

/shtml <Filename>
Save the list of all network interfaces into HTML file (Horizontal).

/sverhtml <Filename>
Save the list of all network interfaces into HTML file (Vertical).

/sxml <Filename>
Save the list of all network interfaces to XML file.

/sort <column>
This command-line option can be used with other save options for sorting
by the desired column. If you don't specify this option, the list is
sorted according to the last sort that you made from the user interface.
The <column> parameter can specify the column index (0 for the first
column, 1 for the second column, and so on) or the name of the column,
like "IP Address" and "Device Name". You can specify the '~' prefix
character (e.g: "~Status") if you want to sort in descending order. You
can put multiple /sort in the command-line if you want to sort by
multiple columns.

Examples:
NetworkInterfacesView.exe /shtml "c:\temp\interfaces.html" /sort 2 /sort
~1
NetworkInterfacesView.exe /shtml "c:\temp\interfaces.html" /sort "Status"
/sort "Connection Name"

/nosort
When you specify this command-line option, the list will be saved without
any sorting.



Translating NetworkInterfacesView to other languages
====================================================

In order to translate NetworkInterfacesView to other language, follow the
instructions below:
1. Run NetworkInterfacesView with /savelangfile parameter:
   NetworkInterfacesView.exe /savelangfile
   A file named NetworkInterfacesView_lng.ini will be created in the
   folder of NetworkInterfacesView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run NetworkInterfacesView, and
   all translated strings will be loaded from the language file.
   If you want to run NetworkInterfacesView without the translation,
   simply rename the language file, or move it to another folder.



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

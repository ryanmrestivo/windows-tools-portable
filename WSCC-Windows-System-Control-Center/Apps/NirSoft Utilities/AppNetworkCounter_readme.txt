


AppNetworkCounter v1.56
Copyright (c) 2018 - 2023 Nir Sofer
Web site: https://www.nirsoft.net



Description
===========

AppNetworkCounter is a simple tool for Windows that counts and displays
the number of TCP/UDP bytes and packets sent and received by every
application on your system. For every application, the following
information is displayed: the number of sent and received bytes, number
of sent and received packets, number of sent/received IPv4 bytes, number
of sent/received IPv6 bytes, and sent/receive speed. It also displays the
version information of the application - Product Name, Product Version,
File Description, and Company Name.



System Requirements
===================

This tool works on any version of Windows, starting from Windows XP and
up to Windows 11. Both 32-bit and 64-bit versions of Windows are
supported. On Windows Vista and later this tool requires to run as
Administrator (elevation).



Versions History
================


* Version 1.56:
  o Fixed issue: When copying data to the clipboard or exporting to
    tab-delimited file, every line contained an empty field in the end of
    the line.

* Version 1.55:
  o Fixed the 'Received+Sent Bytes' column to display the value
    according to the 'Bytes Counter Unit' option.
  o Added 'Full Screen' mode (View -> Full Screen or F11 key).
  o Added 'Black Background' option (Under the View menu). When it's
    turned on, the main table is displayed in black background and white
    text, instead of default system colors.

* Version 1.52:
  o Added 'Sort By' button to the toolbar.

* Version 1.51:
  o Fixed a bug with KiB unit on 'Bytes Counter Unit' option.
  o Fixed a few high DPI mode issues

* Version 1.50:
  o Added 'Average Receive Speed' and 'Average Send Speed' columns,
    which calculate the speed between the 'First Activity Time' and 'Last
    Activity Time'.

* Version 1.49:
  o Added 'Add Header Line To CSV/Tab-Delimited File' option (Turned
    on by default).

* Version 1.48:
  o Fixed to display the speed values according to the 'Regional
    Settings' of Windows.
  o Fixed to display leading zero according to the 'Regional
    Settings' of Windows.
  o Added Kbps speed unit.

* Version 1.47:
  o Added 'Always On Top' option.

* Version 1.46:
  o Added GB and GiB to the 'Bytes Counter Unit' option.
  o Added option to change the sorting column from the menu (View ->
    Sort By). Like the column header click sorting, if you click again
    the same sorting menu item, it'll switch between ascending and
    descending order. Also, if you hold down the shift key while choosing
    the sort menu item, you'll get a secondary sorting.

* Version 1.45:
  o Added new columns: 'Received+Sent Bytes', 'Received+Sent Packets'.

* Version 1.42:
  o Added 'Start As Hidden' option. When this option and 'Put Icon On
    Tray' option are turned on, the main window of AppNetworkCounter will
    be invisible on start.
  o Updated to work properly in high DPI mode

* Version 1.41:
  o Added 'Process Services' column, which displays the services of
    the process (Only when the 'Group By' option is 'Process ID').

* Version 1.40:
  o Added 'Show Total Line' option. When it's turned on, a 'Total'
    item is added, showing the total TCP/UDP bytes and packets of all
    applications together.

* Version 1.35:
  o Added thousands separator to all byte counter units.
  o You can set any variable appears saved in the .cfg file from
    command-line. For example, this command set the speed unit to kB/Sec :
    AppNetworkCounter.exe /SpeedUnit 1
  o Added 'Align Numeric Columns To Right' option (It's turned on by
    default).

* Version 1.30:
  o Added 'Group By' option - Application Name (The default) or
    Process ID. If you choose the 'Process ID' option - every process ID
    of the same application is displayed as a separated item.

* Version 1.25:
  o Added new columns 'First Activity Time' and 'Last Activity Time'.
  o Added 'Hide Inactive Items' option.

* Version 1.20:
  o Added 'Maximum Receive Speed' and 'Maximum Send Speed' columns.

* Version 1.15:
  o Added 'Put Icon On Tray' option.

* Version 1.12:
  o Added 'Save File Encoding' option.

* Version 1.11:
  o Added 'Sort On Every Update' option.

* Version 1.10:
  o Added command-line options to save the report of
    AppNetworkCounter into a file without displaying any user interface.

* Version 1.06:
  o Added 'Save All Items' option (Shift+Ctrl+S).

* Version 1.05:
  o Added option to choose another font (name and size) to display in
    the main window.

* Version 1.00 - First release.



Start Using AppNetworkCounter
=============================

AppNetworkCounter doesn't require any installation process or additional
DLL files. In order to start using it, simply run the executable file -
AppNetworkCounter.exe

Immediately after running it, the main window displays every application
that currently send or receive data on your network. Be aware that the
network counters in this tool are not per process but per application, so
if you have multiple processes for the same application ,
AppNetworkCounter merges them into one line. Also, if you close an
application and then run it again, AppNetworkCounter will continue the
update the network counters of the same application entry.

At any time, you can clear the entire list and start with empty window by
pressing Ctrl+X (Clear All). You can also reset the network counters of
selected items by pressing Ctrl+R (Reset Selected Counters).



Columns Description
===================


* Application Name: The .exe filename of the application.
* Application Path: The full path of the application.
* Received Bytes: Number of bytes that the specified application
  received.
* Sent Bytes: Number of bytes that the specified application sent.
* Receive Speed: Calculated receive speed of the specified program. You
  can use this field to monitor the current download bandwidth used by
  every application on your system.
* Send Speed: Calculated send speed of the specified program. You can
  use this field to monitor the current upload bandwidth used by every
  application on your system.
* Maximum Receive Speed: The maximum value of the 'Receive Speed'
  column.
* Maximum Send Speed: The maximum value of the 'Send Speed' column.
* Received Packets: Number of packets that the specified application
  received.
* Sent Packets: Number of packets that the specified application sent.
* IPv4 Received Bytes: Number of IPv4 bytes that the specified
  application received.
* IPv4 Sent Bytes: Number of IPv4 bytes that the specified application
  sent.
* IPv6 Received Bytes: Number of IPv6 bytes that the specified
  application received.
* IPv6 Sent Bytes: Number of IPv6 bytes that the specified application
  sent.
* Product Name: product name, taken from the version resource of the
  .exe file.
* Product Version: product version, taken from the version resource of
  the .exe file.
* File Description: file description, taken from the version resource
  of the .exe file.
* Company Name: company name, taken from the version resource of the
  .exe file.
* First Activity Time: The first time that network activity was
  detected for the specified application.
* Last Activity Time: The last time that network activity was detected
  for the specified application.



Other Options
=============


* Speed Unit: Specifies the speed unit for the speed columns ('Receive
  Speed', 'Send Speed', 'Maximum Receive Speed', 'Maximum Send Speed'):
  kB/Sec , KiB/Sec , MB/Sec , MiB/Sec, Mbps
* Bytes Counter Unit: Specifies the unit for all counter columns:
  Bytes, kB, KiB, MB, MiB
* Exclude Activity of Localhost Addresses: If this option is turned on,
  AppNetworkCounter won't count the local host activity (127.0.0.1 or ::1
  ).
* Hide Inactive Items: If this option is turned on, AppNetworkCounter
  hides any item that is not active for more than xx seconds. The default
  timeout value is 10 seconds, you can change the default timeout value
  by setting the 'InactiveTime' value of the .cfg file.



Command-Line Options
====================



/CaptureTime <Milliseconds>
Specifies the capture time in milliseconds for the save command-line
options (/stext, /stab, /scomma, and so on...)
The default is 10000 milliseconds (10 seconds).

/cfg <Filename>
Start AppNetworkCounter with the specified configuration file. For
example:
AppNetworkCounter.exe /cfg "c:\config\anc.cfg"
AppNetworkCounter.exe /cfg "%AppData%\AppNetworkCounter.cfg"

/stext <Filename>
Save the report of AppNetworkCounter into a simple text file.

/stab <Filename>
Save the report of AppNetworkCounter into a tab-delimited text file.

/scomma <Filename>
Save the report of AppNetworkCounter into a comma-delimited text file
(csv).

/shtml <Filename>
Save the report of AppNetworkCounter into HTML file (Horizontal).

/sverhtml <Filename>
Save the report of AppNetworkCounter into HTML file (Vertical).

/sxml <Filename>
Save the report of AppNetworkCounter into XML file.

/sjson <Filename>
Save the report of AppNetworkCounter into JSON file.

/sort <column>
This command-line option can be used with other save options for sorting
by the desired column. The <column> parameter can specify the column
index (0 for the first column, 1 for the second column, and so on) or the
name of the column, like "Application Name" and "Application Path". You
can specify the '~' prefix character (e.g: "~Received Bytes") if you want
to sort in descending order. You can put multiple /sort in the
command-line if you want to sort by multiple columns.





Translating AppNetworkCounter to other languages
================================================

In order to translate AppNetworkCounter to other language, follow the
instructions below:
1. Run AppNetworkCounter with /savelangfile parameter:
   AppNetworkCounter.exe /savelangfile
   A file named AppNetworkCounter_lng.ini will be created in the folder
   of AppNetworkCounter utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run AppNetworkCounter, and all
   translated strings will be loaded from the language file.
   If you want to run AppNetworkCounter without the translation, simply
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

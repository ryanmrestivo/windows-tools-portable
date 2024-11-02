


USBDriveLog v1.13
Copyright (c) 2021 - 2024 Nir Sofer
Web site: https://www.nirsoft.net/utils/usb_drive_log.html



Description
===========

USBDriveLog is a tool for Windows 10 and Windows 11 that displays a log
of all USB drives plugged to your computer. For every USB drive event,
the following information is displayed: Device Model, Revision,
Manufacturer, Serial Number, Plug Time, Unplug Time, Device ID, Device
Capacity, and more... USBDriveLog allows you to retrieve the information
from your local computer, from remote computer on your network, and from
external hard drive.



System Requirements
===================


* This tool works on Windows 10 and Windows 11. Both 32-bit and 64-bit
  systems are supported. Previous versions of Windows are not supported
  because they don't have the needed event log channels.
* This tool is just a small standalone .exe file that you can run on
  any system without installing anything.
* USBDriveLog retrieves the information from the following event log
  channels: Microsoft-Windows-Partition/Diagnostic ,
  Microsoft-Windows-Storsvc/Diagnostic , both channels are turned on by
  default on Windows 10 and Windows 11. If they are turned off from some
  reason, USBDriveLog will not display the USB drives log.



Versions History
================


* Version 1.13:
  o Added 'Black Background' option (Under the View menu). When it's
    turned on, the main table is displayed in black background and white
    text, instead of default system colors.

* Version 1.12:
  o Added 'Sort By' toolbar button.

* Version 1.11:
  o Added 'Show Milliseconds In Time' option.

* Version 1.10:
  o Added 'Vendor ID' and 'Product ID' columns.
  o Added 'Vendor Name' and 'Product Name' columns. These columns are
    filled according to the Vendor ID and Product ID if you download the
    USB IDs file from http://www.linux-usb.org/usb.ids and put it in the
    same folder of USBDriveLog.exe (Save it as usb.ids ).

* Version 1.04:
  o Added 'Copy Clicked Cell' option to the right-click context menu,
    which copies to the clipboard the text of cell that you right-clicked
    with the mouse.

* Version 1.03:
  o Added 'Computer Name' column.

* Version 1.02:
  o Added option to choose another font (name and size) to display in
    the main window.

* Version 1.01:
  o Fixed to work faster when connecting a remote computer.
  o Fixed resize problem with the 'Choose Data Source' window.

* Version 1.00 - First release.



Start Using USBDriveLog
=======================

USBDriveLog doesn't require any installation process or additional DLL
files. In order to start using it, simply run the executable file -
USBDriveLog.exe
After running USBDriveLog, the main window displays the USB drive log of
your current running system. You can select one or more items (or select
all items by pressing Ctrl+A), and then use the 'Save Selected Items'
option (Ctrl+S) to save the selected items to
comma-delimited/tab-delimited/HTML/XML/JSON file. You can also press
Ctrl+C to copy the selected items to the clipboard, and then paste them
into Excel or other spreadsheet application.



Read USB drive log from external hard drive
===========================================

If you want to view the USB drive log on external disk - Open the 'Choose
Data Source' window (F7), in the 'Load From' combo-box choose 'External
Folder', type the event log folder on the external hard drive (For
example: F:\Windows\System32\winevt\Logs ), and then press the 'OK'
button.



Read USB drive log from remote computer
=======================================

If you want to view the USB drive log on remote computer - Open the
'Choose Data Source' window (F7), in the 'Load From' combo-box choose
'Remote Computer', type the name or IP address of the remote computer.
You may also need to specify the user name and password to connect the
remote computer. Finally, press the 'OK' button to start loading the USB
drive log from the remote computer
This option works only if you have permission to read the event log on
the remote computer.



Vendor Name and Product Name Columns
====================================

'Vendor Name' and 'Product Name' columns are filled according to the
Vendor ID and Product ID of the USB device. In order to fill these
columns, you have to download the usb.ids file from
http://www.linux-usb.org/usb.ids and save it as usb.ids in the same
folder of USBDriveLog.exe



Command-Line Options
====================



/stext <Filename>
Save the USB drive log to a simple text file.

/stab <Filename>
Save the USB drive log to a tab-delimited text file.

/scomma <Filename>
Save the USB drive log to a comma-delimited text file (csv).

/shtml <Filename>
Save the USB drive log to HTML5 file (Horizontal).

/sverhtml <Filename>
Save the USB drive log to HTML5 file (Vertical).

/sxml <Filename>
Save the USB drive log to XML file.

/sjson <Filename>
Save the USB drive log to JSON file.

/sort <column>
This command-line option can be used with other save options for sorting
by the desired column. The <column> parameter can specify the column
index (0 for the first column, 1 for the second column, and so on) or the
name of the column, like "Plug Time" and "Device Model". You can specify
the '~' prefix character (e.g: "~Plug Time") if you want to sort in
descending order. You can put multiple /sort in the command-line if you
want to sort by multiple columns.

/cfg <Config Filename&gt
Start USBDriveLog with the specified config file.



Translating USBDriveLog to other languages
==========================================

In order to translate USBDriveLog to other language, follow the
instructions below:
1. Run USBDriveLog with /savelangfile parameter:
   USBDriveLog.exe /savelangfile
   A file named USBDriveLog_lng.ini will be created in the folder of
   USBDriveLog utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run USBDriveLog, and all
   translated strings will be loaded from the language file.
   If you want to run USBDriveLog without the translation, simply rename
   the language file, or move it to another folder.



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

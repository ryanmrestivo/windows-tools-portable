


BluetoothView v1.66
Copyright (c) 2008 - 2013 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

BluetoothView is a small utility that runs in the background, and monitor
the activity of Bluetooth devices around you. For each detected Bluetooth
device, it displays the following information: Device Name, Bluetooth
Address, Major Device Type, Minor Device Type, First Detection Time, Last
Detection Time, and more.
BluetoothView can also notify you when a new Bluetooth device is
detected, by displaying a balloon in your taskbar or by playing a small
beep sound.



Versions History
================


* Version 1.66:
  o Added 'Mark Odd/Even Rows' option, under the View menu. When it's
    turned on, the odd and even rows are displayed in different color, to
    make it easier to read a single line.
  o Added 'Auto Size Columns+Headers' option, which allows you to
    automatically resize the columns according to the row values and
    column headers.

* Version 1.65:
  o Added 'Hide Paired Devices' option. Paired deviced are usually
    detected even when they are not active, so this option allows you to
    hide them.

* Version 1.61:
  o Fixed the problem with invalid % character on the .xml file.

* Version 1.60:
  o Added option to choose audio file to play when a new bluetooth
    device is detected (In Advanced Options), instead of using the
    default beep sound of Windows.

* Version 1.55:
  o Added 'Start As Hidden' option. When this option and 'Put Icon On
    Tray' option are turned on, the main window of BluetoothView will be
    invisible on start.

* Version 1.50:
  o Added 2 new columns: 'No Detection Counter' and '% Detection'
  o Added support for saving the Bluetooth activity into a log file.
    A new log line is added when a device is detected for at least 5
    Bluetooth scans (Device Arrival) and when a device is not detected
    anymore, for 5 Bluetooth scans ('Device Left' lines). You can
    activate the log file feature in the 'Advanced Options' window (F9).

* Version 1.41 - Added /try_to_connect command-line option for testing
  the ability to connect to specific bluetooth device.
* Version 1.40 - Added 'Add Header Line To CSV/Tab-Delimited File'
  option. When this option is turned on, the column names are added as
  the first line when you export to csv or tab-delimited file.
* Version 1.37 - Fixed issue: Removed the wrong encoding from the xml
  string, which caused problems to some xml viewers.
* Version 1.36 - Fixed bug: BluetoothView didn't loaded the oui.txt
  filename when using it from command-line.
* Version 1.35 - Added custom timeout value (In 'Advanced Options').
* Version 1.31 - Added command-line option for sorting (/sort).
* Version 1.30 - Added command-line support for saving Bluetooth
  devices list to a file.
* Version 1.25 - Added 'Speak the following text when a new bluetooth
  device is detected' in advanced options. When this option is enabled,
  BluetoothView will speak the desired text by using Windows SAPI when a
  new device is detected.
* Version 1.20 - Added 'Try To Connect' option. (See below)
* Version 1.15 - New Option: Execute a command when a new Bluetooth
  device is detected. (In 'Advanced Options')
* Version 1.11 - Added update rate (low/medium/high)
* Version 1.10 - Added 'Company Name' column (see below)
* Version 1.06 - Added new option: Select Another Font.
* Version 1.05 - Fixed bug: The main window lost the focus when the
  user switched to another application and then returned back to
  BluetoothView.
* Version 1.04 - Fixed bug in saving as comma-delimited file when
  description or name fields contained comma character.
* Version 1.03 - Added support for saving as comma-delimited file.
* Version 1.02 - Added 'Automatically Set Device Description' option.
* Version 1.01 - Added 'Remove Selected Items' option. (The removed
  items will be considered as new in the next time that BluetoothView
  detect them)
* Version 1.00 - First release.



What can you do with BluetoothView ?
====================================

If you have neighbors or family members that use a cellular phone with
Bluetooth turned on:
* You can easily know when they come home and when they leave, by using
  the 'First Detected On' and 'Last Detected On' fields.
* Each time that a new device is detected, BluetoothView automatically
  displays an alert as a balloon in your taskbar. This means that you can
  detect when your neighbors/friends/family members are coming even
  before they knock on your door...



System Requirements
===================


* Bluetooth Dongle and device driver that works with the standard
  Bluetooth module of Windows XP/Vista/Windows 7.
* Windows XP/SP2, Windows Vista, or Windows 7. Other versions of
  Windows don't provide a build-in support for Bluetooth, and thus
  BluetoothView cannot work with them.



Start Using BluetoothView
=========================

BluetoothView doesn't require any installation process or additional DLL
files. In order to start using it, simply copy the executable file
(BluetoothView.exe) to any folder you like, and run it.
A few seconds after you run it, BluetoothView will start to gradually
display all detected Bluetooth around you.



The 'Company Name' Column
=========================

Starting from version 1.10, BluetoothView allows you to view the company
name of each BluetoothView device. The company name is determined
according to the Bluetooth address. However, in order to get this
feature, you must download the following external file, and put in the
same folder of BluetoothView.exe:
http://standards.ieee.org/develop/regauth/oui/oui.txt
Be aware that you must save it as 'oui.txt'



The Description Column
======================

In addition to the name of Bluetooth device, you can set your own short
description to allow you to easily detect the device in the future. The
description that you set will also be displayed in the taskbar balloon,
when the device is detected as a new one.
In order to set a description, double-click the desired item, and in the
'Description' field, simply type the description text and click 'OK'.



Custom Timeout Value
====================

In 'Advanced Options' window, you can set a custom timeout value for the
bluetooth scanning. The timeout value is defined in units of 1.28
seconds. If you set a low timeout value (around 5), the scanning process
will be relatively fast, but there is a risk that some bluetooth devices
won't be detected, esepcially if they are located in a greater distance.
If you set a relatively high timeout value (15 or more), the scanning
process will be slow, but the device detection will work a little better.



Connecting To Bluetooth Device
==============================

Starting from version 1.20, BluetoothView allows you to connect the
desired Bluetooth devices. BluetoothView doesn't send any information to
the device, it only tries to connect the device for testing purposes, and
then closes the connection.
When you choose the 'Try To Connect' option, BluetoothView automatically
send a connection request to the selected devices. On the device, you
should get a qesution like "Do you want to accept data from xyz". If you
choose yes, the connection will be succeeded. Otherwise it'll be failed.
The connection result is displayed in the 'Connection Result' column



More Tips For Using BluetoothView
=================================

You can use the 'Hide Main Window' option for hiding the main window of
BluetoothView. When you want to show back the main window, simply
double-click the tray icon. While the main window is hidden,
BluetoothView will display a balloon alert on each time that a new
Bluetooth device is detected. If you want to clear all current Bluetooth
devices that are currently displayed and start the Bluetooth detection
from the beginning, simply use the 'Reset' option.



Command-Line Options
====================

You can use the following command-line options for saving Bluetooth
information to a file, without displaying any user interface. Be aware
that you have to wait around 15 - 20 seconds until the file is saved. You
can also use the /try_to_connect parameter for testing a connection to
your Bluetooth device.



/try_to_connect <MAC Address>
Try to connect to a specific Bluetooth device. If the connect process was
successful, the .exe returns 0. Otherwise, it returns error code.
Example:
BluetoothView.exe /try_to_connect 00:23:05:a1:22:f1

/stext <Filename>
Save the list of Bluetooth devices into a regular text file.

/stab <Filename>
Save the list of Bluetooth devices into a tab-delimited text file.

/scomma <Filename>
Save the list of Bluetooth devices into a comma-delimited text file (csv).

/stabular <Filename>
Save the list of Bluetooth devices into a tabular text file.

/shtml <Filename>
Save the list of Bluetooth devices into HTML file (Horizontal).

/sverhtml <Filename>
Save the list of Bluetooth devices into HTML file (Vertical).

/sxml <Filename>
Save the list of Bluetooth devices into XML file.

/sort <column>
This command-line option can be used with other save options for sorting
by the desired column. If you don't specify this option, the list is
sorted according to the last sort that you made from the user interface.
The <column> parameter can specify the column index (0 for the first
column, 1 for the second column, and so on) or the name of the column,
like "Address" and "Description". You can specify the '~' prefix
character (e.g: "~Major Device Type") if you want to sort in descending
order. You can put multiple /sort in the command-line if you want to sort
by multiple columns.

Examples:
BluetoothView.exe /shtml "f:\temp\bt.html" /sort 2 /sort ~1
BluetoothView.exe /shtml "f:\temp\bt.html" /sort "Major Device Type"
/sort "Minor Device Type"

/nosort
When you specify this command-line option, the list will be saved without
any sorting.



Translating BluetoothView to other languages
============================================

In order to translate BluetoothView to other language, follow the
instructions below:
1. Run BluetoothView with /savelangfile parameter:
   BluetoothView.exe /savelangfile
   A file named BluetoothView_lng.ini will be created in the folder of
   BluetoothView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run BluetoothView, and all
   translated strings will be loaded from the language file.
   If you want to run BluetoothView without the translation, simply
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

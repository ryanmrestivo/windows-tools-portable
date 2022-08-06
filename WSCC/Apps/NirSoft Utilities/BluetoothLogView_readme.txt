


BluetoothLogView v1.12
Copyright (c) 2012 - 2016 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

BluetoothLogView is a small utility that monitors the activity of
Bluetooth devices around you, and displays a log of Bluetooth devices on
the main window. Every time that a new Bluetooth device arrives to your
area and when the device leaves your area, a new log line is added with
the following information: Device Name, Device Address, Event Time, Event
Type ('Device Arrival' or 'Device Left'), Device Type, and the company
that created the device. BluetoothLogView also allows you to specify a
description for every device (according to its MAC address) that will
appear under the 'Description' column.



System Requirements
===================


* Bluetooth dongle that works with the standard Bluetooth module of
  Windows XP/Vista/Windows 7/Windows 8. Currently, 3-party Bluetooth
  stacks, like Broadcom and BlueSoleil are not supported.
* Windows XP/SP2, Windows Vista, Windows 7, or Windows 8. Other
  versions of Windows don't provide a build-in support for Bluetooth, and
  thus BluetoothLogView cannot work with them.



Versions History
================


* Version 1.12:
  o Updated the internal MAC addresses file.

* Version 1.11:
  o Added option to choose another font (name and size) to display in
    the main window.

* Version 1.10:
  o Updated the internal MAC addresses file.

* Version 1.08:
  o Updated the internal MAC addresses file, and reduced its size
    inside the .exe file.

* Version 1.07:
  o Fixed the flickering appeared while scrolling the Bluetooth log.
  o Updated the internal MAC addresses database.

* Version 1.06:
  o Updated the internal MAC addresses database.
  o Added 'Mark Odd/Even Rows' option, under the View menu. When it's
    turned on, the odd and even rows are displayed in different color, to
    make it easier to read a single line.
  o Fixed issue: The properties and the options windows opened in the
    wrong monitor, on multi-monitors system.

* Version 1.05
  o Added 'Hide Paired Devices' option. Paired deviced are usually
    detected even when they are not active, so this option allows you to
    hide them.

* Version 1.00 - First release.



What can you do with BluetoothLogView ?
=======================================

If you have neighbors or family members that use a cellular phone with
Bluetooth turned on, you can easily find out when they come home and when
they leave. A new log line will be added every time that their cellular
phone arrives to your area and every time that their cellular phone left
your area.




Start Using BluetoothLogView
============================

BluetoothLogView doesn't require any installation process or additional
dll files. In order to start using it, simply plug the Bluetooth dongle
and then run the executable file - BluetoothLogView.exe

After running BluetoothLogView, it'll constantly scan your area for
Bluetooth devices, and it'll add a new log line every time that a new
device arrives to your area, and when the device leaves your area.

You can select one or more log items, and then save them into
text/xml/csv/html file, by using the 'Save Selected Items' option
(Ctrl+S) You can also copy the log lines into the clipboard (Ctrl+C) and
then paste them into Excel.



The 'Description' Column
========================

BluetoothLogView allows you to set your own description for every
Bluetooth device. The description is saved in the .cfg file, and it'll be
displayed under the 'Description' Column every time that this device is
detected. In order to set the description, simply double-click the log
line and in the Properties window, type the desired description.



Translating BluetoothLogView to other languages
===============================================

In order to translate BluetoothLogView to other language, follow the
instructions below:
1. Run BluetoothLogView with /savelangfile parameter:
   BluetoothLogView.exe /savelangfile
   A file named BluetoothLogView_lng.ini will be created in the folder of
   BluetoothLogView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run BluetoothLogView, and all
   translated strings will be loaded from the language file.
   If you want to run BluetoothLogView without the translation, simply
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

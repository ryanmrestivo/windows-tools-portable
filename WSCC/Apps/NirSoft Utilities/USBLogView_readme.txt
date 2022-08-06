


USBLogView v1.26
Copyright (c) 2011 - 2019 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

USBLogView is a small utility that runs in the background and records the
details of any USB device that is plugged or unplugged into your system.
For every log line created by USBLogView, the following information is
displayed: Event Type (Plug/Unplug), Event Time, Device Name,
Description, Device Type, Drive Letter (For storage devices), Serial
Number (Only for some types of devices), Vendor ID, Product ID, Vendor
Name, Product Name, and more...

You can easily select one or more log records and then export them into
csv/tab-delimited/xml/html file.



System Requirements
===================


* This utility works on any version of Windows, starting from Windows
  2000 and up to Windows 10. Both 32-bit and 64-bit systems are supported.



Versions History
================


* Version 1.26:
  o Fixed USBLogView to sort properly the 'Event Time' column and the
    numeric columns.

* Version 1.25:
  o Added option to add every plug/unplug event into a log file (In
    'Advanced Options' window - F9).

* Version 1.20:
  o Fixed USBLogView to work on Windows 8 and Windows 10.

* Version 1.13:
  o Fixed bug: Pressing F5 cleared the entire log.

* Version 1.12:
  o Fixed bug: USBLogView added Byte order mark of Unicode to the
    saved text/html/xml file, while the file was actually saved in
    ASCII...

* Version 1.11:
  o Fixed bug: USBLogView failed to detect the plug/unplug event of
    some USB devices.

* Version 1.10:
  o Added 'Clear Log' option.
  o Fixed bug: USBLogView froze for a few seconds if there was a
    disconnected network drive on the system.

* Version 1.05:
  o Added 'Start As Hidden' option. When this option and 'Put Icon On
    Tray' option are turned on, the main window of USBLogView will be
    invisible on start.

* Version 1.00 - First release.



Start Using USBLogView
======================

USBLogView doesn't require any installation process or additional dll
files. In order to start using it, simply run the executable file -
USBLogView.exe

After running USBLogView, every time that a USB device is plugged or
unplugged from your system, a new log line with the details of the device
will be added to the main window of USBLogView. If you want to close the
main window without stopping the recording of USB devices information,
you can turn on the 'Put Icon On Tray' option, and then close the main
window of USBLogView.

You can also select one or more log lines in the main window of
USBLogView, and then copy the log data to the clipboard (Ctrl+C) or
export the log data into xml/html/csv/comma-delimited file (Ctrl+S)



Translating USBLogView to other languages
=========================================

In order to translate USBLogView to other language, follow the
instructions below:
1. Run USBLogView with /savelangfile parameter:
   USBLogView.exe /savelangfile
   A file named USBLogView_lng.ini will be created in the folder of
   USBLogView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run USBLogView, and all
   translated strings will be loaded from the language file.
   If you want to run USBLogView without the translation, simply rename
   the language file, or move it to another folder.



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




DeviceIOView v1.06
Copyright (c) 2008 - 2016 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

DeviceIOView allows you to watch the data transfer between a software or
service and a device driver (DeviceIoControl calls). For each call to a
device driver, the following information is displayed: Handle, Control
Code, number of input bytes, number of output bytes, the name of the
device handle, and all the input/output bytes, displayed as Hex dump.



System Requirements
===================

This utility works on Windows 2000, Windows XP, Windows Server 2003, and
Windows 10/8/7/Vista/2008. Older versions of Windows are not supported.



Versions History
================


* Version 1.06:
  o Fixed bug: when the input and output buffers pointed to the same
    address, DeviceIOView displayed the output buffer instead of input
    buffer.

* Version 1.05:
  o Added 'Run As Administrator' option (Ctrl+F11), which allows you
    to easily run DeviceIOView as administrator on Windows Vista/7/8/2008.

* Version 1.03:
  o Added 64-bit version, for using with 64-bit applications only.

* Version 1.02:
  o Fixed bug: On some Windows 7 systems, DeviceIOView failed to
    attach a process and crashed it.

* Version 1.01:
  o DeviceIOView now automatically stops when the process that you
    inspect is terminated.
  o DeviceIOView now remembers that last sort in select process
    dialog-box.

* Version 1.00



Using DeviceIOView
==================

DeviceIOView doesn't require any installation process or additional dll
files. In order to start using it, simply run the executable file -
DeviceIOView.exe After running it, select the process that you want to
inspect, and click Ok. After clicking Ok, DeviceIOView will start to
display the information about all calls to device drivers.

The upper pane displays the list of all device drivers calls. When you
select an item in the upper pane, the lower pane displays the
input/output bytes, as Hex dump.



Using DeviceIOView In Windows Vista
===================================

DeviceIOView can work in Vista even when UAC (User Account Control) is
turned on, as long as the process that you wish to inspect run in the
same account and security context of DeviceIOView. However, if you want
to inspect a process that runs under administrator account, you must also
run DeviceIOView as administrator. (right-click on DeviceIOView.exe and
choose 'Run As Administrator')



Practical Example For Using DeviceIOView
========================================

Process Explorer of Sysinternals/Microsoft uses a device driver to
extract handle information of any process. If you set the lower pane of
Process Explorer to Handles list, you can watch all the device driver
calls made to PROCEXP100 device driver:




Translating DeviceIOView to other languages
===========================================

In order to translate DeviceIOView to other language, follow the
instructions below:
1. Run DeviceIOView with /savelangfile parameter:
   DeviceIOView.exe /savelangfile
   A file named DeviceIOView_lng.ini will be created in the folder of
   DeviceIOView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run DeviceIOView, and all
   translated strings will be loaded from the language file.
   If you want to run DeviceIOView without the translation, simply rename
   the language file, or move it to another folder.



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

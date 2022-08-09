


BluetoothCL v1.07
Copyright (c) 2009 - 2014 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

BluetoothCL is a small console application that dumps all current
detected bluetooth devices into the standard output. For each Bluetooth
device, the following information is displayed: MAC Address, Name, Major
Device Type, Minor Device Type, and optionally the company name of the
device (if external file of MAC addresses - oui.txt is provided)



Versions History
================


* Version 1.07 - Fixed bug: BluetoothCL stopped working after the
  change in v1.06 ...
* Version 1.06 - Fixed to work with the current structure of oui.txt
  file.
* Version 1.05 - Fixed bug: when redirecting the output to a file
  (BluetoothCL.exe > filename.txt), the file remained empty.
* Version 1.00 - First release.



System Requirements
===================


* Bluetooth Dongle and device driver that works with the standard
  Bluetooth module of Windows XP/Vista/Windows 7.
* Windows XP/SP2, Windows Vista, or Windows 7. Other versions of
  Windows don't provide a build-in support for Bluetooth, and thus
  BluetoothCL cannot work with them.



Using BluetoothCL
=================

BluetoothCL is a console application, which means that you should run it
in a "Command Prompt" window. When you run it, the list of all currently
detected bluetooth devices is sent to the console output.
As with any console application, you can redirect the output into a file
by using '>' or '>>' in the command-line:
BluetoothCL.exe > c:\temp\bt.txt

You can also specify the timeout value for the bluetooth scanning process:
BluetoothCL.exe -timeout 10

If you don't specify the timeout value, the default timeout is used - 15
seconds.



Displaying Company Name Information
===================================

BluetoothCL also allows you to view the company name of each Bluetooth
device. The company name is determined according to the Bluetooth
address. However, in order to get this feature, you must download the
following external file, and put in the same folder of BluetoothCL.exe:
http://standards.ieee.org/develop/regauth/oui/oui.txt
Be aware that you must save it as 'oui.txt'



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




NetConnectChoose v1.07
Copyright (c) 2013 - 2015 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

NetConnectChoose is a simple tool that allows you to easily choose the
default Internet connection that will be used by all Internet
applications, when you have more than a single Internet connection on the
same time. (Each connection on different network adapter)
It also displays extensive information about every active
network/Internet connection, including network adapter name, MAC Address,
Name Servers, MTU, Interface Speed, current incoming/outgoing data speed,
number of received/sent packets, received/sent bytes, and more...



System Requirements
===================


* This utility works on any version of Windows operating system,
  starting from Windows 2000 and up to Windows 8. Both 32-bit and 64-bit
  systems are supported.
* On Windows Vista/7/8 with UAC turned on, you have to run
  NetConnectChoose as admin in order to smoothly change the default
  Internet connection. If you don't execute NetConnectChoose as admin,
  you'll get a confirmation UAC message-box for every default connection
  change.



Versions History
================


* Version 1.07
  o Fixed bug: NetConnectChoose failed to remember the last
    size/position of the main window if it was not located in the primary
    monitor.

* Version 1.06
  o Fixed to work again on Windows 2000.

* Version 1.05
  o Added 2 new columns that displays the maximum sent speed and
    maximum received speed.

* Version 1.01 - Added option to choose another font to display the
  network adapters information on the main window.
* Version 1.00 - First release.



Known Issues
============


* On Windows XP, when changing the default Internet connection, all
  existing TCP connections stop working. On Windows Vista/7/8, when
  switching to another default Internet connection, the existing TCP
  connections remain active. This means that on Windows Vista/7/8, you
  can start downloading from one Internet connection and then switch to
  the second Internet connection, and start another download on the
  second Internet connection without interrupting the first download
  process, but it's impossible to do that on Windows XP.
* While testing this software, I found out that sometimes the Internet
  connection switching doesn't work properly. This problem occurs
  randomly from unknown reason.



Start Using NetConnectChoose
============================

NetConnectChoose doesn't require any installation process or additional
dll files. In order to start using it, simply run the executable file -
NetConnectChoose.exe
After running it, the main window displays the details of all active
network/internet connections. In order to change the default Internet
connection, you can select the desired connection and press F8 (Set As
Default Connection) or you can simply press F9 to switch between the
active connections.



Packets Information
===================

NetConnectChoose displays packets information for every active network
connection on your system. The packets information include the total
number of received bytes, total number of sent bytes, total number of
received packets, total number of sent packets, current sent data speed,
and current received data speed.
The packet counters are saved to the .cfg file, so in the next time that
you run NetConnectChoose, it'll start with the number you had when you
closed NetConnectChoose previously. You can reset the packets information
to 0, by using the 'Reset Packet Counters' option.



Command-Line Options
====================



/SetDefault <MAC Address>
Set the specified network adapter as the default Internet connection. On
Windows Vista/7/8 with UAC turned on, you must execute this command with
'Run As Administrator'.
Example:
NetConnectChoose.exe /SetDefault 00-21-AD-C2-36-A0

/SwitchDefault
Set the next network adapter as the default Internet connection. You can
use this command to easily switch between 2 or more Internet connection.
On Windows Vista/7/8 with UAC turned on, you must execute this command
with 'Run As Administrator'.



Translating NetConnectChoose to other languages
===============================================

In order to translate NetConnectChoose to other language, follow the
instructions below:
1. Run NetConnectChoose with /savelangfile parameter:
   NetConnectChoose.exe /savelangfile
   A file named NetConnectChoose_lng.ini will be created in the folder of
   NetConnectChoose utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run NetConnectChoose, and all
   translated strings will be loaded from the language file.
   If you want to run NetConnectChoose without the translation, simply
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

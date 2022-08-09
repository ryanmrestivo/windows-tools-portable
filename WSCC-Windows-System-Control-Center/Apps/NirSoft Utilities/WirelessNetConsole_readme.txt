


WirelessNetConsole v1.00
Copyright (c) 2008 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

WirelessNetConsole is a small console application that dumps all current
detected wireless networks information into the standard output. For each
wireless network, the following information is displayed: SSID, Signal
Quality in %, PHY types, RSSI, MAC Address, Channel Frequency, and more.



System Requirements
===================


* Wireless network adapter that works with the wireless module of
  Windows.
* Windows Vista or Windows XP with SP2/SP3. For Windows XP with SP2,
  it's recommended to install the KB918997 update. To download this
  update, click here.



Using WirelessNetConsole
========================

WirelessNetConsole is a console application, which means that you should
run it in a "Command Prompt" window. When you run it, the list of all
currently detected wireless networks is sent to the console output.
As with any console application, you can redirect the output into a file
by using '>' or '>>' in the command-line:
WirelessNetConsole.exe > c:\temp\wn.txt



Translating WirelessNetConsole to other languages
=================================================

In order to translate WirelessNetConsole to other language, follow the
instructions below:
1. Run WirelessNetConsole with /savelangfile parameter:
   WirelessNetConsole.exe /savelangfile
   A file named WirelessNetConsole_lng.ini will be created in the folder
   of WirelessNetConsole utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
4. After you finish the translation, Run WirelessNetConsole, and all
   translated strings will be loaded from the language file.
   If you want to run WirelessNetConsole without the translation, simply
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

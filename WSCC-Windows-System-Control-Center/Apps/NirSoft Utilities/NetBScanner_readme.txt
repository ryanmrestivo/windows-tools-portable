


NetBScanner v1.11
Copyright (c) 2012 - 2016 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

NetBScanner is a network scanner tool that scans all computers in the IP
addresses range you choose, using NetBIOS protocol. For every computer
located by this NetBIOS scanner, the following information is displayed:
IP Address, Computer Name, Workgroup or Domain, MAC Address, and the
company that manufactured the network adapter (determined according to
the MAC address). NetBScanner also shows whether a computer is a Master
Browser. You can easily select one or more computers found by
NetBScanner, and then export the list into csv/tab-delimited/xml/html
file.




System Requirements And Limitations
===================================


* This utility works on every version of Windows, starting from Windows
  2000 and up to Windows 10, including both 32-bit systems and x64
  systems.
* NetBIOS scan uses UDP port 137 to send and receive the NetBIOS data.
  If this port is blocked by your computer or in the remote network
  computers that you scan, the NetBIOS scan will not work.
* When you run NetBScanner in the first time, you might get a warning
  from the Firewall of Windows. Even if you choose to keep blocking
  NetBScanner, the NetBIOS scan will still work properly.



Versions History
================


* Version 1.11:
  o Updated the internal MAC addresses database.

* Version 1.10:
  o Updated the internal MAC addresses database.

* Version 1.08:
  o NetBScanner now automatically skips the broadcast addresses,
    according to the IP addresses/Subnet masks settings of every network
    adapter on your system.

* Version 1.07:
  o Fixed bug: NetBScanner failed to load the external MAC addresses
    file (oui.txt) when every line has 2 leading space characters.
    (Sometimes this file is provided with leading space characters, I
    don't really know why...)
  o Updated the internal MAC addresses database.

* Version 1.06:
  o Updated the internal MAC addresses database.
  o Added 'Mark Odd/Even Rows' option, under the View menu. When it's
    turned on, the odd and even rows are displayed in different color, to
    make it easier to read a single line.

* Version 1.05:
  o Added a few command-line options.

* Version 1.01:
  o Fixed the sorting of the IP Address column.
  o Fixed issue: The properties and the other windows opened in the
    wrong monitor, on multi-monitors system.

* Version 1.00 - First release.



Start Using NetBScanner
=======================

NetBScanner doesn't require any installation process or additional dll
files. In order to start using it, simply run the executable file -
NetBScanner.exe
After running NetBScanner, you have to choose the IP addresses range to
scan (by default, NetBScanner takes the IP addresses range from the
configuration of your network adapter) and the scan speed. Be aware that
if you increase the scan speed, the NetBIOS scan may become less reliable
and miss some of your computers.

After you choose the desired scan option, click the 'Ok' button, and then
NetBScanner will start scanning your network.

After the NetBIOS scan is finished, you can select one or more computers,
and then export the computers list into csv/tab-delimited/xml/html file,
by using the 'Save Selected Items' option (Ctrl+S)



Command-Line Options
====================



/scan
Start to scan immediately on start.

/IPAddressFrom <IP Address>
/IPAddressTo <IP Address>
Specifies the IP addresses range to scan, for example:
NetBScanner.exe /scan /IPAddressFrom 192.168.1.0 /IPAddressTo
192.168.1.254

/ScanSpeed <Speed>
Specifies the scanning speed. The speed is a number between 0 and 100.
0 = very slow, 100 = very fast



Translating NetBScanner to other languages
==========================================

In order to translate NetBScanner to other language, follow the
instructions below:
1. Run NetBScanner with /savelangfile parameter:
   NetBScanner.exe /savelangfile
   A file named NetBScanner_lng.ini will be created in the folder of
   NetBScanner utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run NetBScanner, and all
   translated strings will be loaded from the language file.
   If you want to run NetBScanner without the translation, simply rename
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

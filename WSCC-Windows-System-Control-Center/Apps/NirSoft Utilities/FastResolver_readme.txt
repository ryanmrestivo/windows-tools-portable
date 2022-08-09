


FastResolver v1.26
Copyright (c) 2005 - 2014 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

FastResolver is a small utility that resolves multiple host names into IP
addresses and vice versa. You can simply type the list of IP addresses or
host name that you want to resolve, or alternatively, you can specify IP
addresses range that you want to scan. For local network, FastResolver
also allows you to get the MAC address of all IP addresses that you scan.
FastResolver is a multithreaded application, so it can resolve dozens of
addresses within a few seconds.



Versions History
================


* Version 1.26:
  o Added 'Copy As Hosts File' option. (Ctrl+H)

* Version 1.25:
  o Added 'MAC Address Format' option (XX-XX-XX-XX-XX-XX,
    XX:XX:XX:XX:XX:XX, or XXXXXXXXXXXX).

* Version 1.23:
  o Fixed to work with the latest versions of oui.txt

* Version 1.22:
  o Fixed bug: The size of addresses list text-box was limited to 32
    KB.

* Version 1.21:
  o Added support for typing IP range, like 192.168.0.1-192.168.0.10

* Version 1.20:
  o Added 'Company Name' column that is determined according to the
    MAC address (Requires to download externl file - see below)

* Version 1.16:
  o Fixed bug: The main window lost the focus when the user switched
    to another application and then returned back to FastResolver.

* Version 1.15:
  o Added support for starting the IP addresses scanning from
    command-line
  o Added support for saving into comma-delimited (.csv) file.
  o Fixed bug in radio buttons of mode selection

* Version 1.10:
  o Added support for scanning MAC addresses (works only for local
    network).
  o Added new option: Resolve hosts without domain.
  o The configuration is now saved to a file, instead of the Registry.

* Version 1.00 - First release.



System Requirements
===================


* Windows operating system: Windows 98/ME/2000/XP/2003.
* Network connection.

Be aware that resolving IP address to host name doesn't work well under
Windows 98/ME.



Using FastResolver
==================

FastResolver doesn't require any installation process or additional DLLs.
Just put the executable file (FastResolver.exe) anywhere you like, and
run it.
After you run FastResolver utility, you can type multiple IP addresses
and host names, separated by commas, spaces, or CRLF. Alternatively, you
can select IP addresses range to resolve into host names.



The 'Company Name' Column
=========================

Starting from version 1.20, FastResolver allows you to view the company
name of each MAC address. However, in order to get this feature, you must
download the following external file, and put in the same folder of
FastResolver.exe: http://standards.ieee.org/regauth/oui/oui.txt
Be aware that you must save it as 'oui.txt'



Options Menu
============


* Display Multiple Host IP Addresses: If this option is checked, and
  the host name has multiple IP addresses, all IP addresses are displayed.
* Resolve IP Addresses Back To Host Name: If this option is checked,
  and you resolve an host name to IP address, the IP Address is resolved
  back into a host name, and displayed in "Host Name" column. The
  original host name that you typed is displayed under "Original Name"
  column.



Command-Line Options
====================



/IPFrom <IP Address>
Specifies the from IP address

/IPTo <IP Address>
Specifies the to IP address

/GetMACAddresses <0 | 1>
Specifies whether you want to get the MAC addresses. 1 to enable, 0 to
disable.

/DisplayMultiIPAddr <0 | 1>
Display Multiple Host IP Addresses. 1 to enable, 0 to disable.

/ResolveIPAddrToHost <0 | 1>
Resolve IP Addresses Back To Host Name. 1 to enable, 0 to disable.

Example:
FastResolver.exe /IPFrom 192.168.0.1 /IPTo 192.168.0.100 /GetMACAddresses
1



Translating FastResolver to other languages
===========================================

FastResolver allows you to easily translate all menus, dialog-boxes, and
other strings to other languages.
In order to do that, follow the instructions below:
1. Run FastResolver with /savelangfile parameter:
   FastResolver.exe /savelangfile
   A file named FastResolver_lng.ini will be created in the folder of
   FastResolver utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all menus, dialog-boxes, and string entries to the
   desired language. Optionally, you can also add your name and/or a link
   to your Web site. (TranslatorName and TranslatorURL values) If you add
   this information, it'll be used in the 'About' window.
4. After you finish the translation, Run FastResolver, and all
   translated strings will be loaded from the language file.
   If you want to run FastResolver without the translation, simply rename
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

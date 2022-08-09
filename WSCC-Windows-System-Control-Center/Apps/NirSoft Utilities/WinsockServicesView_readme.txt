


WinsockServicesView v1.00
Copyright (c) 2012 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

This utility displays the details of all Winsock service providers
installed on your system. For every Winsock service, the following
information is displayed: Display Name, Status (Enabled/Disabled), DLL
Type (32-bit or 64-bit), DLL Filename, DLL Description/Version, and
Created/Modified Time.
WinsockServicesView also allows you to easily disable/enable a Winsock
service provider.



Warning !!
==========

Disabling a Winsock service may cause your network/Internet connection to
stop working. You should use this feature carefully, and if something
goes wrong, simply enable again the Winsock services that you previously
disabled.



System Requirements
===================

This utility works on any version of Windows, starting from Windows 2000
and up to Windows 8. Both 32-bit and 64-bit systems are supported.
On Windows 7/8/Vista/2008, you should right-click on
WinsockServicesView.exe and choose 'Run As Administrator' in order to
disable or enable Winsock services.



General Information
===================

WinsockServicesView lists all entries in the Registry located under the
following keys:
HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\WinSock2\Parameters\Na
meSpace_Catalog5\Catalog_Entries
HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\WinSock2\Parameters\Na
meSpace_Catalog5\Catalog_Entries64

Disabling a Winsock service provider is made by setting the 'Enabled'
value to 0.



Start Using WinsockServicesView
===============================

WinsockServicesView doesn't require any installation process or
additional dll files. In order to start using it, simply run the
executable file - WinsockServicesView.exe

After running it, WinsockServicesView displays the details of all Winsock
service providers installed on your system. In most systems, you'll only
see the default Winsock services of Microsoft, which are installed
automatically with Windows operating system. Generally, you should not
disable the Winsock services of Microsoft and if you disable them, your
network/Internet connection may stop working.
If you see that there are non-Microsoft Winsock service providers on your
system and you suspect that these Winsock services cause network/Internet
problems, you can try to disable them and check if it solves the problem.



Command-Line Options
====================



/stext <Filename>
Save the Winsock services list into a regular text file.

/stab <Filename>
Save the Winsock services list into a tab-delimited text file.

/scomma <Filename>
Save the Winsock services list into a comma-delimited text file (csv).

/stabular <Filename>
Save the Winsock services list into a tabular text file.

/shtml <Filename>
Save the Winsock services list into HTML file (Horizontal).

/sverhtml <Filename>
Save the Winsock services list into HTML file (Vertical).

/sxml <Filename>
Save the Winsock services list into XML file.



Translating WinsockServicesView to other languages
==================================================

In order to translate WinsockServicesView to other language, follow the
instructions below:
1. Run WinsockServicesView with /savelangfile parameter:
   WinsockServicesView.exe /savelangfile
   A file named WinsockServicesView_lng.ini will be created in the folder
   of WinsockServicesView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run WinsockServicesView, and all
   translated strings will be loaded from the language file.
   If you want to run WinsockServicesView without the translation, simply
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

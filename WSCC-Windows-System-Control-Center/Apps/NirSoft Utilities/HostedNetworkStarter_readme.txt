


HostedNetworkStarter v1.15
Copyright (c) 2016 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

HostedNetworkStarter is a simple tool for Windows 7 and later that allows
you to easily create a wifi hotspot with your wireless network adapter,
using the Wifi hosted network feature of Windows operating system. With
the wifi hotspot created by this tool, you can allow any device with wifi
support to access the network and the Internet connection available in
your computer.



System Requirements
===================


* Any version of Windows, starting from Windows 7 and up to Windows 10,
  32-bit or 64-bit systems. (In older versions of Windows, there is no
  support for Wifi hosted network)
* Wireless network adapter that supports Wifi hosted network.



Known Issues
============


* hnetcfg.dll Crash - On some Windows 10 systems, HostedNetworkStarter
  crashes when trying to start the hosted network. The crash occurs
  inside hnetcfg.dll while HostedNetworkStarter requests to disable
  previous ICS (Internet Connection Sharing) settings in order to set ICS
  for the hosted network. It's unclear whether this crash occurs because
  HostedNetworkStarter does something wrong or it's some kind of bug in
  ICS component of Windows 10. Some people reported that this crash
  started to appear after installing Windows 10 Anniversary Update.



Versions History
================


* Version 1.15:
  o You can use any variable inside HostedNetworkStarter.cfg as a
    command-line parameter in order to change the settings of
    HostedNetworkStarter, for example:
    HostedNetworkStarter.exe /NetworkSSID "MyNetwork" /NetworkKey
    "fh78fh8f#"

* Version 1.10:
  o Added 'Put Icon On Tray' option.
  o Added 'Save Configuration To File' and 'Load Configuration From
    File' options.
  o Added /Start command-line option to start the hosted network
    instantly without displaying the settings window.
  o Added /cfg command-line option to start HostedNetworkStarter with
    the specified configuration file.

* Version 1.02:
  o HostedNetworkStarter now displays an error message when typing a
    network key shorter than 8 characters (The hosted network feature of
    Windows fails to start if the network key is too short)

* Version 1.01:
  o Fixed issue: When Windows hosted network is disabled,
    HostedNetworkStarter now automatically enable it. In previous
    version, HostedNetworkStarter failed to start the wifi hotspot if
    Windows hosted network was disabled.

* Version 1.00 - First release.



Start Using HostedNetworkStarter
================================

HostedNetworkStarter doesn't require any installation process or
additional DLL files. In order to start using it, simply run the
executable file - HostedNetworkStarter.exe
After running HostedNetworkStarter, the 'Hosted Network Options' window
is opened, allowing you to choose the desired configuration of your Wifi
hotspot. After filling the network name ,the network key, and choosing
the desired Internet connection to share, you should press the Start
button to start the Wifi Hotspot.
After starting the wifi hotspot, the main window of HostedNetworkStarter
displays information about the started hotspot. The upper pane displays
general statistics about the active hotspot (Hosted Network State,
Channel Number, number of Connected clients, Sent Bytes, Received Bytes,
and so on) , and the lower pane displays the list of clients that are
currently connected to your hotspot
If there was any error during the hotspot activation, the error code or
message will be displayed in one or more of the following lines in the
upper pane: 'Hosted Network Error', 'Hosted Network Reason Code', and
'Internet Connection Sharing Error'.



The 'Hosted Network Options' window
===================================

Here's the description of all options available in the 'Hosted Network
Options' window:


* Network Name (SSID):The name of your Wifi hotspot.
* Network Key:The network key of your Wifi hotspot.
* Persistent Key:If this option is checked, Windows operating system
  will store your network key, and it'll use it in the future if the
  'Network Key' field is empty.
* Storing the network key inside the .cfg file: Tells
  HostedNetworkStarter how to store the network key inside
  HostedNetworkStarter.cfg (located in the same folder of the .exe file):

  o Don't store the network key inside the .cfg file (The default)
  o Store the network key inside the .cfg file without encryption
  o Store the network key inside the .cfg file with Windows encryption

  If you choose to store the network key with Windows encryption,
  HostedNetworkStarter will be able to get load the key only when running
  it on the same computer with the same user.
* Share the Internet and the network from the following connection: If
  this option is checked, the devices that connect to your hotspot will
  be able to use the Internet from the selected network connection as
  well as to access other computers and devices on your network.
  HostedNetworkStarter automatically activates the Internet connection
  sharing when you start the wifi hotspot and deactivates it when you
  stop wifi hotspot.
  If this option is turned off, you can still manually activate the
  Internet connection sharing from the settings window of your network
  adapter.
  If this option is turned off and you don't activate the Internet
  connection sharing manually, then the devices connect to your hotspot
  will only be able to access the computer that runs HostedNetworkStarter
  and any other device that is connected to the wifi hotspot.
* Maximum number of connected devices: The maximum number of wifi
  devices that will be able to connect your wifi hotspot concurrently.



Command-Line Options
====================



/cfg <Filename>
Start HostedNetworkStarter with the specified configuration file. For
example:
HostedNetworkStarter.exe /cfg "c:\config\hns.cfg"

/Start
Starts the hosted network instantly without displaying the settings
window.

/NetworkSSID <Network SSID>
/NetworkKey <Network Key>
/ShareInternet <0 | 1>
/ShareAdapter <Network Adapter Guid>
.
.
.
You can use any variable inside HostedNetworkStarter.cfg as a
command-line parameter in order to change the settings of
HostedNetworkStarter, for example:
HostedNetworkStarter.exe /NetworkSSID "NirSoft" /NetworkKey
"js7dhdy387783!"



Translating HostedNetworkStarter to other languages
===================================================

In order to translate HostedNetworkStarter to other language, follow the
instructions below:
1. Run HostedNetworkStarter with /savelangfile parameter:
   HostedNetworkStarter.exe /savelangfile
   A file named HostedNetworkStarter_lng.ini will be created in the
   folder of HostedNetworkStarter utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run HostedNetworkStarter, and all
   translated strings will be loaded from the language file.
   If you want to run HostedNetworkStarter without the translation,
   simply rename the language file, or move it to another folder.



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

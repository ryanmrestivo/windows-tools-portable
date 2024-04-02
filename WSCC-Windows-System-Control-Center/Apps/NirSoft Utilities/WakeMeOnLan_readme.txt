


WakeMeOnLan v1.91
Copyright (c) 2011 - 2023 Nir Sofer
Web site: https://www.nirsoft.net



Description
===========

This utility allows you to easily turn on one or more computers remotely
by sending Wake-on-LAN (WOL) packet to the remote computers.
When your computers are turned on, WakeMeOnLan allows you to scan your
network, and collect the MAC addresses of all your computers, and save
the computers list into a file. Later, when your computers are turned off
or in standby mode, you can use the stored computers list to easily
choose the computer you want to turn on, and then turn on all these
computers with a single click.
WakeMeOnLan also allows you to turn on a computer from command-line, by
specifying the computer name, IP address, or the MAC address of the
remote network card.



System Requirements And Limitations
===================================


* On some Windows 10/8 systems, the Wake-Up feature doesn't work if the
  'Send The Wake-on-LAN Packet To...' option is set to 'Broadcast Address
  255.255.255.255'. If you have this problem, you should set this option
  to 'Broadcast Address According to IP Address'.
* On the computer that you run WakeMeOnLan: WakeMeOnLan works on any
  version of Windows, starting from Windows 2000 and up to Windows 10,
  including x64 versions of Windows.
* On the remote computer: WakeMeOnLan can turn on the remote computer
  only if this feature is supported and enabled on the remote computer.
  Be aware that Wake-on-LAN feature only works on wired network. Wireless
  networks are not supported.
  In order to enable the Wake-on-LAN feature on the remote computer:
  o On some computers, you may need to enable this feature on the
    BIOS setup.
  o In the network card properties, you should go to the 'Power
    Management' and/or 'Advanced' tabs of the network adapter, and turn
    on the Wake-on-LAN feature.




Versions History
================


* Version 1.91
  o Updated the internal MAC addresses database.

* Version 1.90
  o Added 'All Possible Addresses' to the 'Send The Wake-on-LAN
    Packet To...' option, which simply causes WakeMeOnLan to send
    Wake-on-LAN packets to all possible addresses (Broadcast Address
    255.255.255.255, Broadcast Address According to IP Address, IP
    Address of the device)
  o Updated the internal MAC addresses database.

* Version 1.87
  o Updated the internal MAC addresses database.

* Version 1.86
  o Updated the internal MAC addresses database.

* Version 1.85
  o Updated the internal MAC addresses database.

* Version 1.84
  o Fixed bug: WakeMeOnLan failed to remember the last size/position
    of the main window if it was not located in the primary monitor.
  o Updated the internal MAC addresses database.

* Version 1.83
  o Updated the internal MAC addresses database.

* Version 1.82
  o Removed the 'Use Broadcast Address According to IP Address' menu
    item, which was inactive since version 1.70

* Version 1.81
  o Added new option to 'Send The Wake-on-LAN Packet To...': 'Name of
    the device'. If you choose this option - For every computer you
    wakeup, WakeMeOnLan will try to resolve the name of the
    computer/device ('Computer Name' column) to IP address and then send
    the wakup packet to this IP address. If the name cannot be resolved,
    the IP address displayed in the 'IP Address' column will be used.

* Version 1.80
  o When using the combination of /scan and one of the save
    command-line option ( /scomma, /shtml , and so on....) the 'Status'
    field is now updated according to scan result.
    e.g: WakeMeOnLan.exe /scan /shtml c:\temp\status.html
  o Fixed bug: On some systems, WakeMeOnLan failed to detect
    correctly the active network adapter for scanning.

* Version 1.79
  o Updated the internal MAC addresses database.
  o Added 64-bit version.

* Version 1.78
  o The connect name is now displayed in the network adapters list.
    ('Advanced Options' window)

* Version 1.77
  o Updated the internal MAC addresses database.

* Version 1.76
  o The default of 'Send The Wake-on-LAN Packet To...' option is now
    'Broadcast Address According to IP Address' instead of 'Broadcast
    Address 255.255.255.255'. This change is made because on some Windows
    10/8 systems, the 'Broadcast Address 255.255.255.255' option doesn't
    work.

* Version 1.75
  o Added /wakeupmulti command-line option, which allows you to wake
    up multiple computers, for example:
    /wakeupmulti 192.168.0.25 192.168.0.31 192.168.0.35

* Version 1.73
  o Added the 'Start Scanning - Only Selected IPs' option to the
    right-click context menu.
  o Updated the internal MAC addresses database.

* Version 1.72
  o Added 'Start Scanning - Only Selected IPs' option.

* Version 1.71
  o Updated the internal MAC addresses database.

* Version 1.70
  o Added 'Send The Wake-on-LAN To...' option (Under the Options
    menu): Broadcast Address 255.255.255.255 (The default), Broadcast
    Address According to IP Address, or IP Address of the device.
  o Fixed issue: On some systems, WakeMeOnLan added items with
    00-00-00-00-00-00 as MAC address.

* Version 1.68
  o Added 'Copy As Hosts File' option. (Ctrl+H)

* Version 1.67
  o Added 'Scan Listed IPs On Start' option.

* Version 1.66
  o Fixed bug: WakeMeOnLan failed to sort the computers list properly
    on start.
  o Added 'Index' column, which represents the order that the
    computers were added.

* Version 1.65
  o Added option to scan only the IP addresses listed in the main
    window of WakeMeOnLan. ('Start Scanning - Only Listed IPs' - Ctrl+F5)

* Version 1.62
  o You can now specify host name as the broadcast address.

* Version 1.61
  o Added new option to 'Change Wake Up Settings of Selected Items'
    window: 'Send multiple Wake-on-LAN packets'.

* Version 1.60
  o Added 'Change Wake Up Settings of Selected Items' option, which
    allows you to assign for every item the port number and the broadcast
    address that will be used instead of the default port
    number/broadcast address. You can select multiple items and then
    change the port number and broadcast address for all selected items
    at once.

* Version 1.55
  o Added /cfg command-line option, which instructs WakeMeOnLan to
    use a config file in another location instead if the default config
    file, for example:
    WakeMeOnLan.exe /cfg "%AppData%\WakeMeOnLan.cfg"

* Version 1.53
  o Updated the internal MAC addresses database.

* Version 1.52
  o Added 'Auto Size Columns+Headers' option.
  o Added option to choose the font displayed on the main window of
    WakeMeOnLan.

* Version 1.51
  o When you choose to scan specific IP addresses range, WakeMeOnLan
    now automatically skips the broadcast addresses, according to the IP
    addresses/Subnet masks settings of every network adapter.
  o The default button of the delete question-box is 'No', in order
    to avoid from deleting by mistake.

* Version 1.50
  o Added 'Use Broadcast Address According to IP Address' option.
    When it's turn on, the broadcast address is calculated according to
    the IP address. For Example, if the IP address is 192.168.0.10, then
    192.168.0.255 will be used as broadcast address.
  o Fixed bug: WakeMeOnLan failed to load the external MAC addresses
    file (oui.txt) when every line has 2 leading space characters.
    (Sometimes this file is provided with leading space characters, I
    don't really know why...)

* Version 1.48
  o Updated the internal MAC addresses database.

* Version 1.47
  o Fixed issue: The properties dialog-box and other windows opened
    in the wrong monitor, on multi-monitors system.
  o Added 'Mark Odd/Even Rows' option, under the View menu. When it's
    turned on, the odd and even rows are displayed in different color, to
    make it easier to read a single line.

* Version 1.46
  o Fixed /wakeup command-line option to accept MAC Address in
    xxxxxxxxxxxx format, when the computer is not in the list.

* Version 1.45
  o Added new command-line options: /UseIPAddressesRange ,
    /IPAddressFrom , /IPAddressTo , and more...

* Version 1.41
  o Added /wakeupiprange command-line option, which allows you to
    wake up computers in the specified IP addresses range.

* Version 1.40
  o Fixed bug: For some computers the workgroup name displayed
    instead of the computer name, if the NetBIOS scan was turned on.
  o Added Workgroup column (This column is filled only if the NetBIOS
    scan is turned on)

* Version 1.37
  o Fixed bug: WakeMeOnLan crashed on some systems when starting the
    scanning and the 'Clear ARP Cache On Every Scan' option is turned on.

* Version 1.36
  o Added 'Clear ARP Cache On Every Scan' option. This option is
    useful for Windows 2000/XP, because if the ARP cache is not cleared,
    a device might be displayed as connected even when it's not
    connected, because the ARP information is taken from the cache of
    Windows operating system. On Windows Vista/7, this option is
    irrelevant, because the ARP scanning is not affected by the cache.

* Version 1.35
  o Added 'Add New Computer' option (Ctrl+N), which allows you to
    manually add new computer to the list.
  o Added 'Edit Selected Computer' option (Ctrl+E), which allows you
    to edit the selected computer entry.

* Version 1.30
  o Added new option (In Advanced Options window): Use NetBIOS
    protocol to locate computers on other network segments. By default,
    WakeMeOnLan uses only ARP protocol to detect computers on your
    network. If this option is turned on, WakeMeOnLan also scans your
    network with NetBIOS protocol. As opposed to ARP, NetBIOS scan can
    also detect computers located on other network segments.

* Version 1.28
  o Added 'Ask Before Wake Up' option. By default, this option is
    turned on. If you turn it off, the 'Wake Up Selected Computers'
    option will work immediately, without asking any question.

* Version 1.27
  o Added 'Start As Hidden' option. When this option and 'Put Icon On
    Tray' option are turned on, the main window of WakeMeOnLan will be
    invisible on start.

* Version 1.26
  o the /wakeup command-line option now accepts MAC addresses in
    xxxxxxxxxxxx format.

* Version 1.25
  o Added 'MAC Address Format' option, under the Options menu.
  o Copy MAC Address option now allows you to copy multiple MAC
    addresses.

* Version 1.21
  o Fixed bug: When using the 'Scan the following IP addresses range'
    option, WakeMeOnLan didn't scan the last IP address in the specified
    IP range.

* Version 1.20
  o Added 'Put Icon On Tray' option.

* Version 1.15
  o Added /wakeupall command-line option, which allows to easily wake
    up all computers in the list from command-line.

* Version 1.12
  o Fixed the sorting of the IP Address column.

* Version 1.11
  o Added /scan command-line option, which automatically scans your
    network and update the .cfg file without displaying any user
    interface.

* Version 1.10
  o Added 'Advanced Wake Up' (F7), which allows you to specify 2
    advanced parameters for waking up your remote computers: Port Number
    and Broadcast Address.
  o Also, added the option to specify the port number and broadcast
    address from command-line.

* Version 1.00 - First release.



Start Using WakeMeOnLan
=======================

WakeMeOnLan doesn't require any installation process or additional dll
files. In order to start using it, simple run the executable file -
WakeMeOnLan.exe
After running WakeMeOnLan, the first thing to do is to scan your network
and collect the MAC addresses/computer names/IP addresses on your
network. In order to start the network scan, simply press F5. If
WakeMeOnLan scans the wrong IP addresses range, you can stop the scan
process by pressing F6, and then go to the 'Advanced Options' window
(F9), and choose the correct IP addresses range to scan.

All the computers information collected by WakeMeOnLan is saved into the
configuration file (WakeMeOnLan.cfg) for loading it on the next time that
you use WakeMeOnLan. You can also scan your network multiple times, and
if there is a new computers on your network, it'll be added to the list.
Scanning your network also updates the current status of every computer -
'on' (green icon) or 'off' (red icon). If there are obsolete computers on
the list, you can remove them by using the 'Delete Selected Items' option.



Turn On Remote Computers On Your Network
========================================

After scanning your network in the first time, it's very easily to turn
on the computers you need. Simply run WakeMeOnLan, select the desired
computers, and then choose the 'Wake Up Selected Computer' option (F8).
After using the 'Wake Up Selected Computer' option, you can run another
network scan, to verify that the computers are really turned on. Turned
on computers are displayed with green icon.



WakeMeOnLan doesn't wakeup my computers... What to do ?
=======================================================

If WakeMeOnLan doesn't wakeup your computers - try to go to Options ->
Send The Wake-on-LAN Packet To... and choose one of the other methods to
send the wakeup packet.



External MAC Addresses File
===========================

WakeMeOnLan uses an internal MAC Addresses database in order to display
the company name of every network adapter. However, the internal database
is not always updated with the latest MAC address assignments.
You can manually download the latest MAC addresses file from
http://standards-oui.ieee.org/oui.txt and then put oui.txt in the same
folder where WakeMeOnLan.exe is located. When you run WakeMeOnLan.exe,
it'll automatically load and use the external oui.txt instead of the
internal MAC addresses database.



Turn On a Computer From Command-Line
====================================

WakeMeOnLan allows you to wake up a computer on your network without
displaying any user interface, by using the /wakeup command-line option.
You can specify the computer name, IP address, or the free user text that
you typed in the properties window, as long as the computer information
is stored inside the .cfg file. You can also specify the MAC address of
the remote network card, even if the computer is not stored in the .cfg
file.

Optionally, you can specify the port number in the second parameter, and
broadcast address in the third parameter.

Examples:
WakeMeOnLan.exe /wakeup 192.168.1.25
WakeMeOnLan.exe /wakeup Comp01
WakeMeOnLan.exe /wakeup Comp02
WakeMeOnLan.exe /wakeup 40-65-81-A7-16-23
WakeMeOnLan.exe /wakeup 406581A71623
WakeMeOnLan.exe /wakeup Comp02 30000 192.168.0.255
WakeMeOnLan.exe /wakeup 192.168.1.25 20000 192.168.1.255

You can also wake up all computers in the list by using /wakeupall
command-line option. Like in the /wakeup command-line option, you can
optionally specify broadcast address and port number.
Examples:
WakeMeOnLan.exe /wakeupall
WakeMeOnLan.exe /wakeupall 20000 192.168.2.255

If you want to wake up all computers in specific IP addresses range, you
can use /wakeupiprange command-line option
Examples:
WakeMeOnLan.exe /wakeupiprange 192.168.0.25 192.168.0.100
WakeMeOnLan.exe /wakeupiprange 192.168.0.11 192.168.0.20 20000
192.168.0.255

If you want to wakeup multiple computers, you can use /wakeupmulti
command-line option.
Examples:
WakeMeOnLan.exe /wakeupmulti 192.168.1.19 192.168.1.55 192.168.1.82
WakeMeOnLan.exe /wakeupmulti Comp01 Comp02



Scan Your Network From Command-Line
===================================

WakeMeOnLan allows you to scan your network and update the computers list
on the .cfg file without displaying any user interface, by using the
/scan command-line option:
WakeMeOnLan.exe /scan

You can also specify specific IP addresses range to scan, for example:
WakeMeOnLan.exe /scan /UseIPAddressesRange 1 /IPAddressFrom 192.168.1.1
/IPAddressTo 192.168.1.254 /UseNetworkAdapter 0



More Command-Line Options
=========================



/IPAddressFrom <IP Address>
/IPAddressTo <IP Address>
Specifies the IP adderess range to scan.

/UseIPAddressesRange <0 | 1>
Specifies whether to scan with specific IP addresses range (Specified in
/IPAddressFrom and /IPAddressTo command-line options)
0 = No, 1 = Yes

/UseNetworkAdapter <0 | 1>
Specifies whether to scan the IP addresses range of the specified adapter
(/NetworkAdapter)
0 = No, 1 = Yes

/NetworkAdapter <Name>
Specifies the network adapter name when /UseNetworkAdapter is 1

/MacAddressFormat <1 | 2 | 3>
Specifies the MAC address format to display:
1 = XX-XX-XX-XX-XX-XX
2 = XX:XX:XX:XX:XX:XX
3 = XXXXXXXXXXXX

/UseNetBios <0 | 1>
Specifies whether to use NetBIOS scan.
0 = No, 1 = Yes

/cfg <Filename>
Start WakeMeOnLan with the specified configuration file. For example:
WakeMeOnLan.exe /cfg "c:\config\won.cfg"
WakeMeOnLan.exe /cfg "%AppData%\WakeMeOnLan.cfg"

/stext <Filename>
Save the list of computers that you previously scanned into a simple text
file.

/stab <Filename>
Save the list of computers that you previously scanned into a
tab-delimited text file.

/scomma <Filename>
Save the list of computers that you previously scanned into a
comma-delimited text file (csv).

/stabular <Filename>
Save the list of computers that you previously scanned into a tabular
text file.

/shtml <Filename>
Save the list of computers that you previously scanned into HTML file
(Horizontal).

/sverhtml <Filename>
Save the list of computers that you previously scanned into HTML file
(Vertical).

/sxml <Filename>
Save the list of computers that you previously scanned into XML file.

/sort <column>
This command-line option can be used with other save options for sorting
by the desired column. If you don't specify this option, the list is
sorted according to the last sort that you made from the user interface.
The <column> parameter can specify the column index (0 for the first
column, 1 for the second column, and so on) or the name of the column,
like "Computer Name" and "Workgroup". You can specify the '~' prefix
character (e.g: "~MAC Address") if you want to sort in descending order.
You can put multiple /sort in the command-line if you want to sort by
multiple columns.

Examples:
WakeMeOnLan.exe /shtml "c:\temp\WakeMeOnLan.html" /sort 2 /sort ~1
WakeMeOnLan.exe /shtml "c:\temp\WakeMeOnLan.html" /sort "Workgroup" /sort
"Computer Name"

/nosort
When you specify this command-line option, the list will be saved without
any sorting.



Translating WakeMeOnLan to other languages
==========================================

In order to translate WakeMeOnLan to other language, follow the
instructions below:
1. Run WakeMeOnLan with /savelangfile parameter:
   WakeMeOnLan.exe /savelangfile
   A file named WakeMeOnLan_lng.ini will be created in the folder of
   WakeMeOnLan utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run WakeMeOnLan, and all
   translated strings will be loaded from the language file.
   If you want to run WakeMeOnLan without the translation, simply rename
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




NetworkLatencyView v1.75
Copyright (c) 2013 - 2023 Nir Sofer
Web site: https://www.nirsoft.net



Description
===========

NetworkLatencyView is a simple tool for Windows that listens to the TCP
connections on your system and calculates the network latency (in
milliseconds) for every new TCP connection detected on your system. For
every IP address, NetworkLatencyView displays up to 10 network latency
values, and their average. The latency value calculated by
NetworkLatencyView is very similar to the result you get from pinging to
the same IP address.
NetworkLatencyView also allows you to easily export the latency
information to text/csv/tab-delimited/html/xml file, or copy the
information to the clipboard and then paste it to Excel or other
application.



System Requirements
===================


* This utility works on any version of Windows, starting from Windows
  2000, and up to Windows 11. Both 32-bit and 64-bit systems are
  supported.
* In order to capture the TCP packets properly, you have to install one
  of the following capture drivers:
  o WinPcap capture driver
  o Network Monitor driver - version 3.4 or later.

* You can also try to use the 'Raw Socket' method without installing
  any capture driver. However, this method doesn't work in some systems,
  as well as the latency values detected by using this method are not
  very accurate.
* When using Network Monitor driver on 64-bit system, you must use the
  64-bit version of NetworkLatencyView.



Versions History
================


* Version 1.75:
  o Added support for using the IP-Location files from
    https://github.com/sapics/ip-location-db for viewing country/city
    information of remote IP addresses.
  o In order to use these IP-Location files, simply download the
    desired file and put it in the same folder of NetworkLatencyView.exe
    with its original filename (For example: asn-country-ipv4.csv ,
    dbip-city-ipv4.csv)

* Version 1.72:
  o Added 'Sort By' toolbar button.

* Version 1.71:
  o Fixed bug: NetworkLatencyView randomly crashed when using the
    GeoLite2 City database.

* Version 1.70:
  o Added 'High Resolution Latency' option. When it's turned on, the
    values in the latency columns are displayed in microsecond resolution
    (e.g: 1.139 ms)

* Version 1.67:
  o Added new option: 'IPNetInfo - Source IP'.

* Version 1.66:
  o Updated to work properly in high DPI mode.
  o Added option to change the sorting column from the menu (View ->
    Sort By). Like the column header click sorting, if you click again
    the same sorting menu item, it'll switch between ascending and
    descending order.

* Version 1.65:
  o Added support for GeoLite2 City and GeoLite2 Country database in
    CSV format.
  o In order to use it, you have to extract the following files into
    the folder of NetworkLatencyView.exe: GeoLite2-City-Blocks-IPv4.csv ,
    GeoLite2-City-Locations-en.csv

* Version 1.62:
  o Added 'Add Header Line To CSV/Tab-Delimited File' option (Turned
    on by default).

* Version 1.61:
  o Fixed bug from version 1.60: NetworkLatencyView crashed when
    selecting network interface without connection information.

* Version 1.60:
  o The information of the selected network adapter is now displayed
    in the window title.

* Version 1.58:
  o Fixed a crash problem with resolving IP addresses.

* Version 1.57:
  o NetworkLatencyView now resolves IPv6 addresses and displays the
    result in 'Source Host Name' and 'Destination Host Name' columns.

* Version 1.56:
  o Added 'Quick Filter' feature (View -> Use Quick Filter or Ctrl+Q).

* Version 1.55:
  o Added /MaxLatencyValues command-line option. It allows you to
    change the number of latency columns appear on the main table
    (Instead of the default - 10 columns). You can specify any number
    between 1 and 20, for example:
    NetworkLatencyView.exe /MaxLatencyValues 20

* Version 1.50:
  o Added /cfg command-line option, which instructs
    NetworkLatencyView to use a config file in another location instead
    if the default config file, for example:
    NetworkLatencyView.exe /cfg "%AppData%\NetworkLatencyView.cfg"

* Version 1.48:
  o Added 'Save All Items' option.

* Version 1.47:
  o NetworkLatencyView now automatically loads the new version of
    WinPCap driver from https://nmap.org/npcap/ if it's installed on your
    system.

* Version 1.46
  o Added 'Align Numeric Columns To Right' option.

* Version 1.45
  o Added 'Failed Count' column, which displays the number of times
    that a TCP connection was failed. When everything is ok, this column
    remains empty.

* Version 1.41
  o NetworkLatencyView now tries to load the dll of Network Monitor
    Driver 3.x (NmApi.dll) according to the installation path specified
    in HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Netmon3. This change should
    solve the problem with loading the Network Monitor Driver 3.x on some
    systems.

* Version 1.40
  o Added 4 columns to the adapters list in the 'Capture Options'
    window: 'Connection Name', 'MAC Address', 'Instance ID', 'Interface
    Guid'.
  o When using WinPCap driver , NetworkLatencyView now displays more
    accurate information in the adapters list of the 'Capture Options'
    window.

* Version 1.36
  o Added option to choose another font (name and size) to display in
    the main window.

* Version 1.35
  o Added 'Put Icon On Tray' option.

* Version 1.33
  o Added 'First Latency Time' column.

* Version 1.32
  o Fixed bug: NetworkLatencyView failed to remember the last
    size/position of the main window if it was not located in the primary
    monitor.

* Version 1.31
  o IPv4 addresses on the IP address columns are now sorted
    numerically.

* Version 1.30
  o Added 'Specify TCP Port' option.

* Version 1.25
  o Added 'Always On Top' option.

* Version 1.22
  o Added 'Copy Destination Address' option.

* Version 1.21
  o Added columns names ('IP Address' and 'Adapter Name') to the
    adapters list on the 'Capture Options' window.

* Version 1.20
  o Added integration with IPNetInfo utility

* Version 1.15
  o Added 'Destination Country' column, which displays the country of
    the destination IP address. Requires to download Ip-To-Country
    database file separately. See the 'IP Address Country/City
    Information' section for more information.

* Version 1.12
  o Fixed bug: The 'Promiscuous Mode' check-box in the 'Capture
    Options' window was not saved to the configuration file.

* Version 1.11
  o Added 'Last Latency Time' column, which displays the last time
    that latency value was added.

* Version 1.10
  o Added 'Latency Display Mode' option - Show the first 10 latency
    values or show the most recent 10 latency values.

* Version 1.05
  o Added 'Automatically Sort On Every Change' option.
  o Added 'Scroll Down On New Items' option.

* Version 1.00 - First release.



Start Using NetworkLatencyView
==============================

Except of a capture driver that you may need to install,
NetworkLatencyView doesn't require any installation process or additional
dll files. In order to start using it, simply run the executable file -
NetworkLatencyView.exe
After running NetworkLatencyView in the first time, the 'Capture Options'
window appears on the screen, and you're requested to choose the capture
method and the desired network adapter. In the next time that you use
NetworkLatencyView, it'll automatically start capturing packets with the
capture method and the network adapter that you previously selected. You
can always change the 'Capture Options' again by pressing F9. After
choosing the capture method and network adapter, NetworkLatencyView
starts to display the latency of every TCP connection initiated on your
system.



IP Address Country/City Information
===================================

NetworkLatencyView allows you to view country/city information for every
destination IP address ('Destination Country' column). In order to use
this feature, simply download the desired city or country file from
https://github.com/sapics/ip-location-db, and then put it in the same
folder of NetworkLatencyView.exe with its original filename (For example:
asn-country-ipv4.csv , dbip-city-ipv4.csv)



Integration with IPNetInfo utility
==================================

If you want to get more information about the destination IP address
displayed in NetworkLatencyView utility, you can use the Integration with
IPNetInfo utility in order to easily view the IP address information
loaded directly from WHOIS servers:
1. Download and run the latest version of IPNetInfo utility.
2. Select the desired connections, and then choose "IPNetInfo -
   Destination IP" from the File menu (or simply click Ctrl+I).
3. IPNetInfo will retrieve the information about destination IP
   addresses of the selected items.

Starting from version 1.67, you can also get information about the source
IP address, by using the 'IPNetInfo - Source IP' option.



Command-Line Options
====================



/cfg <Filename>
Start NetworkLatencyView with the specified configuration file. For
example:
NetworkLatencyView.exe /cfg "c:\config\nlv.cfg"
NetworkLatencyView.exe /cfg "%AppData%\NetworkLatencyView.cfg"

/MaxLatencyValues <Number>
Specifies the number of latency columns to display on the main window.
You can specify any number between 1 and 20. The default is 10.

For example:
NetworkLatencyView.exe /MaxLatencyValues 20



Translating NetworkLatencyView to other languages
=================================================

In order to translate NetworkLatencyView to other language, follow the
instructions below:
1. Run NetworkLatencyView with /savelangfile parameter:
   NetworkLatencyView.exe /savelangfile
   A file named NetworkLatencyView_lng.ini will be created in the folder
   of NetworkLatencyView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run NetworkLatencyView, and all
   translated strings will be loaded from the language file.
   If you want to run NetworkLatencyView without the translation, simply
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

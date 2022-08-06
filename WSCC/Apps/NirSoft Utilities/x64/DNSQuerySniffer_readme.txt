


DNSQuerySniffer v1.85
Copyright (c) 2013 - 2021 Nir Sofer
Web site: https://www.nirsoft.net



Description
===========

DNSQuerySniffer is a network sniffer utility that shows the DNS queries
sent on your system. For every DNS query, the following information is
displayed: Host Name, Port Number, Query ID, Request Type (A, AAAA, NS,
MX, and so on), Request Time, Response Time, Duration, Response Code,
Number of records, and the content of the returned DNS records.
You can easily export the DNS queries information to
csv/tab-delimited/xml/html file, or copy the DNS queries to the
clipboard, and then paste them into Excel or other spreadsheet
application.



System Requirements
===================


* This utility works on any version of Windows, starting from Windows
  2000, and up to Windows 10. Both 32-bit and 64-bit systems are
  supported.
* On some systems, capturing packets with the 'Raw Sockets' method may
  not work properly, and thus you'll need to install the WinPcap capture
  driver or the Network Monitor driver.
  Even if the 'Raw Sockets' method works properly on your system, it's
  recommended to install the WinPcap capture driver or Microsoft Network
  Monitor driver (version 3.4 or later) in order to get more accurate
  date/time information ('Request Time', 'Response Time', and 'Duration'
  columns)
* In order to use the Network Monitor driver on 64-bit systems, you
  have to download the x64 version of DNSQuerySniffer.



Versions History
================


* Version 1.85
  o Added option to change the sorting column from the menu (View ->
    Sort By). Like the column header click sorting, if you click again
    the same sorting menu item, it'll switch between ascending and
    descending order. Also, if you hold down the shift key while choosing
    the sort menu item, you'll get a secondary sorting.
  o Updated to work properly in high DPI mode.

* Version 1.81
  o Added 'Select All' and 'Deselect All' to the 'Column Settings'
    window.
  o Fixed the /cfg command-line option to load the .cfg file from the
    current directory if full path is not specified.

* Version 1.80
  o Added support for GeoLite2 City and GeoLite2 Country database in
    CSV format (Both IPv4 and Ipv6 addresses are supported).
  o In order to use it, you have to extract the files of GeoLite2
    database into the folder of DNSQuerySniffer.exe

* Version 1.76
  o Added new Quick Filter option: 'Find records that match the
    specified host name wildcard (comma-delimited list)'. For example: if
    you specify '*.com', only .com hosts will be displayed.

* Version 1.75
  o You can now specify wildcard in the host name filter list
    ('Advanced Options' window), for example: *.com, *.net

* Version 1.73
  o Added 'Add Header Line To CSV/Tab-Delimited File' option (Turned
    on by default).
  o Fixed bug: DNSQuerySniffer failed to remember the last
    size/position of the main window if it was not located in the primary
    monitor.

* Version 1.72
  o Fixed bug from version 1.71: DNSQuerySniffer crashed when
    selecting loopback interface or other network interfaces without
    connection information.

* Version 1.71
  o The information of the selected network adapter is now displayed
    in the window title.

* Version 1.70
  o Added "Don't Delete Items On Capture Start" option (Under the
    Options menu).
  o Added TEXT column for TEXT records.

* Version 1.65
  o Added 'Quick Filter' feature (View -> Use Quick Filter or
    Ctrl+Q). When it's turned on, you can type a string in the text-box
    added under the toolbar and DNSQuerySniffer will instantly filter the
    DNS table, showing only lines that contain the string you typed.

* Version 1.62
  o Added /cfg command-line option, which instructs DNSQuerySniffer
    to use a config file in another location instead if the default
    config file, for example:
    DNSQuerySniffer.exe /cfg "%AppData%\DNSQuerySniffer.cfg"

* Version 1.61
  o Added 'Show Only Failed Queries' option (Under the Options menu).

* Version 1.60
  o Added option to add the DNS queries into a log file
    (Comma-delimited or tab-delimited file) in the 'Advanced Options'
    window.

* Version 1.58
  o Added 'Save All Items' option.

* Version 1.57
  o DNSQuerySniffer now automatically loads the new version of
    WinPCap driver from https://nmap.org/npcap/ if it's installed on your
    system.

* Version 1.56
  o Added 'Align Numeric Columns To Right' option.

* Version 1.55
  o Added new option: Show only records of the specified domains/host
    names (In 'Advanced Options' window).
  o Added new option: Don't show records of the specified
    domains/host names (In 'Advanced Options' window).

* Version 1.51
  o DNSQuerySniffer now tries to load the dll of Network Monitor
    Driver 3.x (NmApi.dll) according to the installation path specified
    in HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Netmon3. This change should
    solve the problem with loading the Network Monitor Driver 3.x on some
    systems.

* Version 1.50
  o Added 4 columns to the adapters list in the 'Capture Options'
    window: 'Connection Name', 'MAC Address', 'Instance ID', 'Interface
    Guid'.
  o When using WinPCap driver , DNSQuerySniffer now displays more
    accurate information in the adapters list of the 'Capture Options'
    window.

* Version 1.46
  o Added 'Auto Size Columns On Every Update' option.

* Version 1.45
  o Added option to capture DNS queries on loopback address
    (127.0.0.1), available in raw sockets capture method.

* Version 1.40
  o Added 'Load From Capture File' option. This option allows you to
    load a capture file created by WinPcap/Wireshark (Requires the
    WinPcap driver) or a capture file created by Microsoft Network
    Monitor driver (Requires the Network Monitor driver 3.x)

* Version 1.35
  o Added 'TTL Display Mode' option, which allows you to display the
    TTL value of every DNS response.

* Version 1.30
  o Added integration with IPNetInfo utility

* Version 1.28:
  o Added secondary sorting support: You can now get a secondary
    sorting, by holding down the shift key while clicking the column
    header. Be aware that you only have to hold down the shift key when
    clicking the second/third/fourth column. To sort the first column you
    should not hold down the Shift key.

* Version 1.27:
  o Added 'Copy Host Names' option.

* Version 1.26:
  o Added 'Always On Top' option.

* Version 1.25:
  o DNSQuerySniffer now allows you to automatically add it to the
    allowed programs list of Windows firewall when starting to capture
    and remove it when you stop capturing. This option is needed when
    using the 'Raw Socket' capture method while Windows firewall is
    turned on, because if DNSQuerySniffer is not added to Windows
    firewall, the incoming traffic is not captured.

* Version 1.21:
  o Added columns names ('IP Address' and 'Adapter Name') to the
    adapters list on the 'Capture Options' window.

* Version 1.20:
  o Added 'Put Icon On Tray' option.

* Version 1.15:
  o Added 'IP Country' column, which displays the country of the IP
    addresses found in the A records of the DNS response. Requires to
    download Ip-To-Country database file separately. See the 'IP Address
    Country/City Information' section for more information.

* Version 1.10:
  o Added 'Sort On Every Update' option.

* Version 1.08:
  o Fixed bug: The 'Promiscuous Mode' check-box in the 'Capture
    Options' window was not saved to the configuration file.

* Version 1.07:
  o Added 'Show Time In GMT' option.

* Version 1.06:
  o Added option to choose another font to use on the main window.

* Version 1.05:
  o Added 'Source Address' and 'Destination Address' columns.

* Version 1.00 - First release.



Start Using DNSQuerySniffer
===========================

Except of a capture driver that you may need to install, DNSQuerySniffer
doesn't require any installation process or additional dll files. In
order to start using it, simply run the executable file -
DNSQuerySniffer.exe
After running DNSQuerySniffer in the first time, the 'Capture Options'
window appears on the screen, and you're requested to choose the capture
method and the desired network adapter. In the next time that you use
DNSQuerySniffer, it'll automatically start capturing packets with the
capture method and the network adapter that you previously selected. You
can always change the 'Capture Options' again by pressing F9.

After choosing the capture method and network adapter, DNSQuerySniffer
starts the displays the detail of every DNS query sent on your system.
You can press F6 to stop the DNS capture, F5 to start it again, or Ctrl+X
to clear the current DNS queries list.

You can select one or more DNS query lines, and then use the 'Save
Selected Items' option to export them into csv/tab-delimited/xml/html
file. You can also copy the selected DNS queries to the clipboard
(Ctrl+C) and then paste them (Ctrl+V) into Excel or other spreedsheet
application.



DNSQuerySniffer Columns
=======================


* Host Name: The host name to query
* Port Number: The client UDP port that was used to send the DNS query.
* Query ID: The ID of the query.
* Request Type: The type of the DNS request - A, AAAA, NS, MX, and so
  on...
* Request Time: The exact time that the DNS request was sent. The time
  is specified in absolute date/time or relative to the capture start,
  depending on what you choose in Options -> Time Display Mode.
  Be aware that this column displays more accurate result when using
  WinPcap driver or Microsoft Network Monitor driver, version 3.4 or
  later.
* Response Time: The exact time that the DNS response was received. The
  time is specified in absolute date/time or relative to the capture
  start, depending on what you choose in Options -> Time Display Mode.
  Be aware that this column displays more accurate result when using
  WinPcap driver or Microsoft Network Monitor driver, version 3.4 or
  later.
* Duration: The time difference in milliseconds between the Request
  Time and Response Time.
* Response Code: The returned response code. If the response code is
  not 'Ok', it means that the DNS server returned an error, and the
  bullet icon will be in red instead of green.
* Records Count: Total number of records returned by the DNS server.
* A: Displays the IP addresses list (IPv4) returned by the DNS server.
* AAAA: Displays the IP addresses list (IPv6) returned by the DNS
  server.
* CNAME: Displays the CNAME record returned by the DNS server.
* NS: Displays the NS records returned by the DNS server.
* MX: Displays the MX records returned by the DNS server.
* PTR: Displays the PTR records returned by the DNS server.
* SOA: Displays the SOA record returned by the DNS server.
* Source Address: The IP address of the client that sent the DNS query.
* Destination Address: The IP address of the DNS server that received
  the DNS query.



Meaning of icon color
=====================


* Green - Success response received from the DNS server.
* Red - Failed response received from the DNS server.
* Yellow - There is no any response from the DNS server.



IP Address Country/City Information
===================================

DNSQuerySniffer allows you to view country/city information for every IP
address found in the A records of the DNS response ('IP Country' column).
In order to activate this feature, you have to download one of the
following external files, and put the file in the same folder of
DNSQuerySniffer.exe:
* http://software77.net/geo-ip/: Download the IPv4 CSV file, extract it
  from the zip/gz file, and put it in the same folder of
  DNSQuerySniffer.exe as IpToCountry.csv
* GeoLite2 City database: Download the GeoLite2 City in CSV format and
  extract all files into the folder of DNSQuerySniffer.exe
  Be aware that the loading process of the GeoLite2 City database is
  quite slow.



Integration with IPNetInfo utility
==================================

If you want to get more information about the IP address displayed in the
DNS A record, you can use the Integration with IPNetInfo utility in order
to easily view the IP address information loaded directly from WHOIS
servers:
1. Download and run the latest version of IPNetInfo utility.
2. Select the desired items, and then choose "IPNetInfo - A Record"
   from the File menu (or simply click Ctrl+I).
3. IPNetInfo will retrieve the information about IP addresses of the
   selected items.



Command-Line Options
====================



/cfg <Filename>
Start DNSQuerySniffer with the specified configuration file. For example:
DNSQuerySniffer.exe /cfg "c:\config\dqs.cfg"
DNSQuerySniffer.exe /cfg "%AppData%\DNSQuerySniffer.cfg"



Translating DNSQuerySniffer to other languages
==============================================

In order to translate DNSQuerySniffer to other language, follow the
instructions below:
1. Run DNSQuerySniffer with /savelangfile parameter:
   DNSQuerySniffer.exe /savelangfile
   A file named DNSQuerySniffer_lng.ini will be created in the folder of
   DNSQuerySniffer utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run DNSQuerySniffer, and all
   translated strings will be loaded from the language file.
   If you want to run DNSQuerySniffer without the translation, simply
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

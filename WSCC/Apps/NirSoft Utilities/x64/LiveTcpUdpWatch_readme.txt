


LiveTcpUdpWatch v1.43
Copyright (c) 2018 - 2022 Nir Sofer
Web site: https://www.nirsoft.net



Description
===========

LiveTcpUdpWatch is a tool for Windows that displays live information
about all TCP and UDP activity on your system. Every line in the main
table of LiveTcpUdpWatch displays the protocol (TCP/UDP/IPv4/IPv6),
local/remote IP address, local/remote port, number of sent/received
bytes, number of sent/received packets, connect/disconnect time (For TCP
only), and the process (ID and path) responsible for this activity.



LiveTcpUdpWatch vs CurrPorts vs NetworkTrafficView
==================================================

This tool may look very similar to other tools of NirSoft - CurrPorts and
NetworkTrafficView, but every tool behave differently and uses different
technique to extract the network information.
* CurrPorts displays the current table of active TCP connections and
  TCP/UDP listening ports. but this technique has some disadvantages, for
  example, if UDP packets are sent from your computer to remote network
  address, you won't see it with CurrPorts, because with UDP there is no
  really a connection and the UDP table contains only listening UDP
  ports. The advantage of CurrPorts is the ability to use it without
  elevation (Run As Administrator).
* NetworkTrafficView uses network sniffing technique - It analyzes
  every packet sent/received by your network card and displays extensive
  summary according to the display mode you choose. The disadvantages of
  this tool: You have to choose a network card and capture method for
  activating the network sniffer.
* LiveTcpUdpWatch uses event tracing API to get live information from
  Windows Kernel about every TCP/UDP packet sent/received on your system.
  As opposed to CurrPorts, it captures all UDP activity with process
  information, but without the need of using a network sniffer.



System Requirements
===================

This tool works on any version of Windows, starting from Windows XP and
up to Windows 11. Both 32-bit and 64-bit versions of Windows are
supported. On Windows Vista and later this tool requires to run as
Administrator (elevation).



Versions History
================


* Version 1.43:
  o Fixed a bug with KiB unit on 'Bytes Counter Unit' option.
  o Fixed a few high DPI mode issues

* Version 1.42:
  o Added /Columns command-line option, which allows you to set the
    columns to display or the columns to export from command-line, for
    example:
    LiveTcpUdpWatch.exe /Columns "Process Name,Process ID,Protocol,Remote
    Port,Remote Address,Received Bytes,Sent Bytes"

* Version 1.41:
  o Fixed high CPU usage issue when capturing the network activity
    from command-line (/CaptureTime command)

* Version 1.40:
  o Added 'Host Name Mode' option - 'Use DNS Cache' (the default
    option) or 'Resolve IP Addresses'.
  o Be aware that if you choose the 'Resolve IP Addresses' option,
    LiveTcpUdpWatch will generate additional DNS traffic for every
    resolved IP address, and this traffic will also be captured by
    LiveTcpUdpWatch...

* Version 1.36:
  o Added GB and GiB to the 'Bytes Counter Unit' option.
  o Added option to change the sorting column from the menu (View ->
    Sort By). Like the column header click sorting, if you click again
    the same sorting menu item, it'll switch between ascending and
    descending order. Also, if you hold down the shift key while choosing
    the sort menu item, you'll get a secondary sorting.

* Version 1.35:
  o Updated to work properly in high DPI mode

* Version 1.34:
  o Added 'Start As Hidden' option. When this option and 'Put Icon On
    Tray' option are turned on, the main window of LiveTcpUdpWatch will
    be invisible on start.

* Version 1.33:
  o Added 'Copy Clicked Cell' option to the right-click context menu,
    which copies to the clipboard the text of cell that you right-clicked
    with the mouse.

* Version 1.32:
  o The tooltip of the tray icon now shows the number of items
    displayed on the main window.

* Version 1.31:
  o Fixed the /cfg command-line option to load the .cfg file from the
    current directory if full path is not specified.

* Version 1.30:
  o Added 'Remote IP Country' column. In order to get IP country
    information in this column, you have to download one of the following
    databases and put the files in the same folder of
    LiveTcpUdpWatch.exe: http://software77.net/geo-ip/ or GeoLite2
    database (Only the CSV database is supported)
  o Added option to check the remote IP address with the IPNetInfo
    tool. In order to use this feature, you have to put ipnetinfo.exe in
    the same folder of LiveTcpUdpWatch.exe, select the items with the IP
    addresses you want to check, and then choose the 'Check Remote
    Address With IPNetInfo' option from the File menu or from the context
    menu.

* Version 1.26:
  o Added 'Select All' and 'Deselect All' to the 'Column Settings'
    window.

* Version 1.25:
  o Added thousands separator to all byte counter units.
  o You can set any variable appears saved in the .cfg file from
    command-line. For example, this command set the speed unit to kB/Sec :
    LiveTcpUdpWatch.exe /SpeedUnit 1
  o Added 'Align Numeric Columns To Right' option (It's turned on by
    default).

* Version 1.20:
  o Added option to filter by process name (In 'Advanced Options'
    window - F9).

* Version 1.16:
  o Added 'Put Icon On Tray' option.

* Version 1.15:
  o Added option to capture only the specified TCP/UDP ports (In
    'Advanced Options' window - F9).

* Version 1.13:
  o Added 'Save File Encoding' option.

* Version 1.12:
  o Added 'Sort On Every Update' option.

* Version 1.11:
  o Added 'Add Header Line To CSV/Tab-Delimited File' option (Turned
    on by default).
  o Added 'Always On Top' option.

* Version 1.10:
  o Added command-line options to save the report of LiveTcpUdpWatch
    into a file without displaying any user interface.

* Version 1.07:
  o Added 'Save All Items' option (Shift+Ctrl+S).

* Version 1.06:
  o Added option to choose another font (name and size) to display in
    the main window.

* Version 1.05:
  o Added new option: 'Exclude Localhost Addresses';
  o Added new option: 'Automatically Scroll Down On New Items'

* Version 1.00 - First release.



Start Using LiveTcpUdpWatch
===========================

LiveTcpUdpWatch doesn't require any installation process or additional
DLL files. In order to start using it, simply run the executable file -
LiveTcpUdpWatch.exe

After running LiveTcpUdpWatch, it immediately starts display any TCP/UDP
activity on your system. You can choose from the Options menu which
protocols you want to capture (TCP, UDP, IPv4, IPv6). You can also press
Ctrl+X (Clear All) to clear all accumulated data and start again with
empty table. If you want to temporary stop the network tracing , simply
uncheck the 'Capture Network Data' option or press F2.

If you want to see only the active TCP connections, simply turn on the
'Remove Closed TCP Connections' option (Under the Options menu).



Merge if only local port is different
=====================================

If you want to decrease the number of lines displayed by LiveTcpUdpWatch,
you can activate the following options: 'Merge TCP if only local port is
different', 'Merge UDP if only local port is different' (Under the
Options menu).
For example: If your Web browser creates 5 TCP connections to the same IP
address and the same port (80 or 443) - instead of 5 lines, you'll get
the summary of all 5 connections in one line and the 'Connections Count'
column will display '5'.

For UDP, it's even more significant, because every DNS query is sent to
the same remote address and port (53), but different local port, so
activating the 'Merge UDP' option will put all DNS activity in one line
instead of many lines.



IP Address Country/City Information
===================================

LiveTcpUdpWatch allows you to view country/city information for the
remote IP address. The country/city information is displayed under the
'Remote IP Country' column. In order to activate this feature, you have
to download one of the following external files, and put the file in the
same folder of LiveTcpUdpWatch.exe:
* http://software77.net/geo-ip/: Download the IPv4 CSV file, extract it
  from the zip/gz file, and put it in the same folder of
  LiveTcpUdpWatch.exe as IpToCountry.csv
* GeoLite2 City database:
  You should download the GeoLite2 City or Country database in CSV format
  because LiveTcpUdpWatch can only read this file format. In order to
  starting using this database, simply extract all files in the folder of
  LiveTcpUdpWatch.exe



Integration with IPNetInfo utility
==================================

If you want to get more information about the remote IP address displayed
in LiveTcpUdpWatch utility, you can use the integration with IPNetInfo
utility in order to easily view the IP address information loaded
directly from WHOIS servers:
1. Download and run the latest version of IPNetInfo utility and put
   ipnetinfo.exe in the same folder of LiveTcpUdpWatch.exe .
2. Select the desired items, and then choose "Check Remote Address
   With IPNetInfo" from the File menu or from the right-click context
   menu.
3. IPNetInfo will retrieve the information about remote IP addresses
   of the selected items.



Command-Line Options
====================



/CaptureTime <Milliseconds>
Specifies the capture time in milliseconds for the save command-line
options (/stext, /stab, /scomma, and so on...)
The default is 10000 milliseconds (10 seconds).

For example, if you want to capture the TCP/UDP activity for 20 seconds
and then save the result to csv file:
LiveTcpUdpWatch.exe /CaptureTime 20000 /scomma "c:\temp\tcpudp.csv"

/cfg <Filename>
Start LiveTcpUdpWatch with the specified configuration file. For example:
LiveTcpUdpWatch.exe /cfg "c:\config\ltuw.cfg"
LiveTcpUdpWatch.exe /cfg "%AppData%\LiveTcpUdpWatch.cfg"

/stext <Filename>
Save the report of LiveTcpUdpWatch into a simple text file.

/stab <Filename>
Save the report of LiveTcpUdpWatch into a tab-delimited text file.

/scomma <Filename>
Save the report of LiveTcpUdpWatch into a comma-delimited text file (csv).

/shtml <Filename>
Save the report of LiveTcpUdpWatch into HTML file (Horizontal).

/sverhtml <Filename>
Save the report of LiveTcpUdpWatch into HTML file (Vertical).

/sxml <Filename>
Save the report of LiveTcpUdpWatch into XML file.

/sjson <Filename>
Save the report of LiveTcpUdpWatch into JSON file.

/sort <column>
This command-line option can be used with other save options for sorting
by the desired column. The <column> parameter can specify the column
index (0 for the first column, 1 for the second column, and so on) or the
name of the column, like "Local Address" and "Remote Address". You can
specify the '~' prefix character (e.g: "~Received Bytes") if you want to
sort in descending order. You can put multiple /sort in the command-line
if you want to sort by multiple columns.



/Columns <Comma Delimited Columns List>
Allows you to set the columns to display or the columns to export from
command-line. You have to specify the column names, delimited by comma,
for example:
LiveTcpUdpWatch.exe /scomma c:\temp\tcp-udp-list.csv /Columns "Process
Name,Process ID,Protocol,Remote Port,Remote Address,Received Bytes,Sent
Bytes"

You can also specify the column names without space characters, for
example:
LiveTcpUdpWatch.exe /Columns
""ProcessName,ProcessID,Protocol,RemotePort,RemoteAddress,ReceivedBytes,Sen
tBytes"



Translating LiveTcpUdpWatch to other languages
==============================================

In order to translate LiveTcpUdpWatch to other language, follow the
instructions below:
1. Run LiveTcpUdpWatch with /savelangfile parameter:
   LiveTcpUdpWatch.exe /savelangfile
   A file named LiveTcpUdpWatch_lng.ini will be created in the folder of
   LiveTcpUdpWatch utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run LiveTcpUdpWatch, and all
   translated strings will be loaded from the language file.
   If you want to run LiveTcpUdpWatch without the translation, simply
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

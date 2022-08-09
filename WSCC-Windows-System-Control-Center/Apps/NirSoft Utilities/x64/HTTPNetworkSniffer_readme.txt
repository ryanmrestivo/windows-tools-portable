


HTTPNetworkSniffer v1.63
Copyright (c) 2011 - 2018 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

HTTPNetworkSniffer is a packet sniffer tool that captures all HTTP
requests/responses sent between the Web browser and the Web server and
displays them in a simple table. For every HTTP request, the following
information is displayed: Host Name, HTTP method (GET, POST, HEAD), URL
Path, User Agent, Response Code, Response String, Content Type, Referer,
Content Encoding, Transfer Encoding, Server Name, Content Length, Cookie
String, and more...

You can easily select one or more HTTP information lines, and then export
them to text/html/xml/csv file or copy them to the clipboard and then
paste them into Excel.




System Requirements
===================


* This utility works on any version of Windows, starting from Windows
  2000 and up to Windows 10, including 64-bit systems.
* One of the following capture drivers is required to use
  HTTPNetworkSniffer:
  o WinPcap Capture Driver: WinPcap is an open source capture driver
    that allows you to capture network packets on any version of Windows.
    You can download and install the WinPcap driver from this Web page.
  o Microsoft Network Monitor Driver version 2.x (Only for Windows
    2000/XP/2003): Microsoft provides a free capture driver under Windows
    2000/XP/2003 that can be used by HTTPNetworkSniffer, but this driver
    is not installed by default, and you have to manually install it, by
    using one of the following options:
    - Option 1: Install it from the CD-ROM of Windows 2000/XP
      according to the instructions in Microsoft Web site
    - Option 2 (XP Only) : Download and install the Windows XP
      Service Pack 2 Support Tools. One of the tools in this package is
      netcap.exe. When you run this tool in the first time, the Network
      Monitor Driver will automatically be installed on your system.

  o Microsoft Network Monitor Driver version 3.x: Microsoft provides
    a new version of Microsoft Network Monitor driver (3.x) that is also
    supported under Windows 7/Vista/2008.
    The new version of Microsoft Network Monitor (3.x) is available to
    download from Microsoft Web site.

* You can also try to use HTTPNetworkSniffer without installing any
  driver, by using the 'Raw Sockets' method. Unfortunately, Raw Sockets
  method has many problems:
  o It doesn't work in all Windows systems, depending on Windows
    version, service pack, and the updates installed on your system.
  o On Windows 7 with UAC turned on, 'Raw Sockets' method only works
    when you run HTTPNetworkSniffer with 'Run As Administrator'.




Known Limitations
=================


* HTTPNetworkSniffer cannot capture HTTP data of a secured Web site
  (HTTPS)



Versions History
================


* Version 1.63:
  o Fixed bug from version 1.62: HTTPNetworkSniffer crashed when
    selecting network interface without connection information.

* Version 1.62:
  o The information of the selected network adapter is now displayed
    in the window title.

* Version 1.61:
  o Added /cfg command-line option, which instructs
    HTTPNetworkSniffer to use a config file in another location instead
    if the default config file, for example:
    HTTPNetworkSniffer.exe /cfg "%AppData%\HTTPNetworkSniffer.cfg"

* Version 1.60:
  o Added 'Clear On Capture Start' option. You can turn it off if you
    don't want to clear the previous items when you stop the capture and
    start again.
  o Added 'Quick Filter' feature (View -> Use Quick Filter or
    Ctrl+Q). When it's turned on, you can type a string in the text-box
    added under the toolbar and HTTPNetworkSniffer will instantly filter
    the HTTP items, showing only lines that contain the string you typed.

* Version 1.57:
  o Added 'Save All Items' (Shift+Ctrl+S).

* Version 1.56:
  o HTTPNetworkSniffer now automatically loads the new version of
    WinPCap driver from https://nmap.org/npcap/ if it's installed on your
    system.

* Version 1.55:
  o Added 2 HTTP request columns: 'Accept' and 'Range'.

* Version 1.51:
  o HTTPNetworkSniffer now tries to load the dll of Network Monitor
    Driver 3.x (NmApi.dll) according to the installation path specified
    in HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Netmon3. This change should
    solve the problem with loading the Network Monitor Driver 3.x on some
    systems.

* Version 1.50:
  o Added 4 columns to the adapters list in the 'Capture Options'
    window: 'Connection Name', 'MAC Address', 'Instance ID', 'Interface
    Guid'.
  o When using WinPCap driver , HTTPNetworkSniffer now displays more
    accurate information in the adapters list of the 'Capture Options'
    window.

* Version 1.47:
  o Added 'Auto Size Columns On Every Update' option.

* Version 1.46:
  o Added option to export to JSON file.

* Version 1.45:
  o Added 'Always On Top' option.
  o Added secondary sorting support: You can now get a secondary
    sorting, by holding down the shift key while clicking the column
    header. Be aware that you only have to hold down the shift key when
    clicking the second/third/fourth column. To sort the first column you
    should not hold down the Shift key.

* Version 1.41:
  o HTTPNetworkSniffer now offers you to run it as administrator
    (Under Windows Vista/7/8 with UAC)

* Version 1.40:
  o HTTPNetworkSniffer now allows you to automatically add it to the
    allowed programs list of Windows firewall when starting to capture
    and remove it when you stop capturing. This option is needed when
    using the 'Raw Socket' capture method while Windows firewall is
    turned on, because if HTTPNetworkSniffer is not added to Windows
    firewall, the incoming traffic is not captured at all and thus
    HTTPNetworkSniffer doesn't work properly.

* Version 1.36:
  o Added columns names ('IP Address' and 'Adapter Name') to the
    adapters list on the 'Capture Options' window.

* Version 1.35:
  o Added integration with IPNetInfo utility

* Version 1.32:
  o Added 'Show Time In GMT' option.

* Version 1.31:
  o Fixed bug: The 'Promiscuous Mode' check-box in the 'Capture
    Options' window was not saved to the configuration file.

* Version 1.30:
  o Added 'Response Time' column, which calculates and displays the
    time (in milliseconds) passed between the moment that the client sent
    the HTTP request and the moment that the HTTP server response
    received by the client.
    To get more accurate result on this column, it's recommended to use
    the WinPcap driver or the Microsoft Network Monitor driver (version
    3.4 or later) to capture the packets.

* Version 1.27:
  o Added 'Scroll Down On New Line' option. If it's turned on,
    HTTPNetworkSniffer automatically scrolls to the bottom when a new
    line is added.

* Version 1.26:
  o Fixed the flickering problem on Windows 7.

* Version 1.25:
  o Added 'Load From Capture File' option. Allows you to load a
    capture file created by WinPcap/Wireshark (Requires the WinPcap
    driver) or a capture file created by Microsoft Network Monitor driver
    (Requires the Network Monitor driver 3.x) and displays the captured
    data in the format of HTTPNetworkSniffer.
  o Added /load_file_pcap and /load_file_netmon command-line options.

* Version 1.22:
  o Added 'Mark Odd/Even Rows' option, under the View menu. When it's
    turned on, the odd and even rows are displayed in different color, to
    make it easier to read a single line.

* Version 1.21:
  o Added 'Auto Size Columns+Headers' option, which allows you to
    automatically resize the columns according to the row values and
    column headers.
  o Fixed issue: The properties dialog-box and other windows opened
    in the wrong monitor, on multi-monitors system.

* Version 1.20:
  o Added URL column.
  o Fixed bug: When opening the 'Capture Options' dialog-box after
    Network Monitor Driver 3.x was previously selected,
    HTTPNetworkSniffer switched back to Raw Sockets mode.

* Version 1.15:
  o Added new column: Last Modified Time.

* Version 1.10:
  o Added 3 new columns: Location, Server Time, and Expiration Time.

* Version 1.06:
  o Fixed the accelerator key of 'Stop Capture' (F6)

* Version 1.05:
  o Added 'Copy URLs' option (Ctrl+U), which copies the URLs of the
    selected HTTP items into the clipboard

* Version 1.00 - First release.



Start Using HTTPNetworkSniffer
==============================

Except of a capture driver needed for capturing network packets,
HTTPNetworkSniffer doesn't require any installation process or additional
dll files. In order to start using it, simply run the executable file -
HTTPNetworkSniffer.exe

After running HTTPNetworkSniffer in the first time, the 'Capture Options'
window appears on the screen, and you're requested to choose the capture
method and the desired network adapter. In the next time that you use
HTTPNetworkSniffer, it'll automatically start capturing packets with the
capture method and the network adapter that you previously selected. You
can always change the 'Capture Options' again by pressing F9.

After choosing the capture method and network adapter, HTTPNetworkSniffer
captures and displays every HTTP request/response sent between your Web
browser and the remote Web server.



Command-Line Options
====================



/cfg <Filename>
Start HTTPNetworkSniffer with the specified configuration file. For
example:
HTTPNetworkSniffer.exe /cfg "c:\config\hns.cfg"
HTTPNetworkSniffer.exe /cfg "%AppData%\HTTPNetworkSniffer.cfg"

/load_file_pcap <Filename>
Loads the specified capture file, created by WinPcap driver.

/load_file_netmon <Filename>
Loads the specified capture file, created by Network Monitor driver 3.x.



Integration with IPNetInfo utility
==================================

If you want to get more information about the server IP address displayed
in HTTPNetworkSniffer utility, you can use the Integration with IPNetInfo
utility in order to easily view the IP address information loaded
directly from WHOIS servers:
1. Download and run the latest version of IPNetInfo utility.
2. Select the desired connections, and then choose "IPNetInfo - Server
   IP" from the File menu (or simply click Ctrl+I).
3. IPNetInfo will retrieve the information about server IP addresses
   of the selected items.



Translating HTTPNetworkSniffer to other languages
=================================================

In order to translate HTTPNetworkSniffer to other language, follow the
instructions below:
1. Run HTTPNetworkSniffer with /savelangfile parameter:
   HTTPNetworkSniffer.exe /savelangfile
   A file named HTTPNetworkSniffer_lng.ini will be created in the folder
   of HTTPNetworkSniffer utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run HTTPNetworkSniffer, and all
   translated strings will be loaded from the language file.
   If you want to run HTTPNetworkSniffer without the translation, simply
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

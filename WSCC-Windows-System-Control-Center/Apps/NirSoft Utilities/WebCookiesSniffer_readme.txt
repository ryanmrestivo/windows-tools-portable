


WebCookiesSniffer v1.30
Copyright (c) 2011 - 2018 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

WebCookiesSniffer is a packet sniffer tool that captures all Web site
cookies sent between the Web browser and the Web server and displays them
in a simple cookies table. The upper pane of WebCookiesSniffer displays
the cookie string and the Web site/host name that sent or received this
cookie. When selecting a cookie string in the upper pane,
WebCookiesSniffer parses the cookie string and displays the cookies as
name-value format in the lower pane.



System Requirements
===================


* This utility works on any version of Windows, starting from Windows
  2000 and up to Windows 10, including 64-bit systems.
* One of the following capture drivers is required to use
  WebCookiesSniffer:
  o WinPcap Capture Driver: WinPcap is an open source capture driver
    that allows you to capture network packets on any version of Windows.
    You can download and install the WinPcap driver from this Web page.
  o Microsoft Network Monitor Driver version 2.x (Only for Windows
    2000/XP/2003): Microsoft provides a free capture driver under Windows
    2000/XP/2003 that can be used by WebCookiesSniffer, but this driver
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

* You can also try to use WebCookiesSniffer without installing any
  driver, by using the 'Raw Sockets' method. Unfortunately, Raw Sockets
  method has many problems:
  o It doesn't work in all Windows systems, depending on Windows
    version, service pack, and the updates installed on your system.
  o On Windows 7 with UAC turned on, 'Raw Sockets' method only works
    when you run WebCookiesSniffer with 'Run As Administrator'.




Versions History
================


* Version 1.30:
  o Added 'Auto Size Columns+Headers' option.
  o Fixed bug: WebCookiesSniffer failed to remember the last
    size/position of the main window if it was not located in the primary
    monitor.
  o The information of the selected network adapter is now displayed
    in the window title.

* Version 1.27:
  o WebCookiesSniffer now automatically loads the new version of
    WinPCap driver from https://nmap.org/npcap/ if it's installed on your
    system.

* Version 1.26:
  o Added 4 columns to the adapters list in the 'Capture Options'
    window: 'Connection Name', 'MAC Address', 'Instance ID', 'Interface
    Guid'.
  o When using WinPCap driver , WebCookiesSniffer now displays more
    accurate information in the adapters list of the 'Capture Options'
    window.
  o WebCookiesSniffer now tries to load the dll of Network Monitor
    Driver 3.x (NmApi.dll) according to the installation path specified
    in HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Netmon3. This change should
    solve the problem with loading the Network Monitor Driver 3.x on some
    systems.

* Version 1.25:
  o Added 'Copy As Cookies.txt Format' option.

* Version 1.21:
  o Added columns names ('IP Address' and 'Adapter Name') to the
    adapters list on the 'Capture Options' window.

* Version 1.20:
  o WebCookiesSniffer now allows you to automatically add it to the
    allowed programs list of Windows firewall when starting to capture
    and remove it when you stop capturing. This option is needed when
    using the 'Raw Socket' capture method while Windows firewall is
    turned on, because if WebCookiesSniffer is not added to Windows
    firewall, the incoming traffic is not captured at all.
  o WebCookiesSniffer now offers you to run it as administrator
    (Under Windows Vista/7/8 with UAC) if you start to capture using Raw
    Sockets method.

* Version 1.17:
  o Added 'Copy Cookies String' option.

* Version 1.16:
  o Fixed the flickering problem on Windows 7.

* Version 1.15:
  o Added 'Load From Capture File' option. Allows you to load a
    capture file created by WinPcap/Wireshark (Requires the WinPcap
    driver) or a capture file created by Microsoft Network Monitor driver
    (Requires the Network Monitor driver 3.x) and displays the captured
    data in the format of WebCookiesSniffer.
  o Added /load_file_pcap and /load_file_netmon command-line options.
  o Fixed issue: The properties dialog-box and other windows opened
    in the wrong monitor, on multi-monitors system.

* Version 1.12:
  o Fixed bug: When opening the 'Capture Options' dialog-box after
    Network Monitor Driver 3.x was previously selected, WebCookiesSniffer
    switched back to Raw Sockets mode.

* Version 1.11:
  o Fixed the accelerator key of 'Stop Capture' (F6)

* Version 1.10:
  o Added 'Start As Hidden' option. When this option and 'Put Icon On
    Tray' option are turned on, the main window of WebCookiesSniffer will
    be invisible on start.

* Version 1.07:
  o Fixed bug: The check status of 'Capture On Program Start' menu
    item was not displayed.

* Version 1.06:
  o Fixed a crash problem occurred while browsing into some Web pages.

* Version 1.05:
  o Added 'Put Icon On Tray' option.

* Version 1.00 - First release.



Known Limitations
=================


* WebCookiesSniffer cannot capture files of a secured Web site (HTTPS)



Start Using WebCookiesSniffer
=============================

Except of a capture driver needed for capturing network packets,
WebCookiesSniffer doesn't require any installation process or additional
dll files. In order to start using it, simply run the executable file -
WebCookiesSniffer.exe

After running WebCookiesSniffer in the first time, the 'Capture Options'
window appears on the screen, and you're requested to choose the capture
method and the desired network adapter. In the next time that you use
WebCookiesSniffer, it'll automatically start capturing packets with the
capture method and the network adapter that you previously selected. You
can always change the 'Capture Options' again by pressing F9. After
choosing the capture method and network adapter, WebCookiesSniffer
captures and displays every cookie found in the data sent between your
Web browser and the remote Web server.



Command-Line Options
====================



/load_file_pcap <Filename>
Loads the specified capture file, created by WinPcap driver.

/load_file_netmon <Filename>
Loads the specified capture file, created by Network Monitor driver 3.x.



Translating WebCookiesSniffer to other languages
================================================

In order to translate WebCookiesSniffer to other language, follow the
instructions below:
1. Run WebCookiesSniffer with /savelangfile parameter:
   WebCookiesSniffer.exe /savelangfile
   A file named WebCookiesSniffer_lng.ini will be created in the folder
   of WebCookiesSniffer utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run WebCookiesSniffer, and all
   translated strings will be loaded from the language file.
   If you want to run WebCookiesSniffer without the translation, simply
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




WebSiteSniffer v1.51
Copyright (c) 2011 - 2017 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

WebSiteSniffer is a packet sniffer tool that captures all Web site files
downloaded by your Web browser while browsing the Internet, and stores
them on your hard drive under the base folder that you choose.
WebSiteSniffer allows you to choose which type of Web site files will be
captured: HTML Files, Text Files, XML Files, CSS Files, Video/Audio
Files, Images, Scripts, and Flash (.swf) files.

While capturing the Web site files, the main window of WebSiteSniffer
displays general statistics about the downloaded files for every Web site
/ host name, including the total size of all files (compressed and
uncompressed) and total number of files for every file type (HTML, Text,
Images, and so on)





System Requirements
===================


* This utility works on any version of Windows, starting from Windows
  2000 and up to Windows 10, including 64-bit systems.
* One of the following capture drivers is required to use
  WebSiteSniffer:
  o WinPcap Capture Driver: WinPcap is an open source capture driver
    that allows you to capture network packets on any version of Windows.
    You can download and install the WinPcap driver from this Web page.
  o Microsoft Network Monitor Driver version 2.x (Only for Windows
    2000/XP/2003): Microsoft provides a free capture driver under Windows
    2000/XP/2003 that can be used by WebSiteSniffer, but this driver is
    not installed by default, and you have to manually install it, by
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

* You can also try to use WebSiteSniffer without installing any driver,
  by using the 'Raw Sockets' method. Unfortunately, Raw Sockets method
  has many problems:
  o It doesn't work in all Windows systems, depending on Windows
    version, service pack, and the updates installed on your system.
  o On Windows 7 with UAC turned on, 'Raw Sockets' method only works
    when you run WebSiteSniffer with 'Run As Administrator'.




Versions History
================


* Version 1.51:
  o Added /cfg command-line option, which instructs WebSiteSniffer to
    use a config file in another location instead if the default config
    file, for example:
    WebSiteSniffer.exe /cfg "%AppData%\WebSiteSniffer.cfg"

* Version 1.50:
  o Added 'If filename already exists' option: Generate different
    filename (default), Overwrite the existing file, Don't save the file
    if it already exists.
  o WebSiteSniffer now automatically loads the new version of WinPCap
    driver from https://nmap.org/npcap/ if it's installed on your system.

* Version 1.45:
  o Added 4 columns to the adapters list in the 'Capture Options'
    window: 'Connection Name', 'MAC Address', 'Instance ID', 'Interface
    Guid'.
  o When using WinPCap driver , WebSiteSniffer now displays more
    accurate information in the adapters list of the 'Capture Options'
    window.

* Version 1.41:
  o WebSiteSniffer now offers you to run it as administrator (Under
    Windows Vista/7/8 with UAC) if you start to capture using Raw Sockets
    method.

* Version 1.40:
  o WebSiteSniffer now allows you to automatically add it to the
    allowed programs list of Windows firewall when starting to capture
    and remove it when you stop capturing. This option is needed when
    using the 'Raw Socket' capture method while Windows firewall is
    turned on, because if WebSiteSniffer is not added to Windows
    firewall, the incoming traffic is not captured at all.

* Version 1.37:
  o Added 'Sort On Every Update' option.

* Version 1.36:
  o Fixed bug: The 'Promiscuous Mode' check-box in the 'Capture
    Options' window was not saved to the configuration file.

* Version 1.35:
  o Added option to save and load the entire configuration of
    WebSiteSniffer ('Save Configuration' and 'Load Configuration' under
    the File menu).

* Version 1.31:
  o Fixed the flickering problem on Windows 7.

* Version 1.30:
  o Added 'Load Capture File' option, which allows you to load a
    capture file created by WinPcap/Wireshark (Requires the WinPcap
    driver) or a capture file created by Microsoft Network Monitor driver
    (Requires the Network Monitor driver 3.x). When you use this option,
    WebSiteSniffer will analyze the packets stored inside the capture
    file, and then it'll extract all Web site files according to the
    current 'Capture Options', exactly like it's done with a live capture.

* Version 1.27:
  o Added 'Mark Odd/Even Rows' option, under the View menu. When it's
    turned on, the odd and even rows are displayed in different color, to
    make it easier to read a single line.
  o Added 'Auto Size Columns+Headers' option, which allows you to
    automatically resize the columns according to the row values and
    column headers.
  o Fixed issue: Dialog-boxes opened in the wrong monitor, on
    multi-monitors system.

* Version 1.26:
  o Fixed bug: When opening the 'Capture Options' dialog-box after
    Network Monitor Driver 3.x was previously selected, WebSiteSniffer
    switched back to Raw Sockets mode.

* Version 1.25:
  o Added option to specify domains/host names to skip
    (comma-delimited list)

* Version 1.20:
  o Added option to download only files from the domains/host names
    you choose (comma-delimited list)

* Version 1.15:
  o Added new option: Set the modified time of the downloaded files
    according to the modified time on the Web server.

* Version 1.11:
  o Fixed the accelerator key of 'Stop Capture' (F6)

* Version 1.10:
  o Added 'Start As Hidden' option. When this option and 'Put Icon On
    Tray' option are turned on, the main window of WebSiteSniffer will be
    invisible on start.

* Version 1.06:
  o Fixed a crash problem occurred while browsing into some Web pages.

* Version 1.05:
  o Added 'Put Icon On Tray' option.

* Version 1.01:
  o Fixed bug: WebSiteSniffer created files with double extension
    (like image.gifgif) if the MIME type database in the Registry
    contained extension name without a dot.

* Version 1.00 - First release.



Known Limitations
=================


* WebSiteSniffer cannot capture files of a secured Web site (HTTPS)
* When downloading a large file with a fast Internet connection,
  WebSiteSniffer might lose some of the packets, and thus the captured
  file will be corrupted.
* If some of the Web site files are taken from the cache of your Web
  browser, WebSiteSniffer won't be able to capture them. To ensure that
  all Web site files are captured by WebSiteSniffer, clear the cache of
  your Web browser, or use the 'Start Private Browsing' option of Firefox.



Captured Files Directory Structure
==================================

For every Web site or host name, WebSiteSniffer creates a separated
subfolder under the main download folder that you choose. For example, if
you browse into www.nirsoft.net Web site, all files downloaded from
www.nirsoft.net are stored under www.nirsoft.net subfolder.


When opening the subfolder of specific host name/Web site, you'll find
all files captured from this Web site:





Start Using WebSiteSniffer
==========================

Except of a capture driver needed for capturing network packets,
WebSiteSniffer doesn't require any installation process or additional dll
files. In order to start using it, simply run the executable file -
WebSiteSniffer.exe

After running WebSiteSniffer in the first time, the 'Capture Options'
window appears on the screen, and you're requested to choose the base
folder to download and extract all Web site files, the file types that
you wish to capture (html, image, video, audio, scripts, and so on...),
the capture method, and the desired network adapter. In the next time
that you use WebSiteSniffer, it'll automatically start capturing the web
site files according to the last selected settings.

After clicking the 'Ok' button, WebSiteSniffer starts capturing the
network packets on your network adapter. You can simply open your Web
browser, browse into any Web site you like, and you'll see the files of
the Web site you visit accumulated under the base folder that you chose.
The main window of WebSiteSniffer also displays the statistics about
captured files for every Web site. You can also select the desired Web
site item and press F8 (Open Web Site Folder) to open the folder of the
selected Web site in Windows Explorer, and easily view all files captured
from this Web site.



Command-Line Options
====================



/cfg <Filename>
Start WebSiteSniffer with the specified configuration file. For example:
WebSiteSniffer.exe /cfg "c:\config\wss.cfg"
WebSiteSniffer.exe /cfg "%AppData%\WebSiteSniffer.cfg"



Translating WebSiteSniffer to other languages
=============================================

In order to translate WebSiteSniffer to other language, follow the
instructions below:
1. Run WebSiteSniffer with /savelangfile parameter:
   WebSiteSniffer.exe /savelangfile
   A file named WebSiteSniffer_lng.ini will be created in the folder of
   WebSiteSniffer utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run WebSiteSniffer, and all
   translated strings will be loaded from the language file.
   If you want to run WebSiteSniffer without the translation, simply
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

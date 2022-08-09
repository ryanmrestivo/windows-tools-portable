


QuickSetDNS v1.31
Copyright (c) 2013 - 2021 Nir Sofer
Web site: https://www.nirsoft.net



Description
===========

QuickSetDNS is a simple tool that allows you to easily change the DNS
servers that are used for your Internet connection. You can set the
desired DNS servers from the user interface, by choosing from a list of
DNS servers that you defined, or from command-line, without displaying
any user interface.



System Requirements
===================

This utility works on any version of Windows, starting from Windows 2000
and up to Windows 10. Both 32-bit and 64-bit systems are supported.



Versions History
================


* Version 1.31:
  o Added 'Start As Hidden' option. When this option and 'Put Icon On
    Tray' option are turned on, the main window of QuickSetDNS will be
    invisible on start.

* Version 1.30:
  o Added support for IPv6. In order to set the IPv6 DNS servers, you
    have to use the 'Set Active DNS (IPv4+IPv6)' option. If you want to
    set only the IPv4 DNS servers, like the previous versions, you should
    use the 'Set Active DNS (IPv4)' option.

* Version 1.22:
  o Fixed the 'Copy SetDNS Command Line' option - Added quotes to the
    .exe file.

* Version 1.21:
  o You can now specify the connection name in command-line, for
    example:
    QuickSetDNS.exe /SetDNS "8.8.8.8,8.8.4.4" "Local Area Connection"

* Version 1.20:
  o Added new default DNS servers: Cloudflare (1.1.1.1) and Quad9
    (9.9.9.9). Be aware that these DNS servers are added only when you
    run QuickSetDNS in the first time (Without .cfg file)

* Version 1.15:
  o Added 'Open Adapter In RegEdit' option, which allows you to open
    the settings of the selected network adapter in the Registry.
  o You can now manually set the DNS servers in the Registry, and
    then use /SetDNS command with 'reg' value to update the system with
    the Registry changes you made, for example:
    QuickSetDNS /SetDNS reg "{F41A4233-02DA-42D6-A97B-A2D12F9FE0CD}"

* Version 1.10:
  o Added option to choose another font (name and size) to display in
    the main window.

* Version 1.05:
  o Added 'Put Icon On Tray' option.

* Version 1.03:
  o Fixed bug: On some systems, QuickSetDNS failed to display network
    adapters in the top combo-box.

* Version 1.02:
  o Added 'Always On Top' option.

* Version 1.01:
  o Added 'Router DNS' item, which allows you to choose the internal
    DNS server of your router.

* Version 1.00 - First release.



Start Using QuickSetDNS
=======================

QuickSetDNS doesn't require any installation process or additional dll
files. In order to start using it, simply run the executable file -
QuickSetDNS.exe

After running QuickSetDNS, the main window allows you to easily choose
the desired DNS servers to use on your Internet connection, by using the
'Set Active DNS' option (F2). By default, QuickSetDNS provides only one
alternative: the public DNS servers of Google - 8.8.8.8 and 8.8.4.4
You can easily add more DNS servers to the list by using the 'New DNS
Server' option (Ctrl+N).

If the 'Automatic DNS' option is selected, then the DNS server
information is received from your router automatically, using DHCP.

If you have multiple network adapters, you may need to choose the correct
network adapter from the combo-box located just below the toolbar of
QuickSetDNS.



Setting DNS servers from command-line
=====================================

With QuickSetDNS, you can easily set the desired DNS servers from
command-line, without displaying any user intertface by using the /SetDNS
and /SetDNS6 commands:

QuickSetDNS.exe /SetDNS [DNS Servers List] [Network Adapter String]
QuickSetDNS.exe /SetDNS6 [DNS Servers List] [Network Adapter String]

[DNS Servers List] specifies the DNS servers, delimited by comma if there
are multiple servers. If empty string is specified ( "" ), QuickSetDNS
will set the automatic DNS mode. if 'reg' string is specified ,
QuickSetDNS will not set the DNS, but it'll update the system with the
DNS changes you made in the Registry (Under
HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\\arameters\\nter
faces\[Adapter] ).
[Network Adapter String] specifies the unique ID string of your network
adapter or connection name (e.g: 'Wireless Network Connection 2'). If you
don't know what is your Network Adapter String, simply press Ctrl+L (Copy
SetDNS Command-Line) and the entire command needed to set the selected
DNS server will be copied to the clipboard.
If empty string is specified ( "" ), QuickSetDNS will try to choose the
correct network adapter automatically.

Here's some examples for the /SetDNS and /SetDNS6 command:
QuickSetDNS.exe /SetDNS "8.8.8.8,8.8.4.4"
"{F41A4233-02DA-42D6-A97B-A2D12F9FE0CD}"
QuickSetDNS.exe /SetDNS "8.8.8.8,8.8.4.4" "Local Area Connection"
QuickSetDNS.exe /SetDNS "8.8.8.8,8.8.4.4"
QuickSetDNS.exe /SetDNS "" "{F41A4233-02DA-42D6-A97B-A2D12F9FE0CD}"
QuickSetDNS.exe /SetDNS ""
QuickSetDNS.exe /SetDNS "192.168.1.1"
"{F41A4233-02DA-42D6-A97B-A2D12F9FE0CD}"
QuickSetDNS.exe /SetDNS "reg" "{F41A4233-02DA-42D6-A97B-A2D12F9FE0CD}"
QuickSetDNS.exe /SetDNS6 "2001:4860:4860::8888,2001:4860:4860::8844"
"Local Area Connection"




Translating QuickSetDNS to other languages
==========================================

In order to translate QuickSetDNS to other language, follow the
instructions below:
1. Run QuickSetDNS with /savelangfile parameter:
   QuickSetDNS.exe /savelangfile
   A file named QuickSetDNS_lng.ini will be created in the folder of
   QuickSetDNS utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run QuickSetDNS, and all
   translated strings will be loaded from the language file.
   If you want to run QuickSetDNS without the translation, simply rename
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

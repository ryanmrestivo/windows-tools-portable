


WifiChannelMonitor v1.70
Copyright (c) 2014 - 2021 Nir Sofer
Web site: https://www.nirsoft.net



Description
===========

WifiChannelMonitor captures wifi traffic on the channel you choose, using
Microsoft Network Monitor capture driver in monitor mode, and displays
extensive information about access points and the wifi clients connected
to them. WifiChannelMonitor also allows you to view the information about
wifi clients that are not connected to any access points, including the
list of SSIDs (network names) that they are trying to connect.
For every access point, the following information is displayed: SSID, MAC
Address, Device Manufacturer , PHY Type, Channel, RSSI, Security, Beacons
Count, Probe Responses Count, Data Bytes, Retransmitted Data Bytes, and
more...
For every client, the following information is displayed: MAC Address,
Device Manufacturer, SSID list that the client tries to connect, Sent
Data Bytes, Received Data Bytes, Probe Requests Count, and more...



System Requirements
===================


* Windows 10/Vista/7/8/2012 - 32-bit or 64-bit. (In previous version of
  Windows , there is no support for wifi monitor mode)
* Microsoft Network Monitor 3.x - You can download and install it from
  this Web page or from this Web page .
* Wireless network adapter and a driver that works properly in 'monitor
  mode' under Windows. See the remarks about that in the 'Known Problems'
  section below, it's very important !!
* Starting from version 1.55 - You can also monitor Wifi traffic even
  if your card doesn't support 'monitor mode'. When your card is not in
  'monitor mode' - you'll mostly see the traffic of your own network.

You can also use WifiChannelMonitor to watch wifi information offline by
importing a capture pcap file created under Linux with airodump-ng or
wireshark. In this case, there is no need for capture driver and you can
also use it under Windows XP.



Versions History
================


* Version 1.70:
  o Added '802.11ac' to the monitor mode option in the 'Capture
    Options' window.
  o Updated the internal MAC addresses file.

* Version 1.66:
  o Added 'Copy Clicked Cell' option to the right-click context menu,
    which copies to the clipboard the text of cell that you right-clicked
    with the mouse.
  o Updated the internal MAC addresses file.

* Version 1.65:
  o Added support for WPA3 detection (Security column).
  o Added support for detecting 802.11ax devices.
  o The 'PHY Type' column now displays multiple phy types (e.g:
    802.11g/n, 802.11n/ac).
  o Fixed the /cfg command-line option to load the .cfg file from the
    current directory if full path is not specified.

* Version 1.60:
  o Updated the internal MAC addresses file.

* Version 1.59:
  o Added 'WiFi Scanning Options' button to the 'Capture Options'
    window, which opens the 'WiFi Scanning Options' window of Microsoft
    Network Monitor.

* Version 1.58:
  o Added 'Always On Top' option.
  o Updated the internal MAC addresses file.

* Version 1.57:
  o Fixed bug: WifiChannelMonitor failed to remember the last
    size/position of the main window if it was not located in the primary
    monitor.
  o Updated the internal MAC addresses file.

* Version 1.56:
  o Updated the internal MAC addresses file.

* Version 1.55:
  o WifiChannelMonitor now processes packets that are not flagged as
    'Monitor Mode' (In previous versions it dropped these packets). This
    means that if your network card doesn't support 'Monitor Mode', you
    can still monitor your own network (The network that you are
    connected to).
  o Also, this change may fix capture problem (In monitor mode) with
    some cards on Windows 10 Fall Creator Update.
  o If the wireless network adapter cannot switch to monitor mode,
    WifiChannelMonitor now displays an error message in the status bar.
  o Added 'Select All' and 'Deselect All' to the 'Column Settings'
    window.

* Version 1.50:
  o Fixed issue: When plugging a USB wifi device while
    WifiChannelMonitor is already running, you had to close
    WifiChannelMonitor and run it again in order to use the plugged
    device.

* Version 1.48:
  o Updated the internal MAC addresses file.

* Version 1.47:
  o Added 'Auto Capture On Program Start' option.

* Version 1.46:
  o Updated the internal MAC addresses file.

* Version 1.45:
  o Added option to play a sound when a new Wifi client is detected
    ('Advanced Options' window)

* Version 1.42:
  o Fixed the 'MAC Addresses List' window to support Ctrl+A (Select
    All).

* Version 1.41:
  o Updated the internal MAC addresses file.

* Version 1.40:
  o WifiChannelMonitor now tries to load the NmApi.dll file according
    to the installation path specified in
    HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Netmon3. Hopefully, this change
    will solve the 'Failed to load the NmApi.dll file' error that
    occurred on some systems.
  o Added 'Association Status Code' and 'Deauthentication Code'
    columns. These columns might be useful to disgnose wifi connection
    problems. You can find the meaning of these codes in this Web page.
  o Added 'Association Requests' column, which displays the number of
    association requests sent by the client.

* Version 1.35:
  o Added 'MAC Addresses List' option (Ctrl+F8), which allows you to
    create a MAC addresses list of all your devices and optionally their
    name or description. The MAC addresses list is saved into
    WifiChannelMonitor_MAC_List.txt filename located in the same folder
    of the .exe file.
  o Added 'Device Description' column, which displays the text you
    added for a device in the 'MAC Addresses List' window.
  o Added 'Show Only Clients+APs In My List' option. When you switch
    to this mode, WifiChannelMonitor displays only the devices you added
    in the 'MAC Addresses List' window.

* Version 1.30:
  o Updated the internal MAC addresses file.
  o Added 'Put Icon On Tray' option.

* Version 1.25:
  o Added 'Maximum Speed' column for both APs and wifi clients.

* Version 1.20:
  o Added 'Beacons Per Second' column.

* Version 1.18:
  o Added 'Show All Clients With AP' option.

* Version 1.17:
  o Added 'AP BSSID' column to the wifi clients pane.

* Version 1.16:
  o Updated the internal MAC addresses file.

* Version 1.15:
  o Added 'Panes Display Mode' - 'Access Points and Clients', 'Access
    Points Only', or 'Clients Only'.

* Version 1.10:
  o Added separated 'Sort On Every update' and 'Auto Scroll Down'
    options for access points pane and for the clients pane.
  o Fixed bug: WifiChannelMonitor displayed 01:80:c2:00:00:xx
    addresses as clients.
  o Added 'Clear All Clients Data' option.
  o Added 'Duration' column to the wifi clients pane, which shows the
    difference between the 'First Detected On' and 'Last Detected On'.

* Version 1.05:
  o Added 'Save Configuration To File' and 'Load Configuration From
    File' options.
  o Added /cfg command-line option.

* Version 1.02:
  o Added secondary sorting support: You can now get a secondary
    sorting, by holding down the shift key while clicking the column
    header. Be aware that you only have to hold down the shift key when
    clicking the second/third/fourth column. To sort the first column you
    should not hold down the Shift key.

* Version 1.01:
  o WifiChannelMonitor now displays an error message if you try to
    run WifiChannelMonitor 32-bit on 64-bit system.
  o WifiChannelMonitor now displays an error message if it fails to
    load the dll of Microsoft Network Monitor (NmApi.dll).

* Version 1.00 - First release.



Known Problems with Monitor Mode
================================

Unfortunately, many wireless adapters and/or their drivers have variety
of problems when switching them to 'monitor mode'. These problems also
affect the quality and accuracy of the information you see in
WifiChannelMonitor.

Here's the list of known problems in 'Monitor Mode' under Windows:
* No RSSI and channel frequency information: Some wireless
  adapters/drivers don't provide RSSI values and channel frequency
  information. If you have a driver with this problem, you'll see a false
  RSSI/frequency values, or these columns will just remain empty.
* Wireless adapter switches to default channel: Some wireless
  adapters/drivers switche to their default channel after some time. You
  can try to solve this problem by using the 'Frequently set the channel
  during the capture process' option.
* Large amount of 'Noise': In some wireless adapters/drivers, high
  percentage of the captured packets are corrupted. It means that you'll
  see many APs and wifi clients with incorrect MAC address and other
  false information. If you have this problem, you can improve the
  quality of displayed information by using the 'Noise Filtering' section
  in the 'Advanced Options' window (F8).
* Removed CRC values: The 'Drop all packets with bad CRC' option (in
  the 'Advanced Options' window) allows you to filter all corrupted
  packets that are not encrypted and it helps to significantly reduce
  noise problems. Unfortunately, some drivers remove the CRC value from
  the captured packet, so for these drivers, the 'Drop all packets with
  bad CRC' option cannot be used...
* No 802.11n support: Some wireless adapters/drivers can only capture
  802.11g traffic, even if the adapter supports 802.11n in non-monitor
  mode.



Recommended Wireless Adapters
=============================

Unfortunately, I currently don't have a list of wireless adapters that
works well in monitor mode under Windows. I have tested several wireless
adapters and from all of them, I found only one that works perfectly:
TP-LINK TL-WN722N Version 1 (Be aware that there is version 2 of this
device with different chipset, what I write here is true for version 1)

The advantages of this wireless card and its Windows driver:
* It provides the correct RSSI values.
* It captures data with very low percentage of corrupted packets.
* The driver doesn't remove the CRC values from the captured packets.
* It doesn't switch to a default channel by itself.
* It captures 802.11n traffic.
* It also works well in monitor mode under Kali Linux.
Be aware that this wireless adapter was tested under Windows 7. I don't
know if the driver of TL-WN722N works in the same way with other version
of Windows.

If you find a wireless adapter that works well in monitor mode as
described above, please send me the exact model and version of the
wireless adapter, and I'll add it to the list. It's very important to
specify the version of the adapter, because many adapter models have
multiple versions with different chipsets and drivers.



WifiChannelMonitor vs Other Tools
=================================

Capturing data using monitor mode allows WifiChannelMonitor to show
information that other wifi tools cannot get:
* Detect and show all wifi clients (Tablets, Smartphones, computers
  with wifi adapter, and so on... ), Including wifi clients that are not
  connected to any access point, but only tries to connect...
* For wifi clients that try to connect to one or more APs -
  WifiChannelMonitor displays the list of network names (SSIDs) that the
  wifi client tries to connect.
* WifiChannelMonitor can also detect clients with a wired connection to
  the router.
* WifiChannelMonitor shows the number of sent/received data bytes for
  every access point and for every wifi client connected to the access
  point.
* WifiChannelMonitor can show the name of hidden network. (The name is
  detected only when somebody connects this wireless network)



Start Using WifiChannelMonitor
==============================

Before you start capturing wifi data with WifiChannelMonitor, you have to
install the Microsoft Network Monitor 3.x from this Web page or from this
Web page. Except of the Microsoft Network Monitor driver, there is no
need for any installation process or additional dll files.
In order to start using WifiChannelMonitor, simply run the executable
file - WifiChannelMonitor.exe
After running WifiChannelMonitor, press F6 to start capturing in wifi
monitor mode. On the 'Capture Options' window, you have to choose the
correct wireless network adapter and the channel number you want to
monitor. It's recommended to start monitoring with one of the 3 major
wifi channels - 1, 6, or 11.
After choosing the channel and adapter, click the Ok button to start
monitoring. After a few seconds, you should see the access points
information in the upper pane. If you don't see any information , stop
the capture (F7) , go to the 'Capture Options' window (F9) and try to
change from 802.11n to 802.11g. After that press F6 to start the capture
again.



Wifi Clients Modes (Lower Pane)
===============================

There are 3 different modes that you can view the wifi clients in the
lower pane:
* Show Clients Of Selected AP: In this mode, WifiChannelMonitor only
  displays the wifi clients that are connected to the access point you
  select in the upper pane.
* Show All Clients: In this mode, WifiChannelMonitor displays all
  detected clients.
* Show All Clients Without AP: In this mode, WifiChannelMonitor
  displays all clients that are not connected to any access point.
* Show All Clients With AP: In this mode, WifiChannelMonitor displays
  all clients that are connected to access point.
* Show Only Clients+APs In My List: In this mode, WifiChannelMonitor
  displays only the clients and APs that appear in the MAC Addresses List
  (Ctrl+F8)



AP Columns Description
======================


* SSID: The name of the wireless network
* MAC Address: MAC address of the access point.
* Company: Company that manufactured this access point, determined
  according to the MAC address.
* PHY Type: 802.11g, 802.11n, and so on...
* Frequency: Channel frequency in MHz.
* Channel: Channel number.
* RSSI: Specifies the signal strength, in dBm. Some drivers don't
  provide the correct RSSI values in monitor mode.
* Security: None, WPA-PSK, WPA2-PSK, WPA-PSK + WPA2-PSK, WPA-EAP,
  WPA2-EAP, WPA-EAP + WPA2-EAP, or WEP.
* Cipher: None, WEP, TKIP, CCMP, TKIP+CCMP.
* Beacons: The total number of beacons sent by the access point. Beacon
  is a packet sent frequently by the access point and contains essential
  information that the wifi client need to identify and connect it.
* Probe Responses: The total number of times that the access point
  responded to a probe request sent by a wifi client.
* Data Bytes: Total number of data bytes sent and received by this
  access point.
* Retransmitted Data: Total number of retransmitted data bytes sent and
  received by this access point.
* Device Name: The name of the device. This value is displayed only for
  devices that support WPS.
* Device Model: The device model. This value is displayed only for
  devices that support WPS.
* WPS: Specifies the WPS status: No (No WPS Support), Configured, Not
  Configured, or Locked.
* Start Time: Displays the last time that access point was possibly
  started/restarted/rebooted. Be aware that some access points reset
  their timestamp periodically without restart/reboot action, and thus
  for these APs, the time value displayed on this column doesn't
  represent the correct start time.
* First Data Detected On: The first time that sent/received data was
  detected for this AP.
* Last Data Detected On: The last time that sent/received data was
  detected for this AP.



Wifi Client Columns Description
===============================


* MAC Address: MAC address of the wifi client.
* Company: Company that manufactured this wifi client, determined
  according to the MAC address. For example, if the wifi client is iPhone
  or iPad, you'll see 'Apple' in this column.
* RSSI: Specifies the signal strength, in dBm. Some drivers don't
  provide the correct RSSI values in monitor mode.
* SSID List: When wifi client tries to connect one or more access
  points, this field will display the list of network names (SSIDs) that
  this client tries to connect.
* Sent Data Bytes: Total number of data bytes sent by the client.
* Received Data Bytes: Total number of data bytes received by the
  client.
* Retransmitted Sent: Total number of retransmitted data bytes sent by
  the client.
* Retransmitted Received: Total number of retransmitted data bytes
  received by the client.
* Client Type: Wifi Client, Router, or Unknown.
  Wifi Client means that this client uses wireless connection.
  Router means that this client is the router (Yes... the router is also
  displayed as a client in the network).
  Unknown means that this client uses wired connection or wireless
  connection.
* Device Name: The name of the device. This value is displayed only for
  devices that support WPS.
* Device Model: The device model. This value is displayed only for
  devices that support WPS.
* WPS: Specifies the WPS status: No (No WPS Support), Configured, Not
  Configured, or Locked.
* PHY Type: 802.11g, 802.11n, and so on...
* Security: None, WPA-PSK, WPA2-PSK, WPA-EAP, WPA2-EAP, or WEP. This
  field is filled only when the client tries to connect the access point.
* Cipher: None, WEP, TKIP, CCMP, TKIP+CCMP. This field is filled only
  when the client tries to connect the access point.
* Probe Requests: Total number of probe requests sent by this client.
* First Detected On: The first date/time that this client was detected.
* Last Detected On: The last date/time that this client was detected.
* Association Status Code: Specifies the last Association Status Code
  that might be useful to disgnose wifi connection problems. You can find
  the meaning of these codes in this Web page.
* Deauthentication Code: Specifies the last Deauthentication Code that
  might be useful to disgnose wifi connection problems. You can find the
  meaning of these codes in this Web page.
* Association Requests: Specifies the number of association requests
  sent by the client.
* Device Description If the MAC address of the device is identical a
  MAC address in your MAC Addresses List (Ctrl+F8), then the description
  of the device in this list is displayed in this column.



Meaning of Icons
================


* Green Icon - The AP or wifi client sent or received data in the last
  10 seconds. (You can change the number of seconds in the 'Advanced
  Options' window)
* Orange Icon - The AP or wifi client sent or received data in the last
  60 seconds. (You can change the number of seconds in the 'Advanced
  Options' window)
* Red Icon - No sent/received data in the last 60 seconds.



Command-Line Options
====================



/cfg <Filename>
Start WifiChannelMonitor with the specified configuration file. For
example:
WifiChannelMonitor.exe /cfg "c:\config\wf.cfg"
WifiChannelMonitor.exe /cfg "%AppData%\WifiChannelMonitor.cfg"



Translating WifiChannelMonitor to other languages
=================================================

In order to translate WifiChannelMonitor to other language, follow the
instructions below:
1. Run WifiChannelMonitor with /savelangfile parameter:
   WifiChannelMonitor.exe /savelangfile
   A file named WifiChannelMonitor_lng.ini will be created in the folder
   of WifiChannelMonitor utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run WifiChannelMonitor, and all
   translated strings will be loaded from the language file.
   If you want to run WifiChannelMonitor without the translation, simply
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

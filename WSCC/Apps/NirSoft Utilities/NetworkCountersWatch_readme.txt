


NetworkCountersWatch v1.02
Copyright (c) 2017 - 2020 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

NetworkCountersWatch is a tool for Windows that displays system counters
for every network interface on your system. The system counters include
the number of incoming/outgoing bytes, number of incoming/outgoing
packets, number of broadcast packets, and more. You can also initialize
all counters to zero at any time in order to watch the network counters
for specific event. NetworkCountersWatch also calculates and displays the
current download speed and upload speed on your network interface.



System Requirements
===================

This utility works on any version of Windows, starting from Windows Vista
and up to Windows 10. (Windows XP is not supported). Both 32-bit and
64-bit systems are supported.



Versions History
================


* Version 1.02:
  o Added 'Select All' and 'Deselect All' to the 'Column Settings'
    window.

* Version 1.01:
  o Added 'Align Numeric Columns To Right' option.

* Version 1.00 - First release.



Start Using NetworkCountersWatch
================================

NetworkCountersWatch doesn't require any installation process or
additional DLL files. In order to start using it, simply run the
executable file - NetworkCountersWatch.exe

After running NetworkCountersWatch, the main window displays a table with
the counters of active network interfaces. By default, Both 'Show Only
Items With Non-Zero Counters' and 'Show Only Hardware Interfaces' options
are turned on. In order to see all network interfaces on your system, you
should turn off these options, but when you do it, you might see multiple
interfaces with exactly the same counters.



Reset And Restore Counters
==========================

You can use the 'Reset Counters Of Selected Items' option (F7) in order
to initialize all counters to zero. Be aware that NetworkCountersWatch
doesn't actually reset the system counters, it simply takes a snapshot of
the current counters and then shows you the difference between the
snapshot and the system counters. You can restore back the display of
actual system counters by using the 'Restore Counters Of Selected Items'
option.



Counters Description
====================

Here's the description of all network counters displayed by
NetworkCountersWatch, taken from official documents of Microsoft:
* InOctets: The number of octets of data received without errors
  through this interface. This value includes octets in unicast,
  broadcast, and multicast packets.
* InUcastPkts: The number of unicast packets received without errors
  through this interface.
* InNUcastPkts: The number of non-unicast packets received without
  errors through this interface. This value includes broadcast and
  multicast packets.
* InDiscards: The number of inbound packets which were chosen to be
  discarded even though no errors were detected to prevent the packets
  from being deliverable to a higher-layer protocol.
* InErrors: The number of incoming packets that were discarded because
  of errors.
* InUnknownProtos: The number of incoming packets that were discarded
  because the protocol was unknown.
* InUcastOctets: The number of octets of data received without errors
  in unicast packets through this interface.
* InMulticastOctets: The number of octets of data received without
  errors in multicast packets through this interface.
* InBroadcastOctets: The number of octets of data received without
  errors in broadcast packets through this interface.
* OutOctets: The number of octets of data transmitted without errors
  through this interface. This value includes octets in unicast,
  broadcast, and multicast packets.
* OutUcastPkts: The number of unicast packets transmitted without
  errors through this interface.
* OutNUcastPkts: The number of non-unicast packets transmitted without
  errors through this interface. This value includes broadcast and
  multicast packets.
* OutDiscards: The number of outgoing packets that were discarded even
  though they did not have errors.
* OutErrors: The number of outgoing packets that were discarded because
  of errors.
* OutUcastOctets: The number of octets of data transmitted without
  errors in unicast packets through this interface.
* OutMulticastOctets: The number of octets of data transmitted without
  errors in multicast packets through this interface.
* OutBroadcastOctets: The number of octets of data transmitted without
  errors in broadcast packets through this interface.

NetworkCountersWatch also displays the current download/upload speed
('Current Upload Speed' and 'Current Download Speed' columns) ,
calculated according to the change in InOctets and OutOctets counters.



Command-Line Options
====================



/stext <Filename>
Save the network counters into a simple text file.

/stab <Filename>
Save the network counters into a tab-delimited text file.

/scomma <Filename>
Save the network counters into a comma-delimited text file (csv).

/stabular <Filename>
Save the network counters into a tabular text file.

/shtml <Filename>
Save the network counters into HTML file (Horizontal).

/sverhtml <Filename>
Save the network counters into HTML file (Vertical).

/sxml <Filename>
Save the network counters into XML file.



Translating NetworkCountersWatch to other languages
===================================================

In order to translate NetworkCountersWatch to other language, follow the
instructions below:
1. Run NetworkCountersWatch with /savelangfile parameter:
   NetworkCountersWatch.exe /savelangfile
   A file named NetworkCountersWatch_lng.ini will be created in the
   folder of NetworkCountersWatch utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run NetworkCountersWatch, and all
   translated strings will be loaded from the language file.
   If you want to run NetworkCountersWatch without the translation,
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




NetRouteView v1.35
Copyright (c) 2010 - 2020 Nir Sofer
Web site: https://www.nirsoft.net



Description
===========

NetRouteView is a GUI alternative to the standard route utility
(Route.exe) of Windows operating system. It displays the list of all
routes on your current network, including the destination, mask, gateway,
interface IP address, metric value, type, protocol, age (in seconds),
interface name, and the MAC address.
NetRouteView also allows you to easily add new routes, as well as to
remove or modify existing static routes.

Notice: Currently, this utility doesn't support IPv6.



System Requirements
===================


* This utility works on any version of Windows, starting from Windows
  2000, and up to Windows 10.



Versions History
================


* Version 1.35:
  o When you add a new route, the new dialog-box is filled with the
    values you used in the previous time.
  o When you add a new route, NetRouteView now automatically fills
    the lowest metric value on your system.

* Version 1.30:
  o Added 'Run As Administrator' option (Ctrl+F11), which allows you
    to easily run NetRouteView as administrator on Windows
    Vista/7/8/2008/10 (For adding/removing/editing network routes)

* Version 1.25:
  o Added 'Sort On Every Refresh' option.

* Version 1.20:
  o Fixed bug: NetRouteView failed to load large amount of items.
  o Added 'Auto Size Columns+Headers' option, which allows you to
    automatically resize the columns according to the row values and
    column headers.
  o Fixed issue: The properties dialog-box and other windows opened
    in the wrong monitor, on multi-monitors system.
  o Added 'Mark Odd/Even Rows' option, under the View menu. When it's
    turned on, the odd and even rows are displayed in different color, to
    make it easier to read a single line.

* Version 1.15:
  o Added 'Auto Refresh' option.

* Version 1.10:
  o Added 'Put Icon On Tray' option.
  o Added 'Start As Hidden' option. When this option and 'Put Icon On
    Tray' option are turned on, the main window of NetRouteView will be
    invisible on start.

* Version 1.07:
  o Added 'Add Header Line To CSV/Tab-Delimited File' option. When
    this option is turned on, the column names are added as the first
    line when you export to csv or tab-delimited file.

* Version 1.06:
  o Fixed issue: Removed the wrong encoding from the xml string,
    which caused problems to some xml viewers.

* Version 1.05:
  o Added error messages when the action of adding/modifying/deleting
    a route fails.
  o Added Persistent column (Yes/No)
  o Added the ability to make a route persistent or none-persistent
    from the route new/modify window.

* Version 1.00 - First release.



Using NetRouteView
==================

NetRouteView doesn't require any installation process or additional dll
files. In order to start using it, simply copy the executable file
(NetRouteView.exe) to any folder you like, and run it.
The main window of NetRouteView displays the list of all your network
routes, like the 'print' command in the route utility of Windows. You can
select a single route and then delete it (Del key) or modify it (Ctrl+M).
Be aware that only routes with 'Static Route' value in the Protocol
column, can be deleted or modified. You can also add a new route by using
'New Route' option (Ctrl+N).

Notice: If you are using NetRouteView on Windows 7/Vista/2008 with UAC
turned on, you must right-click on NetRouteView.exe and choose 'Run As
Administrator' in order to be able to add, remove, or delete network
routes.



Using The 'Switch Metric Values' Option
=======================================

If you have more than one network adapters with Internet connection, the
'Metric' value is used to determine which Internet connection will be
used by default. (The operating system always use the route with lower
Metric value)
If you want to switch to the other network adapter, simply select both
network routes of these adapters, and then use the 'Switch Metric Values'
option. After the metric switching, the internet connection of the other
network adapter will be used.



Command-Line Options
====================



/stext <Filename>
Save the routing table into a regular text file.

/stab <Filename>
Save the routing table into a tab-delimited text file.

/scomma <Filename>
Save the routing table into a comma-delimited text file (csv).

/stabular <Filename>
Save the routing table into a tabular text file.

/shtml <Filename>
Save the routing table into HTML file (Horizontal).

/sverhtml <Filename>
Save the routing table into HTML file (Vertical).

/sxml <Filename>
Save the routing table into XML file.



Translating NetRouteView to other languages
===========================================

In order to translate NetRouteView to other language, follow the
instructions below:
1. Run NetRouteView with /savelangfile parameter:
   NetRouteView.exe /savelangfile
   A file named NetRouteView_lng.ini will be created in the folder of
   NetRouteView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run NetRouteView, and all
   translated strings will be loaded from the language file.
   If you want to run NetRouteView without the translation, simply rename
   the language file, or move it to another folder.



License
=======

This utility is released as freeware. You are allowed to freely
distribute this utility via floppy disk, CD-ROM, Internet, or in any
other way, as long as you don't charge anything for this. If you
distribute this utility, you must include all files in the distribution
package, without any modification.
If you want to distribute this utility with a commercial software
package, please contact NirSoft about licensing options.



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

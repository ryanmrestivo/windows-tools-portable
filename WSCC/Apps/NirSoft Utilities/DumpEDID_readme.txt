

DumpEDID v1.07
Copyright (c) 2006 - 2018 Nir Sofer
Web Site: http://www.nirsoft.net



Description
===========

DumpEDID is a small console application that extract the EDID ("Extended
display identification data") records from your computer, analyze it, and
dump it into the console window. EDID record provide essential
information about your monitor: manufacture week/year, monitor
manufacturer, monitor model, supported display modes, and so on...
You can also get the EDID records of a remote computer, if you login to
this computer with administrator rights.

License
=======

This utility is released as freeware. You are allowed to freely
distribute this utility via floppy disk, CD-ROM, Internet, or in any
other way, as long as you don't charge anything for this. If you
distribute this utility, you must include all files in the distribution
package, without any modification !



Disclaimer
==========

The software is provided "AS IS" without any warranty, either expressed
or implied, including, but not limited to, the implied warranties of
merchantability and fitness for a particular purpose. The author will not
be liable for any special, incidental, consequential or indirect damages
due to loss of data or any other reason.



Using DumpEDID
==============

DumpEDID is a console application, so in order the view the output, you
have to run it in console (Command-Prompt) window.
As with any console application, you dump the output into a file, for
example:
DumpEDID.exe > c:\temp\edid.txt

If you want to Get the EDID records of a remote computer, you can specify
the remote computer as parameter, for example:
DumpEDID.exe \\remote01

If you want to get only the active monitors, simply add -a to the
command-line, for example:
DumpEDID.exe -a
DumpEDID.exe -a \\remote01



System Requirement
==================

This utility works on Windows 2000/XP/2003/Vista/7/8. Windows 98/ME is
not supported.



Versions History
================


* Version 1.07 - You can now add -a to the command-line in order to get
  only the active monitors.
* Version 1.06 - The 'Active' status is now taken from the Registry
  (Control Subkey) when connecting a remote computer.
* Version 1.05 - Added 'Active' field (Doesn't work on remote
  computer), which shows whether the monitor is active.
* Version 1.02 - Added support for EDID Detailed Timing Descriptor, so
  DumpEDID will display accurate Maximum Resolution information for
  monitors with high resolution.
* Version 1.01 - Fixed bug: In some computers, the EDID information was
  loaded from the wrong hardware configuration.
* Version 1.00 - First release.



Feedback
========

If you have any problem, suggestion, comment, or you found a bug in my
utility, you can send a message to nirsofer@yahoo.com



AltStreamDump v1.05
Copyright (c) 2011 - 2012 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

AltStreamDump is a console application (Command Prompt) that dumps the
list of NTFS alternate streams found in the current directory. By using a
few command-line options, you can also instruct AltStreamDump to displays
the alternate streams list of other folders and to scan subfolders in the
desired folder depth.



Versions History
================


* Version 1.05
  o Fixed bug: AltStreamDump displayed alternate streams under the
    wrong folder.

* Version 1.00 - First release.



System Requirements
===================

This utility works on any version of Windows starting from Windows 2000
and up to Windows 7.



Using AltStreamDump
===================

AltStreamDump doesn't require any installation process or additional DLL
files. In order to use it, simply run it inside a 'Command Prompt' window.
By default AltStreamDump displays that alternate streams list for the
current directory. You can view the alternate streams of other folders by
using -f and -d command-line options.



Command Line Options
====================



-h
Displays command-line help.

-f [Folder Path]
Specifies the folder that you wish to scan

-d [Subfolders Depth]
Specified the depth of subfolders to scan. (0 = none, 1 = first level of
subfolders, and so on)

Example:
AltStreamDump.exe -f "c:\myfolder" -d 3



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



Feedback
========

If you have any problem, suggestion, comment, or you found a bug in my
utility, you can send a message to nirsofer@yahoo.com

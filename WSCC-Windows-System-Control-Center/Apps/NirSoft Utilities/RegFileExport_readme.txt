

RegFileExport v1.11
Copyright (c) 2010 - 2019 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

RegFileExport is a small console application that allows you to easily
extract data from offline Registry file located on another disk drive.
RegFileExport read the Registry file, ananlyze it, and then export the
Registry data into a standard .reg file of Windows. You can export the
entire Registry file, or only a specific Registry key.

RegFileExport may also be able to export some of the Registry data even
when the Registry file is corrupted and cannot be loaded by Windows.



System Requirements
===================

This utility works on any version of Windows, starting from Windows 2000,
and up to Windows 10.



Versions History
================


* Version 1.11:
  o Fixed bug: RegFileExport failed to handle properly large Registry
    values with more than 16344 bytes.

* Version 1.10:
  o Fixed bug: RegFileExport failed to export properly value names
    with '\' and '"' characters.

* Version 1.09:
  o Fixed bug: Under certain conditions, RegFileExport skipped half
    of subkeys or crashed while reading Registry key that had many
    subkeys.

* Version 1.08:
  o Fixed a glitch in the release of version 1.07 that caused it to
    stop working....

* Version 1.07:
  o Added support for UsrClass.dat hive (
    HKEY_CURRENT_USER\Software\Classes )

* Version 1.06:
  o Fixed issue: RegFileExport hang/freeze when reading invalid
    keys/values.

* Version 1.05:
  o Fixed problem with large Registry keys, like
    HKEY_LOCAL_MACHINE\Software\Classes
  o Added FF FE Unicode prefix, like in standard .reg file.

* Version 1.00 - First release.



Using RegFileExport
===================

RegFileExport is a console application designated to be used by advanced
users. RegFileExport accept 2 - 3 parameters, according to the following
syntax:

RegFileExport [Registry File] [Destination .Reg File] {Registry Key}

{Registry Key} is optional, if the key is specified, only this key and
all its subkeys will be exported into the .reg file. Otherwise, the
entire file will be exported.
if [Destination .Reg File] is an empty string ("") the Registry data will
be sent to the standard output.

Examples:
RegFileExport "E:\Windows\system32\config\SOFTWARE." "f:\temp\reg1.txt"
"HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion"
RegFileExport "SOFTWARE" "" "Software\Microsoft\Windows NT\CurrentVersion"
RegFileExport "NTUSER.DAT" "ntuser-reg.txt"
RegFileExport "NTUSER.DAT" "ntuser-reg.txt"
"HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion"




More Information
================


* RegFileExport can also export secret data that is only available for
  'SYSTEM' account, like the password/security information stored in
  SECURITY and SAM Registry hives.
* RegFileExport cannot export Registry data of your currently loaded
  operating system, because these files are locked by Windows.
* On Windows XP - If you want to extract Registry infromation from
  previous restore points, you can find the Registry files of every
  restore point under C:\System Volume
  Information\_restore{guid}\RPxxx\snapshot. However, you must change the
  permissions of this folder in order to access these files, or
  alternatively, you can run cmd.exe as a SYSTEM account (with 'at'
  command), and then you'll be able to access this folder and the
  Registry files that are stored in it. Be aware that the _restore{guid}
  subfolder also has 'hidden' attribute.



License
=======

This utility is released as freeware. You are allowed to freely use it at
your home or in your company. However, you are not allowed to make profit
from this software or to charge your customers for recovering their
Registry data with this tool, unless you got a permission from the
software author.
You are also allowed to freely distribute this utility via floppy disk,
CD-ROM, Internet, or in any other way, as long as you don't charge
anything for this. If you distribute this utility, you must include all
files in the distribution package, without any modification !



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

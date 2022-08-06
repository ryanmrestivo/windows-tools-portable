


WinDefLogView v1.00
Copyright (c) 2022 Nir Sofer
Web site: https://www.nirsoft.net/utils/windows_defender_log_Viewer.html



Description
===========

WinDefLogView is a tool for Windows 10 and Windows 11 that reads the
event log of Windows Defender (Microsoft-Windows-Windows
Defender/Operational) and displays a log of threats detected by Windows
Defender on your system. For every log line, the following information is
displayed: Filename, Detect Time, Threat Name, Severity, Category,
Detection User, Action, Origin, and more...

You can view the detected threats log on your local computer, on remote
computers on your network, and on external disk plugged to your computer.



System Requirements
===================


* This tool works with Windows Defender of Windows 10 and Windows 11.
  Both 32-bit and 64-bit systems are supported. You can also use this
  tool on older versions of Windows (e.g: Windows 7) to view the data on
  remote computer with Windows 10/11, or to view the data stored on
  external drive with Windows 10 or Windows 11.
* This tool is just a small standalone .exe file that you can run on
  any system without installing anything.



Start Using WinDefLogView
=========================

WinDefLogView doesn't require any installation process or additional dll
files. In order to start using it, simply run the executable file -
WinDefLogView.exe
After running it, the main window of WinDefLogView displays the log of
all threats detected on your system by Windows Defender. You can easily
export the list to html/xml/tab-delimited/comma-delimited file by using
the 'Save Selected Items' option. You can also copy the selected items to
the clipboard (Ctrl+C) and then paste them into Excel with Ctrl+V.



View detected threats on remote computer
========================================

If you want to view the log of detected Windows Defender threats on
remote computer, go to File -> Choose Data Source (or press F7), choose
'Remote Computer' in the 'load from' combo-box and then type the name or
IP address of the remote computer. You must have full admin access to the
remote computer in order to view the detected threats log.

If you want to view the detected threats on multiple remote computers,
choose the 'Multiple Remote Computers' option and then type the names of
the computers, delimited by comma.



View detected threats on external drive
=======================================

If you want to view the log of detected Windows Defender threats on
external disk plugged to your computer, go to File -> Choose Data Source
(or press F7), choose 'External Folder' in the 'load from' combo-box and
then choose the event log folder on the external drive (For example:
G:\Windows\System32\Winevt\Logs).
Be aware that you must have read access to the event log folder and you
may need to run this tool as Administrator in order to enable the read
access to this folder.
The file needed by this tool is Microsoft-Windows-Windows
Defender%4Operational.evtx
If the 'Read archive log files' option is enabled, WinDefLogView will
also try to read the archive log files.



Translating WinDefLogView to other languages
============================================

In order to translate WinDefLogView to other language, follow the
instructions below:
1. Run WinDefLogView with /savelangfile parameter:
   WinDefLogView.exe /savelangfile
   A file named WinDefLogView_lng.ini will be created in the folder of
   WinDefLogView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run WinDefLogView, and all
   translated strings will be loaded from the language file.
   If you want to run WinDefLogView without the translation, simply
   rename the language file, or move it to another folder.



License
=======

This utility is released as freeware. You are allowed to freely
distribute this utility via CD-ROM, DVD, Internet, or in any other way,
as long as you don't charge anything for this and you don't sell it or
distribute it as a part of commercial product. If you distribute this
utility, you must include all files in the distribution package, without
any modification !



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
utility, you can send a message to support@nirsoft.net

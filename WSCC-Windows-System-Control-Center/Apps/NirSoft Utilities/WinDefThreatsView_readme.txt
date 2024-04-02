


WinDefThreatsView v1.15
Copyright (c) 2019 - 2024 Nir Sofer
Web site: https://www.nirsoft.net/utils/windows_defender_threats_view.html



Description
===========

WinDefThreatsView is tool for Windows 11/10 that displays the list of all
threats detected by Windows Defender Antivirus and allows you to easily
set the default action (Allow, Quarantine, Clean, Remove, Block, or No
Action) for multiple threats at once. You can use this tool on your local
computer and also on remote computer, as long as you have permission to
access WMI on the remote machine.
For every threat, the following information is displayed: Filename,
Threat Name, Severity, Process Name, Initial Detect Time, Status Change
Time, Remediation Time, Threat ID, Threat Status, Default Threat Action,
and more...



System Requirements
===================

This tool works only on Windows 11, Windows 10 and Windows 8.1. Both
32-bit and 64-bit systems are supported. You can also use this tool on
Windows 7 to connect a Windows 11/10 remote computer.



Versions History
================


* Version 1.15
  o Added option to change the sorting column from the menu (View ->
    Sort By). Like the column header click sorting, if you click again
    the same sorting menu item, it'll switch between ascending and
    descending order. Also, if you hold down the shift key while choosing
    the sort menu item, you'll get a secondary sorting.
  o Added 'Sort By' toolbar button
  o Fixed a few high DPI mode issues
  o Fixed issue: When copying data to the clipboard or exporting to
    tab-delimited file, every line contained an empty field in the end of
    the line.

* Version 1.12
  o Added 'Start As Hidden' option. When this option and 'Put Icon On
    Tray' option are turned on, the main window of WinDefThreatsView will
    be invisible on start.
  o Fixed some display issues in high DPI mode.

* Version 1.11
  o Added 'Add Header Line To CSV/Tab-Delimited File' option (Turned
    on by default).

* Version 1.10
  o Added option to choose another font (name and size) to display in
    the main window.
  o When pressing F5 (Refresh) the refresh process is smoother,
    keeping the selected item and scroll position.

* Version 1.06
  o Added 'Put Icon On Tray' option.

* Version 1.05
  o You can now use any variable stored in the .cfg as command-line
    option. For example, in order to connect a remote computer that its
    IP address is 192.168.0.105 :
    WinDefThreatsView.exe /ConnectMode 2 /ComputerName 192.168.0.105

* Version 1.00 - First release.



Start Using WinDefThreatsView
=============================

WinDefThreatsView doesn't require any installation process or additional
DLL files. In order to start using it, simply run the executable file -
WinDefThreatsView.exe
After running WinDefThreatsView, the main window displays the list of all
threats detected by Windows Defender Antivirus.



Connect Windows Defender on remote computer
===========================================

In order to view the Windows Defender threats on a remote computer,
simply open the 'Advanced Options' window (F9), choose the 'Load threats
data from remote computer' option, type the IP address or the computer
name of the remote computer and then press the 'Ok' button. If you get
'Access Denied' error on the status bar, you may also need to specify the
user name and password to connect the remote computer. Be aware that this
feature works only if you have permission to access WMI on the remote
machine.



Set default action of Windows Defender
======================================

After the list of all Windows Defender threats is displayed on the main
window, you can select one or more threats and then set the default
action for these threats. You can set on of the following actions: Allow,
Quarantine, Clean, Remove, Block, or No Action. You can set the default
action for your local computer and for remote computer on your network.
You can use this feature to quickly handle multiple false positive
issues: Simply select the threats that are false positives, set their
default action to 'Allow' and then WinDefThreatsView will not block
anymore.

Be aware that setting the default action of Windows Defender threat
requires elevation (Run As Administrator)



View threat information
=======================

You can get more information about Windows Defender threat from Microsoft
Web site by selecting the threat item and using the 'Open Threat Web
Page' option (Ctrl+W).



Command-Line Options
====================



/ConnectMode <Mode>
Specifies the connect mode. 1 = local comouter, 2 = remote computer

/ComputerName <Name>
Specifies the name or IP address of the remote computer. (For using with
/ConnectMode 2)

/UseLoginInfo <0 | 1>
Specifies whether to connect the remote computer with the specified user
name and password. 0 = No, 1 = Yes.

/UserName <Name>
Specifies the user name to connect the remote computer. (For using with
/ConnectMode 2 and /UseLoginInfo 1)

/Password <Password>
Specifies the password to connect the remote computer. (For using with
/ConnectMode 2 and /UseLoginInfo 1)

/stext <Filename>
Save the threats list of Windows Defender to a simple text file.

/stab <Filename>
Save the threats list of Windows Defender to a tab-delimited text file.

/scomma <Filename>
Save the threats list of Windows Defender to a comma-delimited text file
(csv).

/shtml <Filename>
Save the threats list of Windows Defender to HTML5 file (Horizontal).

/sverhtml <Filename>
Save the threats list of Windows Defender to HTML5 file (Vertical).

/sxml <Filename>
Save the threats list of Windows Defender to XML file.

/sjson <Filename>
Save the threats list of Windows Defender to JSON file.

/sort <column>
This command-line option can be used with other save options for sorting
by the desired column. The <column> parameter can specify the column
index (0 for the first column, 1 for the second column, and so on) or the
name of the column, like "Threat Name" and "Filename". You can specify
the '~' prefix character (e.g: "~Initial Detect Time") if you want to
sort in descending order. You can put multiple /sort in the command-line
if you want to sort by multiple columns.



Translating WinDefThreatsView to other languages
================================================

In order to translate WinDefThreatsView to other language, follow the
instructions below:
1. Run WinDefThreatsView with /savelangfile parameter:
   WinDefThreatsView.exe /savelangfile
   A file named WinDefThreatsView_lng.ini will be created in the folder
   of WinDefThreatsView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run WinDefThreatsView, and all
   translated strings will be loaded from the language file.
   If you want to run WinDefThreatsView without the translation, simply
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

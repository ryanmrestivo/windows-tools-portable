


InstalledPackagesView v1.05
Copyright (c) 2017 - 2019 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

InstalledPackagesView is a tool for Windows that displays the list of all
software packages installed on your system with Windows Installer, and
lists the files, Registry keys, and .NET Assemblies associated with them.
For every installed software, the following information is displayed:
Display Name, Display Version, Install Date, Registry Time, Estimated
Size, Install Location, Install Source, MSI Filename (In
C:\Windows\Installer), and more...
You can watch the installed software packages information from your local
system or from another system on external hard-drive.

The installed software information is loaded from the following Registry
keys:
HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Installer\User
Data\Products
HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Installer\User
Data\Components

Be aware that this tool lists only software installed by Windows
Installer (MSI), it doesn't list any software installed by other
installers.



System Requirements
===================

This utility works on any version of Windows, starting from Windows XP
and up to Windows 10. Both 32-bit and 64-bit systems are supported.



Versions History
================


* Version 1.05:
  o Added /cfg command-line option to start InstalledPackagesView
    with the specified config file.
  o Added 'Save File Encoding' option.

* Version 1.02:
  o Added 'Load Product Icon' option. When it's turned on,
    InstalledPackagesView displays the icon of the product, if it's
    available.

* Version 1.01:
  o You can now resize the properties window, and the last
    size/position of this window is saved in the .cfg file.
  o You can now send the data to stdout by specifying empty string as
    filename, for example:
    InstalledPackagesView.exe /scomma "" | more

* Version 1.00 - First release.



Start Using InstalledPackagesView
=================================

InstalledPackagesView doesn't require any installation process or
additional DLL files. In order to start using it, simply run the
executable file - InstalledPackagesView.exe

After running InstalledPackagesView, the upper pane of the main window
displays the list of all MSI packages installed on your system. When
selecting an item in the upper pane, the lower pane displays the list of
files, Registry keys, and NET Assemblies associated with the selected
software package.

If you want to view the information of external drive, go to the
'Advanced Options' window (F9), choose to load from external drive and
then type the config folder (For example: F:\windows\system32\config) on
the external drive.



Command-Line Options
====================



/stext <Filename>
Save the installed Windows Installer packages into a simple text file.

/stab <Filename>
Save the installed Windows Installer packages into a tab-delimited text
file.

/scomma <Filename>
Save the installed Windows Installer packages into a comma-delimited text
file (csv).

/stabular <Filename>
Save the installed Windows Installer packages into a tabular text file.

/shtml <Filename>
Save the installed Windows Installer packages into HTML file (Horizontal).

/sverhtml <Filename>
Save the installed Windows Installer packages into HTML file (Vertical).

/sxml <Filename>
Save the installed Windows Installer packages into XML file.

/cfg <Filename>
Start InstalledPackagesView with the specified configuration file. For
example:
InstalledPackagesView.exe /cfg "c:\config\ipv.cfg"
InstalledPackagesView.exe /cfg "%AppData%\InstalledPackagesView.cfg"



Translating InstalledPackagesView to other languages
====================================================

In order to translate InstalledPackagesView to other language, follow the
instructions below:
1. Run InstalledPackagesView with /savelangfile parameter:
   InstalledPackagesView.exe /savelangfile
   A file named InstalledPackagesView_lng.ini will be created in the
   folder of InstalledPackagesView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run InstalledPackagesView, and
   all translated strings will be loaded from the language file.
   If you want to run InstalledPackagesView without the translation,
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

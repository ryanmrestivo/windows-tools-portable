


AppCompatibilityView v1.07
Copyright (c) 2018 - 2022 Nir Sofer
Web site: https://www.nirsoft.net



Description
===========

AppCompatibilityView is a simple tool that displays the list of all
programs that run with different compatibility settings, stored in the
Registry under HKEY_CURRENT_USER\Software\Microsoft\Windows
NT\CurrentVersion\AppCompatFlags\Layers and
HKEY_LOCAL_MACHINE\Software\Microsoft\Windows
NT\CurrentVersion\AppCompatFlags\Layers keys.
It also allows you to easily modify or delete the compatibility settings
of multiple applications at once.



System Requirements
===================

This utility works in any version of Windows, starting from Windows XP
and up to Windows 11. Both 32-bit and 64-bit systems are supported.



Versions History
================


* Version 1.07:
  o Added 'Add New Item' option (Ctrl+N), under the Action menu.

* Version 1.06:
  o Fixed some high DPI mode issues.

* Version 1.05:
  o Added support for the following Windows 10 compatibility
    settings: 'Program DPI' ('I signed in to Windows' or 'I open this
    program') , 'Disable Fullscreen Optimizations'.

* Version 1.03:
  o Added 'Copy Clicked Cell' option to the right-click context menu,
    which copies to the clipboard the text of cell that you right-clicked
    with the mouse.
  o When pressing F5 (Refresh) the refresh process is smoother,
    keeping the selected item and scroll position.

* Version 1.02:
  o Added 'Save File Encoding' option.

* Version 1.01:
  o Added /cfg command-line option to start AppCompatibilityView with
    the specified config file.
  o Added 'Add Header Line To CSV/Tab-Delimited File' option (Turned
    on by default).

* Version 1.00 - First release.



Start Using AppCompatibilityView
================================

This utility doesn't require any installation process or additional DLL
files. In order to start using it, simply run the executable file -
AppCompatibilityView.exe
After running AppCompatibilityView, the main window displays the list of
all application compatibility entries on your system.

You can select one or more entries and then use the following menus to
modify the compatibility settings:
* Set Windows Version Compatibility Mode: Allows you to run the
  specified program in compatibility mode of older version of Windows.
  You can choose one of the following versions of Windows: Windows 95,
  Windows 98, Windows NT 4.0 SP5, Windows 2000, Windows XP SP2, Windows
  XP SP3, Windows Server 2003 SP1, Windows Server 2008 SP1, Windows
  Vista, Windows Vista SP1, Windows Vista SP2, Windows 7, Windows 8.
* Remove Windows Version Compatibility Mode: Allows you to remove
  compatibility mode added with 'Set Windows Version Compatibility Mode'
  menu or from the compatibility options of Windows.
* Add Compatibility Option: Allows you to add compatibility setting to
  the selected programs. The following compatibility settings are
  available: Run As Admin, Run As Invoker, High DPI Scaling -
  Application, High DPI Scaling - System (For Windows 10), High DPI
  Scaling - System Enhanced (For Windows 10) , Disable Desktop
  Composition, Disable Visual Themes, 256 Colors Mode, 16-Bit Colors
  Mode, 640X480 Resolution, DisableNXShowUI, ElevateCreateProcess,
  DisableUserCallbackException
  A few of these options are not available in the compatibility options
  of Windows: 'Run As Invoker' allows you to run a program that requires
  elevation ('Run As Administrator') without elevation. The
  ElevateCreateProcess and DisableUserCallbackException items are added
  by Windows operating system under some circumstances.
* Remove Compatibility Option: Allows you to remove compatibility
  settings added with 'Add Compatibility Option' menu or with the
  compatibility options of Windows.



Adding/Removing Compatibility Entries
=====================================

If you want to remove existing compatibility entries, simply select them
and use the 'Delete Selected Items' option. If you want to add new
compatibility entry, simply drag the desired .exe file from Windows
Explorer into the main window of AppCompatibilityView. You can also
choose the 'Add New Item' option from the Action menu (or simply press
Ctrl+N), and then choose the .exe file you want to add.
After you add new compatibility entry it's empty and then you can use the
'Set Windows Version Compatibility Mode' and the 'Add Compatibility
Option' menus to add compatibility options into the new entry.



Command-Line Options
====================



/stext <Filename>
Save the application compatibility list into a simple text file.

/stab <Filename>
Save the application compatibility list into a tab-delimited text file.

/scomma <Filename>
Save the application compatibility list into a comma-delimited text file
(csv).

/stabular <Filename>
Save the application compatibility list into a tabular text file.

/shtml <Filename>
Save the application compatibility list into HTML file (Horizontal).

/sverhtml <Filename>
Save the application compatibility list into HTML file (Vertical).

/sxml <Filename>
Save the application compatibility list into XML file.

/sort <column>
This command-line option can be used with other save options for sorting
by the desired column. The <column> parameter can specify the column
index (0 for the first column, 1 for the second column, and so on) or the
name of the column, like "Filename" and "Compatibility String". You can
specify the '~' prefix character (e.g: "~Filename") if you want to sort
in descending order. You can put multiple /sort in the command-line if
you want to sort by multiple columns.



/cfg <Filename>
Start AppCompatibilityView with the specified configuration file. For
example:
AppCompatibilityView.exe /cfg "c:\config\acv.cfg"
AppCompatibilityView.exe /cfg "%AppData%\AppCompatibilityView.cfg"



Translating AppCompatibilityView to other languages
===================================================

In order to translate AppCompatibilityView to other language, follow the
instructions below:
1. Run AppCompatibilityView with /savelangfile parameter:
   AppCompatibilityView.exe /savelangfile
   A file named AppCompatibilityView_lng.ini will be created in the
   folder of AppCompatibilityView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run AppCompatibilityView, and all
   translated strings will be loaded from the language file.
   If you want to run AppCompatibilityView without the translation,
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




ShellBagsView v1.30
Copyright (c) 2008 - 2020 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

Each time that you open a folder in Explorer, Windows automatically save
the settings of this folder into the Registry. This utility displays the
list of all folder settings saved by Windows. For each folder, the
following information is displayed: The date/time that you opened it, the
entry number, display mode (Details, Icons, Tiles, and so on...), the
last position of the window, and the last size of the window.



System Requirements
===================

This utility works on Windows XP, Windows Server 2003/2008, Windows
Vista, Windows 7, Windows 8.x, and Windows 10. Previous versions of
Windows are not supported.



Registry Keys
=============

Windows uses the following Registry keys to save the folders information:
* HKEY_CURRENT_USER\Software\Microsoft\Windows\ShellNoRoam
* HKEY_CURRENT_USER\Software\Microsoft\Windows\Shell
* HKEY_CURRENT_USER\Software\Classes\Local
  Settings\Software\Microsoft\Windows\Shell (Only in Windows Vista)



Versions History
================


* Version 1.30:
  o Added option to connect a remote computer on your network. You
    can view the Explorer folders of the users currently logged on on the
    remote machine, as well as modify their view mode (Tiles, Details,
    Content, List, Small Icons, Medium Icons, Large Icons)
  o In order to connect a remote computer, simply go to the 'Advanced
    Options' window (F7), choose 'Remote Computer' as data source, type
    the name or IP address of the remote computer, and press the OK
    button.
  o Added 'User Name' column, which displays the user name when
    connecting a remote computer.

* Version 1.25:
  o Added 'Set Mode' option (File -> Set Mode), which allows you to
    set the mode of the selected Windows Explorer folders: Tiles,
    Details, Content, List, Small Icons, Medium Icons, Large Icons.
  o Added 'RegEdit Open Mode' option - 'Without Elevation' or 'With
    Elevation'.
  o Added 'Icon Size' column.
  o When pressing F5 (Refresh) the refresh process is smoother,
    keeping the selected item and scroll position.

* Version 1.21:
  o Fixed bug: On Windows 10/8 - In some folder names, ShellBagsView
    omitted the first 2 characters.

* Version 1.20:
  o Added option to read the information from external Registry hives
    (ntuser.dat and UsrClass.dat) - In 'Advanced Options' window (F7).
  o Added 'Run As Administrator' option (Ctrl+F11), which allows you
    to easily run ShellBagsView as administrator on Windows
    Vista/7/8/2008/10 (Needed for the external Registry hive feature).

* Version 1.16:
  o Fixed to show the folder path properly on Windows 8.1

* Version 1.15:
  o The 'Last Modified Time' columns now takes the date/time from the
    BagMRU key (instead of the slot key), which displays more accurately
    represents the time that the folder was opened. The date/time of the
    slot key is displayed under the new 'Slot Modified Time' column.
  o Fixed issue: The properties and the other windows opened in the
    wrong monitor, on multi-monitors system.

* Version 1.09:
  o Fixed bug: ShellBagsView crashed if there is a very deep folder
    hierarchy with 20 subfolders or more.

* Version 1.08:
  o Fixed bug: ShellBagsView failed to read the folders information
    if the NodeSlots value was very large.

* Version 1.07:
  o Fixed to work properly with the Registry keys of Windows 7.

* Version 1.06:
  o Added command-line options for sorting.

* Version 1.05:
  o Added 'Slot Key' column.
  o Added 'Open Slot Key In RegEdit' option.
  o Added 'Reset Selected Items' option (Reset the folders settings
    to the default of Windows)
  o Added 'Open Selected Folder' option.

* Version 1.00 - First release.



Using ShellBagsView
===================

ShellBagsView doesn't require any installation process or additional DLL
files. In order to start using it, simply run the executable file -
ShellBagsView.exe
After running it, the main window of ShellBagsView displays the list of
all folder entries in your system.



Command-Line Options
====================



/stext <Filename>
Save the list of folders into a regular text file.

/stab <Filename>
Save the list of folders into a tab-delimited text file.

/scomma <Filename>
Save the list of folders into a comma-delimited text file.

/stabular <Filename>
Save the list of folders into a tabular text file.

/shtml <Filename>
Save the list of folders into HTML file (Horizontal).

/sverhtml <Filename>
Save the list of folders into HTML file (Vertical).

/sxml <Filename>
Save the list of folders to XML file.

/sort <column>
This command-line option can be used with other save options for sorting
by the desired column. If you don't specify this option, the list is
sorted according to the last sort that you made from the user interface.
The <column> parameter can specify the column index (0 for the first
column, 1 for the second column, and so on) or the name of the column,
like "Path" and "Last Modified Time". You can specify the '~' prefix
character (e.g: "~Last Modified Time") if you want to sort in descending
order. You can put multiple /sort in the command-line if you want to sort
by multiple columns.

Examples:
ShellBagsView.exe.exe /shtml "f:\temp\history.html" /sort 2 /sort ~1
ShellBagsView.exe.exe /shtml "f:\temp\history.html" /sort "Last Modified
Time"

/nosort
When you specify this command-line option, the list will be saved without
any sorting.



Translating ShellBagsView to other languages
============================================

In order to translate ShellBagsView to other language, follow the
instructions below:
1. Run ShellBagsView with /savelangfile parameter:
   ShellBagsView.exe /savelangfile
   A file named ShellBagsView_lng.ini will be created in the folder of
   ShellBagsView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run ShellBagsView, and all
   translated strings will be loaded from the language file.
   If you want to run ShellBagsView without the translation, simply
   rename the language file, or move it to another folder.



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

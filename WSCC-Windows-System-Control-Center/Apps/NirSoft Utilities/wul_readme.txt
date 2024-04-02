


WinUpdatesList v1.33
Copyright (c) 2004 - 2017 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

WinUpdatesList displays the list of all Windows updates (Service Packs
and Hotfixes) installed on your local computer. For hotfix updates, this
utility also displays the list of files updated with these hotfixes. In
addition, it allows you to instantly open the Web link in Microsoft Web
site that provides more information about the selected update, uninstall
an update, copy the update information to the clipboard, or save it to
text/HTML/XML file.



System Requirements
===================

This utility works on Windows 98, Windows ME, Windows 2000, and Windows
XP. On Windows 98/ME, some columns are not displayed, because the related
information is not stored in the Registry as in Windows 2000/XP.
On Windows 10/8/7/Vista/2008 - The windows updates information is
displayed in the upper pane, but there is no installed files information
in the lower pane. Also on these version of Windows, you cannot view the
information on remote computer.



Versions History
================


* Version 1.33:
  o Fixed issue: The 'Installation Date' column displayed the time in
    GMT instead of local time.

* Version 1.32:
  o Fixed the URLs on Microsoft Web site to the current format:
    http://support.microsoft.com/kb/xxxxxx
  o Fixed to display the 'Last Modified Time' values according to
    daylight saving time settings.

* Version 1.31:
  o Added 'Mark Odd/Even Rows' option, under the View menu. When it's
    turned on, the odd and even rows are displayed in different color, to
    make it easier to read a single line.
  o Added 'Add Header Line To CSV/Tab-Delimited File' option. When
    this option is turned on, the column names are added as the first
    line when you export to csv or tab-delimited file.

* Version 1.30:
  o Added partial support for Windows 7/Vista/2008. The windows
    updates information is displayed in the upper pane, but there is no
    installed files information in the lower pane. Also on these version
    of Windows, you cannot view the information on remote computer.
  o Added 'Long Description' column, for Windows 7/Vista/2008 only.

* Version 1.23:
  o Fixed bug: The dates displayed in system locale, instead of user
    locale.

* Version 1.22:
  o Added support for saving as comma-delimited file.
  o Fixed bug: The main window lost the focus when the user switched
    to another application and then returned back to WinUpdatesList.

* Version 1.21:
  o Fixed bug: Crash when running wul.exe with command-line
    parameters.

* Version 1.20:
  o Changed Operating System column to Application.
  o Added filter by application (Windows, .NET, and others)
  o Added 'Last Modified Time' column.
  o Fixed Web link for .NET Updates.
  o Configuration is now saved to cfg file instead of the Registry.
  o Updates with extra sub-key level (in the Registry) are now
    displayed properly.

* Version 1.13: A tooltip is now displayed when a string in a column is
  longer than the column length.
* Version 1.12: Added support for Windows XP styles.
* Version 1.11:
  o On Windows 2000/XP: new command-line options that allows you to
    connect another operating system on local or remote computer.
  o Computer name is now added to XML and HTML files.

* Version 1.10:
  o Added support for Windows 98/ME
  o 'Open Web Link' now opens each link in a new browser window.
  o Command-Line support.

* Version 1.00 - First Release.



Using WinUpdatesList
====================

WinUpdatesList is a standalone program, so it doesn't require any
installation or additional DLLs. In order to start using it, just copy it
to any folder you like, and run it. If you want, you can also install
WinUpdatesList on your computer with uninstall support, by downloading
and running the self-install executable file.

The main window of WinUpdatesList contains 2 panes: The upper pane
displays the list of all updates installed on your computer. When you
select an hotfix in the upper pane, the lower pane display the list of
files installed with the selected hotfix.
If you want to get more information about a specific update, select the
desired item in the upper pane, and then from the File menu (or from the
popup menu) choose 'Open Web Link'. This option opens your browser with a
Web page in Microsoft site that provides information about the selected
Windows update.

Notice: Some operations, like saving to file or copying to the clipboard,
are performed on the pane that currently has the focus. For example: If
you press Ctrl+C while the lower pane is focused, the selected files list
will be copied to the clipboard. If the upper pane has the focus, the
selected updates in the upper pane will be copied.



Connecting to another operating system (Windows 2000/XP only)
=============================================================

Starting from v1.11, WinUpdatesList provides 2 methods for viewing the
Windows Updates of another operating system:
1. On local computer: If you have more than one instance of Windows
   2000/XP operating system on the same computer, you can view the
   Windows updates list of the other operating system by using /another
   command-line parameter.
   For example:
   wul.exe /another e:\winnt

   The second parameter specifies the Windows folder of the operating
   system.
   Be aware that when you use this option, WinUpdatesList loads the
   Registry of the other operating system as a new hive under
   HKEY_LOCAL_MACHINE, and than unloads it after you exit from
   WinUpdatesList.


2. On remote computer: If you have a remote computer with Windows
   2000/XP operating system, your can view the Windows updates list of
   this computer by using /remote command-line parameter.
   For example:
   wul.exe /remote \\192.168.0.10
   You must connect the remote computer with administrative rights in
   order that this option will work properly. It's also recommended to
   enable admin shares (C$, D$, and so on) on the remote computer.



Translating to another language
===============================

WinUpdatesList allows you to easily translate all menus, dialog-boxes,
and other strings to other languages.
In order to do that, follow the instructions below:
1. Run WinUpdatesList with /savelangfile parameter:
   wul.exe /savelangfile
   A file named wul_lng.ini will be created in the folder of
   WinUpdatesList utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all menus, dialog-boxes, and string entries to the
   desired language.
4. After you finish the translation, Run WinUpdatesList, and all
   translated strings will be loaded from the language file.
   If you want to run WinUpdatesList without the translation, simply
   rename the language file, or move it to another folder.



Command-Line Options
====================



/stext <Filename>
Save windows updates list into a regular text file.

/stab <Filename>
Save windows updates list into a tab-delimited text file.

/scomma <Filename>
Save windows updates list into a comma-delimited text file.

/stabular <Filename>
Save windows updates list into a tabular text file.

/shtml <Filename>
Save windows updates list into HTML file.

/sverhtml <Filename>
Save windows updates list into HTML file. (vertical)

/sxml <Filename>
Save windows updates list into XML file.

/another <Windows Folder>
connect to another instance of operating system on the same computer
(Windows 2000/XP only). You can combine this option with one of the save
options in order to save the Windows updates list of another operating
system.

Examples:
wul.exe /shtml c:\temp\1.html /another d:\winnt
wul.exe /another f:\winnt

/remote <Computer Name>
Connect to remote Windows 2000/XP operating system. You can combine this
option with one of the save options in order to save the Windows updates
list of a remote computer.

Examples:
wul.exe /shtml c:\temp\1.html /remote \\comp01
wul.exe /another /remote \\192.168.0.101



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

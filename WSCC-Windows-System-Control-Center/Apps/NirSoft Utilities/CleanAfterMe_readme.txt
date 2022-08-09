


CleanAfterMe v1.37
Copyright (c) 2008 - 2010 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

CleanAfterMe allows you to easily clean files and Registry entries that
are automatically created by the Windows operating system during your
regular computer work.
With CleanAfterMe, you can clean the cookies/history/cache/passwords of
Internet Explorer, the 'Recent' folder, the Registry entries that record
the last opened files, the temporary folder of Windows, the event logs,
the Recycle Bin, and more.

CleanAfterMe is a portable application. This means that you can run it
without any installation and without leaving any trace in the Registry.
You can also run this program from a USB flash drive: In order to do
that, simply copy the executable file of CleanAfterMe (CleanAfterMe.exe)
into the USB flash drive, and run it from there.



System Requirements
===================

This utility works under Windows 2000, Windows XP, Windows Server 2003,
and Windows Vista.



Versions History
================


* Version 1.37:
  o Removed the option to delete .eml cache files of Windows Live
    Mail. This option was good for HotMail and IMAP accounts, but for
    POP3 accounts, it might delete real email messages.

* Version 1.36:
  o Added support for Opera 10.
  o Made another change in cleaning the 'installed USB devices', and
    Hopefully, this change will fix the problem of disconnecting the USB
    mouse/keyboard in some computers.

* Version 1.35:
  o Added new cleaning items: DirectInput MRU, Direct3D MRU, and
    Windows Prefetch Files (*.pf).
  o Added Unicode header (0xff, 0xfe) to the log files saved by
    CleanAfterMe.

* Version 1.30:
  o New option: Fill files with zero bytes before deleting them (In
    Advanced Options)
  o New option: Don't ask me before cleaning my temporary folder (In
    Advanced Options)
  o New cleaning items for Outlook/Word/Office temporary folder.

* Version 1.25:
  o Added command-line support (/clean and /report)

* Version 1.21:
  o Fixed bug: In some computers, when cleaning USB devices, the USB
    mouse/keyboard devices were also removed, and the user had to unplug
    and plug them again...

* Version 1.20:
  o Added support for cleaning 'UserAssist' Registry key.
  o Added support for cleaning Visual Studio MRU lists. (Displayed
    only when Visual Studio installation is detected.)
  o Added support for cleaning Acrobat Reader MRU list. (Displayed
    only when Acrobat Reader installation is detected.)

* Version 1.16:
  o Fixed bug: CleanAfterMe failed to clean the history file of
    Firefox 3.0.1
  o New cleaning item: Installed USB devices.

* Version 1.15:
  o New option: Remember Last Settings.
  o New cleaning items: Recent files list of Microsoft Office and
    Windows Media Player, and .eml files cache of Windows Live Mail.
  o New cleaning item: Clean Firefox 3 History (this option delete
    the moz_historyvisits table of places.sqlite, without affecting the
    bookmarks and other data in this file)

* Version 1.11:
  o Fixed bug: Cleaning hitsory file caused a problem with Bookmarks
    on Firefox 3.

* Version 1.10:
  o Added support for Firefox (Displayed only when Firefox folder is
    detected)
  o Added support for Opera Web browser (Displayed only when Opera
    folder is detected)
  o Added support for cleaning the last logged-on user name.
  o The main dialog-box of CleanAfterMe is now resizable.
  o In cleaing report: Display the number of files to delete and the
    total files size to delete.

* Version 1.01 - Fixed bug: CleanAfterMe hangs when choosing 'no' to
  'Do you want to clean selected items' question.
* Version 1.00 - First release.



Using CleanAfterMe
==================

In order to start using CleanAfterMe, simply run the executable file -
CleanAfterMe.exe
In the main window of CleanAfterMe, you can choose what do you want to
clean, by selecting the desired items. You must read the description of
each cleaning item before selecting it, so you won't clean something that
you want to keep. For some of the cleaning items, you can also use the
'Open' button in order to view the folder or Registry key that is going
to be cleaned.

After you selected the desired items that you wish to clean, you can
click the 'Show Cleaning Report' button. When using this option,
CleanAfterMe will show you the list of all files and Registry values that
are going to be deleted, but without actually cleaning anything.
After looking in the cleaning list and you see that everything is fine,
you can start the cleaning process by clicking the 'Clean Selected Items'
button.



Using CleanAfterMe From Command-Line
====================================



/clean <Log Filename>
Clean the items that you selected in the last time that you used
CleanAfterMe. The cleaning information will be saved into the Log
Filename. You can specify an empty string if you don't want to write the
log information to file.

Examples:
CleanAfterMe.exe /clean "c:\temp\clean.log"
CleanAfterMe.exe /clean ""

/report <Log Filename>
Save the cleaning report (only report, without cleaning anything) for the
items that you selected in the last time that you used CleanAfterMe. The
cleaning report will be saved into the specified filename.



Translating CleanAfterMe to other languages
===========================================

In order to translate CleanAfterMe to other language, follow the
instructions below:
1. Run CleanAfterMe with /savelangfile parameter:
   CleanAfterMe.exe /savelangfile
   A file named CleanAfterMe_lng.ini will be created in the folder of
   CleanAfterMe utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run CleanAfterMe, and all
   translated strings will be loaded from the language file.
   If you want to run CleanAfterMe without the translation, simply rename
   the language file, or move it to another folder.



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

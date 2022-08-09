


ShellMenuNew v1.02
Copyright (c) 2010 - 2013 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

ShellMenuNew is a small utility that displays the list of all menu items
in the 'New' submenu of Windows Explorer. It allows you to easily disable
unwanted menu items, so this 'New' submenu will display only the items
that you need.



System Requirements
===================


* This utility works on any version of Windows, starting from Windows
  2000, and up to Windows 7.



Versions History
================


* Version 1.02:
  o Fixed bug: if ShellMenuNew disabled a menu item, and then another
    software created this menu item again, ShellMenuNew displayed this
    menu item as disabled while it was actually active.

* Version 1.01 - Fixed bug: ShellMenuNew failed to display menu items
  that have been disabled previously.
* Version 1.00 - First release.



Using ShellMenuNew
==================

ShellMenuNew doesn't require any installation process or additional dll
files. In order to start using it, simply run the executable file -
ShellMenuNew.exe

After running it, the main window of ShellMenuNew displays the list of
all 'New' menu items found in your Registry. You can select one or more
menu items and then disable/enable them. If you are a professional/power
user, you can also select a single menu item, use the 'Open In RegEdit'
option, and then manually edit or delete the menu item in RegEdit.

Notice: When you enable or disable a menu item and then immediately
right-click in Explorer, you won't see the change yet. Only after you
open the new menu in the second time, you'll see the effect of your
disable/enable change. It's not a bug in ShellMenuNew, it simply the way
that Explorer new menu is loaded.
Also, be aware that under Windows 2000/XP, 'Automatic Desktop Refresh'
option must be checked in order to see the disable/enable changes. If
this option is not set, you'll see the change only after reboot. Under
Windows 7/Vista, 'Automatic Desktop Refresh' option is not required.



Command-Line Options
====================



/stext <Filename>
Save the new menu items into a regular text file.

/stab <Filename>
Save the new menu items into a tab-delimited text file.

/scomma <Filename>
Save the new menu items into a comma-delimited text file (csv).

/stabular <Filename>
Save the new menu items into a tabular text file.

/shtml <Filename>
Save the new menu items into HTML file (Horizontal).

/sverhtml <Filename>
Save the new menu items into HTML file (Vertical).

/sxml <Filename>
Save the new menu items into XML file.



Translating ShellMenuNew to other languages
===========================================

In order to translate ShellMenuNew to other language, follow the
instructions below:
1. Run ShellMenuNew with /savelangfile parameter:
   ShellMenuNew.exe /savelangfile
   A file named ShellMenuNew_lng.ini will be created in the folder of
   ShellMenuNew utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run ShellMenuNew, and all
   translated strings will be loaded from the language file.
   If you want to run ShellMenuNew without the translation, simply rename
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

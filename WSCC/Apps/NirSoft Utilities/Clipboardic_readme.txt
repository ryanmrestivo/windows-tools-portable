


Clipboardic v1.15
Copyright (c) 2009 - 2017 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

Clipboardic is a small utility that listen to the clipboard activity, and
each time that you copy something into the clipboard, it automatically
save the copied data into Windows clipboard file (.clp). Later, when you
need the copied data again, you can simply select the right clipboard
file, and Clipboardic will automatically insert it into the clipboard.
Clipboardic also allows you to easily share the clipboard data between
multiple computers on your local network.



System Requirements
===================

Clipboardic works on any version of Windows, from Windows 2000 to Windows
10.



Versions History
================


* Version 1.15:
  o Added lower pane that displays image preview of the selected
    clipboard item (Only when the select clipboard item is bitmap).

* Version 1.12:
  o Added 'Always On Top' option.

* Version 1.11:
  o Added 'Sort On Every Update' option.

* Version 1.10:
  o New option: Put Icon On Tray.
  o New option: Delete Selected Clipboard Files.

* Version 1.00 - First release.



Using Clipboardic
=================

Clipboardic doesn't require any installation process or additional dll
files. In order to start using it, simply run the executable file -
Clipboardic.exe
If you want to share the clipboard data in multiple computers on your
network, you have to put Clipboardic.exe in a shared network drive, and
then run Clipboardic.exe in all computers that you want to share the
clipboard (you must run it from the same shared folder).
After running Clipboardic, the main window displays the list of available
clipboard files. Each time that you copy something to the clipboard, a
new item is added. If you run Clipboardic in multiple computers, you can
see the clipboard files of all other computers, you can identify the file
owner by looking in the 'Computer Name' column.
When you select a file in Clipboardic's main window, its content is
automatically copied into the clipboard. If you have too much files in
Clipboardic, you can use the 'Clear All My Clipboard Files' option.



Translating Clipboardic to other languages
==========================================

In order to translate Clipboardic to other language, follow the
instructions below:
1. Run Clipboardic with /savelangfile parameter:
   Clipboardic.exe /savelangfile
   A file named Clipboardic_lng.ini will be created in the folder of
   Clipboardic utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run Clipboardic, and all
   translated strings will be loaded from the language file.
   If you want to run Clipboardic without the translation, simply rename
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

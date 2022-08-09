


CustomExplorerToolbar v1.05
Copyright (c) 2011 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

CustomExplorerToolbar is small utility for Windows 7 only, which allows
you to easily customize the toolbar of Windows Explorer, and add buttons
that were existed in previous versions of Windows, like Copy, Cut, Paste,
Select All, and more.
This utility also allows you to remove the toolbar buttons that you
previously added.




Versions History
================


* Version 1.05:
  o The last settings is now saved into configuration file
    (CustomExplorerToolbar.cfg) and loaded in the next time that you use
    CustomExplorerToolbar.

* Version 1.00 - First release.



System Requirements And Limitations
===================================


* This utility only works on Windows 7. It doesn't work on Windows
  Vista. Both 32-bit and x64 systems are supported.
* Some buttons might not be displayed on Explorer toolbar, even if you
  added them with CustomExplorerToolbar tool.
* Be aware that CustomExplorerToolbar cannot remove the default buttons
  provided by Windows operating system. It can only remove buttons that
  you previously added.



How it works
============

CustomExplorerToolbar updates the toolbar buttons list stored in
TasksItemsSelected and TasksNoItemsSelected Registry subkeys, under the
following Registry keys: (Every key represents a different folder type)
HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Folde
rTypes\{5c4f28b5-f869-4e84-8e60-f11db97c5cc7}
HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Folde
rTypes\{5f4eab9a-6833-4f61-899d-31cf46979d49}
HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Folde
rTypes\{fbb3477e-c9e4-4b3b-a2ba-d3f5d3cd46f9}
HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Folde
rTypes\{3f2a72a7-99fa-4ddb-a5a8-c604edf61d6b}
HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Folde
rTypes\{0b2baaeb-0042-4dca-aa4d-3ee8648d03e5}
HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Folde
rTypes\{631958a6-ad0f-4035-a745-28ac066dc6ed}

If the owner of the Registry key is TrustedInstaller,
CustomExplorerToolbar automatically changes the owner and permissions,
make the toolbar change, and then set back the original owner and
permissions.



Using CustomExplorerToolbar
===========================

CustomExplorerToolbar doesn't require any installation process or
additional dll files. In order to start using it, simply run the
executable file, CustomExplorerToolbar.exe
If UAC (User Account Control) is turned on, Windows 7 will ask you
whether you want that this program will make changes to this computer,
and you should choose 'Yes' to run the program.

After running CustomExplorerToolbar, the main window is displayed, and
you can can choose the toolbar mode, buttons, and folder type, and then
press the 'Do It !' button to add the toolbar buttons your selected.



CustomExplorerToolbar Options
=============================


* Action: Choose whether you want to add the selected buttons, or to
  remove the selected buttons. You can use the 'remove' action to remove
  the buttons that you previously added with the 'add' action.
* Toolbar Mode: Choose when the selected buttons should be displayed:
  when one or more items are selected (In Windows Explorer) or when items
  are not selected.
* Buttons List: Choose the buttons that you want to add or remove. Be
  aware that CustomExplorerToolbar displays all available Explorer
  buttons. However, some of them won't be displayed on Explorer toolbar,
  even if you chose to add them.
* Folder Types: Types of folder that will be affected. The most
  important folder type is 'Generic', which represents almost every file
  system folder. You can also choose to add or remove the toolbar buttons
  in the Documents/Music/Pictures/Video libraries of Windows Explorer.

In the following screenshot, you can see an example of Explorer window,
after adding the Close, Copy, Cut, Paste, Properties, and Select All
buttons with CustomExplorerToolbar utility:




Translating CustomExplorerToolbar to other languages
====================================================

In order to translate CustomExplorerToolbar to other language, follow the
instructions below:
1. Run CustomExplorerToolbar with /savelangfile parameter:
   CustomExplorerToolbar.exe /savelangfile
   A file named CustomExplorerToolbar_lng.ini will be created in the
   folder of CustomExplorerToolbar utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run CustomExplorerToolbar, and
   all translated strings will be loaded from the language file.
   If you want to run CustomExplorerToolbar without the translation,
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

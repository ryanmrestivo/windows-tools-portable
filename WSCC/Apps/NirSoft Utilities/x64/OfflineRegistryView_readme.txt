


OfflineRegistryView v1.03
Copyright (c) 2018 - 2019 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

OfflineRegistryView is a simple tool for Windows that allows you to read
offline Registry files from external drive and view the desired Registry
key in .reg file format.



System Requirements
===================

This utility works with any version of Windows, starting from Windows XP
and up to Windows 10. Both 32-bit and 64-bit systems are supported.



Versions History
================


* Version 1.03:
  o Fixed bug: OfflineRegistryView failed to handle properly large
    Registry values with more than 16344 bytes.

* Version 1.02:
  o Fixed bug: OfflineRegistryView generated .reg file incorrectly
    when the value names had '\' or '"' characters.

* Version 1.01:
  o Fixed bug: OfflineRegistryView exported REG_EXPAND_SZ values
    incorrectly.

* Version 1.00 - First release.



Start Using OfflineRegistryView
===============================

This utility doesn't require any installation process or additional DLL
files. In order to start using it, simply run the executable file -
OfflineRegistryView.exe
After running it, simply type the folders where the Registry files are
located. There is one folder field for config folder (for all Registry
hives loaded into HKEY_LOCAL_MACHINE key) and one folder field for
HKEY_CURRENT_USER Registry hives (ntuser.dat and UsrClass.dat). You can
also fill these fields with a folder contains a Registry snapshot created
by other tools from NirSoft (RegistryChangesView and
OfflineRegistryFinder)
Type the path of the Registry key you want to view (e.g:
HKEY_CURRENT_USER\Software\Microsoft\Windows ,
HKLM\Software\Microsoft\Windows\CurrentVersion ) and the subkey depth and
click the 'Go' button or F5 key.

After clicking the 'Go' button or F5 key, the Registry key you chose is
displayed in the text-box in .reg file format. You can use the 'Save To
.Reg File' option (Ctrl+S) to save the result into a .reg file.



Translating OfflineRegistryView to other languages
==================================================

In order to translate OfflineRegistryView to other language, follow the
instructions below:
1. Run OfflineRegistryView with /savelangfile parameter:
   OfflineRegistryView.exe /savelangfile
   A file named OfflineRegistryView_lng.ini will be created in the folder
   of OfflineRegistryView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run OfflineRegistryView, and all
   translated strings will be loaded from the language file.
   If you want to run OfflineRegistryView without the translation, simply
   rename the language file, or move it to another folder.



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

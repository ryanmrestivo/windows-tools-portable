


OfflineRegistryFinder v1.11
Copyright (c) 2018 - 2020 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

OfflineRegistryFinder is a tool for Windows that allows you to scan
Registry files from external drive and find the desired Registry
keys/values/data according to the search criteria you define. After
OfflineRegistryFinder displays the search result, you can easily select
one or more items and then export them into a .reg file that can be used
to import in the RegEdit tool of Windows.

OfflineRegistryFinder can also be used for Registry scan of your running
operating system. You simply have to create a Registry snapshot, and then
scan this snapshot with OfflineRegistryFinder. Searching in a Registry
snapshot is usually much faster then searching in the Registry of running
system.



System Requirements
===================

This utility works with any version of Windows, starting from Windows XP
and up to Windows 10. Both 32-bit and 64-bit systems are supported.



Versions History
================


* Version 1.11:
  o Added option to create a snapshot with the HKEY_CURRENT_USER hive
    of another user.

* Version 1.10:
  o Added new date/time option: Show only Registry keys modified in
    the specified time range and date range (separately). For example:
    You can search all Registry keys that their modified date is between
    01/01/2019 - 01/01/2020 and their modified time is between 09:00 -
    10:00.
  o Increased the size of the time field to show the AM/PM properly.

* Version 1.05:
  o Fixed bug: OfflineRegistryFinder failed to search properly large
    Registry values with more than 16344 bytes.

* Version 1.03:
  o Fixed bug: OfflineRegistryFinder generated .reg file incorrectly
    when the value names had '\' or '"' characters.

* Version 1.02:
  o Added option to choose another font (name and size) to display in
    the main window.

* Version 1.01:
  o Fixed bug: OfflineRegistryFinder exported REG_EXPAND_SZ values
    incorrectly.

* Version 1.00 - First release.



Start Using OfflineRegistryFinder
=================================

This utility doesn't require any installation process or additional DLL
files. In order to start using it, simply run the executable file -
OfflineRegistryFinder.exe

After running it, the 'Registry Search Options' window is displayed. You
have to type the folders that contain the Registry files you want to scan
(You can type up to 3 different folders), You can also choose a drive
letter or shadow copy path in the top combo-box and then click the
'Automatic Fill' button to automatically detect and fill the correct
paths of the Registry Files.
choose the desired search criteria, and then click the ok button to start
the search.
After the search is finished, you can select one or more items and then
generate a .reg file from them by using the 'Copy As .reg File' option
(Ctrl+R) or the 'Export Selected Items To .reg File' option (Ctrl+E)



Search in the Registry of your running operating system
=======================================================

If you want to search in the Registry of your running operating system,
simply click the 'Create Registry Snapshot' button, choose the folder to
create the snapshot and the Registry hives to dump, and then click the
'Create Snapshot' button.
After the snapshot is created, the snapshot folder is filled in the
folder field and then you can run your searches.
Be aware that creating a Registry snapshot requires elevation (Run As
Administrator).



Searching in older version of the Registry
==========================================

If you accidently deleted a Registry key/value, you can try to find it by
searching in a shadow copy. If you have shadow copy on your system, it'll
be added to the top combo-box (It looks like
\\?\GLOBALROOT\Device\HarddiskVolumeShadowCopy1 )
Simply choose the shadow copy in the top combo box, click the 'Automatic
Fill' button and then run your search. Be aware that for searching in
HKEY_LOCAL_MACHINE of a shadow copy, you must run OfflineRegistryFinder
as Administrator.



Translating OfflineRegistryFinder to other languages
====================================================

In order to translate OfflineRegistryFinder to other language, follow the
instructions below:
1. Run OfflineRegistryFinder with /savelangfile parameter:
   OfflineRegistryFinder.exe /savelangfile
   A file named OfflineRegistryFinder_lng.ini will be created in the
   folder of OfflineRegistryFinder utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run OfflineRegistryFinder, and
   all translated strings will be loaded from the language file.
   If you want to run OfflineRegistryFinder without the translation,
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

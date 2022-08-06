


RegistryChangesView v1.29
Copyright (c) 2017 - 2022 Nir Sofer
Web site: https://www.nirsoft.net



Description
===========

RegistryChangesView is a tool for Windows that allows you to take a
snapshot of Windows Registry and later compare it with another Registry
snapshots, with the current Registry or with Registry files stored in a
shadow copy created by Windows. When comparing 2 Registry snapshots, you
can see the exact changes made in the Registry between the 2 snapshots,
and optionally export the Registry changes into a standard .reg file of
RegEdit.



System Requirements
===================

This utility works on any version of Windows, starting from Windows XP
and up to Windows 10. Both 32-bit and 64-bit systems are supported.



Versions History
================


* Version 1.29:
  o Fixed bug: RegistryChangesView failed to handle large values
    (with more than 16,344 bytes) when a value is added or removed.

* Version 1.28:
  o Updated to work properly in high DPI mode (Toolbar, status bar,
    and properties window).

* Version 1.27:
  o Fixed bug: When specifying relative path to create a Registry
    snapshot, the security hive was created under the System32 directory
    instead of the specified snapshot folder.

* Version 1.26:
  o Fixed the /cfg command-line option to load the .cfg file from the
    current directory if full path is not specified.

* Version 1.25:
  o Added option to create a Registry snapshot with the ntuser.dat
    hive of another user on your system, instead the user that runs the
    RegistryChangesView tool.

* Version 1.22:
  o Added option to choose another font (name and size) to display in
    the main window.

* Version 1.21:
  o Added 'Case Sensitive' option to the Quick Filter window.

* Version 1.20:
  o Added more command-line options, which allow you to compare
    Registry snapshots and export the result to .reg file or
    csv/tab-delimited/xml/html file.

* Version 1.15:
  o Added new columns: 'Data Length' and 'Data Length Changed To'.

* Version 1.12:
  o Fixed bug: RegistryChangesView failed to handle large values
    (with more than 16,344 bytes) properly and this problem also caused
    RegistryChangesView to crash on some systems.

* Version 1.11:
  o Added /cfg command-line option to start RegistryChangesView with
    the specified config file.

* Version 1.10:
  o RegistryChangesView now consumes less memory when loading large
    amount of items.

* Version 1.08:
  o Fixed bug: RegistryChangesView generated .reg file incorrectly
    when the value names had '\' or '"' characters.
  o Fixed bug: In some circumstances, RegistryChangesView omitted the
    key name of the first .reg file value.

* Version 1.07:
  o Fixed bug: RegistryChangesView exported REG_EXPAND_SZ values
    incorrectly.

* Version 1.06:
  o Fixed bug: The browse button on the 'Create Registry Snapshot'
    window didn't work.

* Version 1.05:
  o Added /CreateSnapshot command-line option for creating Registry
    snapshot from command-line.

* Version 1.01:
  o Fixed bug: Under certain conditions, RegistryChangesView skipped
    half of subkeys or crashed while reading Registry key that had many
    subkeys.

* Version 1.00 - First release.



Examples for useful things you can do with this tool
====================================================


* You can create a Registry snapshot before installing a new software
  and then after the installation is completed, compare this Registry
  snapshot with the current Registry and see all Registry changes made by
  the installer (Be aware that you'll also see some changes made by
  Windows or other programs in the same time). If there are Registry
  changes that you don't like, you can generate a .reg file to revert
  back the changes.
* If you make a change in Windows configuration from the GUI of Windows
  and you want to see how to make this change in the Registry, simply
  create a Registry snapshot before making the config change and then
  after the configuration change, compare this Registry snapshot with the
  current Registry and optionally generate a .reg file that makes this
  configuration change.
* If there is unwanted change in the Registry of your system but you
  don't have any previous snapshot, you can compare the current Registry
  with a shadow copy created by Windows and try to locate the unwanted
  Registry changes.
* You can also use this tool as a simple way to backup the Registry.
  The snapshot created by RegistryChangesView simply contains Registry
  hive files with the same name as the original one (ntuser.dat, SYSTEM,
  SOFTWARE, and so on...)



Start Using RegistryChangesView
===============================

RegistryChangesView doesn't require any installation process or
additional DLL files. In order to start using it, simply run the
executable file - RegistryChangesView.exe
After running RegistryChangesView, the main options window is displayed,
which allows you to choose 2 Registry snapshots to compare. For every
snapshot , you can choose one of the following data sources: 'Current
Registry', 'Saved Registry Snapshot', and 'Shadow Copy'. You can choose
any combination you want, as long as 'Data Source 1' is not identical to
'Data Source 2'. For example: you can choose to compare the Registry of 2
different shadow copies, compare a shadow copy with current Registry,
compare a saved Registry snapshot with current Registry, compare a saved
Registry snapshot with another saved Registry snapshot, and so on...

If you want to generate a new Registry snapshot, simply choose 'Saved
Registry Snapshot' in the data source combo-box and then click the
'Create Registry Snapshot' button. In the 'Create Registry Snapshot'
window choose the folder to save the Registry Snapshot, click the 'Create
Snapshot' button, and wait a few seconds to create the snapshot. You can
also create a new Registry snapshot from the main window by pressing F8
(File -> Create Registry Snapshot).

After choosing the 2 Registry data sources to compare , you should also
set the following options:
* Direction: This field determines how the 2 Registry snapshots are
  compared. For example: if the direction you choose is 'Registry Data
  Source 1 => Registry Data Source 2', every Registry key or value that
  exists on the second snapshot but doesn't exist on the first snapshot
  will be displayed as 'Added Key' or 'Added Value'. But if you choose
  the opposite direction ('Registry Data Source 2 => Registry Data Source
  1'), every Registry key or value that exists on the second snapshot but
  doesn't exist on the first snapshot will be displayed as 'Removed Key'
  or 'Removed Value'.
  The direction field also affects the way that .reg file is generated
  ('Export Selected Items To .Reg File' and 'Copy As .Reg File Format'
  options). if the direction you choose is 'Registry Data Source 1 =>
  Registry Data Source 2', the generated .reg file will make the changes
  from snapshot 1 to snapshot 2. if the direction you choose is 'Registry
  Data Source 2 => Registry Data Source 1', the generated .reg file will
  make the changes from snapshot 2 to snapshot 1.
* Hives to compare: Allows you to choose which Registry hives to
  compare. For example, If you only want to see the Registry changes on
  HKEY_CURRENT_USER, you should select the 'HKEY_CURRENT_USER' and
  'HKEY_CURRENT_USER\Software\Classes' hives and deselect all others.

After choosing all option, click the 'Ok' button. RegistryChangesView
will compare the 2 Registry data sources you chose and the result will be
displayed on the main window.



Some Important Remarks
======================


* By default, the SAM and SECURITY Registry hives are not selected for
  comparison and for generating new Registry snapshots. You can choose
  these 2 Registry hives if you need to compare them, but you should be
  aware that there is a security risk: These Registry hives contain
  encryption keys and password hashes of your system and if you leave a
  Registry snapshot with SAM/SECURITY hives that can be accessed by a
  non-admin user, hacker that finds these files on your system might be
  able to use them for penetrating your system.
* When you choose 'Current Registry' as one of the data sources,
  RegistryChangesView generates a temporary Registry snapshot on
  %temp%\TempRegSnapshotX folder (X = numeric value) and deletes it after
  the Registry comparison process is finished.
* The Registry snapshot created by RegistryChangesView is just a folder
  that contains the Registry files with their original name. If you have
  a copy of Registry hives and you want to use them as a snapshot, simply
  copy them into a separated folder with their original filename (
  Software, System, ntuser.dat, UsrClass.dat ) and choose this folder as
  a Registry snapshot.



Columns Description
===================


* Registry Key: Full path of the Registry key.
* Change Type: Type of Registry change: Added Key, Removed Key, Added
  Value, Removed Value, Modified Value.
* Value Name: Name of the Registry value (Relevant only when the
  'Change Type' is 'Added Value', 'Removed Value', or 'Modified Value')
* Value Data: The content of Registry value (Relevant only when the
  'Change Type' is 'Added Value', 'Removed Value', or 'Modified Value').
  If the 'Change Type' is 'Modified Value' - this columns shows the
  original value (before the change) and the 'Value Data Changed To'
  column shows the value after the change.
* Value Type: Type of Registry value (REG_SZ, REG_DWORD, REG_BINARY,
  and so on...). If the 'Change Type' is 'Modified Value' - this columns
  shows the original value type (before the change) and the 'Value Type
  Changed To' column shows the value type after the change.
* Value Data Changed To: The content of Registry value after the change
  (Relevant only when the 'Change Type' is 'Modified Value').
* Value Type Changed To: The type of Registry value after the change
  (Relevant only when the 'Change Type' is 'Modified Value').
* Key Modified Time 1: The timestamp of the specified Registry key in
  the first snapshot.
* Key Modified Time 2: The timestamp of the specified Registry key in
  the second snapshot.



Generating .reg file
====================

RegistryChangesView allows you to generate a .reg file that can be used
to import with RegEdit tool of Windows.
There are 2 options to generate .reg file: (Both options work on selected
items, you can press Ctrl+A to select all items)
* Export Selected Items To .Reg File (Ctrl+E): Exports into a .reg
  filename that you choose.
* Copy As .Reg File Format (Ctrl+R): Generates text in .reg file format
  into the clipboard.

The .reg file is generated according to the 'Direction' field in the
Options window. if the Direction is 'Registry Data Source 1 => Registry
Data Source 2', the generated .reg file will make the changes from
snapshot 1 to snapshot 2. if the Direction is 'Registry Data Source 2 =>
Registry Data Source 1', the generated .reg file will make the changes
from snapshot 2 to snapshot 1.



Quick Filter
============

If you want to see only Registry keys or values that contain specific
strings, you can press Ctrl+Q (View -> Quick Filter), and then in the
quick filter text-box type the desired filter string.



Command-Line Options
====================



/cfg <Filename>
Start RegistryChangesView with the specified configuration file. For
example:
RegistryChangesView.exe /cfg "c:\config\rcv.cfg"
RegistryChangesView.exe /cfg "%AppData%\RegistryChangesView.cfg"

/sreg <Filename>
Save the Registry comparison result into a .reg file.

/stext <Filename>
Save the Registry comparison result into a regular text file.

/stab <Filename>
Save the Registry comparison result into a tab-delimited text file.

/scomma <Filename>
Save the Registry comparison result into a comma-delimited text file
(csv).

/shtml <Filename>
Save the Registry comparison result into HTML file (Horizontal).

/sverhtml <Filename>
Save the Registry comparison result into HTML file (Vertical).

/sxml <Filename>
Save the Registry comparison result into XML file.

/CreateSnapshot [Folder]
Creates a Registry snaphot in the specified folder. If the folder doesn't
exist, RegistryChangesView will create it. By default the snapshot will
be created according to the last settings, but you can change it by using
the commands below ( /CreateSnapshot.SoftwareHive ,
/CreateSnapshot.SystemHive and so on...)


/CreateSnapshot.SoftwareHive [0 | 1]
/CreateSnapshot.SystemHive [0 | 1]
/CreateSnapshot.NTUserHive [0 | 1]
/CreateSnapshot.UsrClassHive [0 | 1]
/CreateSnapshot.DefaultHive [0 | 1]
/CreateSnapshot.BCD00000000Hive [0 | 1]
/CreateSnapshot.SAMHive [0 | 1]
/CreateSnapshot.SecurityHive [0 | 1]
Specifies which hives to include in the snapshot (1 = include, 0 =
execlude)

For example:
RegistryChangesView.exe /CreateSnapshot "c:\temp\snapshot1"
/CreateSnapshot.SoftwareHive 1 /CreateSnapshot.SystemHive 0
/CreateSnapshot.NTUserHive 1 /CreateSnapshot.UsrClassHive 1


/DataSourceType1 [1 | 2 | 3]
/DataSourceType2 [1 | 2 | 3]
Specifies the data source to compare:
1 - Current Registry 2 - Saved Registry Snapshot 3 - Shadow Copy


/RegSnapshotPath1 [Path]
/RegSnapshotPath2 [Path]
Specifies the path of the Registry snapshot when DataSourceType is 2


/ShadowCopyPath1 [Path]
/ShadowCopyPath2 [Path]
Specifies the path of the Shadow Copy when DataSourceType is3


/DataSourceDirection [1 | 2]
Specifies the comparison direction:
1 - Registry Data Source 1 => Registry Data Source 2
2 - Registry Data Source 2 => Registry Data Source 1


/Compare.SoftwareHive [0 | 1]
/Compare.SystemHive [0 | 1]
/Compare.NTUserHive [0 | 1]
/Compare.UsrClassHive [0 | 1]
/Compare.DefaultHive [0 | 1]
/Compare.BCD00000000Hive [0 | 1]
/Compare.SAMHive [0 | 1]
/Compare.SecurityHive [0 | 1]
Specifies which hives to compare (1 = compare, 0 = don't compare)

Examples:
* Compare a saved Registry snapshot with current Registry, and export
  the result to regcomp1.reg:
  RegistryChangesView.exe /DataSourceDirection 1 /DataSourceType1 2
  /DataSourceType2 1 /RegSnapshotPath1
  "C:\temp\RegSnapshot20190622075426" /sreg "c:\regcomp1.reg"
* Compare 2 saved Registry snapshots and export the result to
  regcomp1.csv:
  RegistryChangesView.exe /DataSourceDirection 1 /DataSourceType1 2
  /DataSourceType2 2 /RegSnapshotPath1
  "C:\temp\RegSnapshot20190622075426" /RegSnapshotPath2
  "C:\temp\RegSnapshot20190623022112" /scomma "c:\temp\regcomp1.csv"



Translating RegistryChangesView to other languages
==================================================

In order to translate RegistryChangesView to other language, follow the
instructions below:
1. Run RegistryChangesView with /savelangfile parameter:
   RegistryChangesView.exe /savelangfile
   A file named RegistryChangesView_lng.ini will be created in the folder
   of RegistryChangesView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run RegistryChangesView, and all
   translated strings will be loaded from the language file.
   If you want to run RegistryChangesView without the translation, simply
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

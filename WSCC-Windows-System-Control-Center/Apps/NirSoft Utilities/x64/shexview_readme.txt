


ShellExView v2.01
Copyright (c) 2003 - 2019 Nir Sofer
Web Site: http://www.nirsoft.net



Description
===========

Shell Extensions are in-process COM objects which extend the abilities of
Windows operating system. Most shell extensions are automatically
installed by the operating system, but there are also many other
applications that install additional shell extension components. For
example: If you install WinZip on your computer, you'll see a special
WinZip menu when you right-click on a Zip file. This menu is created by
adding a shell extension to the system.

The ShellExView utility displays the details of shell extensions
installed on your computer, and allows you to easily disable and enable
each shell extension.

ShellExView can be used for solving context-menu problems in Explorer
environment. For more information, read the following article:
Right-click is slow or weird behavior caused by context menu handlers



System Requirements
===================

This utility works on any version of Windows, starting from Windows 98
and up to Windows 10. x64 versions of Windows are also supported.

Versions History
================




10/06/2019
2.01

* Fixed bug: ShellExView crashed on some systems.


07/03/2019
2.00

* Fixed to detect properly the filename of .NET extensions.


30/08/2015
1.97

* Fixed the 'Restart Explorer' option to work properly on Windows 10.


07/08/2015
1.96

* Fixed bug: When the 'Hide All Microsoft Extensions' option was turned
  on, ShellExView didn't display it as checked.
* Fixed bug: ShellExView failed to detect some shell extensions.


02/07/2015
1.95

* Added 'Hide All Microsoft Extensions' option.
* Added 'Missing File' column (Displays 'Yes' if the shell extension
  file is missing).


26/05/2014
1.90

* Added 'Thumbnail Handler' and 'Preview Handler' shell extensions that
  ShellExView failed to locate in previous versions.


05/09/2013
1.86

* Fixed bug: ShellExView failed to extract the digital signatures on
  some systems.


19/08/2013
1.85

* Fixed issue: Microsoft shell extensions displayed as non-Microsoft if
  the company name was 'Microsoft Corp.'
* Added 'Digital Signature' column, which displays the signer name if
  the shell extension dll is signed with a digital signature. This column
  is active only when 'Read Digital Signatures' option (Under the Options
  menu) is turned on. (by default it's turned off)
* Added 'Auto Size Columns+Headers' option.


13/06/2013
1.81

* Added secondary sorting: When clicking the column headers of 'Type',
  'Company', and other columns , the list is sorted by the selected
  column first, and then by the 'Extension Name' column.


31/05/2013
1.80

* Added 'Show 32-bit Shell Extensions' option, under the Options menu,
  available only on 64-bit systems. When it's turned on, ShellExView
  loads the 32-bit instance of installed shell extensions. (Similar to
  the /wow64 command-line option)


25/09/2012
1.76

* Fixed issue: The properties window opened in the wrong monitor, on
  multi-monitors system.


09/09/2012
1.75

* Added 'Restart Explorer' (Ctrl+E) option, under the Options menu,
  which allows you to easily restart Windows Explorer if the
  disabling/enabling a shell extension doesn't affect Explorer
  immediately (Very useful for Windows 7/2008/Vista).


19/03/2012
1.70

* Added 'Put Icon On Tray' option.


24/10/2011
1.68

* Added shell extensions under LibraryFolder\Background key.


03/10/2011
1.67

* You can now drag one or more files from the window of ShellExView
  into Explorer window or other application.


18/05/2011
1.66

* Added 'Show Time In GMT' option.


10/03/2011
1.65

* Added support for 3 types of shell extensions: Disk Cleanup Handlers,
  Icon Overlay Handlers, and Property Handlers


26/02/2011
1.60

* Added /enable and /disable command-line options, which allow you to
  disable/enable shell extensions automatically from command-line without
  displaying any user interface, by specifying the CLSID of the shell
  extension.


14/02/2011
1.55

* Fixed bug: ShellExView failed to detect some shell extensions (When
  the CLSID was specified as Registry key instead of Registry value).
* Added .NET detection - When there is a .NET extension, ShellExView
  now detect the real shell extension dll instead of displaying the .NET
  core dll (mscoree.dll)
* Added .NET column, which displays 'Yes' if the shell extension was
  created in .NET


21/11/2010
1.50

* Added 'Google Search - Filename' and 'Google Search - Extension Name'
  options, which allows you to easily search for information about the
  selected shell extension in Google.


20/09/2010
1.48

* Added 'Add Header Line To CSV/Tab-Delimited File' option. When this
  option is turned on, the column names are added as the first line when
  you export to csv or tab-delimited file.


18/05/2010
1.47

* Fixed ShellExView x64 to require to run as admin under Windows
  7/Vista, like the 32-bit version.


03/05/2010
1.46

* Added 'Preview Handler' shell extensions.


07/11/2009
1.45

* On x64 systems, ShellExView now always shows the shell extensions for
  x64 applications, even on the 32-bit version of ShellExView. If you
  want to get the shell extensions list for 32-bit applications, use
  ShellExView with /wow64 command-line option.
* Added /remote command-line option, which allows you to
  view/enable/disable shell extensions in a remote computer on your
  network.


29/08/2009
1.41

* Changed the definition of 'Suspicious Shell Extensions' - In previous
  versions, Every shell extension with read-only attribute marked as
  Suspicious, which confused some users, because there are many
  legitimated shell extensions that set a read-only attribute, probably
  to protect them from delete by the user. However, if a shell extension
  has an hidden attribute, it'll still be marked as suspicious.


22/08/2009
1.40

* Added option to submit a report about a shell extension that you
  disabled to http://shellfix.nirsoft.net.


05/04/2009
1.37

* ShellExView now displays a special warning when trying to disable a
  shell extension of shell32.dll


07/01/2009
1.36

* Fixed bug: ShellExView crashed when using it with the save
  command-line options.


24/11/2008
1.35

* Added support for using ShellExView with external drive (by using
  /external command-line option).


10/11/2008
1.30

* Added 'Filter By Extension Type' option - Allows you to select which
  type of shell extensions you want to view.


24/10/2008
1.25

* New restriction: ShellExView won't allow you to disable at once more
  than 15 shell extensions created by Microsoft. The reason for this
  restriction is that recently there were a few cases of people that
  disabled most of their shell extensions, including system extensions
  that installed as a part of the operating system, and then found
  themselves with a system that cannot boot properly.


02/10/2008
1.24

* Fixed bug: Exception window appeared when starting ShellExView in
  some systems.


08/07/2008
1.23

* Fixed bug: The dates displayed in system locale format, instead of
  user locale.


14/05/2008
1.22

* Added shell extensions under "My Network Places", "Entire Network",
  and "Remote Computer" Registry keys.
* Added 3 columns: "My Network Places", "Entire Network", and "Remote
  Computer" (which tells you whether the Shell Extension was added into
  these folders)


03/05/2008
1.21

* Fixed bug: The main window lost the focus when the user switched to
  another application and then returned back to ShellExView.


24/04/2008
1.20

* Added support for saving as comma-delimited text file


22/11/2007
1.19

* Under Vista, ShellExView now requires to run as administrator.


21/09/2007
1.18

* Configuration of ShellExView is now saved to a cfg file instead of
  the Registry.


04/08/2007
1.17

* Added support for properly enabling/disabling shell extensions under
  Windows Vista. (The disabled shell extensions are added to
  'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell
  Extensions\Blocked' key in the Registry)
* Added x64 version (as a separated download) for using under Windows
  Vista x64.
* Added shell extensions under SystemFileAssociations key.


16/02/2007
1.16

* Fixed bug: When a filename was enclosed with quotes, ShellExView
  failed to display the properties of the file.


12/08/2006
1.15

* A tooltip is displayed when a string in a column is longer than the
  column length.


30/12/2005
1.14

* Added shell extensions under HKEY_CLASSES_ROOT\Directory\Background


15/07/2005
1.13

* New columns: File Attributes and File Size.
* New option: Mark Suspicious Shell Extensions - mark in red color
  shell extensions with unusual file attribues (hidden attribue) or with
  unusual file extensions.


21/06/2005
1.12

* New shell extension types: InfoTip Handler, Shell Link, Structure
  Storage, MetaData.
* Multiple shell extensions with the same CLSID are now displayed in
  separated entries.
* Added support for Windows XP style.


27/02/2005
1.11

* New shell extension type: URL Search Hook.
* Open the CLSID key of the shell extension in RegEdit.
* New column: File Extensions.


25/11/2004
1.10

* New columns: File Created Time, CLSID Modified Time, Microsoft.
* New extensions types: Browser Helper Object, IE Toolbar, Explorer
  Bar, IE Extensions.
* Choose columns dialog-box.
* Auto-Size columns.
* Find dialog-box.
* HTML Reports.
* Save as XML file.
* Mark disabled items in gray color.
* Mark non-Microsoft extensions in pink color.
* Ability to translate to other languages.


23/08/2003
1.01
Critical bug from previous version (1.00) was fixed: In some
circumstances, after disabling a shell extension and then enabling it
again, the shell extension continued to be disabled, even if ShellExView
show that it's enabled.

05/06/2003
1.00
First Release.


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



Using ShellExView
=================

The ShellExView is a standalone executable. It doesn't require any
installation process or additional DLLs. Just copy it to any folder you
want, and run it. After you run it, wait a few seconds until ShellExView
loads all shell extensions items.
The main window of ShellExView displays the details of all shell
extensions in 12 different columns:



Extension Name
The name of the shell extension, as it appears in the Registry.

Disabled
Tells you whether the shell extension is disabled.

Type
The type of the shell extension. There are more than 10 different types
of shell extensions. For more information about the types of shell
extensions, see the table below.

Description
Description of the shell extension item. This information is extracted
from the DLL file that contains this shell extension.

Version
Version of the shell extension item. This information is extracted from
the DLL file that contains this shell extension.

Product Name
The name of the product that created this shell extension. This
information is extracted from the DLL file that contains this shell
extension.

Company
The name of the company that created this shell extension.

My Computer
Tells you whether the "My Computer" folder contains this shell extension.
This column is only relevant to "Shell Folder" extensions.

Desktop
Tells you whether the "Desktop" folder contains this shell extension.
This column is only relevant to "Shell Folder" extensions.

Control Panel
Tells you whether the "Control Panel" folder contains this shell
extension. This column is only relevant to "Shell Folder" extensions
under Windows 2000/XP.

Filename
The filename that contains this shell extension.

CLSID
The CLSID of this shell extension.

File Created Time
The creation time of the extension dll. You can use this field in order
to find out when the extension was installed on your system.

CLSID Modified Time
The Modified Time of CLSID in the Registry. Only available under Windows
NT/2000/XP.

Microsoft
Specifies whether the extension was created by Microsoft ('Yes' value) or
by other company ('No' value).

File Extensions
Specifies a list of file extensions (like .txt, .html) that use this
shell extension.

File Attributes
Specifies the attributes of the shell extension file. (H for hidden, R
for read-only, and so on)

File Size
Specifies the size (in bytes) of the shell extension file.

There are more than 10 types of shell extension, here's a small
description for each type:


Shell Folder
Provides special system folders like "Printers", "Fonts", "Recycle Bin",
and more...

Context Menu
Provides the ability to add new items to the context menu of particular
file type.

Drag & Drop Handler
Provides the ability to add new items to the context menu that appears
when you drag a file with right mouse button.

Icon Handler
Provides the ability to dynamically assign icons to file objects.

Copy Hook Handler
This type of shell extension is called when a file is moved, copies,
renamed or deleted.

Drop Handler
Provides the ability to control the "Drop" behavior of files.

Data Handler
Provides the ability to copy files/objects to the clipboard.

Property Sheet
Property Sheet dialog boxes.

Search Handler
Provides the ability to create a system search engine (Like the standard
"Search For Files or Folders" module)

Column Handler
Provides the ability to add new columns to the details view of Explorer
window.

Thumbnail
Provides the ability to display images in "Thumbnail" view.

Browser Helper Object
Provides the ability to customize and control the Internet Explorer
browser.

IE Toolbar
Provides the ability to add new toolbars into Internet Explorer (like
Yahoo! Toolbar)

Explorer Bar
Provides the ability to add Explorer bars to Internet Explorer.

URL Search Hook
Browser extension stored under Software\Microsoft\Internet
Explorer\URLSearchHooks.

System
All other types of shell extensions that ShellExView utility cannot
recognize are categorized as "System" type.



Disable/Enable Shell Extensions
===============================

The ShellExView utility allows you to disable and enable the shell
extensions components on your system. In order to disable or enable a
shell extension item, select the desired item, and from the File menu (or
from the pop-up menu) select the appropriate option - "Enable Selected
Items" or "Disable Selected Items".
Here's 2 examples of useful things that you can do with this feature:

* Context Menu: Some applications, like WinZip, CuteFTP, and others,
  add some items to the context menu when you right-click on a file in
  explorer window. If you disable the appropriate shell extension, you
  won't get these additional menu items.
  In order to locate the desired shell extension item:
  1. Sort the extensions list by the "Type" column and look at all
     "Context Menu" items.
  2. Search the application that creates the menu you want to
     disable. The icon near each item can help to locate the desired
     shell extension.

* Shell Folder: When you enter into some special folders like "History"
  and "Temporary Internet Files", you don't see the real file system, but
  the a virtual folder that the shell extension create for you. If you
  want to watch the real file system inside "History" or "Temporary
  Internet Files", you can disable the appropriate shell extension items.



Sending report to shellfix.nirsoft.net
======================================

If you solved a problem by disabling a shell extension in your Explorer,
and you want to share it with others, you can use the 'Send Report To
ShellFix' option to publish the information in
http://shellfix.nirsoft.net. You can find full instructions about how to
send a report in the main page of http://shellfix.nirsoft.net Web site.



Add/Remove special folders to "My Computer" and "Desktop" folders
=================================================================

Some special shell folders like "Printers", "Recycle Bin", "Scheduled
Tasks", "Network and Dial-up Connections", "Mobile Device", and others
can be added (and be removed) to "My Computer", "Desktop", and even to
"Control Panel" (Only in Windows 2000) by using the ShellExView utility.
For Example: Under Windows 2000, you can add the "Printers", "Recycle
Bin", and "Scheduled Tasks" folders to "My Computer". In order to do
that, select the item that you want to add or remove (You can only use
"Shell Folder" items) and from the File menu, select the appropriate
add/remove option.
Be aware that there are some shell folders that cannot be added to "My
Computer" or "Desktop" folders. For example: adding the "Administrative
Tools" folder to "My Computer" won't work properly as you might expect.



Mark Suspicious Shell Extensions
================================

Most shell extensions use standard file extensions (.dll, .ocx or .cpl)
as well as they usually don't turn on their system attribues
(read-only/hidden/system). If ShellExView detect shell extension with
unusual file extension or with unusual attribute (e.g: shell extension
dll that is marked as hidden in the file system), it'll be marked in red
color. It's recommended to deeply check these unusual shell extensions to
insure that they are not unwanted malicious programs that penetrated into
your system.



Command-line options
====================



/stext <Filename>
Save the list of shell extensions into a regular text file.

/stab <Filename>
Save the list of shell extensions into a tab-delimited text file.

/scomma <Filename>
Save the list of shell extensions into a comma-delimited text file.

/stabular <Filename>
Save the list of shell extensions into a tabular text file.

/shtml <Filename>
Save the list of shell extensions into HTML file.

/sverhtml <Filename>
Save the list of shell extensions into vertical HTML file.

/sxml <Filename>
Save the list of shell extensions into XML file.

/NoLoadSettings
Run ShellExView without loading your last settings. (window position,
columns size, etc. )

/wow64
On x64 systems, load ShellExView for using with 32-bit applications.

/external <Windows Directory> <User Profile Folder (Optional)>
Run ShellExView on external instance of Windows operating system. This
option can be useful when you have Windows operating system that cannot
boot properly. The <User Profile Folder> parameter is optional. If you
don't specify it, ShellExView won't load extensions lists that are stored
in HKEY_CURRENT_USER.

Example:
shexview.exe /external "k:\windows" "k:\Documents and
Settings\Administrator"

/remote < \\ComputerName >
Use ShellExView with the shell extensions of a remote computer on your
network. You must have full administrator access on the remote computer
in order to use this feature.

If you fail to connect the remote computer with ShellExView, read the
instructions in the following Blog post:
How to connect a remote Windows 7/Vista/XP computer with NirSoft
utilities.

/disable <CLSID>
Disables the specified shell extension. You should specify the exact
CLSID value that you see in the CLSID column, for example:
shexview.exe /disable {120B94B5-2E6A-4F13-94D0-414BCB64FA0F}

/enable <CLSID>
Enables the specified shell extension. You should specify the exact CLSID
value that you see in the CLSID column, for example:
shexview.exe /enable {120B94B5-2E6A-4F13-94D0-414BCB64FA0F}



Translating ShellExView to other languages
==========================================

In order to translate ShellExView to other language, follow the
instructions below:
1. Run ShellExView with /savelangfile parameter:
   shexview.exe /savelangfile
   A file named shexview_lng.ini will be created in the folder of
   ShellExView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run ShellExView, and all
   translated strings will be loaded from the language file.
   If you want to run ShellExView without the translation, simply rename
   the language file, or move it to another folder.



Feedback
========

If you have any problem, suggestion, comment, or you found a bug in my
utility, you can send a message to nirsofer@yahoo.com



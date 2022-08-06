


AlternateStreamView v1.56
Copyright (c) 2009 - 2019 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

AlternateStreamView is a small utility that allows you to scan your NTFS
drive, and find all hidden alternate streams stored in the file system.
After scanning and finding the alternate streams, you can extract these
streams into the specified folder, delete unwanted streams, or save the
streams list into text/html/csv/xml file.



System Requirements
===================

This utility works on any version of Windows starting from Windows 2000
and up to Windows 10. Both 32-bit and 64-bit systems are supported.



Versions History
================


* Version 1.56:
  o Added /RunAsAdmin command-line option for running
    AlternateStreamView as administrator.

* Version 1.55:
  o Fixed bug: AlternateStreamView failed to remember the last
    size/position of the main window if it was not located in the primary
    monitor.
  o You can now send the data to stdout by specifying empty string as
    filename, for example:
    AlternateStreamView.exe /scomma "" | more

* Version 1.54:
  o Added 'Keep The Original Attributes On Stream Delete' option
    (Under the Options menu). By default, when a stream is deleted, the
    system set the Archive attribute to the file. If this option is
    turned on, AlternateStreamView will keep the original attributes of
    the file without any change.

* Version 1.53:
  o Fixed bug: Scanning from command-line failed to work properly.

* Version 1.52:
  o Added 'Entry Modified' column (Windows Vista or later).
  o Fixed bug: When pressing Delete key inside the text-box of the
    Find window, AlternateStreamView asked you if you want to delete the
    selected item instead of deleting a character inside the find
    text-box.

* Version 1.51:
  o Added 'Run As Administrator' option (Ctrl+F11), which allows you
    to easily run AlternateStreamView as administrator on Windows
    Vista/7/8/2008.

* Version 1.50:
  o Added new columns: 'File Modified Time', 'File Created Time',
    'File Attributes'.
  o Fixed bug: for some files, the Extension column displayed
    incorrect extension.
  o Fixed to display the correct icon for folders.

* Version 1.45:
  o Added /filename command-line option, which allows you to open
    AlternateStreamView with a single filename.
  o Added 'Explorer Context Menu' option. When it's turned on,
    'AlternateStreamView' item is added to the context menu of Windows
    Explorer, and allows you to check the alternate streams of a single
    file.

* Version 1.40:
  o Added 'Open Folder In Explorer' option.
  o Added 64-bit build.

* Version 1.36:
  o You can now specify environment variables inside the scan folder
    (For example: %localappdata%, %appdata%)

* Version 1.35:
  o Fixed bug: When searching with wildcard that is not *.*,
    AlternateStreamView failed to scan the subfolders.
  o Fixed issue: The properties and the other windows opened in the
    wrong monitor, on multi-monitors system.

* Version 1.32:
  o Added 'Extension' column, which allows you to easily sort the
    streams list by the extension of the filename.

* Version 1.31:
  o Fixed bug: AlternateStreamView crashed when trying to delete
    alternate stream with long filename.

* Version 1.30:
  o Added 'Files Wildcard' option, which allows you to scan only the
    files with specific name/extension.

* Version 1.25:
  o Added 'Open Selected Stream With...' option.
  o Fixed bug: AlternateStreamView failed to locate 2 dots stream
    names (for example - F:\MyFolder\..:stream1)
  o Fixed issue: AlternateStreamView failed to locate alternate
    streams on remote network drive.

* Version 1.20:
  o Fixed bug: AlternateStreamView didn't display alternate streams
    attached to the root folder of the search.
  o Added 'Add Header Line To CSV/Tab-Delimited File' option. When
    this option is turned on, the column names are added as the first
    line when you export to csv or tab-delimited file.

* Version 1.15:
  o Added command-line support.
  o Fixed issue: Removed the wrong encoding from the xml string,
    which caused problems to some xml viewers.

* Version 1.12:
  o Fixed the problem with icons on Windows 7/x64 systems.

* Version 1.11:
  o Added 'Explorer Copy' option - copy selected files and then paste
    them into Explorer window.

* Version 1.10:
  o Added support for choosing the folder depth of subfolders
    scanning.

* Version 1.05:
  o Fixed bug: In Windows Vista, NTFS junction point to 'Application
    Data' folder created a recursive scan. In this version,
    AlternateStreamView automatically skip junction points.
  o Fixed bug: AlternateStreamView failed to delete streams of
    read-only files.
  o Fixed bug: AlternateStreamView allowed to close the main window
    during scan.

* Version 1.00 - First release.



About Alternate Streams in NTFS File System
===========================================

NTFS system has a feature that allows you to add multiple streams in
addition to the main file stream. When you open or view the file, only
the main file stream is visible, while other additional streams are
hidden from the user.

Here's 3 examples of alternate streams usage in Windows operating system:
1. Favorites of Internet Explorer: When You add a Web site link into
   your 'Favorites', a .url file containing the url and description is
   created. However, if the Web site also have an icon (favicon), the
   icon is saved as alternate stream for the same url file. The stream
   name of the icon is :favicon:$DATA
2. Downloaded files of Internet Explorer: When you download and save a
   file with Internet Explorer, it automatically add a zone information
   for the saved file. This zone information is used for identifying the
   file as downloaded file from the Internet. The stream name in this
   case is :Zone.Identifier:$DATA
3. Summary information of files: When you right-click on a file in
   Explorer and go to the 'Summary' tab, you can add summary information
   for the file, like title, subject, author, and so on. This summary
   information is also saved into alternate stream. The stream name in
   this case is SummaryInformation:$DATA.
In addition to the legitimate usage of alternate streams, this technique
may also be used by Viruses/Trojans/Spywares for saving data and hiding
it from the user.



Using AlternateStreamView
=========================

AlternateStreamView doesn't require any installation process or
additional DLL files. In order to start using it, simply run the
executable file - AlternateStreamView.exe
After running it, choose the drive or folder that you wish to scan, and
click Ok. AlternateStreamView will scan the selected folder, and then
it'll display all alternate streams found in the selected drive/folder.
After the scan is finished, you can select one or more alternate streams,
and then delete them ('Delete Selected Streams' option), or copy them
into a folder that you choose ('Export Selected Streams To...').



Command-Line Options
====================



/RunAsAdmin
Runs AlternateStreamView as administrator.

/FolderPath <Folder>
Specifies the folder to scan

/ScanSubfolders <0 | 1>
Specifies whether to scan the subfolders under the folder specified in
/FolderPath
0 = No, 1 = Yes.

/SubFolderDepth <Depth Value>
Specifies the folder depth to scan when ScanSubfolders is 1. If 0 is
specified, the folder depth is unlimited.

/ShowZeroLengthStreams <0 | 1>
Specifies whether to show zero length streams. 0 = No, 1 = Yes.

/Filename <filename>
Loads the specified filename into AlternateStreamView.

/stext <Filename>
Save the list of alternate streams into a regular text file.

/stab <Filename>
Save the list of alternate streams into a tab-delimited text file.

/scomma <Filename>
Save the list of alternate streams into a comma-delimited text file (csv).

/stabular <Filename>
Save the list of alternate streams into a tabular text file.

/shtml <Filename>
Save the list of alternate streams into HTML file (Horizontal).

/sverhtml <Filename>
Save the list of alternate streams into HTML file (Vertical).

/sxml <Filename>
Save the list of alternate streams into XML file.

/sort <column>
This command-line option can be used with other save options for sorting
by the desired column. If you don't specify this option, the list is
sorted according to the last sort that you made from the user interface.
The <column> parameter can specify the column index (0 for the first
column, 1 for the second column, and so on) or the name of the column,
like "Stream Name" and "Filename". You can specify the '~' prefix
character (e.g: "~Stream Size") if you want to sort in descending order.
You can put multiple /sort in the command-line if you want to sort by
multiple columns.

Examples:
AlternateStreamView.exe /shtml "f:\temp\alt.html" /sort 2 /sort ~1
AlternateStreamView.exe /shtml "f:\temp\alt.html" /sort "Stream Size"

/nosort
When you specify this command-line option, the list will be saved without
any sorting.

Example:
AlternateStreamView.exe /FolderPath "f:\temp" /ScanSubfolders 1
/SubFolderDepth 1 /shtml "f:\temp\streams.html"



Translating AlternateStreamView to other languages
==================================================

In order to translate AlternateStreamView to other language, follow the
instructions below:
1. Run AlternateStreamView with /savelangfile parameter:
   AlternateStreamView.exe /savelangfile
   A file named AlternateStreamView_lng.ini will be created in the folder
   of AlternateStreamView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run AlternateStreamView, and all
   translated strings will be loaded from the language file.
   If you want to run AlternateStreamView without the translation, simply
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

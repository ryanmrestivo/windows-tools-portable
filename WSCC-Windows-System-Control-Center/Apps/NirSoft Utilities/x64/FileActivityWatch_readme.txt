


FileActivityWatch v1.66
Copyright (c) 2018 - 2022 Nir Sofer
Web site: https://www.nirsoft.net



Description
===========

FileActivityWatch is a tool for Windows that displays information about
every read/write/delete operation of files occurs on your system. For
every file, FileActivityWatch displays the number of read/write bytes,
number of read/write/delete operations, first and last read/write
timestamp, and the name/ID of the process responsible for the file
operation.



System Requirements
===================

This tool works on any version of Windows, starting from Windows Vista
and up to Windows 11. Both 32-bit and 64-bit systems are supported.
Elevation ('Run As Administrator') is required to use this tool.



Versions History
================


* Version 1.66:
  o Added 'Always On Top' option.

* Version 1.65:
  o Fixed some high DPI mode issues (Toolbar, Properties Window).
  o Added option to change the sorting column from the menu (View ->
    Sort By). Like the column header click sorting, if you click again
    the same sorting menu item, it'll switch between ascending and
    descending order. Also, if you hold down the shift key while choosing
    the sort menu item, you'll get a secondary sorting.

* Version 1.61:
  o Added 'Process Services' column, which displays the services of
    the process (Only when the 'Process Grouping' option is 'Group by
    process ID').

* Version 1.60:
  o Added 'Drives Summary' option to the 'Files/Folders Mode' option,
    which allows you to display a summary of all activity of a drive in
    one item, instead of displaying every filename separately.
  o Fixed to display the drive letter properly when USB drive is
    inserted while FileActivityWatch is active.

* Version 1.55:
  o Added 'Files/Folders Mode' to the 'Advanced Options' window,
    which allows you to display a summary of all activity of a folder in
    one item, instead of displaying every filename separately.

* Version 1.50:
  o You can now choose the unit of the Read/Write Bytes columns:
    Bytes, kB, KiB, MB, MiB.

* Version 1.45:
  o You can set any variable appears saved in the .cfg file from
    command-line. For example, this command set a filter to display only
    file operations of .txt files :
    FileActivityWatch.exe /FilenameFilterMode 1 /FilenameFilterStr "*.txt"
  o Added 'Align Numeric Columns To Right' option (It's turned on by
    default).

* Version 1.40:
  o You can now specify "*." as wildcard to specify filename without
    extension.
  o Explorer context menu inside FileActivityWatch: When you
    right-click on a single item while holding down the shift key,
    FileActivityWatch now displays the context menu of Windows Explorer,
    instead of the FileActivityWatch context menu.

* Version 1.35:
  o Added 'Process Grouping' option (In 'Advanced Options' window -
    F9): 'Don't group by process', 'Group by process ID' (Default),
    'Group by process filename'.

* Version 1.31:
  o Added 'Skip Activity of EtwRTNT Kernel Logger.etl' option (Turned
    on by default). The activity of this file is a side effect of the
    system tracing that FileActivityWatch uses to get the file activity
    data , so it's now hidden by default.

* Version 1.30:
  o Added option to filter by process name (In 'Advanced Options'
    window - F9).

* Version 1.27:
  o Added 'Put Icon On Tray' option.

* Version 1.26:
  o Fixed to display properly files on a remote network drive.

* Version 1.25:
  o Added option to filter by filename wildcard (In 'Advanced
    Options' window - F9).

* Version 1.21:
  o Added 'Add Header Line To CSV/Tab-Delimited File' option (Turned
    on by default).

* Version 1.20:
  o Added command-line options to save the report of
    FileActivityWatch into a file without displaying any user interface.

* Version 1.10:
  o Added 'File Properties' (Ctrl+Enter), 'Open File Folder' (F8),
    and 'Explorer Copy' (Ctrl+E).

* Version 1.09:
  o Added 'Save All Items' option (Shift+Ctrl+S).

* Version 1.08:
  o You can now resize the properties window, and the last
    size/position of this window is saved in the .cfg file.

* Version 1.07:
  o Added option to choose another font (name and size) to display in
    the main window.

* Version 1.06:
  o Added 'Automatically Scroll Down On New Items' option.

* Version 1.05:
  o Added new columns: 'Read+Write Bytes' and 'Read+Write Count'.

* Version 1.00: First release.



Known Issues
============


* This tool cannot detect read/write activity if the file was opened
  white the tool was not running.



Start Using FileActivityWatch
=============================

FileActivityWatch doesn't require any installation process or additional
DLL files. In order to start using it, simply run the executable file -
FileActivityWatch.exe

Immediately after running FileActivityWatch, the main window displays all
read/write/delete operations made by applications running on your system.
Under the Options menu you can choose which type of operation to trace:
'Capture Read Events', 'Capture Write Events', and 'Capture Delete
Events'. You can also turn off all events tracing by unchecking the
'Capture Events' option (F2).

At any time, you can press Ctrl+X (Clear List) in order to clear all
items accumulated in the main window of FileActivityWatch.



Mark Files With Active Read/Write
=================================

When the 'Mark Files With Active Read/Write' option is turned on, every
item with read/write/delete operation in the last few seconds is marked
as follows:
* Green - Read operation
* Yellow - Write operation
* Red - Read+Write operation
* Blue - Delete operation



FileActivityWatch Columns
=========================


* Filename:The filename that had read/write/delete operation.
* Process ID:The ID of the process responsible for the
  read/write/delete operation.
* Process Name:The name of the process responsible for the
  read/write/delete operation.
* Process Path:Full path of the process.
* Read Count:Number of read operations.
* Write Count:Number of write operations.
* Delete Count:Number of times that the file was deleted by the
  specified process.
* Read Bytes:Total number of bytes read from the specified file by the
  specified process.
* Write Bytes:Total number of bytes written to the specified file by
  the specified process.
* First Read Time:Date/time when the first read operation was detected.
* First Write Time:Date/time when the first write operation was
  detected.
* Last Read Time:Date/time when the last read operation was detected.
* Last Write Time:Date/time when the last write operation was detected.



Command-Line Options
====================



/CaptureTime <Milliseconds>
Specifies the capture time in milliseconds for the save command-line
options (/stext, /stab, /scomma, and so on...)
The default is 10000 milliseconds (10 seconds).

/cfg <Filename>
Start FileActivityWatch with the specified configuration file. For
example:
FileActivityWatch.exe /cfg "c:\config\faw.cfg"
FileActivityWatch.exe /cfg "%AppData%\FileActivityWatch.cfg"

/stext <Filename>
Save the report of FileActivityWatch into a simple text file.

/stab <Filename>
Save the report of FileActivityWatch into a tab-delimited text file.

/scomma <Filename>
Save the report of FileActivityWatch into a comma-delimited text file
(csv).

/shtml <Filename>
Save the report of FileActivityWatch into HTML file (Horizontal).

/sverhtml <Filename>
Save the report of FileActivityWatch into HTML file (Vertical).

/sxml <Filename>
Save the report of FileActivityWatch into XML file.

/sjson <Filename>
Save the report of FileActivityWatch into JSON file.

/sort <column>
This command-line option can be used with other save options for sorting
by the desired column. The <column> parameter can specify the column
index (0 for the first column, 1 for the second column, and so on) or the
name of the column, like "Filename" and "Process Name". You can specify
the '~' prefix character (e.g: "~Write Bytes") if you want to sort in
descending order. You can put multiple /sort in the command-line if you
want to sort by multiple columns.





Translating FileActivityWatch to other languages
================================================

In order to translate FileActivityWatch to other language, follow the
instructions below:
1. Run FileActivityWatch with /savelangfile parameter:
   FileActivityWatch.exe /savelangfile
   A file named FileActivityWatch_lng.ini will be created in the folder
   of FileActivityWatch utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run FileActivityWatch, and all
   translated strings will be loaded from the language file.
   If you want to run FileActivityWatch without the translation, simply
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

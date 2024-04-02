


AppReadWriteCounter v1.41
Copyright (c) 2018 - 2023 Nir Sofer
Web site: https://www.nirsoft.net



Description
===========

AppReadWriteCounter is a tool for Windows that counts and displays the
current file read/write operations of every application running on your
system. It displays the number of read/write bytes, the number of
read/write operations, current calculated read/write speed, and the
details about the application (product name, product version, and so on)
that makes the file read/write operations.



System Requirements
===================

This tool works on any version of Windows, starting from Windows XP and
up to Windows 11. Both 32-bit and 64-bit versions of Windows are
supported. On Windows Vista and later, if you want to view the full path
of system processes , you have to run AppReadWriteCounter as
Administrator.



Known Issues
============


* On Windows XP, for some applications (including AppReadWriteCounter
  itself) you may see constant increase in the read counters without any
  actual file read.



Versions History
================


* Version 1.41:
  o Added 'Sort By' button to the toolbar.

* Version 1.40:
  o Added 'Average Read Speed' and 'Average Write Speed' columns,
    which calculate the speed between the 'First Activity Time' and 'Last
    Activity Time'.

* Version 1.37:
  o Fixed to display the speed values according to the 'Regional
    Settings' of Windows.
  o Added Kbps speed unit.

* Version 1.36:
  o Added option to change the sorting column from the menu (View ->
    Sort By). Like the column header click sorting, if you click again
    the same sorting menu item, it'll switch between ascending and
    descending order. Also, if you hold down the shift key while choosing
    the sort menu item, you'll get a secondary sorting.

* Version 1.35:
  o Added new columns: 'Read+Write Count', 'Read+Write Bytes'.

* Version 1.32:
  o Added 'Start As Hidden' option. When this option and 'Put Icon On
    Tray' option are turned on, the main window of AppReadWriteCounter
    will be invisible on start.
  o Updated to work properly in high DPI mode

* Version 1.31:
  o Added 'Process Services' column, which displays the services of
    the process (Only when the 'Group By' option is 'Process ID').

* Version 1.30:
  o Added 'Show Total Line' option. When it's turned on, a 'Total'
    item is added, showing the total read/write information of all
    applications together.

* Version 1.26:
  o Added 'Select All' and 'Deselect All' to the 'Column Settings'
    window.
  o Added /RunAsAdmin command-line option for running
    AppReadWriteCounter as administrator.

* Version 1.25:
  o Added thousands separator to all byte counter units.
  o You can set any variable appears saved in the .cfg file from
    command-line. For example, this command set the speed unit to kB/Sec :
    AppReadWriteCounter.exe /SpeedUnit 1
  o Added 'Align Numeric Columns To Right' option (It's turned on by
    default).

* Version 1.20:
  o Added 'Group By' option - Application Name (The default) or
    Process ID. If you choose the 'Process ID' option - every process ID
    of the same application is displayed as a separated item.
  o Added new columns 'First Activity Time' and 'Last Activity Time'.
  o Added 'Hide Inactive Items' option.
  o Added 'Maximum Read Speed' and 'Maximum Write Speed' columns.

* Version 1.15:
  o Added 'Put Icon On Tray' option.

* Version 1.13:
  o Added 'Save File Encoding' option.

* Version 1.12:
  o Added 'Sort On Every Update' option.

* Version 1.11:
  o Added 'Add Header Line To CSV/Tab-Delimited File' option (Turned
    on by default).
  o Added 'Always On Top' option.

* Version 1.10:
  o Added command-line options to save the report of
    AppReadWriteCounter into a file without displaying any user interface.

* Version 1.06:
  o Added 'Save All Items' option (Shift+Ctrl+S).

* Version 1.05:
  o Added option to choose another font (name and size) to display in
    the main window.

* Version 1.00: First release.



Start Using AppReadWriteCounter
===============================

AppReadWriteCounter doesn't require any installation process or
additional DLL files. In order to start using it, simply run the
executable file - AppReadWriteCounter.exe

Immediately after running it, the main window displays every application
that currently read or write files. Be aware that the counters in this
tool are not per process but per application, so if you have multiple
processes for the same application , AppReadWriteCounter merges them into
one line. Also, if you close an application and then run it again,
AppReadWriteCounter will continue the update the read/write counters of
the same application entry.
At any time, you can clear the entire list and start with empty window by
pressing Ctrl+X (Clear All). You can also reset the counters of selected
items by pressing Ctrl+R (Reset Selected Counters).



Command-Line Options
====================



/CaptureTime <Milliseconds>
Specifies the capture time in milliseconds for the save command-line
options (/stext, /stab, /scomma, and so on...)
The default is 10000 milliseconds (10 seconds).

/cfg <Filename>
Start AppReadWriteCounter with the specified configuration file. For
example:
AppReadWriteCounter.exe /cfg "c:\config\arwc.cfg"
AppReadWriteCounter.exe /cfg "%AppData%\AppReadWriteCounter.cfg"

/RunAsAdmin
Runs AppReadWriteCounter as administrator.

/stext <Filename>
Save the report of AppReadWriteCounter into a simple text file.

/stab <Filename>
Save the report of AppReadWriteCounter into a tab-delimited text file.

/scomma <Filename>
Save the report of AppReadWriteCounter into a comma-delimited text file
(csv).

/shtml <Filename>
Save the report of AppReadWriteCounter into HTML file (Horizontal).

/sverhtml <Filename>
Save the report of AppReadWriteCounter into HTML file (Vertical).

/sxml <Filename>
Save the report of AppReadWriteCounter into XML file.

/sjson <Filename>
Save the report of AppReadWriteCounter into JSON file.

/sort <column>
This command-line option can be used with other save options for sorting
by the desired column. The <column> parameter can specify the column
index (0 for the first column, 1 for the second column, and so on) or the
name of the column, like "Application Namequot; and "Application Path".
You can specify the '~' prefix character (e.g: "~Write Bytes") if you
want to sort in descending order. You can put multiple /sort in the
command-line if you want to sort by multiple columns.





Translating AppReadWriteCounter to other languages
==================================================

In order to translate AppReadWriteCounter to other language, follow the
instructions below:
1. Run AppReadWriteCounter with /savelangfile parameter:
   AppReadWriteCounter.exe /savelangfile
   A file named AppReadWriteCounter_lng.ini will be created in the folder
   of AppReadWriteCounter utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run AppReadWriteCounter, and all
   translated strings will be loaded from the language file.
   If you want to run AppReadWriteCounter without the translation, simply
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

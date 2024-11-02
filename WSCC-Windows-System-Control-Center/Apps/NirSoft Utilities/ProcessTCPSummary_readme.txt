


ProcessTCPSummary v1.22
Copyright (c) 2018 - 2024 Nir Sofer
Web site: https://www.nirsoft.net



Description
===========

ProcessTCPSummary is a simple tool for Windows that displays a summary of
all process that have TCP connections or listening UDP ports. For every
process, this tool displays the total number of TCP connections, number
of TCP connections for each status (Established, Listening, Syn-Sent,
Syn-Received...), number of IPv4 TCP connections, number of IPv6 TCP
connections, common port numbers, and more...
If you run ProcessTCPSummary as Administrator, you can also watch the
number of TCP/UDP bytes sent and received by every process as well as the
current send/receive speed.



System Requirements
===================

This tool works on any version of Windows, starting from Windows XP and
up to Windows 11. Both 32-bit and 64-bit versions of Windows are
supported. On Windows Vista and later, if you want to view the full path
of system processes or you want to view the sent/reveived bytes
information , you have to run ProcessTCPSummary as Administrator.



Versions History
================


* Version 1.22:
  o Fixed bug with the 'Mark Odd/Even Rows' option.

* Version 1.21:
  o Added 'Save All Items' option (Shift+Ctrl+S).

* Version 1.20:
  o Added 'Black Background' option (Under the View menu). When it's
    turned on, the main table is displayed in black background and white
    text, instead of default system colors.

* Version 1.18:
  o Added 'Sort By' toolbar button.

* Version 1.17:
  o Added 'Bytes Counter Unit' option. You can choose one of the
    following units: Bytes, kB, KiB, MB, MiB, GB, GiB.

* Version 1.16:
  o Added 'Always On Top' option.

* Version 1.15:
  o Added 'Start As Hidden' option. When this option and 'Put Icon On
    Tray' option are turned on, the main window of ProcessTCPSummary will
    be invisible on start.
  o Updated to work properly in high DPI mode (Toolbar and properties
    window).
  o Added option to change the sorting column from the menu (View ->
    Sort By). Like the column header click sorting, if you click again
    the same sorting menu item, it'll switch between ascending and
    descending order. Also, if you hold down the shift key while choosing
    the sort menu item, you'll get a secondary sorting.

* Version 1.11:
  o Added /RunAsAdmin command-line option for running
    ProcessTCPSummary as administrator.
  o Added 'Select All' and 'Deselect All' to the 'Column Settings'
    window.

* Version 1.10:
  o Added 'Put Icon On Tray' option.

* Version 1.05:
  o Added 'Process Services' column.

* Version 1.02:
  o Added 'Sort On Every Update' option.

* Version 1.01:
  o Added /cfg command-line option to start ProcessTCPSummary with
    the specified config file.
  o Added 'Add Header Line To CSV/Tab-Delimited File' option (Turned
    on by default).

* Version 1.00 - First release.



Start Using ProcessTCPSummary
=============================

This utility doesn't require any installation process or additional DLL
files. In order to start using it, simply run the executable file -
ProcessTCPSummary.exe
After running ProcessTCPSummary, the main window displays a summary of
TCP connections for every process.



Command-Line Options
====================



/cfg <Filename>
Start ProcessTCPSummary with the specified configuration file. For
example:
ProcessTCPSummary.exe /cfg "c:\config\pts.cfg"
ProcessTCPSummary.exe /cfg "%AppData%\ProcessTCPSummary.cfg"

/RunAsAdmin
Runs ProcessTCPSummary as administrator.

/stext <Filename>
Save the process TCP Summary into a simple text file.

/stab <Filename>
Save the process TCP Summary into a tab-delimited text file.

/scomma <Filename>
Save the process TCP Summary into a comma-delimited text file (csv).

/sjson <Filename>
Save the process TCP Summary into a JSON file.

/shtml <Filename>
Save the process TCP Summary into HTML file (Horizontal).

/sverhtml <Filename>
Save the process TCP Summary into HTML file (Vertical).

/sxml <Filename>
Save the process TCP Summary into XML file.

/sort <column>
This command-line option can be used with other save options for sorting
by the desired column. The <column> parameter can specify the column
index (0 for the first column, 1 for the second column, and so on) or the
name of the column, like "TCP Established" and "Total TCP". You can
specify the '~' prefix character (e.g: "~TCP Listening") if you want to
sort in descending order. You can put multiple /sort in the command-line
if you want to sort by multiple columns.





Translating ProcessTCPSummary to other languages
================================================

In order to translate ProcessTCPSummary to other language, follow the
instructions below:
1. Run ProcessTCPSummary with /savelangfile parameter:
   ProcessTCPSummary.exe /savelangfile
   A file named ProcessTCPSummary_lng.ini will be created in the folder
   of ProcessTCPSummary utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run ProcessTCPSummary, and all
   translated strings will be loaded from the language file.
   If you want to run ProcessTCPSummary without the translation, simply
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

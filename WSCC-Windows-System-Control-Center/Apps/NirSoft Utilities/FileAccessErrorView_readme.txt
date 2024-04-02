


FileAccessErrorView v1.32
Copyright (c) 2018 - 2023 Nir Sofer
Web site: https://www.nirsoft.net



Description
===========

FileAccessErrorView is a diagnostic tool for Windows that displays
information about errors occur while programs running on your system try
to open/read/write/delete a file. FileAccessErrorView displays the
filename that the application tried to open/read/write/delete, the
process id/name of the application, the error code (NTSTATUS code), the
description of the error code, the number of times that this error
occurred, and the timestamp of this error.



System Requirements
===================

This tool works on any version of Windows, starting from Windows Vista
and up to Windows 11. Both 32-bit and 64-bit systems are supported.
Elevation ('Run As Administrator') is required to use this tool.



Versions History
================


* Version 1.32:
  o Added 'Black Background' option (Under the View menu). When it's
    turned on, the main table is displayed in black background and white
    text, instead of default system colors.
  o Added 'Full Screen' mode (View -> Full Screen or F11 key).

* Version 1.31:
  o Added 'Always On Top' option.

* Version 1.30:
  o Added 'Quick Filter' feature (View -> Use Quick Filter or
    Ctrl+Q). When it's turned on, you can type a string in the text-box
    added under the toolbar and FileAccessErrorView will instantly filter
    the file access error table, showing only lines that contain the
    string you typed.
  o Added option to change the sorting column from the menu (View ->
    Sort By). Like the column header click sorting, if you click again
    the same sorting menu item, it'll switch between ascending and
    descending order. Also, if you hold down the shift key while choosing
    the sort menu item, you'll get a secondary sorting.

* Version 1.26:
  o Added 'Open Folder In Explorer' option.

* Version 1.25:
  o Fixed some high DPI mode issues.

* Version 1.24:
  o Added 'Start As Hidden' option. When this option and 'Put Icon On
    Tray' option are turned on, the main window of FileAccessErrorView
    will be invisible on start.

* Version 1.23:
  o The tooltip of the tray icon now shows the number of errors
    displayed on the main window.

* Version 1.22:
  o Added 'File Properties' option, which displays the
    file-properties window for the selected file (Only if the file
    exists).

* Version 1.21:
  o Added 'Align Numeric Columns To Right' option (It's turned on by
    default).

* Version 1.20:
  o Added 'Response Time' column, which shows the number of
    milliseconds between the moment that the open/read/write call was
    made and when the error code was returned. If the 'Response Time'
    value is high (e.g: 10000 milliseconds) it means that the specified
    call might caused the software to hang.

* Version 1.15:
  o Added 'Put Icon On Tray' option.

* Version 1.12:
  o Fixed to display properly files on a remote network drive.

* Version 1.11:
  o Added 'Sort On Every Update' option.

* Version 1.10:
  o Added command-line options to save the report of
    FileAccessErrorView into a file without displaying any user interface.

* Version 1.07:
  o Added 'Save All Items' option (Shift+Ctrl+S).

* Version 1.06:
  o Added option to choose another font (name and size) to display in
    the main window.

* Version 1.05:
  o Added 'Automatically Scroll Down On New Items' option.

* Version 1.00 - First release.



Start Using FileAccessErrorView
===============================

FileAccessErrorView doesn't require any installation process or
additional DLL files. In order to start using it, simply run the
executable file - FileAccessErrorView.exe

After you run FileAccessErrorView, it immediately starts to trace the
open/read/write/delete operation of files and displays the details when
an error is detected.
Be aware: The fact that application get an error while trying to access a
file doesn't mean that something is wrong in this application. In fact,
in most programs you'll see some file access errors as a normal operation
of the software. However, if you have a program that hangs or crashes,
this tool may give you an hint about the cause of the problem. For
example: If a program hangs because it tries to access a file on a remote
disconnected computer, this tool will display the network path that the
program is trying to access.



'Skip Common Errors' Option
===========================

By default, FileAccessErrorView ignores the following error codes,
because they appear frequently in programs that run normally without any
problem: 0xc0000034 (The object name is not found) , 0xc0000035 (The
object name already exists.), 0xc00000ba (The file that was specified as
a target is a directory, and the caller specified that it could be
anything but a directory.), 0xc0000011 (The end-of-file marker has been
reached. There is no valid data in the file beyond this marker.),
0xc000003a (Path Not Found)

If you don't want to skip these errors, you can turn off the 'Skip Common
Errors' option (Under the Options menu).



Command-Line Options
====================



/CaptureTime <Milliseconds>
Specifies the capture time in milliseconds for the save command-line
options (/stext, /stab, /scomma, and so on...)
The default is 10000 milliseconds (10 seconds).

/cfg <Filename>
Start FileAccessErrorView with the specified configuration file. For
example:
FileAccessErrorView.exe /cfg "c:\config\faev.cfg"
FileAccessErrorView.exe /cfg "%AppData%\FileAccessErrorView.cfg"

/stext <Filename>
Save the report of FileAccessErrorView into a simple text file.

/stab <Filename>
Save the report of FileAccessErrorView into a tab-delimited text file.

/scomma <Filename>
Save the report of FileAccessErrorView into a comma-delimited text file
(csv).

/shtml <Filename>
Save the report of FileAccessErrorView into HTML file (Horizontal).

/sverhtml <Filename>
Save the report of FileAccessErrorView into HTML file (Vertical).

/sxml <Filename>
Save the report of FileAccessErrorView into XML file.

/sjson <Filename>
Save the report of FileAccessErrorView into JSON file.

/sort <column>
This command-line option can be used with other save options for sorting
by the desired column. The <column> parameter can specify the column
index (0 for the first column, 1 for the second column, and so on) or the
name of the column, like "Filename" and "Process Name". You can specify
the '~' prefix character (e.g: "~Error Code") if you want to sort in
descending order. You can put multiple /sort in the command-line if you
want to sort by multiple columns.





Translating FileAccessErrorView to other languages
==================================================

In order to translate FileAccessErrorView to other language, follow the
instructions below:
1. Run FileAccessErrorView with /savelangfile parameter:
   FileAccessErrorView.exe /savelangfile
   A file named FileAccessErrorView_lng.ini will be created in the folder
   of FileAccessErrorView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run FileAccessErrorView, and all
   translated strings will be loaded from the language file.
   If you want to run FileAccessErrorView without the translation, simply
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

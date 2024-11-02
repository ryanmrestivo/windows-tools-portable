


NetworkOpenedFiles v1.63
Copyright (c) 2016 - 2024 Nir Sofer
Web site: https://www.nirsoft.net



Description
===========

NetworkOpenedFiles is a simple tool for Windows that displays the list of
all files that are currently opened by other computers on your network.
For every opened filename, the following information is displayed:
Filename, user name, computer name (On Windows 7/2008 or later),
Permissions information (Read/Write/Create), locks count, file owner,
file size, file attributes, and more...



System Requirements
===================

This utility works on any version of Windows, starting from Windows XP
and up to Windows 11, including Windows Server. Both 32-bit and 64-bit
systems are supported. On systems older than Windows 7 or Windows Server
2008, NetworkOpenedFiles doesn't display the name of the computer that
opened the files ('Computer' column)



Versions History
================


* Version 1.63:
  o The tooltip of the tray icon now displays the current number of
    opened files.

* Version 1.62:
  o Added 'Sort By' toolbar button

* Version 1.61:
  o Added 'Full Screen' mode (View -> Full Screen or F11 key).
  o Added 'Black Background' option (Under the View menu). When it's
    turned on, the main table is displayed in black background and white
    text, instead of default system colors.

* Version 1.60:
  o You can now specify folder path in the filename filter, for
    example: c:\shared\*
  o Added option to include or exclude specific users according to
    the specified wildcards (In the 'Advanced Options' window).
  o Added option to include or exclude specific computers according
    to the specified wildcards (In the 'Advanced Options' window).

* Version 1.53:
  o Added 'Add Header Line To CSV/Tab-Delimited File' option (Turned
    on by default).

* Version 1.52:
  o Added /Columns command-line option, which allows you to set the
    columns to display or the columns to export from command-line, for
    example:
    NetworkOpenedFiles.exe /Columns "Filename, User, Computer,File
    Owner,File Size"

* Version 1.51:
  o Added 'Always On Top' option.

* Version 1.50:
  o Added 'Open Selected File With' option.
  o Added 'Double-Click Action' option, which allows you to choose
    what to do when you double-click a download item with the mouse:
    None, Open Properties Window, Open File Properties, Open Selected
    File, Open Selected File With, Open Folder In Explorer
  o Added 'Enter Action' option, which allows you to choose what to
    do when you press the Enter key: None, Open Properties Window, Open
    File Properties, Open Selected File, Open Selected File With, Open
    Folder In Explorer

* Version 1.45:
  o Added /close command-line option, which allows you to close
    opened files according to the specified wildcard, for example:
    NetworkOpenedFiles.exe /close *.doc
    NetworkOpenedFiles.exe /close "c:\shared\*.exe"

* Version 1.40:
  o Added option to change the sorting column from the menu (View ->
    Sort By). Like the column header click sorting, if you click again
    the same sorting menu item, it'll switch between ascending and
    descending order. Also, if you hold down the shift key while choosing
    the sort menu item, you'll get a secondary sorting.

* Version 1.38:
  o Fixed some high DPI mode issues (Toolbar, Properties Window).

* Version 1.37:
  o Added 'Start As Hidden' option. When this option and 'Put Icon On
    Tray' option are turned on, the main window of NetworkOpenedFiles
    will be invisible on start.

* Version 1.36:
  o Added support for exporting the opened network files list to JSON
    file.
  o Updated the HTML export feature to HTML5.

* Version 1.35:
  o Added option to include or exclude the files according to the
    specified wildcards (In the 'Advanced Options' window). You can
    specify multiple wildcards to include or exclude as comma-delimited
    list, for example: *.exe, *.docx, *.txt
  o Fixed the /cfg command-line option to load the .cfg file from the
    current directory if full path is not specified.

* Version 1.32:
  o Fixed bug: NetworkOpenedFiles failed to add a tray icon when
    running program with the tray icon option turned on.
  o Added 'Open Selected File' option.

* Version 1.31:
  o Added 'File Properties' option, which displays the
    file-properties window for the selected file.

* Version 1.30:
  o Added 'Show Opened Files' and 'Show Opened Folders' options
    (Under the Options menu). You can turn off one of these options if
    you want to view only the opened files (without folders) or only the
    opened folders.

* Version 1.27:
  o Added 'Select All' and 'Deselect All' to the 'Column Settings'
    window.

* Version 1.26:
  o Added accelerator keys to the 'Close Selected Opened Files' and
    'Open Folder In Explorer' options.

* Version 1.25:
  o Added /cfg command-line option to start NetworkOpenedFiles with
    the specified config file.
  o Explorer context menu inside NetworkOpenedFiles: When you
    right-click on a single item while holding down the shift key,
    NetworkOpenedFiles now displays the context menu of Windows Explorer,
    instead of the NetworkOpenedFiles context menu. This feature only
    works for existing files.

* Version 1.22:
  o You can now resize the properties window, and the last
    size/position of this window is saved in the .cfg file.
  o You can now send the data to stdout by specifying empty string as
    filename, for example:
    NetworkOpenedFiles.exe /scomma "" | more

* Version 1.21:
  o Added option to choose another font (name and size) to display in
    the main window.
  o Fixed a crash problem with resolving IP addresses.

* Version 1.20:
  o The 'Resolve IP Addresses' option now also works with IPv6
    addresses.
  o Added 'Quick Filter' feature (View -> Use Quick Filter or
    Ctrl+Q). When it's turned on, you can type a string in the text-box
    added under the toolbar and NetworkOpenedFiles will instantly filter
    the files list, showing only lines that contain the string you typed.

* Version 1.18:
  o Fixed bug: 'Copy Selected Items' worked improperly when setting
    the 'Unicode/Ascii Save Mode' to 'Always UTF-8'.

* Version 1.17:
  o Added 'Entry Modified Time' column.

* Version 1.16:
  o The 'Host Name' column is now also added to the log file.

* Version 1.15:
  o Added 'Resolve IP Addresses' option. When it's turned on and the
    computer name is detected as IP address, NetworkOpenedFiles tries to
    resolve the IP address to host name, and the host name is displayed
    in 'Host Name' column.

* Version 1.12:
  o When connecting a remote computer, the computer name is now
    displayed in the window title.

* Version 1.11:
  o Added 'Save All Items' option.

* Version 1.10:
  o Added option to add every change (Opening files and closing
    files) into a log file (In 'Advanced Options' window).

* Version 1.08:
  o Added new information to 'File Attributes' column: 'T' for
    'Temporary File', 'I' for 'Not Content Indexed', 'E' for encrypted
    file, 'X' for 'No Scrub File', and 'V' for 'Integrity Attribute'.

* Version 1.07:
  o You can now choose the desired encoding (ANSI, UTF-8, UTF-16) to
    save the csv/xml/text/html files. (Under the Options menu)

* Version 1.06:
  o Added 'Put Icon On Tray' option.

* Version 1.05:
  o Added 'Open Folder In Explorer' option.
  o Added command-line options to connect a remote computer.
    (/LoadFrom and /RemoteComputerName)

* Version 1.00 - First release.



Start Using NetworkOpenedFiles
==============================

NetworkOpenedFiles doesn't require any installation process or additional
DLL files. In order to start using it, simply run the executable file -
NetworkOpenedFiles.exe
After running NetworkOpenedFiles, the main window displays the list of
all files that are opened by other computers on your network. You can
select one or more opened files, and then close them using the 'Close
Selected Opened Files' option, export the files list to
text/csv/tab-delimited/xml/html file using the 'Save Selected Items'
option, or copy the files list to the clipboard (Ctrl+C) and paste it to
Excel or any other spreadsheet application.



Display Mode
============

NetworkOpenedFiles allows you to display the opened files in 2 different
modes:
* Show all entries: In this mode, NetworkOpenedFiles displays all
  opened files, exactly as they are received from Windows operating
  system.
* Merge items with the same filename+user+computer: In this mode, if
  there are multiple items with the same filename, user, and computer
  name - NetworkOpenedFiles merges them into one item.

You can change the display mode from Options -> Display Mode.



Connecting to a remote computer
===============================

NetworkOpenedFiles also allows you to connect another computer on your
network, if you have full administrator rights. In order to connect
another computer, simply open the 'Advanced Options' window (F9) ,choose
'Load opened network files from remote computer' and then type the name
of the computer you want to connect.



Command-Line Options
====================



/close <Wildcard>
Closes opened files according to the specified wildcard. If the folder
path is specified (e.g: C:\MyFiles\*.pdf) then only the files on the
specified folder will be closed.
If folder is not specified (e.g: *.pdf ) , all files that match the
specified wildcard will be closed.

Examples:
NetworkOpenedFiles.exe /close *.pdf
NetworkOpenedFiles.exe /close "c:\Apps\*.exe"

/LoadFrom <1 | 2>
Specifies whether to load the opened files list from this computer or
remote computer. 1 = this computer, 2 = remote computer

/RemoteComputerName <Computer Name>
Specifies the remote computer name (for using with /LoadFrom 2)

/stext <Filename>
Save the opened network files into a simple text file.

/stab <Filename>
Save the opened network files into a tab-delimited text file.

/scomma <Filename>
Save the opened network files into a comma-delimited text file (csv).

/stabular <Filename>
Save the opened network files into a tabular text file.

/shtml <Filename>
Save the opened network files into HTML file (Horizontal).

/sverhtml <Filename>
Save the opened network files into HTML file (Vertical).

/sxml <Filename>
Save the opened network files into XML file.

/sjson <Filename>
Save the opened network files into JSON file.

/sort <column>
This command-line option can be used with other save options for sorting
by the desired column. The <column> parameter can specify the column
index (0 for the first column, 1 for the second column, and so on) or the
name of the column, like "Computer" and "User". You can specify the '~'
prefix character (e.g: "~User") if you want to sort in descending order.
You can put multiple /sort in the command-line if you want to sort by
multiple columns.



/Columns <Comma Delimited Columns List>
Allows you to set the columns to display or the columns to export from
command-line. You have to specify the column names, delimited by comma,
for example:
NetworkOpenedFiles.exe /scomma c:\temp\opened-network-files.csv /Columns
"Filename, User, Computer,File Owner,File Size"

You can also specify the column names without space characters, for
example:
NetworkOpenedFiles.exe /Columns "Filename, User,
Computer,FileOwner,FileSize"

/cfg <Filename>
Start NetworkOpenedFiles with the specified configuration file. For
example:
NetworkOpenedFiles.exe /cfg "c:\config\nof.cfg"
NetworkOpenedFiles.exe /cfg "%AppData%\NetworkOpenedFiles.cfg"

You can also use any variable inside the config file
(NetworkOpenedFiles.cfg) as command-line parameter to set the desired
options.
For example, the following command starts the NetworkOpenedFiles with
filename and user name filters (Show only files under c:\Shared folder
opened by User01,User02, or User03):
NetworkOpenedFiles.exe /FilenameFilter 1 /FilenameFilterString
"c:\Shared\*" /UserNameFilter 1 /UserNameFilterString
"User01,User02,User03"



Translating NetworkOpenedFiles to other languages
=================================================

In order to translate NetworkOpenedFiles to other language, follow the
instructions below:
1. Run NetworkOpenedFiles with /savelangfile parameter:
   NetworkOpenedFiles.exe /savelangfile
   A file named NetworkOpenedFiles_lng.ini will be created in the folder
   of NetworkOpenedFiles utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run NetworkOpenedFiles, and all
   translated strings will be loaded from the language file.
   If you want to run NetworkOpenedFiles without the translation, simply
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

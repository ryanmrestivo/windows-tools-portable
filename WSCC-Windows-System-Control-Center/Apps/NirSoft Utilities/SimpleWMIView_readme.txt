


SimpleWMIView v1.55
Copyright (c) 2015 - 2023 Nir Sofer
Web site: https://www.nirsoft.net



Description
===========

SimpleWMIView is a simple tool for Windows that displays the result of
WMI queries in a simple table, and allows you to easily export the data
to text/csv/tab-delimited/html/xml file, or to copy the selected items to
the clipboard and then paste them to Excel or other spreadsheet
application. With SimpleWMIView you can get extensive information about
your system, like a list of running processes, services, drivers, user
accounts, hardware, and so on...



System Requirements
===================

This utility works on any version of Windows, starting from Windows XP
and up to Windows 11. Both 32-bit and 64-bit systems are supported.



Versions History
================


* Version 1.55:
  o Fixed issue: When copying data to the clipboard or exporting to
    tab-delimited file, every line contained an empty field in the end of
    the line.

* Version 1.54:
  o Added 'Full Screen' mode (View -> Full Screen or F11 key).

* Version 1.53:
  o Added 'Sort By' button to the toolbar.

* Version 1.52:
  o Added 'Show Milliseconds In Time' option.

* Version 1.51:
  o Updated the /Columns command-line option to also set the
    displayed columns in the GUI, for example:
    SimpleWMIView.exe /Namespace "root\CIMV2" /Class "WIN32_Process"
    /Columns "Caption,CommandLine,ExecutablePath,HandleCount" /Update

* Version 1.50:
  o Added /Columns command-line option, which allows you to specify
    the fields to export from command-line (For using with the save
    command-line option - /stab , /scomma, and others)

* Version 1.48:
  o Added new quick filter option: Find a string begins with...

* Version 1.47:
  o When you move the mouse over the column header, you can now see
    the field type in the bottom status bar.

* Version 1.46:
  o When there is a WMI error code (usually begins with 0x8004), the
    error description is now displayed in the status bar in addition to
    the error code.
  o You can also click the error code with the mouse in order to copy
    the error code and error description to the clipboard.
  o Fixed bug with 'Choose Column' window in high DPI mode.

* Version 1.45:
  o Added option to change the sorting column from the menu (View ->
    Sort By). Like the column header click sorting, if you click again
    the same sorting menu item, it'll switch between ascending and
    descending order. Also, if you hold down the shift key while choosing
    the sort menu item, you'll get a secondary sorting.

* Version 1.43:
  o Updated to work properly in high DPI mode.

* Version 1.42:
  o Added 'Start As Hidden' option. When this option and 'Put Icon On
    Tray' option are turned on, the main window of SimpleWMIView will be
    invisible on start.

* Version 1.41:
  o Added 'Copy Clicked Cell' option to the right-click context menu,
    which copies to the clipboard the text of cell that you right-clicked
    with the mouse.
  o Fixed to save the 'Case Sensitive' option of the Quick Filter in
    the .cfg file.

* Version 1.40:
  o Added 'Case Sensitive' option to the Quick Filter window.

* Version 1.38:
  o When pressing F5 (Refresh) the refresh process is smoother,
    keeping the selected item and scroll position.

* Version 1.37:
  o Added 'Enumerate Full Namespace Tree' option. When it's turned
    on, SimpleWMIView fills the namespace combo with full namespace tree.
    This feature works only when you run SimpleWMIView as Administrator.
  o Fixed to display arrays of 8-bit and 16-bit integers.

* Version 1.36:
  o Added /RunAsAdmin command-line option for running SimpleWMIView
    as administrator.

* Version 1.35:
  o Added 'Auto Complete Classes Combo-Box' option. When it's turned
    on, you can type a string in the classes field, and the combo-box
    will show only the available classes that contain the string you
    typed, instead of showing the list of all classes.

* Version 1.33:
  o You can now send the data to stdout by specifying empty string as
    filename, for example:
    SimpleWMIView.exe /scomma "" | more

* Version 1.32:
  o Added new quick filter options: 'Find records with all words
    (space-delimited list)' and 'Find records with all strings
    (comma-delimited list)'
  o Added new quick filter combo-box: 'Show only items match the
    filter' and 'Hide items that match the filter'.

* Version 1.31:
  o Fixed bug: 'Copy Selected Items' worked improperly when setting
    the 'Unicode/Ascii Save Mode' to 'Always UTF-8'.
  o Added /cfg command-line option, which instructs SimpleWMIView to
    use a config file in another location instead if the default config
    file, for example:
    SimpleWMIView.exe /cfg "%AppData%\SimpleWMIView.cfg"

* Version 1.30:
  o Added option to specify user name and password (for remote
    computer).

* Version 1.25:
  o Added 'Quick Filter' feature (View -> Use Quick Filter or
    Ctrl+Q). When it's turned on, you can type a string in the text-box
    added under the WMI options and SimpleWMIView will instantly filter
    the WMI table, showing only lines that contain the string you typed.

* Version 1.22:
  o Fix bug: When using /SaveDirect command-line option, the file was
    always saved according to the default encoding, instead of using the
    selected encoding in Options -> Save File Encoding.

* Version 1.21:
  o Added 'Save All' menu item.

* Version 1.20:
  o Added /update command-line option, which automatically show the
    result of current WMI query immediately after SimpleWMIView starts,
    so there is no need the press the update button.

* Version 1.17:
  o Added option to choose another font (name and size) to display in
    the main table.
  o Added 64-bit version for getting WMI information that is not
    available for 32-bit applications running in 64-bit systems (like
    Win32_ShadowCopy)

* Version 1.16:
  o Added 'Align Numeric Columns To Right' option.
  o Added 'Select All' and 'Deselect All' buttons to the 'Choose
    Column' window.

* Version 1.15:
  o You can now choose the desired encoding (ANSI, UTF-8, UTF-16) to
    save the csv/xml/text/html files. (Under the Options menu)

* Version 1.12:
  o Added 'New SimpleWMIView Instance' under the File menu, for
    opening a new window of SimpleWMIView.

* Version 1.11:
  o The total query time (in Milliseconds) in now displayed in the
    bottom status bar.

* Version 1.10:
  o Added 'Auto Update On Class/Query Change' option.

* Version 1.09:
  o The properties window is now resizable.

* Version 1.08:
  o Added /SaveDirect command-line option for using with the other
    save command-line options (/scomma, /stab, /sxml, and so on...),
    which allows you to export the WMI data directly to a file, instead
    of accumulating all data in memory and then save them to file in the
    end.

* Version 1.07:
  o Added 'Copy Sorted Column Data' option, which copies to the
    clipboard the text of all selected items, but only the column that is
    currently sorted.

* Version 1.06:
  o Added option to export to JSON file.

* Version 1.05:
  o Added 'Put Icon On Tray' option.

* Version 1.01:
  o The current WMI class/query and the remote computer name are now
    displayed in the window title.

* Version 1.00 - First release.



Start Using SimpleWMIView
=========================

SimpleWMIView doesn't require any installation process or additional DLL
files. In order to starting using it, simply run the executable file -
SimpleWMIView.exe
After running it, you can type or choose the desired namespace (The
default is the most common one - root\CIMV2) and then the class name (The
default is Win32_Process, which lists all running processes on your
system). You can also type a full WQL query, like 'SELECT * FROM
Win32_Process WHERE Priority > 8'. After choosing the namespace and
class, simply press F5 (or the Update button) to execute the WMI query
and then watch the result inside the table.



Examples for what you can get with WMI
======================================

Here's some examples of the information you can get with WMI queries (On
root\CIMV2 namespace):
* Win32_Service - Lists all Windows services.
* Win32_Share - Lists all network shares on your machine.
* Win32_StartupCommand - Lists programs that run on Windows startup.
* Win32_SystemAccount - Lists all system accounts.
* Win32_UserAccount - Lists all user accounts.
* Win32_SystemDriver - Lists all drivers installed on your system.
* Win32_USBHub - Lists all USB hubs.
* Win32_NetworkAdapter - Lists all network adapters.
* Win32_Printer - Lists all printers.
* Win32_Battery - Shows battery information.
* Win32_QuickFixEngineering - Lists installed Windows updates.
* Win32_OperatingSystem - Information about version of operating system
  - Operating system name, version, service pack, build number, computer
  name, and so on...
* Win32_SerialPort - Lists the serial ports on your system.
* Win32_Environment - Lists all environment variables on your system.
* Win32_Process - Lists all processes running on your system.

Be aware that on Windows Vista/7/8/10/2008, you'll get more information
on some WMI queries if you run SimpleWMIView as administrator. You can
easily start SimpleWMIView as administrator by pressing Ctrl+F11.



Connecting a remote computer
============================

SimpleWMIView also allows you to get the result of WMI query from a
remote computer on your network, as long as the remote computer is
configured correctly to accept WMI requests remotely.
In order to connect a remote computer, choose 'Connect another computer'
in the computer combo-box, and then type the name of the computer you
wish to connect. If you get 'Access Denied' error even when the remote
computer is configured properly for WMI, try to switch to 'Synchronous
Query' mode, and try to specify the user name and password on the remote
computer.



Command-Line Options
====================

SimpleWMIView allows you to export the WMI data into a file, without
displaying any user interface, for example:
SimpleWMIView.exe /Namespace "root\CIMV2" /Class "CIM_Service" /shtml
c:\temp\services.html /Sort "Caption"
SimpleWMIView.exe /Namespace "root\CIMV2" /Class "WIN32_Process" /scomma
c:\temp\processes.csv /Sort "CommandLine"
SimpleWMIView.exe /Namespace "root\CIMV2" /Class "SELECT * FROM
Win32_Process WHERE HandleCount > 500" /scomma c:\temp\processes.csv
SimpleWMIView.exe /ConnectComputer 2 /ComputerName mypc1 /SyncMode 2
/Namespace "root\CIMV2" /Class "WIN32_Process" /scomma
c:\temp\processes.csv /Sort "CommandLine"
SimpleWMIView.exe /SaveDirect /Namespace "root\CIMV2" /Class
"CIM_Service" /scomma c:\temp\services.csv



/cfg <Filename>
Start SimpleWMIView with the specified configuration file. For example:
SimpleWMIView.exe /cfg "c:\config\swv.cfg"
SimpleWMIView.exe /cfg "%AppData%\SimpleWMIView.cfg"

/Update
Instructs SimpleWMIView to instantly show the result of the WMI query
without pressing the update button.

/Namespace <Namespace>
Specifies the namespace to load.

/Class <Class>
Specifies the class to load. You can also specify a WQL query in this
parameter.

/ConnectComputer <Value>
1 = this computer, 2 = Connect the computer specified in /ComputerName
parameter.

/ComputerName <Name>
Specifies the computer name to connect (for using with /ConnectComputer 2)

/SyncMode <Value>
1 = Asynchronous Query, 2 = Synchronous Query

/RunAsAdmin
Runs SimpleWMIView as administrator.

/stext <Filename>
Save the WMI Data into a regular text file.

/stab <Filename>
Save the WMI Data into a tab-delimited text file.

/scomma <Filename>
Save the WMI Data into a comma-delimited text file (csv).

/stabular <Filename>
Save the WMI Data into a tabular text file.

/shtml <Filename>
Save the WMI Data into HTML file (Horizontal).

/sverhtml <Filename>
Save the WMI Data into HTML file (Vertical).

/sxml <Filename>
Save the WMI Data into XML file.

/sjson <Filename>
Save the WMI Data into JSON file.

/SaveDirect
Save the WMI data in SaveDirect mode. For using with the other save
command-line options ( /scomma, /stab, /sxml, and so on...) When you use
the SaveDirect mode, the WMI records are saved directly to the disk,
without loading them into the memory first.

/sort <column>
This command-line option can be used with other save options for sorting
by the desired column. The <column> parameter can specify the column
index (0 for the first column, 1 for the second column, and so on) or the
name of the column, like "Caption" and "CommandLine". You can specify the
'~' prefix character (e.g: "~CreationDate") if you want to sort in
descending order. You can put multiple /sort in the command-line if you
want to sort by multiple columns.



/Columns <Comma Delimited Columns List>
You can use this command with the other save commands (/scomma, /stab,
and so on) in order to export only the specified columns, instead of all
columns.
You have to specify the field names, delimited by comma, for example:
SimpleWMIView.exe /Namespace "root\CIMV2" /Class "Win32_Service" /shtml
c:\temp\services.html /Sort "Caption" /Columns
"Caption,Description,DisplayName,ServiceType,StartMode,StartName,State,Stat
us,PathName"

You can also use this command to set the visible columns in the GUI, for
example:
SimpleWMIView.exe /Namespace "root\CIMV2" /Class "WIN32_Process" /Columns
"Caption,CommandLine,ExecutablePath,HandleCount" /Update

For all save command-line options, you can specify empty filename in
order to send the data to stdout, for example:
SimpleWMIView.exe /scomma "" | more



Translating SimpleWMIView to other languages
============================================

In order to translate SimpleWMIView to other language, follow the
instructions below:
1. Run SimpleWMIView with /savelangfile parameter:
   SimpleWMIView.exe /savelangfile
   A file named SimpleWMIView_lng.ini will be created in the folder of
   SimpleWMIView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run SimpleWMIView, and all
   translated strings will be loaded from the language file.
   If you want to run SimpleWMIView without the translation, simply
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




SysExporter v1.77
Copyright (c) 2003 - 2019 Nir Sofer



Description
===========

SysExporter utility allows you to grab the data stored in standard
list-views, tree-views, list boxes, combo boxes, text-boxes, and
WebBrowser/HTML controls from almost any application running on your
system, and export it to text, HTML or XML file.
Here's some examples for data that you can export with SysExporter:
* The files list inside archive file (.zip, .rar, and so on) as
  displayed by WinZip or 7-Zip File Manager.
* The files list inside a folder.
* The event log of Windows.
* The list of emails and contacts in Outlook Express.
* The Registry values displayed in the right pane of the Registry
  Editor.
* The data displayed by SysInternals utilities (Registry Monitor, File
  Monitor, Process Explorer, and others.)
* The text inside a standard message-box of Windows.
* The HTML inside any instance of Internet Explorer.



Versions History
================


* Version 1.77:
  o You can now send the data to stdout by specifying empty string as
    filename, for example:
    sysexp.exe /Title "Windows Task Manager" /class SysListView32
    /Visible Yes /scomma "" | more

* Version 1.76:
  o When the 'Add Column Headers To Tab-Delimited File' option is
    turned on, the header is now also added to comma-delimited files.

* Version 1.75:
  o Added 'New SysExporter Instance' (Ctrl+N), which opens a new
    window of SysExporter.

* Version 1.72:
  o Added 'Run As Administrator' option (Ctrl+F11), which allows you
    to easily run SysExporter as administrator on Windows Vista/7/8/2008.
    You should use this option if you need to extract data from a
    software that is executed as administrator.

* Version 1.71:
  o Fixed to accept 64-bit handles in /Handle command-line option.

* Version 1.70:
  o Added command-line options that allows you to export the data of
    Windows controls to a file, without displaying any user interface.
    For example, to export the active ListView in the task manager of
    Windows to html file:
    sysexp.exe /Process "taskmgr.exe" /class "SysListView32" /Visible
    "Yes" /shtml "c:\temp\1.html"

* Version 1.62:
  o Fixed the flickering while scrolling the items of list-view.

* Version 1.61:
  o Added 'Auto Size Columns+Headers' option, which allows you to
    automatically resize the columns according to the row values and
    column headers.
  o Fixed issue: The properties and the other windows opened in the
    wrong monitor, on multi-monitors system.

* Version 1.60:
  o Added support for DirectUI control, which is used to display
    files and folders on Explorer Windows of Windows 7.

* Version 1.52:
  o Fixed the properties window to be closed when clicking the X
    button or pressing the Esc key.

* Version 1.51:
  o Added 'Remove Question Mark Characters' - Useful for date/time
    and some other columns of Explorer in Windows Vista.

* Version 1.50:
  o Added support for drag And drop feature - Allows you to easily
    locate the desired window simply by dragging the target icon from the
    SysExporter toolbar into the window that you need to grab the data.

* Version 1.41:
  o New option: Add Tree Indent Spaces To Exported Data.

* Version 1.40:
  o Added new columns: 'Window Class', and 'Visible'

* Version 1.39:
  o Fixed bug: The main window lost the focus when the user switched
    to another application and then returned back to SysExporter.

* Version 1.38:
  o Added 'Always On Top' option.

* Version 1.37:
  o Fixed bug in saving as comma-delimited file when field values
    contained comma character.

* Version 1.36:
  o Added support for saving to comma-delimited file.

* Version 1.35:
  o Added support for StatusBar controls.
  o The configuration is now saved to a file, instead of the Registry.

* Version 1.30:
  o New Option: Display HTML As Plain Text (For HTML controls)
  o New Option: Display Invisible Items.
  o New Option: Display Items With Invisible Parent Window.
  o Added filters by control type.

* Version 1.21:
  o Added support for labels.
  o When the lower pane contains text, you can now use the keyboard -
    Ctrl+A for selection, and Ctrl+C to copy the text to the clipboard.

* Version 1.20:
  o Added support for text-boxes.
  o Added support for WebBrowser/HTML controls (IHTMLDocument2
    interface) - Only on Windows 2000/XP.

* Version 1.10:
  o Added support for Tree-View Controls.
  o Copy to clipboard as tab-delimited text.
  o New Options under the Options menu.
  o Ability to translate to other languages.

* Version 1.00: First Release



System Requirement
==================

SysExporter Works perfectly on Windows NT, Windows 2000, Windows XP,
Windows Server 2003, Windows Server 2008, Windows Vista, Windows 7,
Windows 8, and Windows 10.
On Windows 9x and Windows ME, SysExporter can only export data from combo
boxes and list boxes controls, but not from list-view and tree-view
controls.



Known Limitations
=================

SysExporter can export data from most combo boxes, list boxes, tree-view,
and list-view controls, but not from all of them. There are some
applications that use these controls to display data, but the data itself
is not actually stored in the control, but in another location in the
computer's memory. In such cases, SysExporter won't be able to export the
data.



Using SysExporter
=================

This utility is a standalone executable, so it doesn't require any
installation process or additional DLLs. Just run the executable
(sysexp.exe) and start using it. There is only one exception: If you want
to run this utility on Windows NT, you should download the 'psapi.dll',
and copy it into the system32 folder.

The main window of SysExporter contains 2 panes:
1. The upper pane displays the list of current opened windows that are
   available for export.
2. When you select a single window in the upper pane, the lower pane
   displays all data that you can export from the selected window. For
   example: If you select the 'My computer' window in the upper pane, the
   lower pane will display the list of all your disks, and they are
   displayed in the original 'My Computer' window.
You can easily select one or more items from the lower pane, and then
export them to text, HTML or XML files. You can also copy the exported
data to the clipboard in tab-delimited format (Ctrl+C), and then paste it
directly to Excel or any other application that supports this format.
Before exporting the data, you can change the order of columns that will
be appeared in the saved files by using the 'Choose Columns' option.



Practical Example
=================

Let's say that you want to export the list of all files in your
C:\Windows folder to Excel:
1. First, open the 'C:\Windows' folder (or any other folder that you
   want to export).
2. In the top pane of SysExporter, find the window of 'C:\Windows'
   folder and select it. If you cannot find this window, try to refresh
   the list by pressing F5 key.
3. After selecting the desired window in the top pane, the files list
   of this window will be loaded to the lower pane.
4. Select the files in the lower pane that you want to export. (Press
   Ctrl+A in order to select all files)
5. Press Ctrl+C in order to copy the selected items to the clipbaord.
   (The exported items are copied in tab-delimited format)
6. In Excel, go the position that you want to put the exported data,
   and then press Ctrl+V to paste the exported data into your Excel
   worksheet.



Locating the right window with Drag & Drop
==========================================

Starting from version 1.50, you can easily locate the desired window by
using the targeting button. In order to do that, simply press the
targeting button of the toolbar, and then drag it to the window that you
wish to export the data. If the selected window is detected by
SysExporter, it'll automatically be displayed in SysExporter.



Command-Line Options
====================

Starting from version 1.70, you can export the content of Windows control
from command-line, without displaying any user interface. However, in
order to export the desired Windows control, you must specify enough
filters to uniquely identify the correct control you wish to export. If
there are multiple controls that match the filters you specified, then
SysExporter will randomly export only one of them.

You can use the following command-line parameters to define the control
you wish to export: /Process , /Title , /Class , /Type , /Visible ,
/Handle , MinItems, /MaxItems

Here's a few examples:
* Export the current visible ListView in the task manager of Windows to
  csv file:
  sysexp.exe /Title "Windows Task Manager" /class SysListView32 /Visible
  Yes /scomma "c:\temp\1.csv"
* Export the current visible ListView in the task manager of Windows to
  html file:
  sysexp.exe /Process taskmgr.exe /class "SysListView32" /Visible Yes
  /shtml "c:\temp\1.html"
* Export the content of HTML page in opened window of Internet Explorer:
  sysexp.exe /Type HTML /Process iexplore.exe /stext "c:\temp\1.html"


/Process <Process>
Specifies the process that has the Windows control you want to export.
You can specify the process exe file or the process ID, for example:
/Process "Explorer.exe"
/Process 5422

/Title <Title>
Specifies the title of the window that you want to export (The same title
that you see under the Title column), for example:
/Title "Windows Task Manager"
/Title "Local Disk (C:)"

/Class <Class>
Specifies the class name of the window you want to export (It's the same
string you see under the 'Window Class' column), for example:
/Class "SysListView32"
/Class "DirectUIHWND"

/Type <Type>
Specifies the type of the window you want to export (It's the same type
you see under the 'Type' column), for example:
/Type "TreeView"
/Type "ComboBox"

/Visible <Yes | No>
Specifies whether the control that you want to export is visible, for
example:
/Visible Yes
/Visible No

/Handle <Window Handle>
Specifies the window handle of the control you want to export, for
example:
/Handle 0x01571370

/MinItems <Number Of Items>
Specifies that you want to filter out all controls that don't have the
minimum number of items. For example, if you have an application with 2
ListViews, one with 10 items and the other with 50 items, adding the
following command will ensure that SysExporter will export the ListView
with the 50 items:
/MinItems 50

/MaxItems <Number Of Items>
Specifies that you want to filter out all controls that exceed the
maximum number of items.

/stext <Filename>
Export the data into a regular text file.

/stab <Filename>
Export the data into a tab-delimited text file.

/scomma <Filename>
Export the data into a comma-delimited text file (csv).

/stabular <Filename>
Export the data into a tabular text file.

/shtml <Filename>
Export the data into HTML file (Horizontal).

/sverhtml <Filename>
Export the data into HTML file (Vertical).

/sxml <Filename>
Export the data to XML file.



Translating to other languages
==============================

SysExporter allows you to easily translate all menus, dialog-boxes, and
other strings to other languages.
In order to do that, follow the instructions below:
1. Run SysExporter with /savelangfile parameter:
   sysexp.exe /savelangfile
   A file named sysexp_lng.ini will be created in the folder of
   SysExporter utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all menus, dialog-boxes, and string entries to the
   desired language.
4. After you finish the translation, Run SysExporter, and all
   translated strings will be loaded from the language file.
   If you want to run SysExporter without the translation, simply rename
   the language file, or move it to another folder.



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



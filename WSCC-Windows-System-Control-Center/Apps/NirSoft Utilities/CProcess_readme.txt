


CurrProcess v1.13
Copyright (c) 2003 - 2008 Nir Sofer



Description
===========

CurrProcess utility displays the list of all processes currently running
on your system. For each process, you can view the list of all modules
(DLL files) that the process loads into memory. for all processes and
modules, additional useful information is also displayed: product name,
version, company name, description of the file, the size of the file, and
more.
In addition, CurrProcess allows you to do the following actions:
* Change the priority of a process.
* Kill a process.
* Dump memory of process into a text file.
* Create HTML report containing information about a process with the
  list of all modules that it loads into memory.
* Save the list of all running processes into text or HTML file.
* Copy process or module information to the clipboard.



Versions History
================


* Version 1.13:
  o Fixed bug: The main window lost the focus when the user switched
    to another application and then returned back to CurrProcess.

* Version 1.12:
  o The configuration is now saved to a file, instead of the Registry.

* Version 1.11:
  o New column: File Attributes.

* Version 1.10:
  o New columns for process: created/modified date of the process
    file, window title, number of visible and hidden windows, the user
    that created the process (Only for Windows NT, 2000 and XP)
  o New columns that displays memory information for a process (Only
    for Windows NT, 2000 and XP)
  o New option: Beep On New Process - plays a beep when a new process
    is created.
  o New option: Mark Unidentified Processes - marks with pink color
    all processes that don't contain icons and version information.
  o New option: Automatically Select New Process.

* Version 1.00: First Release.



System Requirement
==================

This utility works properly under Windows 9x, Windows ME, Windows 2000,
Windows XP, Windows Server 2003, and Windows Vista. If you want to run
this utility on Windows NT, you should download the 'psapi.dll' and place
it in your system32 directory.

Using The CurrProcess Utility
=============================

This utility is a standalone executable, so it doesn't require any
installation process or additional DLLs. Just run the executable
(cprocess.exe) and start using it. There is only one exception: If you
want to run this utility on Windows NT, you should download the
'psapi.dll', and copy it into the system32 folder.

The main window of CurrProcess utility contains 2 panes:
* The upper pane displays the list of all processes currently running
  on your system. The list is automatically updated when a new process is
  loaded or an existing process is terminated.
* When you select a single process in the upper pane, the lower pane
  displays the list of all modules that the selected process loaded into
  memory. By default, the modules list of a process is not automatically
  updated when a module is loaded or unloaded from memory. If you want to
  automatically update the modules pane of the selected process, select
  the 'Automatic Refresh' option under the Module menu. Be aware that
  this option consumes more CPU resources.
In both panes, you can change the order of the columns by dragging them
to the desired position, or by using the 'Choose Columns' dialog-box.



Dumping Process Memory To File
==============================

CurrProcess utility allows you to scan a range of memory addresses of
process, and dump all its content into a text file. The text file created
in this way contains the memory data in hexadecimal format as well as in
ascii format.

Notice:
* If you select a large range of memory addresses, the memory dump file
  may become very very large. Be careful when you select the desired
  memory range and verify that you have enough disk space. However, if
  during the memory dumping process you see that the file becomes very
  large, you can always stop the dumping process by pressing the 'stop'
  button.
* Not all memory addresses are valid for a process. If you select a
  range of invalid memory addresses, you'll get an empty dump file.



Command-Line Options
====================




/pmhtml <Process> <Filename>
Creates process-modules HTML report for the specified process. In the
<Process> parameter, you can specify only the name of the process (e.g.:
'explorer', 'explorer.exe', "iexplore") or the full path of the process
filename (e.g.: 'C:\Program Files\Internet Explorer\iexplore.exe'). You
can also specify the ProcessID, by adding the '/' character as a prefix
(e.g. /1560).

Examples:
cprocess /pmhtml explorer.exe c:\temp\explorer.html
cprocess /pmhtml /944 c:\temp\explorer.html
cprocess /pmhtml "F:\Program Files\Internet Explorer\IEXPLORE.EXE"
c:\temp\iexplore.html

/pmtext <Process> <Filename>
Similar to /pmhtml, but the report is saved to text file instead of HTML
file.

/pmtabular <Process> <Filename>
Similar to /pmhtml, but the report is saved to tabular text file instead
of HTML file.

/stext <Filename>
Saves the list of all processes into a regular text file.

/stab <Filename>
Saves the list of all processes into a tab-delimited text file.

/stabular <Filename>
Saves the list of all processes into a tabular text file.

/shtml <Filename>
Saves the list of all processes into horizontal HTML file.

/sverhtml <Filename>
Saves the list of all processes into vertical HTML file.



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



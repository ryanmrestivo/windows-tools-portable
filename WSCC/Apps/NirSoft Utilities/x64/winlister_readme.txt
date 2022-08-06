


WinLister v1.22
Copyright (c) 2003 - 2015 Nir Sofer



Description
===========

This utility displays the list of opened windows on your system. For each
window, some useful information is displayed: the title, the handle of
window, location, size, class name, process number, the name of the
program that created the window, and more...
In addition, you can easily hide, show, close or set to top-most mode the
selected windows, or save the windows list to text or HTML file.



System Requirements
===================

This utility works properly on any version of Windows, starting from
Windows 98 and up to Windows 8. Both 32-bit and 64-bit system are
supported.



Versions History
================


* Version 1.22:
  o WinLister now displays the process names (Some of them without
    the full path) for most processes when you run it without elevation
    ('Run As Administrator').

* Version 1.21:
  o Fixed the properties and about windows so they are closed when
    clicking the 'X' button.
  o Fixed the blurry fonts problem on systems with high DPI settings.

* Version 1.20:
  o Added 'Run As Administrator' option (Ctrl+F11), which allows you
    to easily run WinLister as administrator on Windows Vista/7/8/2008.

* Version 1.15:
  o Added 64-bit version.
  o Fixed the flickering problem on Windows 7.
  o Added 'Always On Top' option.

* Version 1.13: The configuration is now saved to a file, instead of
  the Registry
* Version 1.12: Added ThreadID column.
* Version 1.11: Added support for Windows XP style.
* Version 1.10:
  o Choose Columns window.
  o New columns: Top Most, Tool Window, App Window, Popup Window.
  o New option: Top-Most Switch - allows you to switch between
    regular window mode and top-most mode. In top-most mode, the window
    is always in top of all other windows.
  o New options: Switch To, Minimize,Maximize.

* Version 1.01:
  o New option: Display Windows With (0,0) Size
  o Fixed bug in size column.

* Version 1.00 - First Release



Using WinLister
===============

This utility is a standalone executable, so it doesn't require any
installation process or additional DLLs. Just run the executable
(winlister.exe) and start using it. There is only one exception: If you
want to run this utility on Windows NT, you should download the
'psapi.dll', and copy it into the system32 folder.
After you run it, all current visible opened windows are displayed in the
main window. Whenever there is a change in the Windows system (e.g: new
window is added, existing window is closed, and so on), it'll immediately
be updated in windows list of WinLister.
By default, only visible windows are displayed in the windows list, if
you want to also list the invisible windows, you should select the
'Display Hidden Windows' from the Options menu.



The Options Menu
================

The following options are available under the Options menu:


Display Hidden Windows
If this option is selected, all windows are listed, including the hidden
windows. Otherwise, only the visible windows are displayed.
Notice: If you hide a window by using the 'Hide Selected Windows' option,
the window will be still listed, even when it's in hidden state. This
will allow you to easily make the window visible again.

Display Windows With (0,0) Size
If this option is selected, all windows with zero size (0, 0) will be
displayed. Otherwise, these windows won't be displayed.

Sort On Every Change
If this option is selected, the items are automatically sorted each time
that there is a change in the windows list.

Don't List The Windows Of WinLister
If this option is selected, the windows created by WinLister itself,
won't be listed.

Show Grid Lines
If this option is selected, grid lines are displayed around the windows
list.

Ask Before Any Action
If this option is selected, WinLister will ask for your permission before
doing any action.



Actions On Selected Windows
===========================

You Select one or more Window items, and do one of the following actions:


Close Selected Windows
When you close the selected windows with this option, the windows are
closed as though they were closed by clicking the 'X' button in the
top-right side of the window.

Hide Selected Windows
When you hide a window, the program continues to run in background, but
without displaying the user interface. Whenever you want to display the
window again, simply make it visible again by using the 'Show Selected
Windows' action.

Show Selected Windows
You can use this option to display again windows that you have previously
hidden.

Kill Process Of Selected Windows
This option is brutal !!
It brutally terminates the applications that created the selected windows.
You should only use it when a window is hanged and you cannot close it in
any other way.



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



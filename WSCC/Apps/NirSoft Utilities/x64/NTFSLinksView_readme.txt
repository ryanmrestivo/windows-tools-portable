


NTFSLinksView v1.32
Copyright (c) 2009 - 2020 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

Starting from Windows Vista, Microsoft uses symbolic links and junction
points of NTFS file system in order to make changes in the folders
structure of Windows and keep the compatibility of applications written
for older versions of Windows. This utility simply shows you a list of
all symbolic links and junctions in the specified folder, and their
target paths. It also allows you to save the symbolic links/junctions
list into text/html/xml/csv file.



Using NTFSLinksView
===================

NTFSLinksView doesn't require any installation process or additional dll
files. In order to start using it, simply run the executable file -
NTFSLinksView.exe

When you run NTFSLinksView, press the Go button, and then the main window
will display the list of all NTFS symbolic links/junction points in your
profile folder. If you want to view the NTFS links in other folders,
simply type the folder path in the top text-box and press enter (or click
the 'Go' button).

If you want to scan your entire drive, type 'C:\' in the folder text box
and choose Infinite subfolder depth.



Versions History
================


* Version 1.32:
  o Fixed bug: The 'Scan inside symbolic links' option didn't work
    properly.

* Version 1.31:
  o Fixed bug: NTFSLinksView failed to remember the last
    size/position of the main window if it was not located in the primary
    monitor.

* Version 1.30:
  o Added support for searching hard links (Works on Windows Vista
    and later).

* Version 1.21:
  o Fixed to move properly to the next/previous control when pressing
    tab or shift+tab.
  o Fixed the incorrect encoding in the XML file.

* Version 1.20:
  o Added 'New NTFSLinksView Instance' under the File menu, for
    opening a new window of NTFSLinksView.

* Version 1.16:
  o Fixed the target path of symbolic links on Windows 8.1

* Version 1.15:
  o Added 'Scan inside symbolic links' option.

* Version 1.14:
  o Added /Subfolders command-line option.

* Version 1.13:
  o Fixed to display the main window properly when using large fonts
    settings.

* Version 1.12:
  o You can now specify environment variables (For example:
    %localappdata%) in the folder path to scan.

* Version 1.11:
  o The base folder text-box is now focused on start.
  o Added 'Mark Odd/Even Rows' option, under the View menu. When it's
    turned on, the odd and even rows are displayed in different color, to
    make it easier to read a single line.
  o Added x64 build.

* Version 1.10:
  o Fixed bug: The scan options section disappeared if you pressed
    the ESC key.
  o Fixed issue: The properties and the other windows opened in the
    wrong monitor, on multi-monitors system.

* Version 1.07:
  o Fixed bug: The 'Create Time' column was sorted alphabetically
    instead of sorting by time.

* Version 1.06:
  o Fixed bug: For some symbolic links, NTFSLinksView displayed
    incorrect target path.

* Version 1.05:
  o You can now scan the subfolders under the base folder you choose,
    by specifying the subfolder depth to scan (1 - 9 or Infinite).

* Version 1.00 - First release.



Command-Line Options
====================



/folder <Folder>
Load NTFSLinksView with the specified folder.

/Subfolders <Subfolders Depth>
Specifies the subfolders depth.

/stext <Filename>
Save the list of NTFS links into a regular text file.

/stab <Filename>
Save the list of NTFS links into a tab-delimited text file.

/scomma <Filename>
Save the list of NTFS links into a comma-delimited text file (csv).

/stabular <Filename>
Save the list of NTFS links into a tabular text file.

/shtml <Filename>
Save the list of NTFS links into HTML file (Horizontal).

/sverhtml <Filename>
Save the list of NTFS links into HTML file (Vertical).

/sxml <Filename>
Save the list of NTFS links into XML file.



Translating NTFSLinksView to other languages
============================================

In order to translate NTFSLinksView to other language, follow the
instructions below:
1. Run NTFSLinksView with /savelangfile parameter:
   NTFSLinksView.exe /savelangfile
   A file named NTFSLinksView_lng.ini will be created in the folder of
   NTFSLinksView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run NTFSLinksView, and all
   translated strings will be loaded from the language file.
   If you want to run NTFSLinksView without the translation, simply
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

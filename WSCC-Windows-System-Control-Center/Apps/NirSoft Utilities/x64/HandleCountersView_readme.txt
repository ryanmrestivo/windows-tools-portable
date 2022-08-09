


HandleCountersView v1.15
Copyright (c) 2018 - 2021 Nir Sofer
Web site: https://www.nirsoft.net



Description
===========

HandleCountersView is a simple tool for Windows that shows the current
number of handles (File, Directory, Token, Job, Thread, and so on...)
opened by every process running on your system and the change in number
of handles since the last time that you reset the counters.



System Requirements
===================

This tool works on any version of Windows, starting from Windows XP and
up to Windows 10. Both 32-bit and 64-bit versions of Windows are
supported. On Windows Vista and later, if you want to view the full path
of system processes , you have to run HandleCountersView as Administrator.



Versions History
================


* Version 1.15:
  o Updated to work properly in high DPI mode (Toolbar and properties
    window).
  o Added option to change the sorting column from the menu (View ->
    Sort By). Like the column header click sorting, if you click again
    the same sorting menu item, it'll switch between ascending and
    descending order. Also, if you hold down the shift key while choosing
    the sort menu item, you'll get a secondary sorting.

* Version 1.10:
  o Added 'Align Numeric Columns To Right' option.

* Version 1.05:
  o Added 'Put Icon On Tray' option.

* Version 1.01:
  o Added /RunAsAdmin command-line option for running
    HandleCountersView as administrator.

* Version 1.00 - First release.



Start Using HandleCountersView
==============================

This utility doesn't require any installation process or additional DLL
files. In order to start using it, simply run the executable file -
HandleCountersView.exe
After running HandleCountersView, the main window displays the number of
handles opened by every process on your system (every type of handle is
displayed in a separated column). Also, after every refresh (F5), you can
see the change in the number of handles inside the square brackets. The
change value is relative to the time you run HandleCountersView or to the
last time that you used the 'Reset Last Counters' option (F8).



Command-Line Options
====================



/RunAsAdmin
Run HandleCountersView as administrator.

/stext <Filename>
Save the handle counters into a simple text file.

/stab <Filename>
Save the handle counters into a tab-delimited text file.

/scomma <Filename>
Save the handle counters into a comma-delimited text file (csv).

/sjson <Filename>
Save the handle counters into JSON file.

/shtml <Filename>
Save the handle counters into HTML file (Horizontal).

/sverhtml <Filename>
Save the handle counters into HTML file (Vertical).

/sxml <Filename>
Save the handle counters into XML file.



Translating HandleCountersView to other languages
=================================================

In order to translate HandleCountersView to other language, follow the
instructions below:
1. Run HandleCountersView with /savelangfile parameter:
   HandleCountersView.exe /savelangfile
   A file named HandleCountersView_lng.ini will be created in the folder
   of HandleCountersView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run HandleCountersView, and all
   translated strings will be loaded from the language file.
   If you want to run HandleCountersView without the translation, simply
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

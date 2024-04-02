


ProcessThreadsView v1.29
Copyright (c) 2011 - 2018 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

ProcessThreadsView is a small utility that displays extensive information
about all threads of the process that you choose. The threads information
includes the ThreadID, Context Switches Count, Priority, Created Time,
User/Kernel Time, Number of Windows, Window Title, Start Address, and
more.
When selecting a thread in the upper pane, the lower pane displays the
following information: Strings found in the stack, stack modules
addresses, call stack, and processor registers.
ProcessThreadsView also allows you to suspend and resume one or more
threads.




System Requirements And Limitations
===================================


* This utility works on any version of Windows, starting from Windows
  2000 and up to Windows 10.
* For viewing the threads information of x64 applications, you must use
  the x64 version of ProcessThreadsView. For viewing the threads
  information of 32-bit applications, you should use the 32-bit version
  of ProcessThreadsView.
* On Windows 7/2008/Vista - If you want to view the threads of process
  running with admin rights and UAC is turned on, you must also execute
  ProcessThreadsView with 'Run As Administrator'.
* For x64 applications, call stack information is not displayed.



Versions History
================


* Version 1.29:
  o Fixed the lower pane to use the appropriate font size in high DPI
    mode.

* Version 1.28:
  o Fixed the lower pane to switch focus when pressing tab key.

* Version 1.27:
  o Fixed the 'Creation Time' column in 'Choose Process' window to
    display the date/time in local time (Instead of GMT).
  o Added 'Align Numeric Columns To Right' option.

* Version 1.26:
  o Added 'Save All Items' menu item.

* Version 1.25:
  o Added 'New Instance' (Ctrl+N), which opens a new window of
    ProcessThreadsView.

* Version 1.21:
  o Added new columns in the 'Select Process' window: 'Creation Time'
    and 'User Name'.

* Version 1.20:
  o Fixed to display system processes when ProcessThreadsView is
    executed as admin.

* Version 1.15:
  o Added 'Run As Administrator' option.

* Version 1.11:
  o Added 'Always On Top' option.

* Version 1.10:
  o Added 'Sort On Every Update' option.

* Version 1.07:
  o Fixed the flickering while browsing the threads list.

* Version 1.06:
  o Added 'Auto Size Columns+Headers' option, which allows you to
    automatically resize the columns according to the row values and
    column headers.
  o Fixed issue: The properties dialog-box and other windows opened
    in the wrong monitor, on multi-monitors system.
  o Added 'Mark Odd/Even Rows' option, under the View menu. When it's
    turned on, the odd and even rows are displayed in different color, to
    make it easier to read a single line.

* Version 1.05:
  o Added 'Put Icon On Tray' option.

* Version 1.00 - First release.



Using ProcessThreadsView
========================

ProcessThreadsView doesn't require any installation process or additional
dll files. In order to start using it, simply run the executable file -
ProcessThreadsView.exe

After running ProcessThreadsView, you should choose the process that you
want to inspect.
After you choose the desired process, the list of all threads is
displayed on the main window and automatically refreshed on every threads
change. When you select a thread on the upper pane, the lower pane
displays extensive information about the selected thread, according to
the options you choose under the Options menu.
By default, only 'Show Stack Strings' option is selected, but you can
also choose to show the stack binary values, stack module addresses,
other stack values, call stack, and processor regsiters.
Be aware that if turn on all available options, the loading process of
the lower pane might be quite slow.



Translating ProcessThreadsView to other languages
=================================================

In order to translate ProcessThreadsView to other language, follow the
instructions below:
1. Run ProcessThreadsView with /savelangfile parameter:
   ProcessThreadsView.exe /savelangfile
   A file named ProcessThreadsView_lng.ini will be created in the folder
   of ProcessThreadsView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run ProcessThreadsView, and all
   translated strings will be loaded from the language file.
   If you want to run ProcessThreadsView without the translation, simply
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

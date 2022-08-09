


WhatIsHang v1.27
Copyright (c) 2011 - 2015 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

Sometimes, Windows or a running application hangs, the user interface
abruptly stops responding, and you cannot determine what has caused the
problem or how to troubleshoot the issue. This utility tries to detect
the software or process that is currently hung, and displays some
information that may allow you to sort out and understand what exactly is
at the root of such unexpected behavior. Most of the information
displayed in WhatIsHang's report, like Call Stack, Stack Data, Processor
Registers, and Memory Data is designed for users with Windows programming
knowledge. However, WhatIsHang also presents a list of strings and dll
files related to the hang issue that can help users without programming
skills understand and overcome the causes of the problem and restore
normal operation.



System Requirements And Limitations
===================================


* This utility works on any version of Windows, starting from Windows
  2000 and up to Windows 8. Both 32-bit and 64-bit systems are supported.
* In order to detect hang problems of 32-bit applications, you must use
  the 32-bit version of WhatIsHang, even if your operating system is
  64-bit.
* In order to detect hang problems of 64-bit applications, you must use
  the 64-bit version of WhatIsHang.
* On Windows 7/8/2008/Vista with UAC turned on: WhatIsHang cannot
  detect hanging application if it's running with SYSTEM or Administrator
  privilege. In order to solve this problem, you have to right-click on
  WhatIsHang.exe and choose 'Run As Administrator'.
* Some hang problems cannot be detected properly by WhatIsHang, for
  example:
  o Programs without any user interface.
  o When the program hangs because one thread waits for the other
    one. (In this case, WhatIsHang will show the details of the waiting
    thread, but the problem might be in the other thread)
    But... Starting from version 1.05, you can use the experimental 'All
    Threads' report to display the information about all running threads.
  o When the entire system hangs - In this case WhatIsHang won't be
    able to run...




Versions History
================


* Version 1.27
  o Fixed bug: The 'Automatically Get Report' menu item failed to
    work properly.

* Version 1.26
  o Fixed bug: WhatIsHang failed to remember the last size/position
    of the main window if it was not located in the primary monitor.
  o Added 'Run As Administrator' option (Ctrl+F11), which allows you
    to easily run WhatIsHang as administrator on Windows Vista/7/8/2008.

* Version 1.25
  o Added 'Automatically Get Report' option. When it's turned on,
    WhatIsHang automatically generates a report for a freezeing program
    around 2 seconds after it's detected, without selecting it and
    pressing F9.
  o Added 'Always On Top' option.

* Version 1.20
  o Added x64 build, for getting a report about freezing 64-bit
    applications.
  o Added list of all loaded modules to the report.
  o Fixed the flickering problem in the status bar.
  o When WhatIsHang fails to extract information from the process, it
    now displays a message about that in the report, instead of showing
    report full of zero numbers...

* Version 1.15
  o Added 'Start As Hidden' option. When this option and 'Put Icon On
    Tray' option are turned on, the main window of WhatIsHang will be
    invisible on start.

* Version 1.10
  o Added 'Put Icon On Tray' option.

* Version 1.07
  o When a program hangs because it waits to another system object
    (WaitForSingleObject API Call), WhatIsHang now displays the type of
    the system object and its handle, on the Remarks section.

* Version 1.06
  o Fixed the all threads list to display the correct start address.
  o Added the Thread ID into the report.
  o Fixed bug: Ordinal function names were not displayed properly.

* Version 1.05
  o Added 'All Threads' experimental report (Ctrl+F9), which displays
    a report about all running threads, as opposed to the standard
    reports that displays a report only for the thread that stopped
    responding. Be aware that 'All Threads' report might be quite large.

* Version 1.00 - First release.



Using WhatIsHang
================

When you run WhatIsHang, the upper pane of the main window displays the
list of all running applications that their user interface stopped
responding. If WhatIsHang cannot detect any hanging application, the
upper pane will be empty, until any hang software is detected.

When the hanging application is detected and you want to get the
information about the problem, select the desired item in the upper pane,
and then press F9. WhatIsHang will inspect the hanging application and
will display all information the lower pane, as a simple text report.



Understanding The WhatIsHang Reports
====================================

First, you should be aware that there are 2 types of hang problems:
1. The program hangs in a single system/Kernel/API call. This means
   that the program request to do something from the operating system
   (like opening or reading a file) but the operating system function
   doesn't return back and thus cause the program to hang.
2. The program hangs because there is an infinite loop, very long
   loop, or recursive calls.
When WhatIsHang detects the first hang problem, the report will contain
only one system call snapshot. When WhatIsHang detects the second hang
problem, the report will contain 3 snapshots of 3 random execution points.


Here's some information about every section of the WhatIsHang report:
* Remarks: This section displays general hints that may give you a
  first impression of what might be wrong with the hanging problem.
  The first remark always specify the type of the detected hang problem -
  whether it's a single system call problem or infinite loop/very long
  loop problem.

  Additional remarks might be displayed according to the call stack of
  the hang problem. For example, if a filename on a remote computer is
  detected, WhatIsHang will display a warning that this network access
  might cause the problem.
* Strings found in the stack: WhatIsHang collects the strings from the
  calls made by the hang program and displays them in this section. These
  strings might give you a clue of what is wrong in the hang program.
* Modules found in the stack: This section displays the list of DLL
  files found in the calls made by the hang program. It might be
  especially useful for hang problems of Windows Explorer, because if the
  problem is caused by 3-party software, you'll probably find the DLL of
  the problemtic software in the list.
* Execute Address (For Programmers): The execution memory address that
  the hang problem was detected.
* Call Stack (For Programmers): Displays the calls found in the stack,
  like every debugger software does.
* Stack Data (For Programmers): Displays values, addresses, and string
  points found in the stack.
* Processor Registers (For Programmers): Displays the current values of
  the basic processor registers (EAX, EBX, ECX, and so on)
* Memory Data: WhatIsHang collects the memory content of all valid
  memory pointers found in the calls of the hanging program. This section
  displays all memory data found by WhatIsHang in 'Hex Dump' format, and
  it might give you more clues of what might cause the hang.
* All Threads: This section simply displays the list of all threads
  found in the hang program.



If you can't understand the report...
=====================================

If you're not a programmer or Windows expert, you may not be able to
understand or analyze the report of WhatIsHang.
In this case, you can try to...
* Send the report of WhatIsHang to the support of the software that
  hangs. Their programmers/support team might be able to find out what is
  the problem.
* Send the report to NirSoft Web site by using this contact page, with
  a small description of the problem. sending this report will help me to
  improve WhatIsHang in future versions and to make it more friendly for
  users without programming/Windows knowledge.
In order to send the report (to NirSoft or anybody else) press F8 to copy
the entire report to the clipboard, and then paste it with Ctrl+V inside
the email message.



All Threads Report
==================

Starting from version 1.05, there is a new experimental report that
displays information about all running threads instead of showing only
the main user interface thread that stopped responding.

This type of report might be useful when multiple threads are involved in
the hanging problem (For example when the main user interface thread
waits for another thread to finish).

You can get this report by pressing Ctrl+F9. be aware that this report
might be very large on multithreaded applications.



Translating WhatIsHang to other languages
=========================================

In order to translate WhatIsHang to other language, follow the
instructions below:
1. Run WhatIsHang with /savelangfile parameter:
   WhatIsHang.exe /savelangfile
   A file named WhatIsHang_lng.ini will be created in the folder of
   WhatIsHang utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run WhatIsHang, and all
   translated strings will be loaded from the language file.
   If you want to run WhatIsHang without the translation, simply rename
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

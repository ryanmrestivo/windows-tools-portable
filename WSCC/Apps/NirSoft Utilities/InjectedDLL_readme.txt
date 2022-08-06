


InjectedDLL v1.00
Copyright (c) 2006 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

InjectedDLL is a small utility that displays the list of DLLs that are
automatically injected on every process in your system.




More Information
================

DLL injection is a quite common technique used by many programs and
utilities, so the fact that you have injected DLLs in your system doesn't
mean that something is wrong.
The following type of legitimate programs may use DLL injection technique:
* Programs that listen to keystroke on your systems: Macro recorders,
  key loggers, and so on...
* Programs that listen to mouse moves and/or change the default mouse
  behavior. For example: Volumouse utility uses the vlmshlp.dll for
  listening the mouse wheel moves, and use it for changing the sound
  volume.
* Debugging and diagnostics tools. For example: Microsoft Spy++ utility
* Security related programs: Firewalls, Antivirus programs, AntiSpyware
  programs, and so on.
* Programs that are well integrated into Windows environment. For
  example: Babylon translation software uses CAPTLIB.DLL in order to
  activate the dictionary with mouse buttons and the keyboard.

In addition to the above list, DLL injection may also be used by
malicious programs (Viruses, Trojans, Spywares).



Important Notice
================

Each time that you run InjectedDLL or you refresh the DLL list, you may
see a small square around the mouse cursor that appear for short period
of time, and then disappear. You may think that it's bug, but it's not...
Although it may sound strange, this small window is used to detect the
injected DLLs list. Due to the fact that some DLLs are only injected when
the mouse cursor moves over a visible window, this "dummy" window is
displayed in order to force these DLLs to load. Also, be aware that this
window is created by a child process named dummywin.exe



System Requirements
===================

This utility works on Windows 98/ME, Windows 2000, and Windows XP.



Using InjectedDLL
=================

InjectedDLL utility doesn't require any installation process or
additional DLLs. In order to start using it, just run the executable file
- InjectedDLL.exe.
After running it, the main window display the list of injected DLLs. The
window may also be empty, if there are no injected DLLs in your system.



Translating InjectedDLL To Another Language
===========================================

InjectedDLL allows you to easily translate all menus, dialog-boxes, and
other strings to other languages.
In order to do that, follow the instructions below:
1. Run InjectedDLL with /savelangfile parameter:
   InjectedDLL.exe /savelangfile
   A file named InjectedDLL_lng.ini will be created in the folder of
   InjectedDLL utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all menus, dialog-boxes, and string entries to the
   desired language.
4. After you finish the translation, Run InjectedDLL, and all
   translated strings will be loaded from the language file.
   If you want to run InjectedDLL without the translation, simply rename
   the language file, or move it to another folder.



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

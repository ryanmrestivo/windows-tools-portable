


ExecutedProgramsList v1.11
Copyright (c) 2015 - 2016 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

ExecutedProgramsList is a simple tool that displays a list of programs
and batch files that you previously executed on your system. For every
program, ExecutedProgramsList displays the .exe file, the
created/modified time of the .exe file, and the current version
information of the program (product name, product version, company name)
if it's available. For some of the programs, the last time execution time
of the program is also displayed.



System Requirements
===================

This utility works on any version of Windows, starting from Windows XP
and up to Windows 10. Both 32-bit and 64-bit systems are supported.



Versions History
================


* Version 1.11:
  o Added 'Auto Size Columns On Load' option.
  o Added 'File Properties' option. (Open the Explorer properties
    window of the .exe file)

* Version 1.10:
  o Fixed to work properly on Windows 10.

* Version 1.05:
  o Added 'Open Folder In Explorer' option (Ctrl+O)

* Version 1.00 - First release.



Data Source
===========

The list of previously executed programs is collected from the following
data sources:
* Registry Key: HKEY_CURRENT_USER\Classes\Local
  Settings\Software\Microsoft\Windows\Shell\MuiCache
* Registry Key: HKEY_CURRENT_USER\Microsoft\Windows\ShellNoRoam\MUICache
* Registry Key: HKEY_CURRENT_USER\Microsoft\Windows
  NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Persisted
* Registry Key: HKEY_CURRENT_USER\Microsoft\Windows
  NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store
* Windows Prefetch folder (C:\Windows\Prefetch)



Start Using ExecutedProgramsList
================================

ExecutedProgramsList doesn't require any installation process or
additional dll files. In order to start using it, simply run the
executable file - ExecutedProgramsList.exe
After running ExecutedProgramsList, the main window displays a list of
programs and batch files that you previously executed on your system. You
can select one or more items, and then export them to
comma-delimited/tab-delimited/html/xml file using the 'Save Selected
Items' option (Ctrl+S) or copy them to the clipboard (CTRL+C) and then
paste them to Excel or any other spreadsheet application.



Command-Line Options
====================



/stext <Filename>
Save the list of executed programs into a regular text file.

/stab <Filename>
Save the list of executed programs into a tab-delimited text file.

/scomma <Filename>
Save the list of executed programs into a comma-delimited text file (csv).

/stabular <Filename>
Save the list of executed programs into a tabular text file.

/shtml <Filename>
Save the list of executed programs into HTML file (Horizontal).

/sverhtml <Filename>
Save the list of executed programs into HTML file (Vertical).

/sxml <Filename>
Save the list of executed programs into XML file.



Translating ExecutedProgramsList to other languages
===================================================

In order to translate ExecutedProgramsList to other language, follow the
instructions below:
1. Run ExecutedProgramsList with /savelangfile parameter:
   ExecutedProgramsList.exe /savelangfile
   A file named ExecutedProgramsList_lng.ini will be created in the
   folder of ExecutedProgramsList utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run ExecutedProgramsList, and all
   translated strings will be loaded from the language file.
   If you want to run ExecutedProgramsList without the translation,
   simply rename the language file, or move it to another folder.



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

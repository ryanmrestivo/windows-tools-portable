


RuntimeClassesView v1.00
Copyright (c) 2020 - 2022 Nir Sofer
Web site: https://www.nirsoft.net/utils/runtime_classes_view.html



Description
===========

RuntimeClassesView is a tool for Windows 10 and Windows 11 that displays
the list of Windows Runtime (WinRT) classes installed on your system.
For every Runtime class, the following information is displayed: Class
Name, Filename, Threading, Trust Level, Server, Activation Type, Registry
Key, Bitness, Key Modified Time, CLSID, and file version information.

When selecting a Windows Runtime class in the upper pane, this tool tries
to get the list of interfaces implemented by the selected class and the
list is displayed in the lower pane.



System Requirements
===================


* This tool works on Windows 10 and Windows 11. Both 32-bit and 64-bit
  systems are supported.
* This tool is just a small standalone .exe file that you can run on
  any system without installing anything.



Start Using RuntimeClassesView
==============================

RuntimeClassesView doesn't require any installation process or additional
DLL files. In order to start using it, simply run the executable file -
RuntimeClassesView.exe
After running RuntimeClassesView, the main window displays the list of
all runtime classes installed on your system. If you want to find a
specific runtime class, you can press Ctrl+Q, and then in the quick
filter window, type the string you want to find.
When you select a single runtime class in the upper pane of the main
window, RuntimeClassesView tries to get the list of interfaces
implemented by the selected class (By calling the IInspectable::GetIids
method ) and the list is displayed in the lower pane.

You can also select one or more runtime classes (or select all of them by
pressing Ctrl+A) and then export them to
tab-delimited/comma-delimited/HTML/XML/JSON file by using the 'Save
Selected Items' option.



Command-Line Options
====================



/stext <Filename>
Save the runtime classes list to a simple text file.

/stab <Filename>
Save the runtime classes list to a tab-delimited text file.

/scomma <Filename>
Save the runtime classes list to a comma-delimited text file (csv).

/shtml <Filename>
Save the runtime classes list to HTML5 file (Horizontal).

/sverhtml <Filename>
Save the runtime classes list to HTML5 file (Vertical).

/sxml <Filename>
Save the runtime classes list to XML file.

/sjson <Filename>
Save the runtime classes list to JSON file.

/sort <column>
This command-line option can be used with other save options for sorting
by the desired column. The <column> parameter can specify the column
index (0 for the first column, 1 for the second column, and so on) or the
name of the column, like "Class Name" and "Filename". You can specify the
'~' prefix character (e.g: "~Key Modified Time") if you want to sort in
descending order. You can put multiple /sort in the command-line if you
want to sort by multiple columns.



Translating RuntimeClassesView to other languages
=================================================

In order to translate RuntimeClassesView to other language, follow the
instructions below:
1. Run RuntimeClassesView with /savelangfile parameter:
   RuntimeClassesView.exe /savelangfile
   A file named RuntimeClassesView_lng.ini will be created in the folder
   of RuntimeClassesView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run RuntimeClassesView, and all
   translated strings will be loaded from the language file.
   If you want to run RuntimeClassesView without the translation, simply
   rename the language file, or move it to another folder.



License
=======

This utility is released as freeware. You are allowed to freely
distribute this utility via CD-ROM, DVD, Internet, or in any other way,
as long as you don't charge anything for this and you don't sell it or
distribute it as a part of commercial product. If you distribute this
utility, you must include all files in the distribution package, without
any modification !



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
utility, you can send a message to support@nirsoft.net

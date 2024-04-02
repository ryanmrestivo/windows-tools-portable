


GACView v1.11
Copyright (c) 2005 - 2008 Nir Sofer
Web Site: http://www.nirsoft.net



Description
===========

GACView is an alternative to the standard .NET assembly viewer on Windows
Explorer. In addition to the standard columns, GACView displays
additional information for each assembly, like modified date, file size,
full path of the assembly file, file version, and so on. GACView also
allows you to delete an assembly the cannot be uninstalled in the regular
way.



Using GACView
=============

GACView doesn't require any installation process or additional DLLs. In
order to start using it, just copy the executable file (gacview.exe) to
any folder you like, and run it. The main window of GACView displays the
list of all assemblies installed in the GAC. You can select one or more
assemblies, and then uninstall them, delete them (If regular uninstall
fails), or save the assemblies information to file. You can also install
new assemblies by using "Install Assembly" option under the File menu, or
by simply dragging the assembly that you want to install into the main
window of GACView.



Notice About GAC Install Options
================================

The 2 GAC install options (under Options menu) were added according to
the assembly GAC APIs documentation, but it seems that these options
don't really affect the way that an assembly is installed in the GAC.
When a new version of assembly is installed, the new version is added to
the GAC without overwriting the previous versions, even if you select one
of these install options. (Bug in GAC APIs ??)



System Requirements
===================

Although this utility is designed to work with .NET environment, the
utility by itself wasn't written in .NET, which means that it can work in
all versions of Windows, even if .NET Framework is not installed.



Versions History
================


* Version 1.11
  o The configuration is now saved to a file, instead of the Registry.

* Version 1.10
  o Added support for .NET 2.x
  o New column: Processor Architecture. (for .NET 2.x)

* Version 1.01 - Added support for Windows XP visual styles.
* Version 1.00 - First release.



Command-Line Options
====================



/stext <Filename>
Save the list of GAC assemblies into a regular text file.

/stab <Filename>
Save the list of GAC assemblies into a tab-delimited text file.

/stabular <Filename>
Save the list of GAC assemblies into a tabular text file.

/shtml <Filename>
Save the list of GAC assemblies into HTML file.

/sverhtml <Filename>
Save the list of GAC assemblies into vertical HTML file.

/sxml <Filename>
Save the list of GAC assemblies into XML file.

/NoLoadSettings
Run without loading your last settings. (window position, columns size,
etc. )

/DeleteRegKey
Delete the Registry key that this utility use to save your last settings.


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



Translating GACView to the languages
====================================

In order to translate GACView to other language, follow the instructions
below:
1. Run GACView with /savelangfile parameter:
   GACView.exe /savelangfile
   A file named GACView_lng.ini will be created in the folder of GACView
   utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run GACView, and all translated
   strings will be loaded from the language file.
   If you want to run GACView without the translation, simply rename the
   language file, or move it to another folder.



Feedback
========

If you have any problem, suggestion, comment, or you found a bug in my
utility, you can send a message to nirsofer@yahoo.com

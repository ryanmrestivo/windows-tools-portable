


ActiveX Compatibility Manager v1.00
Copyright (c) 2004 Nir Sofer
Web site: http://nirsoft.mirrorz.com



Description
===========

This utility allows you to easily disable/enable ActiveX components on
Internet Explorer browser.
It disables the desired ActiveX component by setting the "kill bit" of
the desired CLSID under the following Registry key:
HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX
Compatibility
For more information about this Registry key, read this Microsoft article



Using ActiveX Compatibility Manager
===================================

ActiveX Compatibility Manager is a standalone executable, and it doesn't
require any installation process or additional DLLs. In order to start
using it, just copy the executable file (acm.exe) to any folder you like,
and run it.
The main window of acm displays the list of all ActiveX components that
are currently available for enabling/disabling. For components that are
currently installed on your computer, additional information is also
displayed: product name, company name, description, version, filename,
and more...
If you want to disable an ActiveX component that doesn't appear in the
list, you can add it to the list by using "Add New Items" option. On the
"Add New Items" window, you can type one or more CLSIDs or ProgIDs
separated by comma or enter key. For example: if you want to add
ADODB.Stream and ShockwaveFlash.ShockwaveFlash components to the list:
You can simply type their CLSIDs:

{00000566-0000-0010-8000-00AA006D2EA4}
{D27CDB6E-AE6D-11cf-96B8-444553540000}


Or alternatively, you type their ProgIDs:

ADODB.Stream, ShockwaveFlash.ShockwaveFlash

After clicking 'Ok', the components that you typed are added to the
ActiveX Compatibility list, and you are allowed to easily disable/enable
them.
You can also add new CLSIDs from a text file, by using "Load New Items
From File" option. When you use this options, all CLSIDs in the text file
are added in disabled state.



Disabling/Enabling Macromedia Flash Player
==========================================

By default, Flash player is not listed in the ActiveX Compatibility list
(unless another program added it), but your can easily add it by
following the instructions below:
1. Select "Add New Items" from the File menu (or press Ctrl+N).
2. Type the CLSID of Macromedia Flash:
   {D27CDB6E-AE6D-11cf-96B8-444553540000}
   If flash is installed on your computer, you can also type the ProgID
   of Flash: ShockwaveFlash.ShockwaveFlash
3. Press Ok, and Flash will be added to the 'ActiveX Compatibility'
   list. After that, you can easily select the Flash item, and then
   disable/enable it.



Command-Line Options
====================



/addfromfile <Filename>
Add all CSLIDs specified in the file to the ActiveX Compatibility list.
The CSLIDs are added in disabled state.

/stext <Filename>
Save ActiveX compatibility list into a regular text file.

/stab <Filename>
Save ActiveX compatibility list into a tab-delimited text file.

/stabular <Filename>
Save ActiveX compatibility list into a tabular text file.

/shtml <Filename>
Save ActiveX compatibility list into HTML file.

/sverhtml <Filename>
Save ActiveX compatibility list into HTML file. (vertical)

/sxml <Filename>
Save ActiveX compatibility list into XML file.



Translating to other languages
==============================

This utility allows you to easily translate all menus, dialog-boxes, and
other strings to other languages.
In order to do that, follow the instructions below:
1. Run acm with /savelangfile parameter:
   acm.exe /savelangfile
   A file named acm_lng.ini will be created in the folder of acm utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all menus, dialog-boxes, and string entries to the
   desired language. Optionally, you can also add your name and/or a link
   to your Web site. (TranslatorName and TranslatorURL values) If you add
   this information, it'll be used in the 'About' window.
4. After you finish the translation, Run acm, and all translated
   strings will be loaded from the language file.
   If you want to run acm without the translation, simply rename the
   language file, or move it to another folder.



License
=======

This utility is released as freeware for personal and non-commercial use.
You are allowed to freely distribute this utility via floppy disk,
CD-ROM, Internet, or in any other way, as long as you don't charge
anything for this. If you distribute this utility, you must include all
files in the distribution package, without any modification !



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

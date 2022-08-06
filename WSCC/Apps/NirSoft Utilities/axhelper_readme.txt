


ActiveXHelper v1.12
Copyright (c) 2004 - 2007 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

ActiveXHelper is a small utility that allows you to view essential
information about ActiveX components installed on your computer. You can
view the entire (and very large !) list of ActiveX components by loading
it from HKEY_CLASSES_ROOT\CLSID Registry key, or alternatively, display
only the ActiveX components that you specify. In addition, you can
temporarily disable specific ActiveX components. When ActiveX components
are disabled, they cannot be used by any software, until you enable them
again.



Versions History
================


* Version 1.12
  o The configuration is now saved into a cfg file, instead of the
    Registry

* Version 1.11
  o A tooltip is displayed when a string in a column is longer than
    the column length.

* Version 1.10
  o Fixed Bug: %SystemRoot% appeared in filename.
  o New option: List only ActiveX components with missing file
    (Obsolete entries)
  o New option: Open In RegEdit.

* Version 1.01 - Added support for Windows XP style.
* Version 1.00 - First release.



Using ActiveXHelper
===================

ActiveXHelper is a standalone program, and thus it doesn't require any
installation process or additional DLLs. In order to start using it, just
run the executable file - axhelper.exe

When you first run ActiveXHelper, the following options are displayed:
* Load ActiveX list from the following Registry key: If you choose this
  option, the CLSID list is loaded from the Registry key that your
  specify. By default, the list is loaded from KEY_CLASSES_ROOT\CLSID -
  which means that all ActiveX components on your computer will be
  displayed - a very long list !
* Load ActiveX list from the following text file: If you choose this
  option, the ActiveX list is loaded from the text file that you specify.
  The text file should contain a list of CLSIDs (e.g.:
  {01E9E99D-9E81-4CEF-0AA5-C62667469295}) and/or ProgIDs (e.g.:
  ADODB.Stream, DAO.DBEngine) separated by comma or CRLF characters.
* Load ActiveX list from the following CLSID/ProgID list: If you choose
  this option, the ActiveX list is loaded from the text-box below this
  option. As in the previous option, the text you specify should contain
  a list of CLSIDs and ProgIDs, separated by comma or CRLF characters.

If you check the "List only ActiveX controls" option, only ActiveX
controls are displayed.

After choosing the desired options, click 'Ok' in order to start loading
the ActiveX list. After the ActiveX list is loaded, you can select one or
more ActiveX components, and then save them to HTML/Text/XML file, copy
them to the clipboard, disable/enable them, or register/unregister their
associated DLL/OCX file.



Command-Line Options
====================



/disable <CLSID>
Disable the specified CLSID.

/enable <CLSID>
Enable the specified CLSID that you previously disabled with /disable
option.

/noselect
Load the ActiveX list according to your last settings, without displaying
the ActiveX selection dialog-box.



Translating to other languages
==============================

This utility allows you to easily translate all menus, dialog-boxes, and
other strings to other languages.
In order to do that, follow the instructions below:
1. Run ActiveXHelper with /savelangfile parameter:
   axhelper.exe /savelangfile
   A file named axhelper_lng.ini will be created in the folder of
   ActiveXHelper utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all menus, dialog-boxes, and string entries to the
   desired language. Optionally, you can also add your name and/or a link
   to your Web site. (TranslatorName and TranslatorURL values) If you add
   this information, it'll be used in the 'About' window.
4. After you finish the translation, Run ActiveXHelper, and all
   translated strings will be loaded from the language file.
   If you want to run ActiveXHelper without the translation, simply
   rename the language file, or move it to another folder.



License
=======

This utility is released as freeware for. You are allowed to freely
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




PreviousFilesRecovery v1.10
Copyright (c) 2016 - 2020 Nir Sofer
Web site: https://www.nirsoft.net



Description
===========

PreviousFilesRecovery is a simple tool for Windows 10/8/7/Vista that
allows you to scan the shadow copies of your local hard drive and find
deleted files as well as older versions of existing files. If the file
you need is found in the shadow copies of Windows, you can easily recover
it by copying it into existing folder on your drive.



System Requirements
===================

This utility works on any version of Windows, starting from Windows
Vista, and up to Windows 10. Windows XP is not supported. In order to use
PreviousFilesRecovery on 64-bit systems, you must download and use the
64-bit version of this tool.



Versions History
================


* Version 1.10:
  o Added option to scan only the selected shadow copy.
  o Added command-line options to search the previous versions of
    existing files and export the result to
    comma-delimited/tab-delimited/html/xml file.

* Version 1.00 - First release.



Start Using PreviousFilesRecovery
=================================

PreviousFilesRecovery doesn't require any installation process or
additional DLL files. In order to start using it, simply run the
executable file - PreviousFilesRecovery.exe
After running PreviousFilesRecovery, you should choose the base folder to
scan, the maximum number of subfolders to scan under this folder
(Subfolders Depth), the wildcard to scan (the default is all files - *)
and what type of files to find (Previous versions of files, deleted
files, and deleted folders)

After choosing the desired options, click the 'Start' button to start the
scanning process.



Description of columns
======================

Here's the description of every column in the scan result table:
* Filename: The name of the file.
* Folder: The full path of the folder where the file is located.
* Item Type: Specified the type of item:
  o Older File Version: This item type means that an older version of
    existing file was found in a shadow copy.
  o Deleted File: This item type means that a file that doesn't exist
    in your drive was found in a shadow copy (Probably because the file
    was deleted)
  o Deleted Folder: This item type means that a folder that doesn't
    exist in your drive was found in a shadow copy (Probably because the
    folder was deleted)

* Current Modified Time: The modified date/time of the current file on
  your disk (Only for 'Older File Version' items').
* Previous Modified Time: The modified date/time of the older file
  found in the shadow copy.
* Current File Size: The size of the current file on your disk (Only
  for 'Older File Version' items').
* Previous File Size: The size of the older file version found in the
  shadow copy.
* Current File Attributes: The attributes of the current file on your
  disk (Only for 'Older File Version' items').
* Previous File Attributes: The attributes of the older file version
  found in the shadow copy.
* Shadow Copy Name: The name/path of the shadow copy where the
  specified file was found. It should be something like
  \\?\GLOBALROOT\Device\HarddiskVolumeShadowCopy3
* Shadow Copy Time: The date/time that the shadow copy was created.



Recovering a file
=================

If you want to recover a file or folder that this tool found inside a
shadow copy, simply select the files/folders you wish to recover and then
press F8 ('Recover Selected Files/Folders'). In the 'Recover Files'
dialog-box, type or choose the destination folder to copy the files and
then click the 'Do it !' button. Be aware that if a file with the same
name already exists in the destination folder, PreviousFilesRecovery will
copy the file using another name.



Command-Line Options
====================



/stext <Filename>
Save the previous files list into a simple text file.

/stab <Filename>
Save the previous files list into a tab-delimited text file.

/scomma <Filename>
Save the previous files list into a comma-delimited text file (csv).

/stabular <Filename>
Save the previous files list into a tabular text file.

/shtml <Filename>
Save the previous files list into HTML file (Horizontal).

/sverhtml <Filename>
Save the previous files list into HTML file (Vertical).

/sxml <Filename>
Save the previous files list into XML file.

/sort <column>
This command-line option can be used with other save options for sorting
by the desired column. The <column> parameter can specify the column
index (0 for the first column, 1 for the second column, and so on) or the
name of the column, like "Filename" and "Current Modified Time". You can
specify the '~' prefix character (e.g: "~Filename") if you want to sort
in descending order. You can put multiple /sort in the command-line if
you want to sort by multiple columns.



/cfg <Filename>
Start PreviousFilesRecovery with the specified configuration file. For
example:
PreviousFilesRecovery.exe /cfg "c:\config\pfr.cfg"
PreviousFilesRecovery.exe /cfg "%AppData%\PreviousFilesRecovery.cfg"



Translating PreviousFilesRecovery to other languages
====================================================

In order to translate PreviousFilesRecovery to other language, follow the
instructions below:
1. Run PreviousFilesRecovery with /savelangfile parameter:
   PreviousFilesRecovery.exe /savelangfile
   A file named PreviousFilesRecovery_lng.ini will be created in the
   folder of PreviousFilesRecovery utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run PreviousFilesRecovery, and
   all translated strings will be loaded from the language file.
   If you want to run PreviousFilesRecovery without the translation,
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

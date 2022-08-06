


BulkFileChanger v1.72
Copyright (c) 2010 - 2021 Nir Sofer
Web site: https://www.nirsoft.net



Description
===========

BulkFileChanger is a small utility that allows you to create files list
from multiple folders, and then make some action on them - Modify their
created/modified/accessed time, change their file attribute (Read Only,
Hidden, System), run an executable with these files as parameter, and
copy/cut paste into Explorer.

BulkFileChanger is a replacement for the old FileDate Changer utility.



System Requirements & Limitations
=================================


* This utility works on any version of Windows, starting from Windows
  2000 and up to Windows 10. Both 32-bit and 64-bit systems are supported.
* If you set a date prior to 01/01/1980, Windows Explorer will not
  display this date, due to a limitation originally created for old FAT
  systems. You can still watch an old file date using other file managers
  like 7-zip, using BulkFileChanger utility, or by right-clicking on the
  file and choosing 'Properties'.
* If you want to set an old date for .jpg images, there is a workaround
  for the 01/01/1980 limit - Simply set the 'EXIF - Generated Time' (In
  the fourth line) to the desired old date/time, and then you should see
  this date/time on Windows Explorer under the 'Date taken' column and
  'Date' column.



Versions History
================


* Version 1.72:
  o Added 'Photo - Date Taken' option to set the date/time when the
    photo was taken. This feature is similar to the 'EXIF - Generated
    Time' option, but it uses the Property System of Windows, which may
    work better in some situations. For example: The 'Photo - Date Taken'
    option will set the photo date/time even if the original .jpg file
    doesn't contain EXIF information.

* Version 1.71:
  o Fixed bug: The extension column displayed incorrect value when
    there was a folder with '.' character and filename without extension.

* Version 1.70:
  o Added support for document files (Word, Excel) date/time values -
    'Content Created Time' and 'Last Saved Time'.
  o This feature works on Windows 7 and later.
  o If you have 64-bit system, this feature may work improperly with
    the 32-bit version of BulkFileChanger, so you should use the 64-bit
    version of BulkFileChanger.

* Version 1.65:
  o BulkFileChanger now allows you to change and copy the date/time
    values stored inside media files ( .mp4 , .mov).
  o You can change/copy 3 date/time values: Item Date, Date Encoded,
    Date Acquired.
  o This feature works on Windows 7 and later.
  o Be aware that the effect of changing these date/time values might
    be different on different versions of Windows operating system.

* Version 1.61:
  o Added /ChangeTimeAttrSingle command-line option to change the
    date/time/attributes of a single file/folder.

* Version 1.60:
  o BulkFileChanger now allows you to change the date/time values
    stored inside EXIF data of .jpg files.
  o You can change 3 EXIF date/time values: Generated Time, Stored
    Time, and Modified Time.
  o The most useful field to change is the 'Generated Time' (Also
    known as 'Date Taken'), because this field is displayed under the
    'Date' column of Windows Explorer and also many applications use this
    value as official date/time of the picture.
  o This feature works only when the date/time values already exist
    inside the .jpg files (BulkFileChanger cannot add new fields into the
    EXIF data).

* Version 1.52:
  o Added 'Fill Current Time' button, which fills all date/time
    fields in the 'Change file time / attributes' window with the current
    date/time.

* Version 1.51:
  o Added 'Fill Date/Time From File' button to the 'Change file time
    / attributes' window. When you click it, you can choose a file and
    then the current date/time of this file will be copied to the
    date/time fields of the 'Change file time / attributes' window.

* Version 1.50:
  o Added /ChangeTimeAttr command-line option which automactially
    scans the specified folder and its subfolders and modifies the
    date/time/attributes according to the .cfg file, without displaying
    any user interface.
  o Added /LogFile and /LogFileAppend command-line options which
    write all date/time changes and errors into a log file (For using
    with /ChangeTimeAttr )
  o Added /cfg command-line option for loading another configuration
    file instead of the default one.
  o Updated the 'Attributes' column to display the following
    Attributes: 'I' for 'Not Content Indexed', 'E' for encrypted file,
    'X' for 'No Scrub File', and 'V' for 'Integrity Attribute'.

* Version 1.40:
  o 'Change Time / Attributes' window: The date/times values are now
    stored in the .cfg file.
  o 'Change Time / Attributes' window: Added 'Save Settings' button,
    for saving the current settings without changing any file.
  o You can now drag a file from Windows Explorer into the 'Change
    Time / Attributes' window and the created/modified/accessed times of
    this file will be copied to the appropriate date/time settings.

* Version 1.35:
  o Added 'Run As Administrator' option (Ctrl+F11), which allows you
    to easily run BulkFileChanger as administrator on Windows
    Vista/7/8/2008.
  o BulkFileChanger now can read the EXIF data of CR2 raw files.

* Version 1.33:
  o Fixed bug from v1.32: BulkFileChanger stopped working on Windows
    2000.

* Version 1.32:
  o Fixed BulkFileChanger to display and handle daylight saving time
    properly, like Explorer on Windows 7.

* Version 1.31:
  o BulkFileChanger now displays file dates prior to 01/01/1980. In
    previous versions, BulkFileChanger didn't display these dates in
    order to be compatible with Windows Explorer...

* Version 1.30:
  o BulkFileChanger now displays an error message if it fails to
    change the date/time/attributes of one or more files.
  o Added 'Modified-Created Time Difference' column, which displays
    the time difference (in hours:minutes:seconds.milliseconds format)
    between the created time and the modified time of the file. This time
    difference might be interesting in some circumstances. For example:
    If you download a new file from the Internet, the file is created at
    the moment you start to download it, and its modified time is set to
    the time that the last byte was written to the file. This means that
    the created/modified time difference represents the duration of
    downloading process.

* Version 1.25:
  o You can now specify environment variables (For example:
    %appdata%) in the folder path to scan ('Add By Wildcard' option).

* Version 1.24:
  o Fixed bug: If you added files, and then removed them from the
    list, BulkFileChanger failed to add them again.

* Version 1.23:
  o Fixed issue: BulkFileChanger failed to copy EXIF properties from
    .jpg image to the created/modified/accessed time of the file, On
    Windows 7 and Windows 8. The problem is actually in the GDI+ library
    of Windows which from unknown reason fails to read these EXIF
    properties. So BulkFileChanger now reads the EXIF data directly
    instead of using the GDI+ library of Windows.

* Version 1.22:
  o Fixed issue: The properties dialog-box and other windows opened
    in the wrong monitor, on multi-monitors system.
  o Added 'Auto Size Columns+Headers' option, which allows you to
    automatically resize the columns according to the row values and
    column headers.
  o Added 64-bit build.

* Version 1.21:
  o Fixed bug: BulkFileChanger failed to display the size and
    date/time information for a filename that begins with dot character.

* Version 1.20:
  o Added 3 new options into 'Copy Time From': EXIF - Generated Time,
    EXIF - Stored Time, and EXIF - Modified Time. You can use these
    options to copy the date/time stored inside EXIF data of digital
    camera picture into the created/modified time of the file.

* Version 1.15:
  o Added 'Date/time sequence mode' option. When it's turned on,
    BulkFileChanger will set a different date/time value for every file,
    and the 'Add' field will be used to add additional time interval for
    every file.
    For example, if you set the modified date/time to '07/07/2011
    10:12:15' and the add value is set to 1 second, the modified time of
    the first file will be set the '07/07/2011 10:12:15', the second file
    will be set to '07/07/2011 10:12:16', the third file will be set to
    '07/07/2011 10:12:17', and so on...
    The order of the files is determined according to the column you
    click. So, if for example, you click the filename column and then use
    the 'Date/time sequence mode', the date/time values will be set
    according to the filename alphabetical order.

* Version 1.10:
  o Added the option to copy from one date/time value to another.
    (For example, you can copy the modified time into the created time or
    the created time into the modified time and accessed time)

* Version 1.05:
  o BulkFileChanger now also allows you to change the date/time of a
    folder. You can add a folder by dragging it from Explorer or by
    adding it with 'Add By Wildcard' feature and 'Add Folders' option
    turned on.
  o Added 'File Extension' column.
  o Added 'Mark Odd/Even Rows' option, under the View menu. When it's
    turned on, the odd and even rows are displayed in different color, to
    make it easier to read a single line.

* Version 1.02:
  o Added support for temporary file attribute.

* Version 1.01:
  o Fixed bug: When the find dialog-box was in focus, pressing the
    delete key removed the file from the main window.

* Version 1.00: First release.




Using BulkFileChanger
=====================

BulkFileChanger doesn't require any installation process or additional
dll files. In order to start using it, simply run the executable file -
BulkFileChanger.exe

After running BulkFileChanger, you can add files into the list by using
one of the following methods:
* Copy and Paste: Simply copy files from Explorer window (Ctrl+C) and
  then paste them into BulkFileChanger (Ctrl+V). You can also copy files
  from other utilities of NirSoft, like SearchMyFiles and HashMyFiles.
* Drag From Explorer: You can add files by dragging them from Explorer
  window into the main window of BulkFileChanger.
* 'Add Files' option (F2):Add files from 'open file' dialog-box.
* 'Add By Wildcard' option (F3):Add multiple files by specifying
  wildcard, path, and subfolder depth to scan. (For Example:
  c:\temp\*.txt)
You can also remove files from the list by using 'Remove Selected Files'
option (Del key) or clear the entire files list by using 'Clear Files
List' (Ctrl+L)

After you added the desired files, you can select some of them or all of
them (Ctrl+A) and then use one of the following options:
* Change Time / Attributes (F6): Allows you to modify the
  modified/created/accessed time of the selected files. You set them to
  specific time/date values or you can add/subtract
  days/hours/minutes/seconds from the existing file time. You can also
  modify the attributes of the files, like Read-Only, Hidden, and so on.
* Execute Command On Selected Files (F7): Allows you to run any
  executable with the selected files as command-line parameter. For
  example: if you specify 'c:\temp\MyProgram.exe "%1"' in the execute
  command string, BulkFileChanger will run MyProgram.exe for every file
  in the list, and the "%1" will be replaced with the full path filename.
* Explorer Copy/Cut: You can use the copy or cut option to copy/move
  the selected files into another folder window of Explorer.
* Export Selected Items: You can export the files list into
  html/text/html/csv file.



Command-Line Options
====================



/cfg <Filename>
Start BulkFileChanger with the specified configuration file. For example:
BulkFileChanger.exe /cfg "c:\config\bfc.cfg"

/ChangeTimeAttr <Folder> <Wildcard> <Subfolders Depth> <File/Folder Mode>
This command-line option allows you to scan a folder and its subfolders,
and change the date/time/attributes of all files without displaying any
user interface. The change is made according to the last settings stored
in the .cfg file. You can choose to load another .cfg file (Instead of
default) by using the /cfg command-line option.


<Folder> - Specifies the base folder to scan.
<Wildcard> - Specifies the wildcard to determine which files to change.
For example, if you want to only modify the date/time of .exe file,
specify "*.exe". If you want to change all files - simply specify "*".
<Subfolders Depth> - Specifies the depth of subfolders to scan. If you
specify 0, BulkFileChanger will not scan the subfolders.
<File/Folder Mode> - Specifies whether to change the date/time/attributes
of files, folders or both:
0 = Both Files and folders
1 = Files only
2 = Folders only

Here's a few examples:
BulkFileChanger.exe /ChangeTimeAttr "C:\Temp\MyFiles" "*" 5 0
BulkFileChanger.exe /ChangeTimeAttr "C:\Temp\MyFiles" "a*.csv" 0 1
BulkFileChanger.exe /cfg "c:\temp\bfc12.cfg" /ChangeTimeAttr "C:\Temp"
"*" 10 0
BulkFileChanger.exe /LogFile "c:\temp\log1.txt" /ChangeTimeAttr
"C:\MyFiles" "*" 2 0

Warning !!
This command-line option is very powerful, so you should use it
carefully. It's recommended to test it with a single small folder to
check that it works as expected before running it on a full drive...

/ChangeTimeAttrSingle <Filename>
This command-line option allows you to change the date/time/attributes of
a single file.

/LogFile <Filename>
Specifies a log file to write all actions and errors while running the
/ChangeTimeAttr command.

/LogFileAppend <Filename>
Similar to /LogFile, but if the file already exists, the new log lines
are added to the existing file.



Translating BulkFileChanger to other languages
==============================================

In order to translate BulkFileChanger to other language, follow the
instructions below:
1. Run BulkFileChanger with /savelangfile parameter:
   BulkFileChanger.exe /savelangfile
   A file named BulkFileChanger_lng.ini will be created in the folder of
   BulkFileChanger utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run BulkFileChanger, and all
   translated strings will be loaded from the language file.
   If you want to run BulkFileChanger without the translation, simply
   rename the language file, or move it to another folder.



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

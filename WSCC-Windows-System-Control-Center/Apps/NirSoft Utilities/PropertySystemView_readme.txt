


PropertySystemView v1.21
Copyright (c) 2019 - 2024 Nir Sofer
Web site: https://www.nirsoft.net/utils/windows_property_system_view.html



Description
===========

PropertySystemView is a tool that allows you view and modify the
properties of file from GUI and command-line, using the property system
of Windows operating system. For example, you can change the 'Media
Created' timestamp stored in .mp4 files (System.Media.DateEncoded) as
well as other metadata stored in media files and office documents, like
Title, Comments, Authors, Tags, Date Acquired, Last Saved Date, Content
Created Date, Date Imported, Date Taken (EXIF of .jpg files), and more...
PropertySystemView also allows you to set properties of Windows. For
example, you can set the System.AppUserModel.ID property of a window in
order to disable the taskbar grouping of the specified window.



System Requirements
===================

This tool works on any version of Windows, starting from Windows Vista
and up to Windows 11. Both 32-bit and 64-bit systems are supported.



Known Issues
============

The property system of Windows has many bugs and issues, for example:
* On some 64-bit systems, edit of some properties ( like
  System.Document.DateCreated and System.Document.DateSaved) will only
  work from the 64-bit version of PropertySystemView. So if you have
  64-bit system, it's recommended to use the 64-bit version of
  PropertySystemView.
* The 'Read Only' flag of properties is not very reliable. There are
  some read-only properties that you can actually modify, while there are
  properties that are not defined as read-only, but you'll get an error
  when trying to modify them.
* Some properties may behave differently on different versions of
  Windows operating system.

The above issues, as well as other problems you may encounter, are not
bugs in the PropertySystemView tool. They are issues of the property
system of Windows operating system.



Versions History
================


* Version 1.21
  o Added 'Always On Top' option.

* Version 1.20
  o Added /CopyProperty command-line option, which allows you to copy
    a value of one property into another property.
  o For example, this command will copy the value of
    System.DateModified property into the System.Media.DateEncoded
    property:
    PropertySystemView.exe /CopyProperty "C:\temp\1.mp4"
    System.DateModified System.Media.DateEncoded

* Version 1.19
  o Added new option: 'Explorer Context Menu - Open In Google Maps'.
    If you turn on this option, 'Open In Google Maps' menu item is added
    to the context menu of .jpg files.

* Version 1.18
  o Added option to choose another font (name and size) to display
    the properties list in the main window.

* Version 1.17
  o Fixed some high DPI mode issues.

* Version 1.16
  o Added 'Start As Hidden' option. When this option and 'Put Icon On
    Tray' option are turned on, the main window of PropertySystemView
    will be invisible on start.

* Version 1.15
  o Added 'New PropertySystemView Instance' under the File menu, for
    opening a new window of PropertySystemView.
  o Added 'Add Header Line To CSV/Tab-Delimited File' option (Turned
    on by default).

* Version 1.13
  o Added /OpenGoogleMaps command-line option, which opens the
    location of .jpg image in Google Maps Web site, for example:
    PropertySystemView.exe /Filename "C:\temp\20200725_101225.jpg"
    /OpenGoogleMaps

* Version 1.12
  o Added 'Open Location In Google Maps' option. This option is
    available for image files with GPS information (Geo-tagging). When
    there are Geo-tagging properties (System.GPS.Longitude and
    System.GPS.Latitude), this option allows you to easily open the
    location of the image in Google Maps.

* Version 1.11
  o Added 'Save All Items' option (Shift+Ctrl+S).

* Version 1.10
  o Added 'Put Icon On Tray' option.

* Version 1.05
  o Added 'Explorer Context Menu' option. When it's turned on, you
    can easily open any file with PropertySystemView from Windows
    Explorer. Simply right-click on the file and then choose the
    PropertySystemView menu item.

* Version 1.00 - First release.



Start Using PropertySystemView
==============================

PropertySystemView doesn't require any installation process or additional
DLL files. In order to start using it, simply run the executable file -
PropertySystemView.exe
After running PropertySystemView, you can easily view the properties of
file by dragging it from Windows Explorer into the main window of
PropertySystemView. You can also click the Browse button and choose the
file to open and then press F8.
Optionally, you can also access the properties of a window by dragging
the target icon on the toolbar into the window or by choosing 'Load
properties of the following window' from the combo-box , typing the
handle of the window (e.g: 01CC0B06) and then pressing F8.
By default, a window doesn't have any property, but you can use the 'Add
New Property' option (Ctrl+N) to add a new property. For example: You can
add System.AppUserModel.ID property to a window in order to disable the
taskbar grouping.

If you want to view the list of all properties available on your system,
simply choose 'List all properties on your system' and press F8.



Information About Properties
============================

If you want to get more information about a property, you can find it in
this Web page on Microsoft Web site. You can also use the 'Open Microsoft
Web Page' option to open the Web page of the selected property in your
default Web browser.



Setting a property
==================

If you want to change the value of existing property, simply select the
desired property and press F2 (Edit Selected Property). If the property
you want to set doesn't exist, Press Ctrl+N (Add New Property), select
the property you want to set and then type the property value.



Other Options
=============


* Keep Filename Time On Property Change: When you set a property that
  modifies the metadata stored inside a file, the operating system
  automatically set the modified time of the file (stored in the file
  system) to the current time. When this option is selected,
  PropertySystemView keeps the original modified time of the file while
  setting the property.
* Show Time In GMT (Raw Value): Date/Time values are usually stored in
  GMT, but PropertySystemView automatically convert these values to your
  local time zone (According to the time zone settings on your system)
  and the local time is displayed under the 'Raw Value' column. If you
  want to keep the date/tiem in GMT, you should turn on this option.
* Hide Read Only Properties: If you turn on this option,
  PropertySystemView will not display properties defined as read-only. Be
  aware that there some read-only properties that it's actually possible
  to change their values...



Command Line Examples
=====================


* Export the list of all properties of 1.mp4 file into csv file
  PropertySystemView.exe /Filename "c:\temp\1.mp4" /scomma
  "c:\temp\mp4_properties.csv"
* Export the list of all properties on your system into html5 file
  PropertySystemView.exe /AllProperties /shtml
  "c:\temp\all_system_properties.html"
* Set the 'Media Created' date/time of single .mp4 file.
  PropertySystemView.exe /SetProperty "c:\temp\1.mp4"
  "System.Media.DateEncoded" "2018/11/23:08:10:30.000"
* Set the 'Media Created' date/time of all .mp4 files on c:\myfiles
  folder
  PropertySystemView.exe /SetProperty "c:\myfiles\*.mp4"
  "System.Media.DateEncoded" "2015/10/15:00:00:00.000"
* Copy the value of System.DateCreated property into the
  System.Media.DateEncoded property
  PropertySystemView.exe /CopyProperty "C:\temp\1.mp4" System.DateCreated
  System.Media.DateEncoded
* Remove the comment from all .mp4 files on c:\myfiles folder
  PropertySystemView.exe /RemoveProperty "c:\myfiles\*.mp4"
  "System.Comment"
* Set the 'Date Taken' value of all .jpg files on c:\pictures folder
  PropertySystemView.exe /SetProperty "c:\pictures\*.jpg"
  "System.Photo.DateTaken" "2019/11/01:10:00:00.000"
* Set the last saved date of the specified Excel file:
  PropertySystemView.exe /SetProperty "c:\temp\myfile.xlsx"
  "System.Document.DateSaved" "2019/10/20:11:22:33.000"
* Set the 'Content Created' date/time of the specified Excel file:
  PropertySystemView.exe /SetProperty "c:\temp\myfile.xlsx"
  "System.Document.DateCreated" "2019/01/31:22:59:50.000"
* Set the authors of all Excel files on c:\myfiles folder:
  PropertySystemView.exe /SetProperty "c:\myfiles\*.xlsx" "System.Author"
  "NirSoft"
* Set the 'Last Saved By' value of all Excel files on c:\myfiles folder:
  PropertySystemView.exe /SetProperty "c:\myfiles\*.xlsx"
  "System.Document.LastAuthor" "NirSoft"
* Set the title of Excel file:
  PropertySystemView.exe /SetProperty "c:\myfiles\1.xlsx" "System.Title"
  "This is my Excel file"
* Set the 'Last Saved By' value of MS-Word file:
  PropertySystemView.exe /SetProperty "c:\myfiles\mydoc.docx"
  "System.Document.LastAuthor" "NirSoft"
* Set the System.AppUserModel.ID property of a window that its handle
  is 010C0A35 to MyWindow
  PropertySystemView.exe /SetPropertyWindow 010C0A35
  "System.AppUserModel.ID" "MyWindow"
* Open the location of the specified .jpg file in Google Maps:
  PropertySystemView.exe /Filename "C:\temp\20200719_090250.jpg"
  /OpenGoogleMaps



Command-Line Options
====================



/Filename <Filename>
Specifies the filename to load. You can use it with the save command-line
options (/scomma, /shtml, and so on...) to export the properties of the
specified filename into a file.

/Window <Handle>
Specifies the handle of window to load.

/AllProperties
Specifies to load the list of all properties. You can use it with the
save command-line options (/scomma, /shtml, and so on...) to export the
list of all properties on your system into a file.

/SetProperty <Filename or Wildcard> <Property Name> <Property Value>
Allows to set a property from command line. You can specify a single
filename, or multiple filenames, by using wildcard. For the property
name, you can specify the Canonical Name (For example:
"System.Document.DateSaved") or the property key (For example:
"{F29F85E0-4FF9-1068-AB91-08002B27B3D9},13").

/CopyProperty <Filename or Wildcard> <Source Property Name> <Destination
Property Name>
Allows you to copy a value of property into another property. You can
specify a single filename, or multiple filenames, by using wildcard.

/RemoveProperty <Filename or Wildcard> <Property Name>
Removes the specified property from command line. You can specify a
single filename, or multiple filenames, by using wildcard. For the
property name, you can specify the Canonical Name (For example:
"System.Comment") or the property key (For example:
"{F29F85E0-4FF9-1068-AB91-08002B27B3D9},6").

/SetPropertyWindow <Window Handle> <Property Name> <Property Value>
Set a property of a window. You should specify the window handle as
Hexadecimal number, for example: 018E07FC

/OpenGoogleMaps
Open the location of the specified .jpg filename (with /Filename
command-line option) in Google Maps.

/stext <Filename>
Save the properties list to a simple text file.

/stab <Filename>
Save the properties list to a tab-delimited text file.

/scomma <Filename>
Save the properties list to a comma-delimited text file (csv).

/shtml <Filename>
Save the properties list to HTML5 file (Horizontal).

/sverhtml <Filename>
Save the properties list to HTML5 file (Vertical).

/sxml <Filename>
Save the properties list to XML file.

/sjson <Filename>
Save the properties list to JSON file.

/sort <column>
This command-line option can be used with other save options for sorting
by the desired column. The <column> parameter can specify the column
index (0 for the first column, 1 for the second column, and so on) or the
name of the column, like "Display Name" and "Canonical Name". You can
specify the '~' prefix character (e.g: "~Property Type") if you want to
sort in descending order. You can put multiple /sort in the command-line
if you want to sort by multiple columns.



Translating PropertySystemView to other languages
=================================================

In order to translate PropertySystemView to other language, follow the
instructions below:
1. Run PropertySystemView with /savelangfile parameter:
   PropertySystemView.exe /savelangfile
   A file named PropertySystemView_lng.ini will be created in the folder
   of PropertySystemView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run PropertySystemView, and all
   translated strings will be loaded from the language file.
   If you want to run PropertySystemView without the translation, simply
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

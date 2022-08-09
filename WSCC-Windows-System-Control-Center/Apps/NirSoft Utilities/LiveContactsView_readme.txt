


LiveContactsView v1.26
Copyright (c) 2009 - 2015 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

LiveContactsView is a small utility that allows you to view the details
of all contacts in your Windows Live Messenger. For each contact,
LiveContactsView display the following fields: Email address, nickname,
quick name, first name, last name, and more. You can easily select one or
more contacts and then export them into text/xml/html/csv file, or copy
them into the clipboard and then paste them into Excel or to other
spreadsheet application.



System Requirements
===================


* You must sign out from your messenger account in order to view your
  current contacts. If you don't do that, the contacts.edb file is locked
  by Windows Live Messenger, and thus LiveContactsView won't be able to
  read it.
* LiveContactsView works only with Windows Live Messenger. It doesn't
  work with older versions of MSN/Windows messengers.



Versions History
================


* Version 1.26:
  o Fixed bug: On records with empty last modified date,
    LiveContactsView displayed a random date/time.
  o Updated the internal ESE database reader.

* Version 1.25:
  o Added new columns: 'Job Title', 'Work Email', 'Other Email',
    'Other Phone'.

* Version 1.22:
  o Fixed bug: In some contacts files, LiveContactsView failed to
    read most of the fields.

* Version 1.21:
  o Added 'Home Email' column. The 'Email Address' column from
    previous versions is now displayed as 'Messenger Address'.

* Version 1.20:
  o LiveContactsView now reads and parses the contacts file directly,
    instead of using esent.dll to read the contacts database. This change
    should solve many error problems that occur when using esent.dll - it
    seems that in many cases, the API of esent.dll fails with various
    error messages even when the database file is completely fine. Also,
    reading the file directly is much faster than using esent.dll
    If from some reason, LiveContactsView fails to read the contacts
    database with the new method, you can still force LiveContactsView to
    use the old method (esent.dll) by running it with the following
    command-line option:
    LiveContactsView.exe /UseDll
  o LiveContactsView now also displays contacts with no email address
    or buddy identifier. (In previous versions LiveContactsView dropped
    them)
  o LiveContactsView now also scans the Microsoft\Windows
    Live\Contacts subfolder to search for contacts.edb
  o Added 'Auto Size Columns+Headers' option, which allows you to
    automatically resize the columns according to the row values and
    column headers.
  o Fixed issue: The properties and the other windows opened in the
    wrong monitor, on multi-monitors system.

* Version 1.10:
  o When there is a problem with opening the contacts.edb database,
    LiveContactsView now displays a small description for the error
    number.
  o Added Drag & Drop support - You can now drag contacts.edb into
    the window of LiveContactsView in order to open it.

* Version 1.07:
  o Added 'Add Header Line To CSV/Tab-Delimited File' option. When
    this option is turned on, the column names are added as the first
    line when you export to csv or tab-delimited file.
  o Fixed issue: removed the wrong encoding from the xml string,
    which caused problems to some xml viewers.

* Version 1.06 - LiveContactsView will now display an error message
  with error code when it fails to read the contacts file.
* Version 1.05 - Added /sort command-line option.
* Version 1.00 - First release.



Using LiveContactsView
======================

LiveContactsView doesn't require any installation process. In order to
start using it, simply run the executable file - LiveContactsView.exe
After you run LiveContactsView, it automatically search for the
contacts.edb with the latest modified date/time located under [Profile
Folder]\Local Settings\Application Data\Microsoft\Windows Live
Contacts\[Guid]\DBStore (in Windows XP) or under [Profile
Folder]\AppData\Local\Microsoft\Windows Live Contacts\[Guid]\DBStore (in
Windows 7/Vista).
If it find your contacts file and this file is not locked by Windows Live
Messenger, all your Live Messenger contacts will be displayed in the main
window. You can select one or more contacts and then use the 'Save
Selected Items' option to export them into text, HTML, xml, or csv file.
You can also use the Copy option (Ctrl+C) to copy them to the clipboard,
and then paste them into Excel or other spreadsheet application.

You can also select to view the contacts stored in another contacts.edb
file, instead of your default contacts file. In order to do that, simply
go to Advanced Options window (F9) and choose the desired contacts.edb
file.



Command-Line Options
====================



/UseDll
Use esent.dll to read the contacts database file. You can try this option
if LiveContactsView fails to read the contacts database properly.

/contactsfile <Filename>
Specifies that you want to load another contacts file instead of the
default one.

/stext <Filename>
Save the list of contacts into a regular text file.

/stab <Filename>
Save the list of contacts into a tab-delimited text file.

/scomma <Filename>
Save the list of contacts into a comma-delimited text file (csv).

/stabular <Filename>
Save the list of contacts into a tabular text file.

/shtml <Filename>
Save the list of contacts into HTML file (Horizontal).

/sverhtml <Filename>
Save the list of contacts into HTML file (Vertical).

/sxml <Filename>
Save the list of contacts into XML file.

/sort <column>
This command-line option can be used with other save options for sorting
by the desired column. If you don't specify this option, the list is
sorted according to the last sort that you made from the user interface.
The <column> parameter can specify the column index (0 for the first
column, 1 for the second column, and so on) or the name of the column,
like "Last Name" and "First Name". You can specify the '~' prefix
character (e.g: "~First Name") if you want to sort in descending order.
You can put multiple /sort in the command-line if you want to sort by
multiple columns.

Examples:
LiveContactsView.exe /shtml "f:\temp\1.html" /sort 2 /sort ~3
LiveContactsView.exe /shtml "f:\temp\1.html" /sort "~First Name" /sort
"Last Name"

/nosort
When you specify this command-line option, the list will be saved without
any sorting.

Examples:
LiveContactsView.exe /contactsfile "f:\temp\contacts.edb"
LiveContactsView.exe /contactsfile "f:\temp\contacts.edb" /shtml
c:\temp\contacts.html



Translating LiveContactsView to other languages
===============================================

In order to translate LiveContactsView to other language, follow the
instructions below:
1. Run LiveContactsView with /savelangfile parameter:
   LiveContactsView.exe /savelangfile
   A file named LiveContactsView_lng.ini will be created in the folder of
   LiveContactsView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run LiveContactsView, and all
   translated strings will be loaded from the language file.
   If you want to run LiveContactsView without the translation, simply
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

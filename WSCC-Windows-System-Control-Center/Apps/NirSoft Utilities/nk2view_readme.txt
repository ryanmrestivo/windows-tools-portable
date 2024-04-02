


NK2View v1.43
Copyright (c) 2007 - 2009 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

Each time that you send a new message in Outlook, the emails that you
type in To/Cc fields, are automatically inserted into the AutoComplete
list, so in the next time that you type an email address, Outlook
automatically completes the right email address for you.
The AutoComplete file of Outlook is stored under [Your
Profile]\Application Data\Microsoft\Outlook , and it always saved as the
profile name of Outlook with .NK2 extension.
This utility reads the AutoComplete file of Outlook (with .NK2
extension), displays all email records stored in it, and allows you to
easily export these records into text/html/xml file.



Versions History
================


* Version 1.43:
  o Added support for Outlook 2010 Beta - Automtically locate the
    Stream_Autocomplete*.dat files under [Local
    AppData]\Microsoft\Outlook\RoamCache.

* Version 1.42:
  o Fixed bug: The sorting options that I added in v1.41 caused the
    delete command-line options to work improperly.

* Version 1.41:
  o Added /sort command-line option.

* Version 1.40:
  o Added 'Email Domain' column that allows you to sort the list by
    the domain of the email (gmail.com, yahoo.com, and so on)

* Version 1.38:
  o Fixed bug: NK2View failed to detect the right NK2 filename when
    the profile name contained '/' or other special characters.

* Version 1.37:
  o Just another small bug fix related the large binary field with
    multiple values.

* Version 1.36:
  o Fix bug: When there was a binary field with multiple values,
    NK2View failed to read it, and thus it could not continue to read the
    other records. For .NK2 files with this problem, NK2View didn't
    display all the records.
  o Fix bug: NK2View failed to add new records when there were dead
    records in the end of the file.

* Version 1.35:
  o Added support for /delete_by_type command-line option.
  o Added support for creating a new empty .NK2 file.
  o Added more error messages when something goes wrong.

* Version 1.30:
  o Added support for backup/restore options. The backup is made in
    the same folder of the NK2 file, with .BAK extension.

* Version 1.25:
  o Added the 'Delete Selected Items' and 'Add Items From Address
    Book' to the toolbar and context menu.
  o Added more accelerator keys.

* Version 1.24:
  o Add new command-line option: /delete_contains - allows you to
    delete all items contains the specified string.

* Version 1.23:
  o Fixed bug: The main window lost the focus when the user switched
    to another application and then returned back to NK2View.

* Version 1.22:
  o Added support for saving as comma delimited file.
  o Added /scomma command-line option

* Version 1.21:
  o Added /delete for deleting AutoComplete items from command-line.

* Version 1.20:
  o Added new save file type - 'Tab delimited file - for Outlook
    import': When you save the selected items with this file type, you
    can use the saved file to import the emails/names list into the
    contacts of Outlook.
  o Added /soutlook command-line option - for saving a tab-delimited
    file that can be used with Outlook import

* Version 1.15:
  o Added new option - Add items from address book.

* Version 1.10:
  o Added support for delete option.
  o Added support for drag & drop from Explorer window into NK2View
    window.
  o Fixed bug in reading some .NK2 files.

* Version 1.00 - First release.



Using NK2View
=============

NK2View doesn't require any installation process or additional DLL files.
Just copy the executable file (nk2view.exe) to any folder you like, and
run it.
After your run it, NK2View utility displays the AutoComplete list of the
default Outlook profile. If you want to view the AutoComplete list of
other profiles, simply use the 'Open .NK2 File' option.



NK2View Columns
===============


* Display Name - The name that represents this email. If there is no
  name for this email, the email itself will be displayed in this field.
* Email - The email address that you sent. If your Outlook is connected
  to Exchange server, you may get here the Exchange/Active Directory
  string (something like /o=xxxxx/ou=yyyyy/cn=Recipients/cn=name) instead
  of the real email address. In order to view the real email address,
  select the desired item, and press F9 (Open Item Details Window).
* Type - The type of the address: SMTP or Exchange.
* AutoComplete Value - The AutoComplete string, exactly as it appeared
  in the AutoComplete drop-down list.
* Entry ID - The ID string of the specified address. This value is
  internally used by Outlook to identify the address record.
* Index - Numeric value the represents the order of the address records
  in the .NK2 file (The first record is 1, the second is 2, and on...)
* Recipient Type - To, Cc, or Bcc. This value is updated according to
  the last time that you sent a message to the specified address.



Delete AutoComplete Items
=========================

Starting from version 1.10, NK2View allows you to delete
unwanted/obsolete AutoComplete items. After you delete the items, Outlook
won't display them in the AutoComplete combo-box.
However, before you make any delete action, you should always backup your
.NK2 file, so if something goes wrong with the delete, you'll be able to
restore the original AutoComplete list. Also, while you use the delete
option, Outlook application must be closed.



Add AutoComplete items from your address book
=============================================

Starting from version 1.15, NK2View allows you to add new AutoComplete
items directly from your address book. In order to use this feature,
close your Outlook, choose the "Add Items From Address Book" from the
File menu, and then select the items that you want to add.
be aware that the number of AutoComplete items that are allowed in NK2
file is limited to 1000.

Warning !!!
Some users complained that their .NK2 file stopped working in Outlook
after trying to add items from the address book. Before you add a new
AutoComplete item, you should always backup your .NK2 file, so if
something goes wrong, you'll be able to restore the original AutoComplete
list. Also, while you use the add option, Outlook application must be
closed.



Command-Line Options
====================



/soutlook <Filename>
Save the list of all AutoComplete entries into a tab-delimited text file
that can be used to import the emails/names list into the contacts of
Outlook.

/delete <Name>
delete a record from the NK2 file. You must specify the exact display
name or email.

/delete_contains <string>
delete all records in the NK2 file that contains the specified string.
for example, to delete all emails of nirsoft.net domain:
/delete_contains "@nirsoft.net"

/delete_by_type <SMTP | EX>
delete all records with the specified address type.
for example, to delete all exchange emails:
/delete_by_type "ex"

to delete all SMTP emails:
/delete_by_type "smtp"

/stext <Filename>
Save the list of all AutoComplete entries into a regular text file.

/stab <Filename>
Save the list of all AutoComplete entries into a tab-delimited text file.

/scomma <Filename>
Save the list of all AutoComplete entries into a comma-delimited text
file.

/stabular <Filename>
Save the list of all AutoComplete entries into a tabular text file.

/shtml <Filename>
Save the list of all AutoComplete entries into HTML file (Horizontal).

/sverhtml <Filename>
Save the list of all AutoComplete entries into HTML file (Vertical).

/sxml <Filename>
Save the list of all AutoComplete entries to XML file.

/sort <column>
This command-line option can be used with other save options for sorting
by the desired column. If you don't specify this option, the list is
sorted according to the last sort that you made from the user interface.
The <column> parameter can specify the column index (0 for the first
column, 1 for the second column, and so on) or the name of the column,
like "Email" and "Display Name". You can specify the '~' prefix character
(e.g: "~Display Name") if you want to sort in descending order. You can
put multiple /sort in the command-line if you want to sort by multiple
columns.

Examples:
nk2view.exe /shtml "f:\temp\nk2.html" /sort 2 /sort ~1
nk2view.exe /shtml "f:\temp\nk2.html" /sort "~Type" /sort "Email"

/nosort
When you specify this command-line option, the list will be saved without
any sorting.

/nk2file <Filename>
Start NK2View with the specified .NK2 filename. If you don't use this
command-line option, the .NK2 file of the default Outlook profile is
loaded.



Translating NK2View To Another Language
=======================================

NK2View allows you to easily translate all menus, dialog-boxes, and other
strings to other languages.
In order to do that, follow the instructions below:
1. Run NK2View with /savelangfile parameter:
   nk2view.exe /savelangfile
   A file named nk2view_lng.ini will be created in the folder of NK2View
   utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all menus, dialog-boxes, and string entries to the
   desired language.
4. After you finish the translation, Run NK2View, and all translated
   strings will be loaded from the language file.
   If you want to run NK2View without the translation, simply rename the
   language file, or move it to another folder.



License
=======

This utility is released as freeware. You are allowed to freely
distribute this utility via floppy disk, CD-ROM, Internet, or in any
other way, as long as you don't charge anything for this. If you
distribute this utility, you must include all files in the distribution
package, without any modification !
Be aware that selling this utility as a part of a software package is not
allowed !



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

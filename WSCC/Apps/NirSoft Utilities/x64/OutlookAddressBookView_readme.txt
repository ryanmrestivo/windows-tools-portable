


OutlookAddressBookView v2.40
Copyright (c) 2012 - 2022 Nir Sofer



Related Utilities
=================


* NK2Edit - Edit, merge and fix the AutoComplete files (.NK2) of
  Microsoft Outlook.



Description
===========

OutlookAddressBookView is a simple utility that displays the details of
all recipients stored in the address books of Microsoft Outlook. For
every recipient entry, the following information is displayed: Email
Address, Display Name, Address Type (MS-Exchange or SMTP), Street
Address, Phone Number, Created Time, Modified Time (Works only with
address books of Exchange server), and more...
You can easily select one or more recipients from the list and export
them into tab-delimited/comma-delimited/xml/html file, or copy them to
the clipboard and then paste the list into Excel.




System Requirements
===================


* Windows 2000/XP/2003/2008/Vista/7/8/10/11.
* Microsoft Outlook 2003, Microsoft Outlook 2007, Microsoft Outlook
  2010, Microsoft Outlook 2013 or Microsoft Outlook 2016. For the 64-bit
  version of Outlook 2010/2013, you should use the x64 version of
  OutlookAddressBookView. For all other versions, you must use the 32-bit
  of OutlookAddressBookView.



Versions History
================


* Version 2.40
  o Custom context menu: You can now add your own menu items to the
    right-click context menu, by editing the configuration file
    (OutlookAddressBookView.cfg)
  o See the 'Custom Context Menu' section for more information.

* Version 2.36
  o Added /Columns command-line option, which allows you to set the
    columns to display or the columns to export from command-line, for
    example:
    OutlookAddressBookView.exe /Columns "Display Name,Address Type,Email
    Address,Title,Company"

* Version 2.35
  o Added new quick filter option: Find a string begins with...

* Version 2.33
  o Fixed issue: When choosing to scan the address book contacts of
    another Outlook profile (Instead of default) while Outlook is opened
    in the background, the profile opened in Outlook was used, instead of
    the profile selected in OutlookAddressBookView.

* Version 2.32
  o Added option to change the sorting column from the menu (View ->
    Sort By). Like the column header click sorting, if you click again
    the same sorting menu item, it'll switch between ascending and
    descending order. Also, if you hold down the shift key while choosing
    the sort menu item, you'll get a secondary sorting.

* Version 2.31
  o Added toolbar button to the 'Display QR Code' option.

* Version 2.30
  o Added option to export the Outlook address book items to vCard
    file. In order to save the selected items as vCard file - press
    Ctrl+S, and in the file-type combo-box choose 'vCard File'.
  o Added option to copy the selected Outlook address book items to
    the clipboard as vCard file format. (Edit -> Copy As vCard).
  o Added option to generate vCard QR Code for the selected Outlook
    address book item. You can use the QR Code to easily add a contact
    from Outlook to your Smartphone.
  o In order to view the vCard QR Code, simply enable this option:
    View -> Display QR Code (or press Ctrl+R). You can also copy the QR
    Code to the clipboard (Edit -> Copy QR Code).
  o Added 'Edit vCard Template' option (Under the Options menu),
    which allows you to modify the template that OutlookAddressBookView
    uses to generate the vCard files and the vCard QR Code.
  o Updated to work properly in high DPI mode.

* Version 2.23
  o Added 'Number of records per request' option ('Advanced Options'
    window), which specifies the number of address book records that
    OutlookAddressBookView receives on every request. The default value
    is 5. You can try to 'Play' with this value if you have performances
    issue while loading the address book on your system.

* Version 2.22
  o Added 'Copy Clicked Cell' option to the right-click context menu,
    which copies to the clipboard the text of cell that you right-clicked
    with the mouse.

* Version 2.21
  o Fixed to save the 'Case Sensitive' option of the Quick Filter in
    the .cfg file.

* Version 2.20
  o Added 'Case Sensitive' option to the Quick Filter window.

* Version 2.19
  o Fixed bug: OutlookAddressBookView failed to remember the last
    size/position of the properties window if it was not located in the
    primary monitor.

* Version 2.18
  o The last size/position of the properties window is now saved in
    the .cfg file.

* Version 2.17
  o Added 'Select All' and 'Deselect All' to the 'Column Settings'
    window.

* Version 2.16
  o The properties window is now resizable.

* Version 2.15:
  o Added /SaveAddressBooks command-line option for exporting the
    names of address books into a file.

* Version 2.13:
  o Added new quick filter options: 'Find records with all words
    (space-delimited list)' and 'Find records with all strings
    (comma-delimited list)'
  o Added new quick filter combo-box: 'Show only items match the
    filter' and 'Hide items that match the filter'.

* Version 2.12:
  o Added 'Manager Name' column.

* Version 2.11:
  o Fixed bug: 'Copy Selected Items' worked improperly when setting
    the 'Unicode/Ascii Save Mode' to 'Always UTF-8'.

* Version 2.10:
  o Added 'Quick Filter' feature (View -> Use Quick Filter or
    Ctrl+Q). When it's turned on, you can type a string in the text-box
    added under the address-books combo-box and OutlookAddressBookView
    will instantly filter the address book table, showing only lines that
    contain the string you typed.

* Version 2.07:
  o Fix bug: When using /SaveDirect command-line option, the file was
    always saved according to the default encoding, instead of using the
    selected encoding in Options -> Save File Encoding.

* Version 2.06:
  o Fixed bug: OutlookAddressBookView crashed when using the find
    option while the last item was selected.

* Version 2.05:
  o Fixed the export to csv file to enclose a field with quotes if it
    contains new line characters (CRLF).
  o You can now choose the desired encoding (ANSI, UTF-8, UTF-16) to
    save the csv/xml/text/html files. (Under the Options menu)

* Version 2.02:
  o Added 'New OutlookAddressBookView Instance' under the File menu,
    for opening a new window of OutlookAddressBookView.

* Version 2.01:
  o Added 'Auto Size Columns On Load' option.

* Version 2.00:
  o Improved the memory allocation for address books with large
    amount of items.
  o Added "Don't load Entry IDs" and "Don't load Exchange strings"
    options. You can use these options to reduce the memory footprint
    when loading very large address books.

* Version 1.98:
  o When OutlookAddressBookView fails to load the selected address
    book, error code is now displayed in the bottom status bar.

* Version 1.97:
  o Added /SaveDirect command-line option for using with the other
    save command-line options (/scomma, /stab, /sxml, and so on...),
    which allows you to export the address book records directly to a
    file, instead of accumulating all data in memory and then save them
    to file in the end.

* Version 1.96:
  o Added option to export to JSON file.

* Version 1.95:
  o Added 'Exchange String' column (For address books of MS-Exchange
    only).
  o Added 'Record Type' column (Mail User, Distribution List, Private
    Distribution List, or Remote User).
  o Added 'Copy As Simple CSV - For NK2Edit' option (F8), which
    allows you to easily copy the selected records and then paste them
    into the NK2Edit tool.

* Version 1.92:
  o The name of the selected address book is now displayed in the
    window title.

* Version 1.91:
  o Added 'Always On Top' option.

* Version 1.90:
  o Fixed bug: OutlookAddressBookView added <br> to the XML file.

* Version 1.89:
  o Fixed bug: OutlookAddressBookView failed to remember the last
    size/position of the main window if it was not located in the primary
    monitor.

* Version 1.88:
  o Fixed to display the profiles list for Outlook 2013 in the
    'Profile Name' combo-box.

* Version 1.87:
  o Fixed a crash problem occurred on some systems.

* Version 1.86:
  o Added 'Alias' column (For address books of MS-Exchange).

* Version 1.85:
  o The number of items of every address book is now displayed in the
    top address books list.

* Version 1.82:
  o Fixed to find the correct item when typing the string you want to
    search into the main List View.
  o Added secondary sorting support: You can now get a secondary
    sorting, by holding down the shift key while clicking the column
    header. Be aware that you only have to hold down the shift key when
    clicking the second/third/fourth column. To sort the first column you
    should not hold down the Shift key.

* Version 1.81:
  o OutlookAddressBookView now remembers the last selected address
    book.

* Version 1.80:
  o Added 'Recent Config Files' menu.

* Version 1.77:
  o Fixed a few strings contained 'NK2Edit' string instead of
    OutlookAddressBookView.
  o Fixed to display date/time values according to daylight saving
    time settings.

* Version 1.76:
  o Fixed bug: OutlookAddressBookView failed to filter the address
    book items properly according to the 'Advanced Options' window when
    exporting the items from command-line.

* Version 1.75:
  o Added option to load only the address books containing the
    specified strings (In 'Advanced Options' window).

* Version 1.72:
  o Fix the 'Department Name' column header, which was mistakenly
    changed to 'OutlookAttachView Config File' in Version 1.70 update.

* Version 1.71:
  o Added 'Copy Names Only' option, which copies the display names of
    all selected records to the clipboard, each name in a separated line.

* Version 1.70:
  o Added 'Load Configuration' and 'Save Configuration' options.

* Version 1.68:
  o Added /cfg command-line option to start OutlookAddressBookView
    with the specified configuration file, for example:
    OutlookAddressBookView.exe /cfg "%AppData%\OutlookAddressBookView.cfg"

* Version 1.67:
  o Added 'Copy Emails Only' option, which copies the emails of all
    selected records to the clipboard, each email in a separated line.

* Version 1.66:
  o When trying to connect to Outlook 2010/2013 with the wrong build
    of OutlookAddressBookView (OutlookAddressBookView 32-bit with Outlook
    x64 or OutlookAddressBookView x64 with Outlook 32-bit),
    OutlookAddressBookView now displays informative error message about
    the problem.

* Version 1.65:
  o Added option to exclude records that their email or display name
    contains the specified strings. (In 'Advanced Options' window)

* Version 1.60:
  o Added option to load only records with the specified address
    types. (In 'Advanced Options' window)

* Version 1.55:
  o Added option to load only records that their email or display
    name contains the specified strings. (In 'Advanced Options' window)

* Version 1.52:
  o Added option to choose another font (font name and size) to
    display all address book items. (Options -> Select Another Font)

* Version 1.51:
  o Fixed the flickering appeared while scrolling the contacts list.

* Version 1.50:
  o Added 2 new columns: 'Office Location' and 'Department Name'

* Version 1.45:
  o Added 2 new columns: 'Business City' and 'Home City'

* Version 1.40:
  o Added 2 new columns: 'Primary Fax' (For address books of
    MS-Exchange ) and 'Home Fax' (for Contacts of MS-Outlook ).

* Version 1.36:
  o Added 'Mark Odd/Even Rows' option, under the View menu. When it's
    turned on, the odd and even rows are displayed in different color, to
    make it easier to read a single line.

* Version 1.35:
  o Added EntryID column.
  o Added 'Open Item In Outlook' option (Ctrl+O).

* Version 1.30:
  o Added new command-line options: /OutlookProfile and
    /OutlookProfileString

* Version 1.25:
  o Added option to save the address book records into
    csv/tab-delimited/xml/html file from command-line.

* Version 1.21:
  o Fixed issue: Dialog-boxes opened in the wrong monitor, on
    multi-monitors system.

* Version 1.20:
  o Added new columns: 'Office Number 2' and 'Home Number 2'

* Version 1.16:
  o Added 'Auto Size Columns+Headers' option, which allows you to
    automatically resize the columns according to the row values and
    column headers.

* Version 1.15:
  o Changed the user interface from tabs to combo-box, which is
    easier to use for Exchange profiles with large amount of address
    books.
  o Instead of loading all address books at once,
    OutlookAddressBookView now loads only the selected address book.

* Version 1.11:
  o Added 'Copy As Emails List' option (Ctrl+L) which allows you to
    copy to the clipboard the selected emails as semicolon delimited list
    that can be used in the To/CC fields of Outlook or other email
    software.

* Version 1.10:
  o Added 'Stop' menu, which allows you to stop the loading process
    of the address books.

* Version 1.05:
  o Fixed bug: In some Outlook/Exchange configurations,
    OutlookAddressBookView loaded only the first 50 address book contacts.
  o Fixed bug: On Outlook profile with large amount of address books,
    the tab control occupied the entire window of OutlookAddressBookView.
  o Improved the memory usage and speed for large amount of contacts.

* Version 1.00 - First release.



Start Using OutlookAddressBookView
==================================

OutlookAddressBookView doesn't require any installation process or
additional dll files. In order to start using it, simply run the
executable file - OutlookAddressBookView.exe
After you run OutlookAddressBookView, it automatically scans your default
Outlook profile and displays the address books stored in it. You can
choose another Outlook profile from the Advanced Options window (F9)
In the combo-box located below the toolbar of OutlookAddressBookView
window, you can choose the desired address book to load. For PST based
profiles, you'll probably find only one address book named 'Contacts'.
For profiles connected to Microsoft Exchange Server, you'll get more
types of address books, for example: 'Global Address Book', 'All Users',
'All Employees', and so on.
On Outlook 2010, you'll also get the 'Suggested Contacts' address book.

You can easily select one or more recipients in your address book, and
then save them into tab-delimited/comma-delimited/xml/html file, by using
the 'Save Selected Items' option. You can also copy the selected
recipients into the clipboard (Ctrl+C) and then paste them into Excel.



Custom Context Menu
===================

Starting from version 2.40, you can add your own custom menu items into
the context menu of OutlookAddressBookView.
In order to do this, you have to exit completely from
OutlookAddressBookView and then edit the OutlookAddressBookView.cfg file,
located in the same folder of `.exe. You can edit
OutlookAddressBookView.cfg with notepad or any other text editor.

The structure of the custom menu configuration is very simple, and looks
like this:


[CustomMenu]
Caption0=Menu Caption
Command0=Menu Command
Caption1=Menu Caption
Command1=Menu Command
Caption2=Menu Caption
Command2=Menu Command
.
.
.



You can create up to 10 different menu items (from 0 to 9). The command
string is an executable file with parameters that provide the information
about the selected items.
For example, the following menu item will open a new message window in
Outlook with the email address of the selected item.


[CustomMenu]
Caption0=New Message In Outlook
Command0=Outlook.exe -c IPM.Note /m "%EmailAddress%"


OutlookAddressBookView will replace the %EmailAddress% variable with the
email address of the selected address book item. You can use the
following variables for the custom menu command (They are identical to
the column names, but without the space characters): %EmailAddress%
%DisplayName% %AddressType% %CreatedTime% %ModifiedTime% %GivenName%
%Surname% %MiddleName% %Title% %Company% %BusinessStreetAddress%
%BusinessPostalCode% %BusinessStateProvince% %BusinessCity%
%BusinessCountry% %CellularNumber% %OfficeNumber% %OfficeNumber2%
%PrimaryFax% %BusinessFax% %BusinessHomepage% %OfficeLocation%
%DepartmentName% %HomeNumber% %HomeNumber2% %HomeFax% %HomeCity%
%StreetAddress% %PostalCode% %StateProvince% %Country% %EntryID% %Alias%
%ExchangeString% %RecordType% %ManagerName%



Command-Line Options
====================



/AddressBookName <Name>
Specifies the address book name to save with the save command-line
options (/stab, /scomma, and so on)
If you don't specify this parameter, all address books will be saved into
the file.
For example:
OutlookAddressBookView.exe /stab "c:\temp\addrbook1.txt" /AddressBookName
"Global Address List"

/OutlookProfile <Mode>
Specifies the Outlook profile mode.
1 = Use default Outlook profile
2 = Choose the desired profile from Outlook profile dialog-box
3 = Use the Outlook profile specified in /OutlookProfileString parameter.

/OutlookProfileString <Name>
Specified the desired Outlook profile name when OutlookProfile is 3.
For example:
OutlookAddressBookView /OutlookProfile 3 /OutlookProfileString "NirSoft"

/cfg <Filename>
Start OutlookAddressBookView with the specified configuration file. For
example:
OutlookAddressBookView.exe /cfg "c:\config\oabv.cfg"
OutlookAddressBookView.exe /cfg "%AppData%\OutlookAddressBookView.cfg"

/stext <Filename>
Save the address book records into a regular text file.

/stab <Filename>
Save the address book records into a tab-delimited text file.

/scomma <Filename>
Save the address book records into a comma-delimited text file (csv).

/stabular <Filename>
Save the address book records into a tabular text file.

/shtml <Filename>
Save the address book records into HTML file (Horizontal).

/sverhtml <Filename>
Save the address book records into HTML file (Vertical).

/sxml <Filename>
Save the address book records into XML file.

/sjson <Filename>
Save the address book records into JSON file.

/SaveDirect
Save the address book records in SaveDirect mode. For using with the
other save command-line options ( /scomma, /stab, /sxml, and so on...)
When you use the SaveDirect mode, the address book records are saved
directly to the disk, without loading them into the memory first.

/sort <column>
This command-line option can be used with other save options for sorting
by the desired column. If you don't specify this option, the list is
sorted according to the last sort that you made from the user interface.
The <column> parameter can specify the column index (0 for the first
column, 1 for the second column, and so on) or the name of the column,
like "Email Address" and "Display Name". You can specify the '~' prefix
character (e.g: "~Email Address") if you want to sort in descending
order. You can put multiple /sort in the command-line if you want to sort
by multiple columns.

Examples:
OutlookAddressBookView.exe /shtml "f:\temp\addrbook.html" /sort 2 /sort ~1
OutlookAddressBookView.exe /shtml "f:\temp\addrbook.html" /sort "Address
Type" /sort "Display Name"

/Columns <Comma Delimited Columns List>
Allows you to set the columns to display or the columns to export from
command-line. You have to specify the column names, delimited by comma,
for example:
OutlookAddressBookView.exe /scomma c:\temp\contacts-list.csv /Columns
"Display Name,Address Type,Email Address,Title,Company"

You can also specify the column names without space characters, for
example:
OutlookAddressBookView.exe /Columns
"DisplayName,AddressType,EmailAddress,Title,Company"

/SaveAddressBooks <Filename>
Save the names of all address books into a file.



Translating OutlookAddressBookView to other languages
=====================================================

In order to translate OutlookAddressBookView to other language, follow
the instructions below:
1. Run OutlookAddressBookView with /savelangfile parameter:
   OutlookAddressBookView.exe /savelangfile
   A file named OutlookAddressBookView_lng.ini will be created in the
   folder of OutlookAddressBookView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run OutlookAddressBookView, and
   all translated strings will be loaded from the language file.
   If you want to run OutlookAddressBookView without the translation,
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

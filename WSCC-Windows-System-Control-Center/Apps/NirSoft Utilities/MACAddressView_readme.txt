


MACAddressView v1.46
Copyright (c) 2009 - 2022 Nir Sofer
Web site: https://www.nirsoft.net



Description
===========

MACAddressView is a MAC address lookup tool that allows you to easily
find the company details (company name, address, and country) according
to the MAC address of a product.
MACAddressView also allows you to find MAC address records according to
the company name, company address, or country name. After finding the
desired MAC address records, you can save them into text/xml/HTML/csv
file or copy them to the clipboard and paste them into Excel or other
applications.

MACAddressView doesn't send any request to a remote server, it simply
uses the internal MAC addresses database stored inside the .exe file.



System Requirements
===================

This utility can be used in any version of Windows, from Windows 98 and
up to Windows 11.



Versions History
================


* Version 1.46:
  o You can now send the data to stdout by specifying empty string as
    filename, for example:
    MACAddressView.exe /find 1 "00-11-F5 00-21-4E 00-80-4C 00-C0-D6"
    /scomma "" | more
  o Updated the internal MAC Addresses database.

* Version 1.45:
  o Updated the internal MAC Addresses database.

* Version 1.44:
  o Updated the internal MAC Addresses database.

* Version 1.43:
  o Updated the internal MAC Addresses database.

* Version 1.42:
  o Updated the internal MAC Addresses database.

* Version 1.41:
  o Fixed bug: MACAddressView failed to remember the last
    size/position of the main window if it was not located in the primary
    monitor.
  o Updated the internal MAC Addresses database.

* Version 1.40:
  o Updated the internal MAC Addresses database.

* Version 1.39:
  o Updated the internal MAC Addresses database.

* Version 1.38:
  o Updated the internal MAC Addresses database.

* Version 1.37:
  o Added new option: Add 'Cannot find MAC address' item if it's not
    in the list.

* Version 1.36:
  o Updated the internal MAC Addresses database.

* Version 1.35:
  o Fixed the 'Find MAC Address Records' window to support Ctrl+A
    (Select All).

* Version 1.33:
  o Updated the internal MAC Addresses database.

* Version 1.32:
  o Fixed to display the country column correctly with the latest
    oui.txt files.
  o Updated the internal MAC Addresses database.

* Version 1.31:
  o Updated the internal MAC Addresses database.

* Version 1.30:
  o Added "Don't Add duplicate records" option.
  o Updated the internal MAC Addresses database.

* Version 1.29:
  o Updated the internal MAC Addresses database.

* Version 1.28:
  o Removed the 32 KB size limitation from the main text-box in the
    'Find MAC Address Records' window

* Version 1.27:
  o Updated the internal MAC Addresses database.

* Version 1.26:
  o Updated the internal MAC Addresses database.

* Version 1.25:
  o Updated to accept MAC addresses in XXXXXXXXXXXX and
    XXXX.XXXX.XXXX formats.
  o Updated the internal MAC Addresses database.
  o Fixed MACAddressView to load the external oui.txt with extra
    spaces on every line.

* Version 1.21:
  o Updated the internal MAC Addresses database.
  o Fixed issue: Dialog-boxes opened in the wrong monitor, on
    multi-monitors system.

* Version 1.20:
  o Added option to load all MAC Address records stored in the
    database.
  o Updated the internal MAC Addresses database.

* Version 1.16:
  o Updated the internal MAC Addresses database.

* Version 1.15:
  o Updated the internal MAC Addresses database.
  o Added 'Mark Odd/Even Rows' option, under the View menu. When it's
    turned on, the odd and even rows are displayed in different color, to
    make it easier to read a single line.
  o Added 'Add Header Line To CSV/Tab-Delimited File' option. When
    this option is turned on, the column names are added as the first
    line when you export to csv or tab-delimited file.

* Version 1.13 - Updated the internal MAC Addresses database.
* Version 1.12 - Added /sort command-line option.
* Version 1.11 - Added 'My MAC Addresses' button to get information
  about the MAC Addresses of your network adapters.
* Version 1.10 - Added command-line support.
* Version 1.05 - Added 'Index' column that you can use to sort the MAC
  addresses list according to the order you added them.
* Version 1.00 - First release.



Using MACAddressView
====================

MACAddressView doesn't require any installation process or additional DLL
files. In order to start using it, simply copy the executable file
(MACAddressView.exe) to any folder you like, and run it.

After running MACAddressView, the 'Find MAC Address Records' will appear.
By default, the 'Find By' option is set to 'MAC Address'. In this mode,
you can type one or more MAC Addresses, separated by space, comma, or
Enter key. You can try a full MAC address (like 01-02-03-04-05-06) or
only the first 3 bytes of the address (like 01-02-03). After typing all
MAC Addresses you need, click the 'Ok' button to view the details of all
MAC records that you asked.

You can also locate a MAC record according to the company name, company
address, or country name. You can look in the examples below to find out
what you can do with these options.



Examples of what you can find with MACAddressView
=================================================


* All MAC addresses range used by companies in Germany and Austria:
  Select 'Country Name' in 'Find By' combo-box, and then in the large
  text-box, type Germany and Austria, in 2 separated lines.
* All MAC addresses range used by Intel: Select 'Company Name' in 'Find
  By' combo-box, and then in the large text-box, type Intel.
* MAC addresses range used by companies in New York: Select 'Company
  Address' in 'Find By' combo-box, and then in the large text-box, type
  'New York'.



Using External File
===================

Although MACAddressView has an internal database inside the .exe file,
you can still use the latest MAC address lookup database available from
http://standards-oui.ieee.org/oui/oui.txt. After downloading it, simply
put the 'oui.txt' filename in the same folder of MACAddressView.exe, and
run it.
When MACAddressView loads the data from external file, 'External File'
phrase will appear in the window title.



Command-Line Options
====================



/find <Find Type> <Find Text>
specifies the MAC addresses that you want to find. The <Find Type> should
be: 1 for searching by MAC addresses, 2 for for searching by company
name, 3 for for searching by company address, or 3 for for searching by
country name.

/stext <Filename>
Save the list of MAC Addresses into a regular text file.

/stab <Filename>
Save the list of MAC Addresses into a tab-delimited text file.

/scomma <Filename>
Save the list of MAC Addresses into a comma-delimited text file (csv).

/stabular <Filename>
Save the list of MAC Addresses into a tabular text file.

/shtml <Filename>
Save the list of MAC Addresses into HTML file (Horizontal).

/sverhtml <Filename>
Save the list of MAC Addresses into HTML file (Vertical).

/sxml <Filename>
Save the list of MAC Addresses into XML file.

/sort <column>
This command-line option can be used with other save options for sorting
by the desired column. If you don't specify this option, the list is
sorted according to the last sort that you made from the user interface.
The <column> parameter can specify the column index (0 for the first
column, 1 for the second column, and so on) or the name of the column,
like "MAC Addresses" and "Company". You can specify the '~' prefix
character (e.g: "~Address") if you want to sort in descending order. You
can put multiple /sort in the command-line if you want to sort by
multiple columns.



/nosort
When you specify this command-line option, the list will be saved without
any sorting.

Examples:
MACAddressView.exe /find 1 "00-11-F5 00-21-4E 00-80-4C 00-C0-D6"
MACAddressView.exe /find 4 "italy"
MACAddressView.exe /find 4 "germany" /shtml c:\temp\maclist.html
MACAddressView.exe /find 2 "intel" /shtml c:\temp\maclist.html
MACAddressView.exe /find 4 "germany" /shtml c:\temp\maclist.html /sort
"Company"



Translating MACAddressView to other languages
=============================================

In order to translate MACAddressView to other language, follow the
instructions below:
1. Run MACAddressView with /savelangfile parameter:
   MACAddressView.exe /savelangfile
   A file named MACAddressView_lng.ini will be created in the folder of
   MACAddressView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run MACAddressView, and all
   translated strings will be loaded from the language file.
   If you want to run MACAddressView without the translation, simply
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

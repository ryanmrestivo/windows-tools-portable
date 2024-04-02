

IECookiesView v1.79
Copyright (c) 2002 - 2017 Nir Sofer
Web site: http://www.nirsoft.net


Description
===========

IECookiesView is a small utility that displays the details of all cookies
that Internet Explorer stores on your computer.
In addition, It allows you to do the following actions:
* Sort the cookies list by any column you want, by clicking the column
  header. A second click sorts the column in descending order.
* Find a cookie in the list by specifying the name of the Web site.
* Select and delete the unwanted cookies.
* Save the cookies to a readable text file.
* Copy cookie information into the clipboard.
* Automatically refresh the cookies list when a Web site sends you a
  cookie.
* Display the cookies of other users and from other computers.
* Open the IECookiesView utility directly from Internet Explorer
  toolbar.
* Change the content of a cookie !
* Export your cookies to Netscape/Mozilla cookies file.
* Block specific Web sites from using cookies through the cookies
  blocking mechanism of Internet Explorer 6.0.



Advantages of this utility
==========================


* This utility is completely freeware ! You don't have to pay anything
  in order to continue using it.
* The utility is a standalone executable. it doesn't require any
  additional DLLs, and installation is not required.
* The executable (iecv.exe) is small and compact. Only 55KB !
* If you have a network, you can watch the cookies of other computers,
  as long as you have a read permission on the cookies folder of other
  computers.
* On Windows NT/2000/XP, You can watch the cookies of other users on
  the same computer, as long as you have the right access permissions on
  the cookies folders.



System Requirements
===================


* Windows operating system: Windows 95/98/ME, Windows NT, Windows 2000,
  Windows XP, Windows Vista, and Windows 7.
* Internet Explorer, Versions 4.0 - 9.0
* There is only limited support for Internet Explorer 10.0, due to a
  change in the way that cookies index information is stored.


License
=======

This utility is released as freeware. You can freely use and distribute
it. If you distribute this utility, you must include all files in the
distribution package including the readme.txt, without any modification !



Disclaimer
==========

The software is provided "AS IS" without any warranty, either expressed
or implied, including, but not limited to, the implied warranties of
merchantability and fitness for a particular purpose. The author will not
be liable for any special, incidental, consequential or indirect damages
due to loss of data or any other reason.



Notice for Windows 7/Vista users
================================

Windows 7 and Windows Vista has 2 cookies folders:
* C:\Users\[User Name]\AppData\Roaming\Microsoft\Windows\Cookies
* C:\Users\[User Name]\AppData\Roaming\Microsoft\Windows\Cookies\Low
Depending on your UAC configuration, Windows may use the first folder or
the second one. Sometimes, IECookiesView choose the wrong cookies folder,
so if you see that the cookies are not updated, you should manually
choose the other cookies folder.



Versions History
================




1.79
11/02/2017

* Fixed to read cookie files with .cookie extension (IE11 - version
  11.576.14393.0).


1.78
01/02/2017

* Fixed issue: IECookiesView failed to read cookies properly on
  IE10/IE11 with Windows 7 if the cookies folder had an old index.dat
  file from previous versions of IE.


1.77
18/07/2014

* Fixed issue: IECookiesView displayed the date/time values of
  IE10/IE11 in GMT instead of local time.
* Fixed to display date/time values according to daylight saving time
  settings.


1.76
02/05/2014

* Fixed to remember the last selection on IE10/IE11.


1.75
06/04/2013

* Added limited support for Internet Explorer 10.0. On IE10, the
  cookies index file (index.dat), which stores information about every
  cookie file, is no longer used. Instead, the information is stored in
  .edb database which is locked for reading/writing by another process.
  Due to this change, when reading the cookies of IE10, the upper pane
  displays only partial information and some of the other features may
  not work properly.


1.74
24/03/2009

* Added more accelerator keys.


1.73
29/09/2008

* On Vista, IECookiesView now automatically goes into 'Low' subfolder
  if the base cookies folder is empty.


1.72
15/07/2008

* Fixed bug: The dates displayed in system locale, instead of user
  locale.


1.71
21/12/2007

* The configuration is now saved to a file, instead of the Registry.


1.70
20/10/2004

* Added support for translating to other languages.
* New accelerator keys added.
* New option: Check Index File Header. If this option is unchecked, an
  error message won't be displayed if the cookies index file is corrupted.
* Ads related domains list (ads.txt)- The list of domains that
  IECookies use to identify advertising related cookies. This file is
  located in the same folder of IECookiesView, and you can freely
  add/remove domains to this list.
* New column: Record Number.
* Added contents to the help file.


1.60
10/03/2004

* Automatically Save Selections: Allows you to automatically save your
  cookies selections when you exit from IECookiesView, and then load it
  again in the next time that you use IECookiesView.
* New Delete/Destroy options: Allows you to delete all your cookies,
  except the cookies that you select.
* Export cookies to Netscape/Mozilla cookies file.
* 'Beep On Change' option - Beep each time that there is a change in
  cookies. (In Auto Refresh mode)
* All dialog-boxes are now automatically centered.


1.50
28/03/2003

* Cookies Blocking/Allowing in version 6 of Internet Explorer
* Remember checked items after choosing other columns.
* New command-line options: /inst, /uninst, /user
* Sort by selection.
* Select by Domain/Site.
* The size of the executable was decreased to 80K.
* Save as tab-delimited file.
* Save / Load Selection.


1.40
12/01/2003

* A new user interface for selecting cookies.
* Destroying a cookie: allows you to delete the cookie including the
  reference in the cookies index file (index.dat).
* A counter is shown on the status bar while loading the cookies.
* Fixed problem: After finding a cookie, the focus is not lost.


1.30
30/10/2002

* New column in the bottom sub-window: "Created In" - Tells you whether
  the cookie was created in the Web Server or in the client (Internet
  Explorer with JScript/VBScript).
* Improvement in identification of advertising related cookies (Ad
  column).
* New option: open the highlighted cookie file in Wordpad.
* After a cookie deletion: the focus is returned to the right place.
* Ability to change the cookie's content.
* Fixed bug: In previous version, the 'Secure' field in the bottom
  sub-window displayed wrong values in some circumstances.
* Each time you run IECookiesView, the cookies that has been modified
  and accessed since the last run, are marked in yellow and green colors.
* Improvement in user interface (Especially in tab orders).
* Improvement in domain parsing. (The domain column in the top
  sub-window)
* Open cookies folder in Explorer.
* Fixed Problem with the 'Tracks Eraser' utility: IECookies will allow
  you to view the cookies even if the index.dat file is corrupted.
* Pop-up menu in the bottom sub-window.


1.20
05/08/2002

* Pop-up menu in the top sub-window.
* Automatically remember your last settings (windows size, split
  location, column settings, and more...)
* New option: open the highlighted cookie file in Notepad.
* Installation options in File menu.
* Choose Columns option in View menu: allows you to select the columns
  that you want to see in the top sub-window. (Like in Explorer of
  Windows 2000/XP)
* "Obsolete Cookie Files" in View menu: allows you to view the cookies
  that are not listed in index.dat
* New column in the top sub-window: "Ad" column - Automatically
  identifies advertising related cookies.
* New column in the top sub-window: "Domain" column - Shows the domain
  name of the cookies file.


1.10
26/06/2002

* Windows 2000-style sort arrows in the columns headers.
* New icons in the bottom window: expired cookies are shown with red
  icon.
* Copy cookies information into the clipboard.
* View Duplicate references in index.dat
* Status column in the top sub-window.
* Default button in "Select Cookies Folder" dialog-box.
* Cookie property page.
* Adding a cookies button into the toolbar of Internet Explorer
* Open Internet Explorer window and connect the Web site of the
  highlighted cookie file.
* A little improvement in performances of cookies loading.
* /dir: command-line option: Run the IECookiesView utility with another
  cookies folder
* /mi command-line option.
* Some changes and fixed bugs in modified/accessed/created dates.
* Fixed bug: In previous version, the default cookies directory for
  windows 95 was x:\windows\profiles\user-name\cookies instead of
  x:\windows\cookies.
* Fixed bug: In previous version, if you switched to "Auto Refresh"
  mode, and than canceled it, by selecting it again from the menu, the
  window was continuing to automatically refresh the cookies list, even
  if the "Auto Refresh" in the menu was unchecked. This bug is fixed on
  version 1.10
* Fixed bug: Error message when trying to load cookies from remote
  computer by using a UNC path (\\computer\folder)


1.00
06/06/2002
First Release



Start using the IECookiesView utility
=====================================

This utility is a standalone executable, and it doesn't require any
installation process or additional DLLs. In order to start using it,
simply run the executable (iecv.exe) from any folder you want. If you
have a network, you can put the executable on the server, allowing all
the workstations on the network to use this utility... And remember: No
additional DLLs are required. As long as you have Internet Explorer
(Version 4.0 and above) on your computer, it'll work !

If you want to create a shortcut to IECookiesView utility or to add a
cookies button to Internet Explorer toolbar, you can easily do it by
selecting the "Installation Options" option from the File menu.

If you have a previous version of IECookiesView, you can just overwrite
the previous executable (iecv.exe), and start using the new one.



Uninstall IECookiesView
=======================

The IECookiesView utility doesn't provide an uninstall module, but in
most cases, you can remove it from your computer simply by deleting the
files of IECookiesView (iecv.exe and iecv.chm). However, if you added a
cookies icon into the toolbar of Internet Explorer (by using the
"Installation Options" or /inst command-line option), you should remove
it before you delete the IECookiesView utility.
There are 3 different ways to remove the cookies icon from the toolbar of
Internet Explorer: (You have to use only one of them)
* In the 'File' menu, select "Installation Options", verify that all 3
  options are unchecked, and press the 'Ok' button.
* Run IECookiesView with /uninst command-line option (iecv.exe /uninst)
* In Internet Explorer application: Right-click on the main toolbar of
  Internet Explorer, and from the popup menu, select "Customize". In the
  "Customize Toolbar" window, remove the cookies icon from list of
  toolbar buttons.

The first and the second options also remove the shortcuts to
IECookiesView in the desktop and in the start-menu.



The main window
===============

The main window of IECookiesView contains two sub-windows: The top
sub-window displays the list of all cookies files and their details. When
you select (highlight) a cookies file in the top sub-window, its cookies
are shown in the bottom sub-window. Each cookies file has at least one
cookie line in the bottom sub-window, unless it's deleted or corrupted.
You can increase and decrease the size of both windows by dragging the
splitter to the right direction.

The top sub-window
==================

The top sub-window displays the details of each cookies file in 11
different columns.
You can add, remove, or change the location of a column, by using the
"Choose columns" option in the View menu.
The following table provides basic information about each available
column:



Web site
The Web site that use this cookies file.

Hits
Number of times that the cookies file was accessed by the Web site. This
value is increased by one in each time that the Web site receives
information from the cookies file.

Accessed Date
The last time that the cookies file was accessed by the Web site.

Modified Date
The last time that the cookies file was modified by the Web site.

Created Date
The time that the cookies file was originally created.

Size
The size of the cookies file (in bytes)

User
The logged-on user that accepted the cookie. For this column, there is a
different between Windows 95/98/ME and Windows NT/2000/XP:

* In Windows NT/2000/XP: Each user has a separated cookies folder, so
  the value in this column is always identical for all cookies.
* In Windows 95/98/ME: Unless you explicitly create new user profiles,
  all users share the same cookies folder (in c:\windows\cookies), and
  thus you can watch the cookies of all users on the system.


Filename
the filename of this cookie in the cookies folder.

Status
The status of the cookies file. It can be one of the following statuses:
* Active: The cookies file is active.
* Deleted: The cookies file was deleted. Deleted cookies files will be
  shown only if "Deleted Cookies Files" in the View menu is checked.
* Duplicate: The record is a duplicate reference to the same cookies
  file. Duplicate references in the cookies index file are shown only if
  "Duplicate Records" in the View menu is checked.


Ad
This column can help to identify unwanted advertising related cookies.
This column can contain one of the following values:
* Yes: The cookie file was created by a known advertising Web site.
  IECookiesView uses the domains list in ads.txt for identifying the
  advertising related cookies.
* Suspect: The Web site that created this cookie file is possibly
  related to advertising. IECookiesView identifies suspect Web sites by
  parsing the URL of the Web site.
* Unknown: IECookiesView cannot determine whether the cookie file was
  created by an advertising Web site.


Domain
In many cases, one Web site might create cookies with different host
names. For example: yahoo.com might send you cookies with the following
host names: groups.yahoo.com, local.yahoo.com, store.yahoo.com and more...
This column displays the domain name of the Web site, by extracting it
from the Web site name. If you sort the cookies list by this column, you
can easily view all cookies of a specific Web site (e.g.: All cookies
files of yahoo.com will be displayed in one chunk)


Record Number
Displays the record number inside the cookies index file (index.dat)

When you click on a column header, the cookies files list is sorted by
the clicked column. A second click sorts the column in descending order.



The bottom sub-window
=====================

The bottom sub-window displays the details of the highlighted cookies
file in 6 different columns:



Key
The name of the cookie

Value
The value of the cookie

Domain
The domain name. It usually the same as the Web site in the top
sub-window.

Secure
Specifies whether the cookie is secure.

Expiration Date
the expiration date of the cookie.

Modified Date
The last time that the cookie was modified by the Web site.

Created In
Specifies where the cookie was created:
* Server: The cookie was sent to the client by the Web Server.
* Client: The cookie was created in the client (Internet Explorer) by
  using JavaScript or VBScript.


When you click on a column header, the cookies list is sorted by the
clicked column. A second click sorts the column in descending order.
Each line in the bottom sub-window contains an icon that indicates
whether the cookie is expired or not. If a cookie is expired, a red icon
will be displayed. otherwise, a green icon will be displayed. The
expiration status is determined by comparing the expiration date of the
cookie with the current local time of your computer. When a cookie is
expired (red icon), the Web site cannot use it anymore, unless it sends a
new cookie, with a new expiration date.



The menu bar
============

The following options are available in the menu bar:
* File
  o Change User: Allows you to display the cookies of another user
    profile. This option is not available on Windows 95/98/ME, unless you
    explicitly add new user profiles from Control Panel.
  o Select Cookies Folder: Allows you to display the cookies from
    another cookies folder. You can also select a cookies folder from
    another computer in a network.
  o Open Cookies Folder In Explorer: Open Explorer window with the
    current cookies folder.
  o Installation Options: Allows you to add or remove the following
    items: shortcut to IECookiesView on the desktop, shortcut to
    IECookiesView in the start menu, and the cookies button in the
    Internet Explorer toolbar.
  o Open Web site: Open Internet Explorer window and connect the Web
    site of the highlighted cookie file.
  o Open With Notepad: Open the highlighted cookie file in Notepad.
  o Open With Wordpad: Open the highlighted cookie file in Wordpad.
  o Save Current Selections: Save the information about currently
    selected cookies files into a file. Later, you can select again the
    same cookies files, by loading the selections file.
  o Load Selections File: Select the cookies files, by using the
    information in a previously saved selections file.
  o Save Selected cookies Files: Save the selected cookies files (in
    the top sub-window) into a readable text file or a tab-delimited text
    file.
  o Export To Netscape/Mozilla File: Export the selected cookies
    files (in the top sub-window) into a Netscape/Mozilla cookies file.
  o Exit: Exit from IECookiesView utility.

* Edit
  o Copy Selected Cookies Files: Copy the information about the
    selected cookies files into the clipboard. You can paste the copied
    information into Notepad, or any other text editor.
  o Select By Domain or Web Site: Select all cookies files created by
    specific domains or Web sites.
  o Select highlighted Items: Select all items that are highlighted
    with blue color.
  o Deselect highlighted Items: Deselect all items that are
    highlighted with blue color.
  o Select All Items: Select all cookies files in the top sub-window.
  o Deselect All Items: Deselect all cookies files in the top
    sub-window.
  o Delete Selected Cookies Files: Delete all selected cookies files.
  o Destroy Selected Cookies Files: Delete all selected cookies files
    and the references to them in the cookies index file (index.dat).
  o Delete All Except The Selected Cookies:Delete all your cookies
    files ,except the cookies that are currently selected.
  o Destroy All Except The Selected Cookies:Delete all your cookies
    and the references to them in the cookies index file ,except the
    cookies that are currently selected.
  o Update Selected Cookies Files: Update the information of the
    cookie file in the cookies index file (index.dat). You use this
    option if you modify a cookie file with external editor (like
    Notepad), and you want to force IE to use the modified file.
  o Cookies Blocking Options (IE6 Only !): Block/Allow the selected
    cookies in Internet Explorer. For more details, read here
  o Find: Find Cookies by specifying the domain of the Web site.
  o Edit The Cookie's Content: Allows you to edit the content of the
    highlighted cookie in the bottom sub-window.

* View
  o Deleted cookies Files: When you delete a cookies file, the
    sensitive data of the cookie is deleted, but the reference to the
    deleted cookies file is remained in the cookies index file
    (index.dat). If this menu item is checked, the deleted cookies files
    are listed in the top sub-window.
  o Duplicate Records: In some circumstances, duplicate references to
    the same cookies file are created in the cookies index file
    (index.dat)
    By default, IECookiesView displays only the latest reference of each
    cookies file, and hide all other duplicate references. You can view
    the duplicate references by selecting the "Duplicate Records" from
    the View menu. Be aware that duplicate records might contain wrong
    and obsolete information about the number of hits and
    accessed/created dates.
    The duplicate records are always marked with a special icon, and
    their status is always "Duplicate".
  o Obsolete Cookie Files: In some circumstances, there are some
    obsolete cookie files in the cookies folder that Internet Explorer
    doesn't use them anymore, as well as they are not listed in the
    cookies index file (index.dat). By default, IECookiesView doesn't
    display the obsolete cookie files. When you select the above option,
    All cookie files will be displayed, even if they are not listed in
    the cookies index file (index.dat)

    Notice:
    - When you select this option, the other view options ("Deleted
      cookies Files" and "Duplicate Records") are automatically disabled.
      i.e.: IECookiesView cannot display the obsolete cookies, together
      with duplicate records or with deleted cookies Files.
    - Some details of the obsolete cookie files are not shown as in
      regular cookie files, because the information is usually extracted
      from the cookies index file.
      Also, the Web site name of obsolete cookie files is usually
      truncated or corrupted.
    - This option might slow the cookies loading process,
      especially in Windows 95/98.


  o Mark Modified Cookies: If this option is selected, IECookiesView
    marks in green all the cookies files that has been modified or
    created since the last run of IECookiesView. You can clear these
    marks by using the 'Reset All Marks' option.
  o Mark Accessed Cookies: If this option is selected, IECookiesView
    marks in yellow all the cookies files that has been accessed since
    the last run of IECookiesView. You can clear these marks by using the
    'Reset All Marks' option.
  o Reset All Marks: Reset all current marks of both last modified
    cookies and last accessed cookies. If cookies are modified or
    accessed while the IECookiesView is open, the cookies will be marked
    accordingly with yellow or green color.
  o Refresh Now: Refresh the cookies list immediately.
  o Sort By Selection: Temporarily moves all selected cookies files
    to the top of the list. This option is useful if you want to view all
    the selected cookies files in one chunk.
  o Choose Columns: You can use this option for adding, removing, and
    changing the order of the columns in the top sub-window.
  o Cookie Properties: Shows the properties window of the current
    highlighted cookie in the bottom sub-window.

* Options
  o Auto Refresh: If this menu item is checked, the top sub-window
    will be automatically refreshed when a change in the cookies folder
    is detected. If a Web site sends you a new cookie while this menu
    item is checked, it'll be updated in the IECookiesView window after a
    few seconds. In order to easily view the latest changes in cookies,
    click the header of "Accessed Date" column, and the latest changes
    will be shown in the bottom of the cookie files list.
  o Beep On Change: If this menu item is checked, a beep is sounded
    each time that there is a change in your cookies. (Only when in 'Auto
    Refresh' mode)
  o Automatically Save Selections: If this menu item is checked, your
    cookies selections are automatically saved, and loaded each time that
    you run IECokiesView. The selections file is saved as 'cookies.ivs'
    under you cookies folder.
  o Always On Top: If this menu item is checked, the main window is
    always on top of all other windows.
  o Check Index File Header: If this option is checked, IECookiesView
    Displays an error message if the header of the cookies index file is
    corrupted. This 'corrupted file' problem might occur if you use a
    'system cleaning' tool that delete the header of the cookies index
    file.


Some menu commands can also be activated by using the toolbar, or by
pressing the right combination of accelerator keys. For example: you can
press the F5 key in order to refresh the top sub-window.
You can also use the pop-up menu, by right-clicking on the top sub-window.



Adding a cookies button into the toolbar of Internet Explorer
=============================================================

IECookiesView allows you to add a cookies button into the Internet
Explorer toolbar. When you click the cookies button, the IECookiesView
utility will be shown on the screen. You can add and remove the cookies
button in the Internet Explorer toolbar, by using the "Installation
Options" in the File menu. In order to add the cookies button, check the
following option in the Installation Options window: "Show a cookies
button in the Internet Explorer toolbar"

Limitations:

* When you add or remove the cookies button, the change will be shown
  only in the next time that you'll open a new window of Internet
  Explorer. You won't see the change in the current opened Internet
  Explorer windows.
* The cookies button is added only for the current logged-on user.
* This option is available only for Internet Explorer 5.0 and above.




The cookie properties window
============================

When you want to focus on a specific cookie, you can double-click the
desired cookie in the bottom sub-window and enter into the "Cookie
Properties" window.
The "Cookie Properties" windows displays all information about the
cookie, and 2 additional special fields:

* IP Address: Some web sites stores your IP address as a part of the
  cookie value. For example: If the value is
  50.60.70.80.738234783.472348237, the IP address is 50.60.70.80
  If IECookiesView recognizes the IP address in the cookie value, it'll
  be shown in IP address field. Otherwise, this field will be remained
  empty.
* Sub-Values: Some cookies stores more than one key-value pair in the
  same cookie. The multiple key-value pairs are usually stored in the
  following syntax: Key1=Value1&Key2=Value2&Key3=Value3...
  When this syntax is recognized by IECookiesView, the key-value pairs
  will be shown in the Sub-Values table.




Editing the content of a cookie
===============================

Starting from version 1.3, IECookies allows you to modify the content of
a single cookie. You can change the key/value pair, the domain, the
secure flag, and the expire/modified dates.
In order make a change in a cookie, follow the instructions below:
1. Close All windows of Internet Explorer.
2. In IECookiesView, press the F5 key to refresh the list of cookies
   files. This action will insure that you have the latest snapshot of
   cookies from the cookies index file (index.dat).
3. In the top sub-window, highlight the cookies file that you want to
   modify.
4. In the bottom sub-window, highlight the cookie that you want to
   modify.
5. Select the "Edit The Cookie's Content" item from the Edit menu or
   from the pop-up menu of the bottom sub-window.
6. In the editing dialog, change the values according to your needs,
   and press "Modify Cookie" button.
7. You'll be asked if you want to modify the cookie. Choose 'Yes', and
   your changes will be saved to the cookies file.
8. You can continue to modify other cookies as much as you need, but
   don't use the Internet Explorer browser until you finish the cookies
   modifications.




Blocking/Allowing of cookies in IE6
===================================

Starting from version 6.0, Internet Explorer give you more control over
cookies, and allows you to block the cookies of specific Web sites, or
even block all web sites from sending cookies, except a few specific Web
sites.
The IECookiesView utility allows you to block and enable the cookies of
specific Web sites by using the cookies blocking mechanism of Internet
Explorer. All the cookies blocking options are available under the
"Cookies Blocking Options" in the Edit menu. These options are enabled
only if version 6.0 of Internet Explorer is installed on you computer.
The following options are available in the "Cookies Blocking Options"
sub-menu:

* Block Selected Cookies: Block the Web sites that created the selected
  cookies files. The cookies of these Web sites will not be accessible
  anymore, and additional cookies of these Web sites will not be accepted
  by Internet Explorer.
* Allow Selected Cookies: Allow the Web sites that created the selected
  cookies files to use and create cookies. This option is useful if you
  want to block the cookies from all Web sites (By using the advanced
  privacy settings of IE), except a few cookies that you have to keep.
* Remove Blocking/Allowing: Remove the Web sites that created the
  selected cookies files from the Blocking/Allowing list of Internet
  Explorer.
* Internet Privacy Options: Display and edit the privacy settings of
  Internet Explorer.



Selecting cookies of specific domains or Web sites
==================================================

If you want to handle together all cookies created by specific Web sites
or domains, you can use the "Select By Domain or Web Site" option from
the Edit menu.


You can select multiple domains at once, as shown in the above
screenshot. After you press the "Ok" button, all cookies of the desired
domains/sites are automatically selected. If you want to see all the
selected sites in one chunk, check the "Sort by selection" check-box.



Saving and loading selections of cookies
========================================

IECookiesView allows you to save the list of current selected cookies
into a file, and then load the cookies selections again when you need it.
In order to save the list of current selected cookies, use the "Save
Current Selections" in the File menu. In order to load back the cookies
selections, use the "Load Selections File" in the File menu.
Starting from version 1.60, IECookiesView automatically saves you last
cookies selection, and loads it each time that you run IECookiesView. The
selections file is saved as 'cookies.ivs' under your cookies folder. If
you don't want that your cookies selections will be saved automatically,
you can simply uncheck the 'Automatically Save Selections' under the View
menu.



Marked cookies
==============

Each time you run IECookiesView, the cookies that has been modified and
accessed since the last run, are marked in yellow and green colors. The
latest accessed cookies are marked with yellow color, and the latest
modified/created cookies are marked with green color. You can clear all
current marks by selecting the "Reset All Marks" item from the View menu.
After you reset the marks, If cookies are modified or accessed again,
they will be marked accordingly. If you want to totally stop the cookies
marking, uncheck the "Mark Modified Cookies" and the "Mark Accessed
Cookies" items in the View Menu.



Deleting and destroying cookies
===============================

IECookiesView provides 2 methods to delete your cookies:
1. Delete Cookies Files: When you delete a cookie with this method,
   the cookie file is deleted, but a dead reference to this cookie is
   remained in the cookies index file. (index.dat)
2. Destroy Cookies Files: When you destroy a cookie:
   * The cookie file is filled with null characters, in order to
     prevent the restoring of the file in the future.
   * The cookie file is deleted.
   * The reference to the deleted cookie file in the cookies index
     file is filled with null characters.


In most cases, you should use the first method to the delete your
cookies. However, if you want to completely remove all traces of your
cookies, you should carefully use the second method (destroy cookies).
Before using the "destroy" option, you must close all windows of Internet
Explorer, and then refresh the cookies list (F5) in order to get the
latest snapshot of the cookies in your system.




Translating IECookiesView to the languages
==========================================

In order to translate IECookiesView to other language, follow the
instructions below:
1. Run IECookiesView with /savelangfile parameter:
   iecv.exe /savelangfile
   A file named iecv_lng.ini will be created in the folder of
   IECookiesView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run IECookiesView, and all
   translated strings will be loaded from the language file.
   If you want to run IECookiesView without the translation, simply
   rename the language file, or move it to another folder.


Command-Line Options
====================




/mi
If you run the IECookiesView utility while one instance of the utility is
already running, the current instance of the utility will be shown,
instead of creating a new instance of IECookiesView.
If you want to run more than one instance of IECookiesView at the same
time, run the IECookiesView utility with "/mi" command-line parameter:
iecv.exe /mi

/dir folder
Starts IECookiesView utility with another cookies folder, instead of the
default cookies folder. If the folder name contains one or more space
characters, it must be enclosed in double quotes.
For example:
iecv.exe /dir "C:\Documents and Settings\Administrator\Cookies"



/nsl
Starts IECookiesView without loading the settings from the previous time.



/inst
Add shortcuts to IECookiesView in the desktop and in the start menu and
add cookies icon into the toolbar of Internet Explorer.



/uninst
Remove the shortcuts and the toolbar icon created by the '/inst'
command-line option or by "Installation Options" window.



/user <User Name>
Starts IECookiesView with the cookies folder of another user.
For example:
/user admin1



Feedback
========

If you have any problem, suggestion, comment, or you found a bug in my
utility, you can send a message to nirsofer@yahoo.com



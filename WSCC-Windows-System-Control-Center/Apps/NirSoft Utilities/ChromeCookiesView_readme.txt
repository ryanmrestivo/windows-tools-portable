


ChromeCookiesView v1.85
Copyright (c) 2011 - 2025 Nir Sofer
Web site: https://www.nirsoft.net



Description
===========

ChromeCookiesView is an alternative to the standard internal cookies
viewer of Google Chrome Web browser. it displays the list of all cookies
stored by Google Chrome Web browser, and allows you to easily delete
unwanted cookies. It also allows you export the cookies into
text/csv/html/xml file.
For every cookie, the following information is displayed: Host Name,
Path, Name, Value, Secure (Yes/No), HTTP Only Cookie (Yes/No), Last
Accessed Time, Creation Time, Expiration Time.



System Requirements
===================


* This utility works on any version of Windows, starting from Windows
  XP and up to Windows 11, and with any version of Google Chrome.



Versions History
================


* Version 1.85:
  o Updated the external drive feature to decrypt the version 3 of
    Chrome App-Bound Encryption. There is a new field you have to fill:
    CNG System Keys Folder (For example:
    K:\ProgramData\Microsoft\Crypto\SystemKeys ).

* Version 1.84:
  o Added support for decrypting cookies encrypted with app-bound
    encryption on new versions of Chrome (Version 3 of Chrome App-Bound
    Encryption)
  o Be aware: The new app-bound encryption (version 3) uses the Next
    Generation Cryptography API (CNG) to encrypt and decrypt the
    encryption key. Currently, the external drive feature cannot decrypt
    the CNG key and thus it fails to recover the cookies if you have the
    version 3 of Chrome app-bound encryption.

* Version 1.83:
  o Updated to decrypt the cookies properly when the app-bound
    encryption feature is disabled (ApplicationBoundEncryptionEnabled
    Registry value set to 0).

* Version 1.82:
  o Fixed problem from version 1.81: On some systems, the following
    error was displayed when trying to run the .exe file: "This
    application failed to start because side-by-side configuration is
    incorrect".

* Version 1.81:
  o Updated to decrypt the new app-bound encryption key (Chrome
    version 134).

* Version 1.80:
  o Added support for decrypting cookies encrypted with app-bound
    encryption on new versions of Chrome. This feature only works when
    you run ChromeCookiesView as Administrator.
  o Added 'System Protect Folder' and 'Registry Hives Folder' fields
    to the external drive feature. You must fill these fields if the
    cookies are encrypted with the new app-bound encryption.
  o Added 'Encryption Type' column. (for app-bound encryption, this
    column displays 'v20', for previous encryption method, this column
    displays 'v10' )
  o Added 'Run As Administrator' option (Ctrl+F11) under the help
    menu.
  o Added /RunAsAdmin command-line option for running
    ChromeCookiesView as administrator.

* Version 1.76:
  o Added 'Sort By' toolbar button.

* Version 1.75:
  o When the cookies file is locked by Chrome Web browser,
    ChromeCookiesView now displays an error message.

* Version 1.74:
  o Fixed a problem with decrypting cookies from external drive on
    Windows 11 22H2.

* Version 1.73:
  o Updated to keep the scroll position after you delete cookies.
  o Added 'Brave Cookies File' button to the 'Advanced Options'
    window.

* Version 1.72:
  o If you try to delete cookies while the cookies file is locked by
    the Web browser, ChromeCookiesView now displays the appropriate
    message.

* Version 1.71:
  o Added 'Show Milliseconds In Time' option.

* Version 1.70:
  o ChromeCookiesView now automatically detects the cookies file of
    the last used profile, when there are multiple profiles.

* Version 1.69:
  o Fixed bug in the 'Edge Cookies File' button.

* Version 1.68:
  o Updated to work properly with the new cookies file location
    (Under the Network subfolder).
  o Fixed the external drive feature to work properly if you sign in
    with Microsoft account.
  o Be aware that in order to decrypt the cookies created while you
    signed in with Microsoft account, you have to provide the random
    DPAPI password generated for your Microsoft account instead of the
    actual login password. You can find this DPAPI password with the
    MadPassExt tool.

* Version 1.67:
  o Added 'Copy Clicked Cell' option to the right-click context menu,
    which copies to the clipboard the text of cell that you right-clicked
    with the mouse.

* Version 1.66:
  o Added option to change the sorting column from the menu (View ->
    Sort By). Like the column header click sorting, if you click again
    the same sorting menu item, it'll switch between ascending and
    descending order. Also, if you hold down the shift key while choosing
    the sort menu item, you'll get a secondary sorting.

* Version 1.65:
  o Added 'Decode Escape Sequence' option (turned on by default). You
    can turn off this option if you want to get the original name/value
    without escape sequence decoding.

* Version 1.61:
  o Fixed ChromeCookiesView to decrypt the new cookies encryption on
    Opera Web browser (The 'Local State' file is stored inside the
    profile instead of the parent folder)

* Version 1.60:
  o Added support for decrypting the encrypted cookie values of
    Chrome/Chromium version 80 or later (They changed the encryption
    algorithm).
  o Be aware that the 'Local State' file ( located inside the 'User
    Data' folder) contains the encryption key needed to decrypt the
    cookies of Chromium 80.
  o In most cases, ChromeCookiesView will find your 'Local State'
    file automatically, but if it fails to find this file from some
    reason, you can manually type the 'Local State' filename in the
    'Advanced Options' window.

* Version 1.58:
  o Added 'Edge Cookies File' button to the 'Advanced Options'
    window, which automatically fills the cookies file of the new
    Chromium-Based Edge Web browser.

* Version 1.57:
  o The decryption process of external drive cookies is now much
    faster.

* Version 1.56:
  o Added 'Add Remark Line To cookies.txt' option. When it's turned
    on, '# Netscape HTTP Cookie File' header line is added to cookies.txt
    file format.
  o When pressing F5 (Refresh) the refresh process is smoother,
    keeping the selected item and scroll position.

* Version 1.55:
  o Added /DeleteCookiesWildcard which allows you to delete cookies
    from command-line that match the specified wildcard, for example:
    /DeleteCookiesWildcard "*.Google.com"

* Version 1.51:
  o Added 'Put Icon On Tray' option.

* Version 1.50:
  o Added /DeleteCookies command-line option to delete cookies from
    command-line.

* Version 1.48:
  o Added 'Add Header Line To CSV/Tab-Delimited File' option (Turned
    on by default).
  o Fixed bug: ChromeCookiesView failed to remember the last
    size/position of the main window if it was not located in the primary
    monitor.

* Version 1.47:
  o Fixed to read the cookies file in the latest versions of Chrome.

* Version 1.46:
  o Added 'Auto Size Columns+Headers' option.

* Version 1.45:
  o Added 'Decrypt cookies from external drive' option (In 'Advanced
    Options' window). In order to decrypt the cookies from external
    drive, you have to specify the Protect folder of Windows (e.g:
    F:\Users\user1\AppData\Roaming\Microsoft\Protect ) and the login
    password of the user.

* Version 1.40:
  o Added option to specify the cookies file from command-line, for
    example:
    ChromeCookiesView.exe /CookiesFile "c:\temp\cookies"
  o Added Auto-Complete support for the cookies file text-box.

* Version 1.35:
  o Added 'Quick Filter' feature (View -> Use Quick Filter or
    Ctrl+Q). When it's turned on, you can type a string in the text-box
    added under the toolbar and ChromeCookiesView will instantly filter
    the cookies, showing only lines that contain the string you typed.

* Version 1.30:
  o Added option to save in cookies.txt format (In File -> Save
    Selected Items option)
  o Added /scookiestxt command-line option to save in cookies.txt
    format.

* Version 1.25:
  o Added new buttons to easily choose the cookies file of
    Chrome-base Web browsers: 'Vivaldi Cookies File', 'Yandex Cookies
    File' (Advanced Options window).

* Version 1.20:
  o Fixed ChromeCookiesView to display the value of encrypted cookies.

* Version 1.15:
  o Fixed to work properly with the latest version of Chrome.

* Version 1.12:
  o Added 'Opera Cookies File' button to the 'Advanced Options'
    window, which allows you to easily use this tool to view the cookies
    of Opera Web browser. (Opera is now based on the code of Chrome Web
    browser...)
  o Fixed the 'Default Cookies File' button in the 'Advanced Options'
    window.

* Version 1.11:
  o Fixed bug: ChromeCookiesView deleted cookies that are not
    selected if they had the same creation time.

* Version 1.10:
  o Added secondary sorting support: You can now get a secondary
    sorting, by holding down the shift key while clicking the column
    header. Be aware that you only have to hold down the shift key when
    clicking the second/third/fourth column. To sort the first column you
    should not hold down the Shift key.
  o Fixed to display date/time values according to daylight saving
    time settings.
  o Fixed a crash problem occurred in some systems.

* Version 1.05 - Added option to copy the selected cookies in Netscape
  cookies.txt format (Ctrl+N)
* Version 1.02 - Fixed a crash problem that occurred when loading the
  cookies.
* Version 1.01 - Fixed bug: The date/time columns displayed incorrect
  values.
* Version 1.00 - First release.



Using ChromeCookiesView
=======================

ChromeCookiesView doesn't require any installation process or additional
DLL files. In order to start using it, simply run the executable file -
ChromeCookiesView.exe
The main window of ChromeCookiesView displays the list of all cookies
stored in your Google Chrome Web browser. You can select one or more
chookie entries, and then use the 'Delete Selected Cookies' (Ctrl+Del) to
delete them.
If you want to view the cookies stored in another cookies file, go to
'Advanced Options' window (F9) and choose the desired cookies file.



Command-Line Options
====================



/RunAsAdmin
Runs ChromeCookiesView as administrator.

/DeleteCookies <Host> {Cookie Name}
Deletes cookies from command-line. If you specify only the host name, all
cookies of this host name will be deleted. If you also specify the cookie
name, only this specific cookie will be deleted.

Examples:
ChromeCookiesView.exe /DeleteCookies ".amazon.com"
ChromeCookiesView.exe /DeleteCookies ".amazon.com" "session-token"

/DeleteCookiesWildcard <Host Wildcard> {Cookie Name Wildcard}
Similar to /DeleteCookies, but it also allows you to specify the host
name and cookie name as wildcard. For example, if you specify
"*.google.com", all google.com cookies will be deleted (including
www.google.com, accounts.google.com, and so on)

Examples:
ChromeCookiesView.exe /DeleteCookiesWildcard "*.google.com"
ChromeCookiesView.exe /DeleteCookiesWildcard "*.amazon.*" "session*"

/CookiesFile <Filename>
Specifies the cookies file to load from command-line, for example:
ChromeCookiesView.exe /CookiesFile "c:\temp\Chrome\cookies"

/stext <Filename>
Save the cookies list into a regular text file.

/stab <Filename>
Save the cookies list into a tab-delimited text file.

/scomma <Filename>
Save the cookies list into a comma-delimited text file (csv).

/stabular <Filename>
Save the cookies list into a tabular text file.

/shtml <Filename>
Save the cookies list into HTML file (Horizontal).

/sverhtml <Filename>
Save the cookies list into HTML file (Vertical).

/sxml <Filename>
Save the cookies list into XML file.

/scookiestxt <Filename>
Save the cookies list in cookies.txt format.

/sort <column>
This command-line option can be used with other save options for sorting
by the desired column. If you don't specify this option, the list is
sorted according to the last sort that you made from the user interface.
The <column> parameter can specify the column index (0 for the first
column, 1 for the second column, and so on) or the name of the column,
like "Host Name" and "Path". You can specify the '~' prefix character
(e.g: "~Secure") if you want to sort in descending order. You can put
multiple /sort in the command-line if you want to sort by multiple
columns.

Examples:
ChromeCookiesView.exe /shtml "f:\temp\cookies.html" /sort 2 /sort ~1
ChromeCookiesView.exe /shtml "f:\temp\cookies.html" /sort "Host Name"
/sort "Path"

/nosort
When you specify this command-line option, the list will be saved without
any sorting.



Translating ChromeCookiesView to other languages
================================================

In order to translate ChromeCookiesView to other language, follow the
instructions below:
1. Run ChromeCookiesView with /savelangfile parameter:
   ChromeCookiesView.exe /savelangfile
   A file named ChromeCookiesView_lng.ini will be created in the folder
   of ChromeCookiesView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run ChromeCookiesView, and all
   translated strings will be loaded from the language file.
   If you want to run ChromeCookiesView without the translation, simply
   rename the language file, or move it to another folder.



License
=======

This utility is released as freeware. You are allowed to freely use it at
your home or in your company. However, you are not allowed to make profit
from this software or to charge your customers for recovering their
passwords with this software, unless you got a permission from the
software author.
You are also allowed to freely distribute this utility via floppy disk,
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

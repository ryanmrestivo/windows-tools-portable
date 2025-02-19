


WifiDiagnosticsView v1.07
Copyright (c) 2022 - 2024 Nir Sofer
Web site: https://www.nirsoft.net/utils/wifi_diagnostics_view.html



Description
===========

WifiDiagnosticsView is a Wifi diagnostics tool for Windows
11/10/8/7/Vista that monitors the wireless network service of Windows
operating system and displays any event that occurs while
WifiDiagnosticsView is running, including wireless networks scan, connect
to access point, disconnect from access point, failed connection attempt,
and so on.. When a failure is detected, the error code and error
description is displayed.



System Requirements
===================


* This tool works on any version of Windows, starting from Windows
  Vista and up to Windows 11. Both 32-bit and 64-bit systems are
  supported.
* This tool is just a small standalone .exe file that you can run on
  any system without installing anything.



Version History
===============


* Version 1.07:
  o Added 'Always On Top' option.

* Version 1.06:
  o The current number of items in the main window is now displayed
    in the tray icon tooltip.

* Version 1.05:
  o Added 'Black Background' option (Under the View menu). When it's
    turned on, the main table is displayed in black background and white
    text, instead of default system colors.
  o Added 'Full Screen' mode (View -> Full Screen or F11 key).

* Version 1.03:
  o Added 'Automatically Scroll Down On New Items' option.

* Version 1.02:
  o Added 'Quick Filter' feature (View -> Use Quick Filter or
    Ctrl+Q). When it's turned on, you can type a string in the text-box
    added under the toolbar and WifiDiagnosticsView will instantly filter
    the wifi diagnostics items, showing only lines that contain the
    string you typed.

* Version 1.01:
  o Fixed to display the time properly in AM/PM format.
  o Fixed the default columns size in high DPI mode.
  o Fixed typo in Description column.

* Version 1.00 - First release.



Start Using WifiDiagnosticsView
===============================

WifiDiagnosticsView doesn't require any installation process or
additional DLL files. In order to start using it, simply run the
executable file - WifiDiagnosticsView.exe
After running WifiDiagnosticsView, it starts to monitor the wireless
network service on your system, and every event is added to the main
window of WifiDiagnosticsView.
Be aware that the following columns are filled only when they are
relevant to the event: Profile Name, SSID, Failure Code, Failure Text,
BSSID, Connection Mode.



Put Icon On Tray
================

If you want to run WifiDiagnosticsView in the background without
displaying any window, simply turn on the 'Put Icon On Tray' option
(Under the Options menu). After you enable this option, you can close the
main window of WifiDiagnosticsView, and it'll continue to monitor your
Wifi connections in the background. When you want to open the window of
WifiDiagnosticsView again, simply double-click the icon of
WifiDiagnosticsView in the system tray.



Translating WifiDiagnosticsView to other languages
==================================================

In order to translate WifiDiagnosticsView to other language, follow the
instructions below:
1. Run WifiDiagnosticsView with /savelangfile parameter:
   WifiDiagnosticsView.exe /savelangfile
   A file named WifiDiagnosticsView_lng.ini will be created in the folder
   of WifiDiagnosticsView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run WifiDiagnosticsView, and all
   translated strings will be loaded from the language file.
   If you want to run WifiDiagnosticsView without the translation, simply
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

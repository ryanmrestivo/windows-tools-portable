


AppAudioConfig v1.16
Copyright (c) 2018 - 2021 Nir Sofer
Web site: https://www.nirsoft.net



Description
===========

Starting from Windows Vista, you are allowed to change the sound volume
of every application separately, and after you exit from the application,
the last settings are saved in the Registry under
HKEY_CURRENT_USER\Software\Microsoft\Internet
Explorer\LowRegistry\Audio\PolicyConfig\PropertyStore so in the next time
you run the application, your last settings are used.
This tool displays your current audio settings of every application on
your system, and allows you to easily change the setting of multiple
applications at once. You can change the mute/unmute status, the sound
volume level, and the right/left audio balance of the application.



System Requirements
===================

This tool works on any version of Windows, starting from Windows Vista,
and up to Windows 10. Both 32-bit and 64-bit systems are supported.



Versions History
================


* Version 1.16:
  o Added "Don't Load Icons" option. You should turn on this option
    if AppAudioConfig crashes on your system while loading the
    applications audio settings. You can also turn on this option from
    command line:
    AppAudioConfig.exe /DontLoadIcons 1
  o Added 'Copy Clicked Cell' option to the right-click context menu,
    which copies to the clipboard the text of cell that you right-clicked
    with the mouse.
  o Fixed some high DPI mode issues (Toolbar, Properties Window).

* Version 1.15:
  o Added /Mute , /Unmute , /SetVolume command-line option to set the
    mute/unmute status and volume level for the next time you run the
    application.
  o Added 'Device ID' column.

* Version 1.10:
  o Added 'Add Header Line To CSV/Tab-Delimited File' option (Turned
    on by default).
  o Added /cfg command-line option to start AppAudioConfig with the
    specified config file.

* Version 1.05:
  o Added 'Delete Selected Items' action.

* Version 1.01:
  o Added 'Open In RegEdit' option.

* Version 1.00 - First release.



Start Using AppAudioConfig
==========================

This utility doesn't require any installation process or additional DLL
files. In order to start using it, simply run the executable file -
AppAudioConfig.exe
After running it, the main window displays the current audio settings of
every application on your system. You can easily select one or more items
and then use the 'Mute Selected Items' (F7), 'Unmute Selected Items'
(F8), and 'Set Application Volume' (F2) menu items to change the settings
of selected applications.

Be aware:
* If you have multiple sound devices, you might have a separated entry
  for every device.
* You have the change the settings while the application is not
  running. Otherwise, the active settings of the application will
  overwrite the Registry changes made by AppAudioConfig.



Command-Line Options
====================



/Mute <Application Name> <Device Name/ID>
Configure the specified application to be in mute status in the next time
you run it.
The <Application Name> parameter specifies the .exe file of the
application, like chrome.exe , firefox.exe and so on...
The <Device Name/ID> parameter specifies the name or ID of the device.
You can specify the value displayed under the 'Device Name' column,
'Device Caption' column or 'Device ID' column. If the device is not
specified, all devices will set to mute status.

Examples:
AppAudioConfig.exe /Mute "Firefox.exe" "Speakers"
AppAudioConfig.exe /Mute "chrome.exe" "Realtek High Definition Audio"
AppAudioConfig.exe /Mute "vlc.exe.exe"

/Unmute <Application Name> <Device Name/ID>
Configure the specified application to be in unmute status in the next
time you run it.
The <Application Name> parameter specifies the .exe file of the
application, like chrome.exe , firefox.exe and so on...
The <Device Name/ID> parameter specifies the name or ID of the device.
You can specify the value displayed under the 'Device Name' column,
'Device Caption' column or 'Device ID' column. If the device is not
specified, all devices will set to unmute status.

Examples:
AppAudioConfig.exe /Unmute "chrome.exe" "Speakers"
AppAudioConfig.exe /Unmute "vlc.exe"
"{2}.\\?\usb#vid_1b3f&pid_2008&mi_00#7&35c6600d&0&0000#{6994ad04-93ef-11d0-
a3cc-00a0c9223196}\global"
AppAudioConfig.exe /Unmute "firefox.exe.exe"

/SetVolume <Volume> <Application Name> <Device Name/ID>
Configure the volume level in percent for the next time you run the
application.
<Volume> is the volume level to set (0 - 100)
The <Application Name> parameter specifies the .exe file of the
application, like chrome.exe , firefox.exe and so on...
The <Device Name/ID> parameter specifies the name or ID of the device.
You can specify the value displayed under the 'Device Name' column,
'Device Caption' column or 'Device ID' column. If the device is not
specified, all devices will set to the specified volume level.

Examples:
AppAudioConfig.exe /SetVolume 80 "chrome.exe" "Speakers"
AppAudioConfig.exe /SetVolume 50 "firefox.exe.exe"

/cfg <Filename>
Start AppAudioConfig with the specified configuration file. For example:
AppAudioConfig.exe /cfg "c:\config\aac.cfg"
AppAudioConfig.exe /cfg "%AppData%\AppAudioConfig.cfg"

/stext <Filename>
Save the applications audio config into a simple text file.

/stab <Filename>
Save the applications audio config into a tab-delimited text file.

/scomma <Filename>
Save the applications audio config into a comma-delimited text file (csv).

/shtml <Filename>
Save the applications audio config into HTML file (Horizontal).

/sverhtml <Filename>
Save the applications audio config into HTML file (Vertical).

/sxml <Filename>
Save the applications audio config into XML file.



Translating AppAudioConfig to other languages
=============================================

In order to translate AppAudioConfig to other language, follow the
instructions below:
1. Run AppAudioConfig with /savelangfile parameter:
   AppAudioConfig.exe /savelangfile
   A file named AppAudioConfig_lng.ini will be created in the folder of
   AppAudioConfig utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run AppAudioConfig, and all
   translated strings will be loaded from the language file.
   If you want to run AppAudioConfig without the translation, simply
   rename the language file, or move it to another folder.



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

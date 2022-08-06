


Volumouse v2.03
Copyright (c) 2004 - 2014 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

Volumouse provides you a quick and easy way to adjust the sound volume on
your system - simply by rolling the wheel of your wheel mouse.
It allows you to define a set of rules for determining when the wheel
will be used for changing the sound volume. For example: You can
configure Volumouse to use your mouse wheel for volume control when the
Alt key is hold down, when the left mouse button is down, when the mouse
cursor is over the taskbar, and so on...
When the conditions that you define are not satisfied, your mouse wheel
will be used for the regular scrolling tasks, exactly as before.



System Requirements
===================


* Windows operating system: Windows 98, Windows ME, Windows NT, Windows
  2000, Windows XP, Windows Server 2003, Windows 7/Vista/2008/8. (Windows
  95 is not supported)
* Wheel mouse
* Sound card.



Known Issues
============


* On Windows Vista/7/2008/8 - If UAC is turned on, Volumouse cannot
  work with applications that you run as Administrator. If you want that
  Volumouse will be able to capture mouse events from application that
  you run as Administrator, you should also run Volumouse as
  Administrator.
* On 64-bit systems, you must use the 64-bit version of Volumouse.



Versions History
================


* Version 2.03:
  o 'Mouse cursor is over the taskbar' now also works with the
    taskbar on secondary monitor (Windows 8).

* Version 2.02:
  o When trying to use Volumouse 32-bit on 64-bit systems, Volumouse
    now displays a warning.

* Version 2.01:
  o Fixed a problem with the percent label of on-screen indicator in
    some systems.

* Version 2.00:
  o Volumouse now allows you to configure up to 12 rules, in 2 pages.
  o Volumouse x64 now supports both x64 applications and 32-bit
    applications.
  o On Windows Vista/7/2008 you can now change the volume of specific
    application.
  o On Screen Display indicator now allows you to add your own text
    that describes the rule.
  o Added 'Send Hot Keys' component, which allows you to send the
    specified keys combination to the active application on every wheel
    move. (Be careful with this feature: Don't use it with Ctrl/Shift/Alt
    keys on the rule's condition)
  o Added "Don't restrict the indicator position to screen size"
    option for TrackBar indicators. This feature may be useful for users
    with multiple monitors.

* Version 1.72:
  o Fixed issue for multiple monitors - Volumouse now open the
    options windows in the primary screen.

* Version 1.71:
  o Fixed bug in Windows 7/Vista: When choosing 'Default Playback' or
    'Default Recording' option, the channels combo-box was disabled, so
    you could not use the mute/unmute option on default
    Playback/Recording.

* Version 1.70:
  o Added 2 new conditions for working with almost any application
    window: 'The specified application window is focused' and 'Mouse
    cursor is over the specified window'. You can specify the desired
    window according to window title and/or window class, in the Advanced
    Rule Options.
  o Changed the installer - Now the Volumouse setup .exe is created
    with NSIS instead of my old ZipInstaller.
  o Fixed bug: In new Volumouse installations, the OSD indicator was
    transparent, instead of green.

* Version 1.67:
  o Fixed bug: Windows key settings were not saved when you exit from
    Volumouse.

* Version 1.66:
  o Added support for Windows key (in separated check-box) when using
    hot keys instead of wheel mouse.

* Version 1.65:
  o Added support for setting the color of On Screen Display.
  o Added support for displaying the percent label in 'On Screen
    Display'.
  o Action add/change: 'The cursor is on screen corners' action now
    really works only when the cursor is on screen corners. There is a
    new action, 'The cursor is on screen edges' that works like the
    corners action in previous versions.

* Version 1.60:
  o Added new type of indicator: On Screen Display. (Only for Windows
    2000 or greater)
  o Added enable/disable options. When Volumouse is disabled,
    scrolling the wheel mouse or pressing the hot-key combination will
    make the regular task and won't be captured by volumouse.
  o On 64-but systems, you can now run 2 separated instances of
    Volumouse. one for using it with 32-bit applications, and the other
    for using it with 64-bit applications.

* Version 1.57:
  o Add new option: Increase steps value on high volume.

* Version 1.56:
  o New Rule Condition: When VLC Player is focused.

* Version 1.55:
  o Added /cfg command-line option to load the configuration of
    Volumouse from another file. (For example: volumouse.exe /cfg
    "c:\temp\vm.cfg")

* Version 1.54:
  o Fixed problems with multiple monitors.

* Version 1.53:
  o Fixed bug: Volumouse failed to change the volume when the
    component type is 'Default Playback' or 'Default Recording' (in Vista)

* Version 1.52:
  o Increased the width of drop-down lists.
  o Added negative values to steps combo-box.

* Version 1.51:
  o Added support for creating plugins.

* Version 1.50:
  o Volumouse now works under Windows Vista (both 32-bit and x64
    versions)
  o Under Vista, there is no default mixer device anymore, but you
    can select the default playback and recording device in the component
    combo-box.
  o Under Vista, You can select more 6 channels, in addition to the 2
    standard left and right channels.
  o Under Vista, changing the master volume doesn't affect the
    default left/right balance, as in the previous version of Windows.
  o All default settings are now saved into .cfg file instead of the
    Registry.
  o Added new options to "Use the wheel when" combo-box: Windows
    Media Center is focused, iTunes is focused, Mouse cursor is over the
    Vista Gadgets, GOM Player is focused, Alt+Shift are down, Alt+Ctrl
    are down, Ctrl+Shift are down, The cursor is on screen corners.
  o New option: Use hot-keys instead of the mouse wheel.
  o Added additional rule line (6 instead of 5 in previous
    versions...)

* Version 1.31:
  o New option in device combo-box - Use the default playback device
    in Control Panel.
  o When Windows Media Player is focused - Now also works in full
    screen mode.

* Version 1.30:
  o Fixed bug: When Word/Excel window is focused, the volume change
    is faster than other windows.
  o Ability to control the left/right balance.
  o Save/load all Volumouse configuration to file.

* Version 1.21:
  o New option: Run Volumouse application in high priority.

* Version 1.20:
  o Component names change: sound component names are now loaded from
    the operating system
  o New option: Display percent label on the indicator.
  o New option: Activate the rule only after specified number of
    wheel moves.
  o New option: indicator position fix - move the indicator position
    according to your preference.
  o New option: Use different mixer device in each rule.
  o Fixed bug: In previous version, Volumouse always used the first
    mixer device, even if you selected another one...
  o New rule condition: "no button/key is pressed" - Use this rule if
    you want to replace the normal behaviour of the wheel.
  o Windows XP Style: The indicator and other elements are now
    displayed according to your XP style.

* Version 1.10:
  o New option: Display on-screen indicator while changing the sound
    volume.
  o New option: Mute/unmute the sound volume.
  o New Rule Conditions: Mouse cursor is over a title bar, BSPlayer
    is focused.
  o Non-Sound Components: Now you can also use volumouse to make your
    windows transparent (On Windows 2000/XP) or to change the brightness
    of the entire screen (only if you have a video card that supports
    this feature).

* Version 1.00 - First release.



Upgrading Volumouse from previous versions
==========================================

If you have a previous version of Volumouse, you don't have to remove the
old version before installing the new one. You can simply overwrite the
previous version with the new version. However, You must do it according
to the following instructions:
1. Exit completely from Volumouse. (The pink button)
2. Wait one or two minutes, to allow the vlmshlp.dll file to be
   released by the operating system.
3. Install Volumouse, as you did with the previous version.
4. If you get any error message related to vlmshlp.dll, restart your
   computer, and then do all this process again.

Notice: When upgrading from verson 1.31 or earlier to this version,
you'll lose all your previous settings and we'll have to reconfigure
Volumouse again.



Installing/Removing Volumouse
=============================

There are 2 methods to install Volumouse on your system:
* Manual Installation: (For advanced users only !)
  In order to manually install Volumouse on your system, follow the
  instructions below:
  1. Create a new folder for Volumouse utility (Under your 'Program
     Files' folder, or anywhere else you like).
  2. Extract all files from the zip file (volumouse.zip for 32-bit
     or volumouse-x64.zip for x64) into the new folder that you created.
  3. Optionally, create a shortcut to volumouse.exe on your desktop
     or under your start-menu.
  4. Start using Volumouse, simply by running the executable -
     volumouse.exe

  In order to remove Volumouse from your system, follow the instructions
  below:
  1. To ensure that Volumouse is not running in your system, Select
     'Exit Completely' from the options dialog-box or from popup menu of
     the taskbar icon.
  2. Delete the folder that you created during the installation
     process. If you failed to delete the Volumouse helper dll
     (vlmshlp.dll), wait a little time (one or two minutes) to allow this
     file to be released by the operating system, and then try again.
  3. Optionally, delete Volumouse configuration from the Registry
     under HKEY_CURRENT_USER\Software\NirSoft\Volumouse


* Automatic Installation (With self-install executable)
  In order to install Volumouse with self-install executable, follow the
  instructions below:
  1. Download and run the Volumouse self-install executable.
  2. Select the desired installation settings, and click 'install'
     to start installing Volumouse.
  3. After installation is completed, run Volumouse from the your
     start-menu.

  In order to remove Volumouse that you previously installed with
  ZipInstaller:
  1. First, you must ensure that Volumouse is not running in your
     system. In order to do that, select 'Exit Completely' from the
     options dialog-box (the pink button) or from popup menu of the
     taskbar icon. Wait a little time to ensure that vlmshlp.dll is
     completely unloaded from the system, and then continue to the next
     step.
  2. Go to the Add/Remove Programs module, choose Volumouse entry,
     and select to remove it from your system.




Using Volumouse
===============

When you run Volumouse, the main options window is displayed, in order to
allow you to configure Volumouse according to your needs. You can always
return again to the 'options' window by clicking on the tray icon of
Volumouse.
Volumouse allows you to define up to 5 different rules for determining
when and how the wheel should be used to control the sound volume. When
you run Volumouse in the first time, it defines for you 2 default rules:
When the alt key is down and when the left mouse button is down. You can
accept the default settings by pressing OK button, or change the rules
list according to your preferences.



Wheel Mouse Rules
=================

Each rule contains 4 basic fields:
1. Use the wheel when: This field represents the condition of the
   rule. For example: if your select 'Shift key is down', this rule will
   be activated only while the shift key is hold down. You can also
   disable a rule by selecting 'Disabled' in this field.
2. Component: This field determines that sound component that you want
   to control with this rule. The default and the most useful component
   is the 'Master Volume' of your system.
3. Channels: The default and the most useful option in this field is
   'All Channels' - which means that both right and left channels are
   changed to the same values. If from some reason, you want to change
   only one channel separately - you can use the 'Left Channel' and
   'Right Channel' options. Starting from version 1.10, 'Mute / Unmute'
   option is also available. If you select this option, scrolling the
   wheel down will mute the sound, and scrolling the wheel up will unmute
   the sound.
4. Steps: The number of steps added to the sound volume for each move
   of the mouse wheel. If you increase this number, the volume will be
   changed faster when you scroll the wheel.
there are also more advanced options for each rule, you can configure
them by clicking the 'More...' button of the desired rule.



More Rule Options
=================


* Activate the rule only after... Allows you to activate the rule only
  after specified number of wheel moves.
* Left / Right Balance: Allows you to control the balance of left and
  right channels. For example: If you want that the volume of the left
  channel will always be 50% of the right channel volume, set the right
  value to 1.0 and the left value to 0.5



On-Screen Indicator
===================

Starting from version 1.10, Volumouse allows you display an indicator on
the screen when you use the wheel for adjusting the volume.
You can configure the on-screen indicator by using the following options
in the 'advanced rule options' dialog-box: (click the 'More...' button in
order to get this dialog-box)
* Type: The type of the on-screen indicator. You can select vertical
  trackbar, horizontal trackbar, or 'none' - if you don't want to display
  any indicator.
* Size: The size of indicator - in pixels.
* Delay: The number of milliseconds that the indicator will be
  displayed on the screen after you finish to adjust the volume. The
  default value is 500 milliseconds.
* Position: the horizontal and vertical position of the indicator. By
  default, the indicator is displayed in the position of the mouse cursor.
* Transparency: Allows you to display the indicator as transparent.
  Only works on Windows 2000/XP.



Non-Sound Components
====================

Volumouse was originally created for controlling the sound volume with
the mouse wheel. However, starting from version 1.10, I decided to add 2
additional components that are not really related to sound, but they
might be useful for some people:
1. Window Transparency: (Works only on Windows 2000/XP)
   Allows you make any window transparent !
   In order to use this feature, define a new rule with this component,
   go with mouse cursor to the window that you want to make transparent,
   hold down the right keys or buttons according the the condition that
   you chose, and then scroll down the wheel to make the window
   transparent !
2. Screen Brightness: Allows you to change the brightness of the
   entire screen.
   Important Notice: Changing the screen brightness is achieved by
   setting the gamma ramp values into the video card. Unfortunately, many
   video cards don't support this feature, so the 'Screen Brightness'
   component may not work in your system.



Using the mouse wheel when specific application is in focus
===========================================================

Starting from version 1.70 of Volumouse, there are 2 new conditions that
allows you the define the wheel behaviour for every application, as long
as the application has a unqiue window title and/or window class name.
You can use one of the following conditions: 'The specified application
window is focused' and 'Mouse cursor is over the specified window'. After
choosing these conditions, you can go to the Advanced Rule Options, and
type the window title, the window class name, or both.
For example, if you want that to change the wheel behaviour when working
with Windows Calculator, simply type 'Calculator' in the window title
field.
If you want to identify the application window according to its unique
class name, simply drag the target icon into the desired window, and
Volumouse will automatically set the right window class for you.



Creating plugins for Volumouse
==============================

If you're a C++ programmer, and you want to add new components to
Volumouse, and respond with your own code when the mouse wheel is
scrolled, you can do that by creating a new plugin for Volumouse. For
more information, click here



Other Options
=============


* Mixer Device: The sound device that you want to use in Volumouse.
* Display icon in the system tray: By default, the icon of Volumouse is
  displayed in the system tray (taskbar). When you click the icon with
  the left mouse button, the main options window is displayed. If from
  some reason you don't want this icon to appear in your taskbar, you can
  hide it by unchecking this option. When this option is unchecked, the
  only way to access the options windows - is by running the executable
  of Volumouse (volumouse.exe)
* Load Volumouse at startup: If this option is checked, Volumouse will
  be automatically loaded after you reboot your computer.
* Display this window when you start Volumouse: By default, the
  'Options' window is displayed each time that you run Volumouse. If you
  want to avoid this, uncheck this option
* Run Volumouse application in high priority: When the CPU usage is
  high, Volumouse may respond to mouse moves very slowly. To improve the
  performances of Volumouse under high CPU usage conditions, you can set
  the priority of Volumouse application to high, simply by checking this
  option.



Translating Volumouse to other languages
========================================

In order to translate Volumouse to other language, follow the
instructions below:
1. Run Volumouse with /savelangfile parameter:
   volumouse.exe /savelangfile
   A file named volumouse_lng.ini will be created in the folder of
   Volumouse utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run Volumouse, and all translated
   strings will be loaded from the language file.
   If you want to run Volumouse without the translation, simply rename
   the language file, or move it to another folder.



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




MyEventViewer v2.25
Copyright (c) 2008 - 2017 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

MyEventViewer is a simple alternative to the standard event viewer of
Windows. As opposed to Windows event viewer, MyEventViewer allows you to
watch multiple event logs in one list, as well as the event description
and data are displayed in the main window, instead of opening a new one.
Also, with MyEventViewer you can easily select multiple event items and
then save them to HTML/Text/XML file, or copy them to the clipboard
(Ctrl+C) and then paste them into Excel.



System Requirements
===================

This utility works on Windows 2000, Windows XP, Windows 2003 Server,
Windows Vista, Windows 7/2008, Windows 8, and Windows 10.



Articles About MyEventViewer
============================


* How to Create Your Own Windows Event Log Notification System



Versions History
================


* Version 2.25:
  o Added option to specify time range filter in local time
    ('Advanced Filter' window).
  o Fixed to save the time range settings to the .cfg file.

* Version 2.20:
  o Added 'Choose Data Source' option (F7), which allows you to view
    the events from a remote computer (In previous versions, you could
    only do it with /remote command-line option)

* Version 2.14:
  o Fixed bug: MyEventViewer failed to display a check sign for 'Show
    Advanced Filter Window On Start' option when it was turned on.

* Version 2.13:
  o Fixed MyEventViewer to display error message when it fails to
    load external file with /LoadFiles command-line option.
  o Fixed bug: MyEventViewer failed to remember the last
    size/position of the main window if it was not located in the primary
    monitor.

* Version 2.12:
  o Fixed bug: The combination of /EventLogNames and the save
    command-line options failed to work properly.

* Version 2.11:
  o Added secondary sorting support: You can now get a secondary
    sorting, by holding down the shift key while clicking the column
    header. Be aware that you only have to hold down the shift key when
    clicking the second/third/fourth column. To sort the first column you
    should not hold down the Shift key.

* Version 2.10:
  o Added option to hide events with specific users (In 'Advanced
    Filter' window)

* Version 2.07:
  o Fixed to display date/time properly according to daylight saving
    time settings.

* Version 2.06:
  o Added 'Copy Lower Pane Text' option (Ctrl+L), which always copies
    the text from the lower pane, even when the upper pane is in focus.

* Version 2.05:
  o Fixed the save command-line options to filter the events
    according to the current configuration.

* Version 2.02:
  o Added /cfg command-line option, which instructs MyEventViewer to
    use a config file in another location instead if the default config
    file, for example:
    MyEventViewer.exe /cfg "%AppData%\MyEventViewer.cfg"

* Version 2.01:
  o The lower pane now displays the event strings list if it fails to
    get the full message string from the event log dll.

* Version 2.00:
  o Added 'Event Description Display Mode' option - Full Text or
    Strings List. If 'Strings List' option is selected, the lower pane
    displays the strings list stored in the event record instead of the
    full description text containing these strings.

* Version 1.95:
  o Added option to display only the events with specific users (In
    'Advanced Filter' window)

* Version 1.90:
  o Added 'Auto Scroll On New Event' option.

* Version 1.88:
  o Fixed the flickering occurred while scrolling the events list.

* Version 1.87:
  o Added 'Mark Odd/Even Rows' option, under the View menu. When it's
    turned on, the odd and even rows are displayed in different color, to
    make it easier to read a single line.

* Version 1.86:
  o Sorting by event time: If the date/time of multiple events is
    identical, MyEventViewer now sorts the list by the log type, and then
    by the record number (In previous versions, the sorting of events
    with the same time was random)
  o Fixed issue: The properties and the 'Advanced Options' windows
    opened in the wrong monitor, on multi-monitors system.

* Version 1.85:
  o Added Stop menu item, which allows you to stop the loading
    process of the events log.

* Version 1.81:
  o Fixed the tab order of the 'Advanced Options' dialog-box.

* Version 1.80:
  o Added /SaveDirect command line option, for using with the other
    save command-line options (/scomma, /stab, /sxml, and so on...)
    When you use the SaveDirect mode, the event log lines are saved
    directly to the disk, without loading them into the memory first.
    This means that you can save a list with large amount of event log
    lines into your disk without any memory problem, as long as you have
    enough disk space to store the saved file. The drawback of this mode:
    You cannot sort the log lines according to the column you choose with
    /sort command-line option.

* Version 1.75:
  o Added /VisibleEventTypes command-line option, which allows you to
    specify the event types you wish to load.
  o Added /EventLogNames command-line option, which allows you to
    specify the event log names you wish to load.

* Version 1.70:
  o Added 'Start As Hidden' option. When this option and 'Put Icon On
    Tray' option are turned on, the main window of MyEventViewer will be
    invisible on start.

* Version 1.66:
  o Added accelerator keys to the event type filter (Ctrl+1 - Ctrl+5)

* Version 1.65:
  o Added option to filter by Event ID.

* Version 1.63:
  o Added new option: 'Show Advanced Filter Window On Start'.

* Version 1.62:
  o Added 'Tray Balloon Event Type Filter' option (Under the Options
    menu), which allows you to choose for which event types the tray
    balloon will be displayed.

* Version 1.61:
  o Added option to load only the last xx events from every event
    log. (In the 'Advanced Filter' window)

* Version 1.60:
  o Added 'Put Icon On Tray' option.
  o Added 'Tray Balloon On New Event' (works only when 'Put Icon On
    Tray' is turned on). When this option is turned on, and 'Auto
    Refresh' mode is enabled too, Every new event detected by
    MyEventViewer is displayed inside a tray balloon.

* Version 1.55:
  o Added option to hide events by their source name, in the
    'Advanced Options' window. You can specify multiple source names as
    comma delimited list (For exmaple: WinMgmt, w3svc, esent)

* Version 1.50:
  o Added option to filter the events by source name, in the
    'Advanced Options' window. You can specify multiple source names as
    comma delimited list (For exmaple: WinMgmt, w3svc, esent)
  o Added 'Remote Event Description Mode' under the Options menu,
    which allows you to control how the event description dll files are
    loaded when you connect a remote computer. In previous versions, the
    dll files were loaded from the local computer. Now you can choose
    whether to load them from local computer, remote computer or both. Be
    aware that loading dll files from the remote computer is a much
    slower process, and requires admin shares access (C$, D$, ADMIN$ and
    so on)

* Version 1.45:
  o Added option to load the events on selected date/time range. (In
    'Advanced Filter' window).
  o Added /advanced command-line option, for starting MyEventViewer
    with the 'Advanced Filter' window before loading the events.

* Version 1.42:
  o The status bar now displays the total data size of selected
    events in KB/MB.

* Version 1.41:
  o Added 'Add Header Line To CSV/Tab-Delimited File' option. When
    this option is turned on, the column names are added as the first
    line when you export to csv or tab-delimited file.
  o Added x64 download, for using on 64-bit versions of Windows.

* Version 1.40:
  o Added 'New Events Refresh' (F8) - This refresh option only add
    new events that have been created since the previous refresh, instead
    of loading the entire events list. This refresh is much faster than
    the standard refresh option (F5), which reloads the entire events
    list.
  o Added 'Auto Refresh' under the Options menu (1, 3, 5, 10 seconds,
    or disabled) - When this option is turned on, newly created events
    are displayed automatically without using the refresh option. When
    using this option, it's recommended to sort the events list by the
    event time, so the new events will appear in the top or in the bottom
    of the events list.

* Version 1.37:
  o Fixed issue: Removed the wrong encoding from the xml string,
    which caused problems to some xml viewers, as well as removed wrong
    <br> tag from the xml.

* Version 1.36:
  o You can now send the events information to stdout by specifying
    an empty filename ("") in the command-line. (For example:
    MyEventViewer.exe /stab "" >> c:\temp\evt.txt)

* Version 1.35:
  o Added /LoadFiles command-line parameter, which allows you to load
    .evt files.

* Version 1.30:
  o Added 'Show Event Description In Table' option, which allows you
    to view the description of the event in the 'Event Description'
    column.

* Version 1.25:
  o Added command-line support.

* Version 1.22:
  o Fixed bug: When using /remote option, MyEventViewer failed to
    display any non-system user name.

* Version 1.21:
  o Fixed bug: When using /remote option, MyEventViewer cleared the
    log of local computer instead of the remote computer.

* Version 1.20:
  o Added /remote command-line option to connect a remote computer.

* Version 1.15:
  o Fixed bug: MyEventViewer stopped enumerating the logs when there
    was an item with very large data.
  o Fixed bug: MyEventViewer failed to display long text/data in the
    bottom pane.
  o New Option: 'Find By Event Description'. When this option is
    checked, the find feature also searches inside the description of the
    event.

* Version 1.11:
  o Fixed bug: MyEventViewer failed to display properly items with
    source name longer than 30 characters.

* Version 1.10:
  o Fixed bug: The main window lost the focus when the user switched
    to another application and then returned back to MyEventViewer.

* Version 1.09:
  o Fixed bug: MyEventViewer crashed when the event data was very
    large.

* Version 1.08:
  o Added support for saving as comma-delimited file.

* Version 1.07:
  o Fixed bug: MyEventViewer displayed '%%number' string instead of
    the real error message.

* Version 1.06:
  o Fixed bug in Event ID sorting.
  o Fixed a few points that might cause a crash in MyEventViewer

* Version 1.05:
  o New option: Clean All Events Logs
  o New option: Show only events from the last xx minutes/hours/days.
    (In the Advanced Filter window)

* Version 1.01 - Added filter by event type.
* Version 1.00 - First release.



Using MyEventViewer
===================

MyEventViewer doesn't require any installation process or additional DLL
files. In order to start using it, simply run the executable file -
MyEventViewer.exe
The main window of MyEventViewer has 2 panes: The upper pane displays the
list of all events. When you select a single event in the upper pane, the
lower pane display the description and data of the selected event.
By default, all event logs are displayed in the main window of
MyEventViewer. You can easily remove/add the logs that you want to view
by using the 'Logs' menu.



Reading External .evt files
===========================

MyEventViewer allows you to read event data from one or more .evt file by
using /LoadFiles command-line parameter. For every .evt filename, you
must specify the appropriate log type name (Application, Security, and so
on...)

For example:
MyEventViewer.exe /LoadFiles "c:\temp\app.evt" "Application"
MyEventViewer.exe /LoadFiles "c:\temp\sec.evt" "Security"
"c:\temp\app.evt" "Application"
MyEventViewer.exe /shtml "c:\temp\events1.html" /LoadFiles
"c:\temp\sec.evt" "Security" "c:\temp\app.evt" "Application"



Connecting a remote computer in your network
============================================

MyEventViewer allows you to connect another computer on your network.
However, this feature only works if you have full admin access to the
computer that you want to connect.

In order to view the events of the remote computer, simply run
MyEventViewer with /remote option, and specify the computer name, for
example:
MyEventViewer.exe /remote \\MyComputerName
MyEventViewer.exe /remote \\192.168.0.1

In order to successfully get full admin access to the remote computer,
read this Blog post: How to connect a remote Windows 7/Vista/XP computer
with NirSoft utilities.



System Requirements
===================

This utility works on Windows 2000, Windows XP, Windows 2003 Server, and
Windows Vista. However, be aware that the event viewer of Windows Vista
displays more event details than MyEventViewer.



Command-Line Options
====================



/SaveDirect
Save the log lines in SaveDirect mode. For using with the other save
command-line options ( /scomma, /stab, /sxml, and so on...)
When you use the SaveDirect mode, the event log lines are saved directly
to the disk, without loading them into the memory first. This means that
you can save a list with large amount of event log lines into your disk
without any memory problem, as long as you have enough disk space to
store the saved file. The drawback of this mode: You cannot sort the log
lines according to the column you choose with /sort command-line option.

/ShowOnlyLastEvents [0 | 1]
If you specify '1' value, the last events filter will be activated.

/LastEventsUnit [Unit]
Unit to specify the last events filter.
1 = Minutes
2 = Hours
3 = Days

/LastEventsValue [Number of Units]
specifies the number of units (Minutes/Hours/Days) for the last events
filter.

/VisibleEventTypes [Number]
Specifies which type of events to display:
1 = Error
2 = Warning
4 = Information
8 = Audit Success
16 = Audit Failure

You can combine multiple event types, for exmaple: if you want to display
both errors and warnings, set the VisibleEventTypes value to 3 (1 + 2 =
3):

/EventLogNames [Name1] [Name2] [Name3]...
Specifies the event log names that you wish to load.

Examples:
MyEventViewer.exe /EventLogNames "osession" "security" "Internet Explorer"
MyEventViewer.exe /EventLogNames "Application" "Security"

/cfg <Filename>
Start MyEventViewer with the specified configuration file. For example:
MyEventViewer.exe /cfg "c:\config\MyEventViewer.cfg"
MyEventViewer.exe /cfg "%AppData%\MyEventViewer.cfg"

/advanced
Starts MyEventViewer with the 'Advanced Filter' window, before loading
the events.

/stext <Filename>
Save the events list into a regular text file.

/stab <Filename>
Save the events list into a tab-delimited text file.

/scomma <Filename>
Save the events list into a comma-delimited text file (csv).

/stabular <Filename>
Save the events list into a tabular text file.

/shtml <Filename>
Save the events list into HTML file (Horizontal).

/sverhtml <Filename>
Save the events list into HTML file (Vertical).

/sxml <Filename>
Save the events list into XML file.

/sort <column>
This command-line option can be used with other save options for sorting
by the desired column. If you don't specify this option, the list is
sorted according to the last sort that you made from the user interface.
The <column> parameter can specify the column index (0 for the first
column, 1 for the second column, and so on) or the name of the column,
like "Source" and "Time". You can specify the '~' prefix character (e.g:
"~Time") if you want to sort in descending order. You can put multiple
/sort in the command-line if you want to sort by multiple columns.

/nosort
When you specify this command-line option, the list will be saved without
any sorting.

Examples:
MyEventViewer.exe /shtml f:\temp\events.html /ShowOnlyLastEvents 1
/LastEventsValue 2000 /LastEventsUnit 1 /sort "~Time"
MyEventViewer.exe /shtml f:\temp\events.html /sort "Event Type" /sort
"Log Type"



Translating MyEventViewer to other languages
============================================

In order to translate MyEventViewer to other language, follow the
instructions below:
1. Run MyEventViewer with /savelangfile parameter:
   MyEventViewer.exe /savelangfile
   A file named MyEventViewer_lng.ini will be created in the folder of
   MyEventViewer utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run MyEventViewer, and all
   translated strings will be loaded from the language file.
   If you want to run MyEventViewer without the translation, simply
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

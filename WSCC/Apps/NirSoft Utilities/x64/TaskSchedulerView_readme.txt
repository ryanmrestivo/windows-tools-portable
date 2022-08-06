


TaskSchedulerView v1.71
Copyright (c) 2015 - 2022 Nir Sofer
Web site: https://www.nirsoft.net



Description
===========

TaskSchedulerView is a simple tool for Windows Vista/7/8/10/11 that
displays in a single table the list of all tasks from the Task Scheduler
of Windows. It also allows you to easily disable/enable mutiple tasks at
once. For every task, the following information is displayed: Task Name,
Description, Status, Hidden (Yes/No), Last Run/Next Run Times, Task
Folder, EXE filename or COM handler of the task, number of missed runs,
and more...



System Requirements
===================

This tool works on any version of Windows, starting from Windows Vista
and up to Windows 11. Both 32-bit and 64-bit systems are supported.
Windows XP and older systems are not supported.



Versions History
================


* Version 1.71:
  o Added /Columns command-line option, which allows you to set the
    columns to display or the columns to export from command-line, for
    example:
    TaskSchedulerView.exe /shtml c:\temp\tasks.html /Columns "Task
    Name,Status,Hidden,Task Folder,Executable File"

* Version 1.70:
  o Added 'Open Task Folder' option.
  o Added 'Add Header Line To CSV/Tab-Delimited File' option (Turned
    on by default).

* Version 1.68:
  o Fixed bug with the next/previous buttons on the properties window.
  o Added option to change the sorting column from the menu (View ->
    Sort By). Like the column header click sorting, if you click again
    the same sorting menu item, it'll switch between ascending and
    descending order. Also, if you hold down the shift key while choosing
    the sort menu item, you'll get a secondary sorting.

* Version 1.67:
  o Updated to work properly in high DPI mode.

* Version 1.66:
  o The properties window now has multiple pages if there is no
    enough space to display all properties in one page.
  o Added 'Task Filename' column.

* Version 1.65:
  o Added 'Task File Created Time' column, which displays the
    date/time that the task filename was created.
  o Added 'Task File Modified Time' column, which displays the
    date/time that the task filename was modified.

* Version 1.60:
  o Added support for exporting the tasks list to JSON file.
  o Updated the HTML export feature to HTML5.

* Version 1.57:
  o Added 'Copy Clicked Cell' option to the right-click context menu,
    which copies to the clipboard the text of cell that you right-clicked
    with the mouse.

* Version 1.56:
  o Fixed the 'start the Remote Registry service' option to start the
    Remote Registry service even if this service is disabled.

* Version 1.55:
  o Fixed to save the 'Case Sensitive' option of the Quick Filter in
    the .cfg file.

* Version 1.54:
  o Added 'Select All' and 'Deselect All' buttons to the 'Choose
    Columns' window.

* Version 1.53:
  o Added new option: 'Show Only Running Tasks'.

* Version 1.52:
  o Added 'Case Sensitive' option to the Quick Filter window.

* Version 1.51:
  o Added new column: 'Wake To Run' (Yes/No).

* Version 1.50:
  o Added new command-line options to enable/disable/run/stop a task
    from command-line: /Disable , /Enable , /StopTask , /RunNow
  o Added /RunAsAdmin command-line option for running
    TaskSchedulerView as administrator.

* Version 1.46:
  o Added new columns: 'Run Only If Network Available' (Yes/No) ,
    'Multi-Instances Policy'.

* Version 1.45:
  o Added 'Allow Demand Start' column (Yes/No).
  o Added 'Run Task Now' option (Available only when the 'Allow
    Demand Start' column displays 'Yes').
  o You can now send the data to stdout by specifying empty string as
    filename, for example:
    TaskSchedulerView.exe /scomma "" &gt "c:\temp\tasks.csv"

* Version 1.42:
  o The last size/position of the properties window is now saved in
    the .cfg file.

* Version 1.41:
  o Fixed bug: Some options like "Hide Disabled Tasks" and "Hide
    Tasks Marked As Hidden" didn't work properly when saving the tasks
    list from command-line.

* Version 1.40:
  o Added 'Hide Tasks Marked As Hidden' option.

* Version 1.37:
  o Added new options to the 'Quick Filter' feature.

* Version 1.36:
  o Added 'Put Icon On Tray' option.

* Version 1.35:
  o Added 'Stop Running Task' option.
  o Fixed bug: The text-box of quick filter disappeared when pressing
    Enter or Esc key.

* Version 1.31:
  o The properties window is now resizable.

* Version 1.30:
  o Added 'Quick Filter' feature (View -> Use Quick Filter or
    Ctrl+Q). When it's turned on, you can type a string in the text-box
    added under the toolbar and TaskSchedulerView will instantly filter
    the task items, showing only lines that contain the string you typed.

* Version 1.26:
  o Added 'Start Directory' column.

* Version 1.25:
  o Added 'Running User Account' column, which shows the user account
    that will be used for running the task.
  o Added 'Highest Privileges Run' column - Displays 'Yes' if the
    task run with highest privileges.
  o Added 'Align Numeric Columns To Right' option.

* Version 1.22:
  o Added 'Save All Items' (Shift+Ctrl+S).

* Version 1.21:
  o You can now choose the desired encoding (ANSI, UTF-8, UTF-16) to
    save the csv/xml/text/html files. (Under the Options menu)

* Version 1.20:
  o Added 'Copy Task XML' option (Ctrl+M), which copies to the
    clipboard the full XML of the task. This XML contains all task
    settings, including fields that are not displayed in the main table
    of TaskSchedulerView.

* Version 1.17:
  o Added option to choose another font (name and size) to display in
    the main window.

* Version 1.16:
  o Added 'Auto Size Columns On Load' option.

* Version 1.15:
  o The Refresh action (F5) is now smooth, without clearing and
    loading again the entire tasks list.
  o Added 'Auto Refresh' option.

* Version 1.12:
  o Added 'Always On Top' option.

* Version 1.11:
  o Added 'Running Instances' column, which shows the number of
    instances of this task that are currently running.

* Version 1.10:
  o Added 'Task Owner' column, which displays the Windows user that
    owns the task.
  o Added 'Priority' column, which displays the priority level of the
    task. Priority level 0 is the highest priority, and priority level 10
    is the lowest priority. The default value is 7.
  o Added 'Open Windows Task Scheduler' option (Under the Help menu).
  o Added 'Hide Tasks In Microsoft Folders' option.

* Version 1.00 - First release.



Start Using TaskSchedulerView
=============================

TaskSchedulerView doesn't require any installation process or additional
DLL files. In order to start using it, simply run the executable file -
TaskSchedulerView.exe
After running TaskSchedulerView, the main window displays the details of
most tasks from the Task Scheduler of Windows. However, some of the tasks
cannot be accessed without full administrator privileges. In order to
view all tasks, you can easily run TaskSchedulerView as Administrator by
pressing Ctrl+F11.
Inside the main window of TaskSchedulerView, you can easily select one or
more tasks, and then export them to
text/comma-delimited/tab-delimited/html/xml file (By using the 'Save
Selected Items' option) or copy the selected tasks to the clipboard and
then paste them to Excel or other application. You can also disable or
enable the selected tasks. Be aware that some of the tasks can only be
disabled/enabled if you run TaskSchedulerView as Administrator.



Connecting Remote Computer
==========================

TaskSchedulerView also allows you to view and disable/enabled the tasks
of a remote computer, as long as you have permission to do that. In order
to connect a remote computer, simply press F9 (Advanced Options), choose
to connect a remote computer, and then type the computer name. There is
also an option to start the Remote Registry service on the remote
computer. This option is needed only if you want to get the information
about COM handlers, which is loaded from Registry.



Columns Description
===================


* Task Name: The name of the task.
* Status:The status of the task: Ready, Running, or Disabled.
* Hidden:Specifies whether the task is hidden (Yes/No).
* Last Task Result:Specifies the return code from the last time the
  task was run.
* Last Run:Specifies the date/time that the task was last run.
* Next Run:Specifies the next time that the task is scheduled to run.
* Triggers:Specifies the trigger types of the task: Event, Specific
  Time, Daily, Weekly, Monthly, Monthly Day-Of-Week, Idle, Task
  Registration, Boot, Logon, Session State Change.
* Run On Boot:Specifies whether the task runs on computer boot (Yes/No).
* Run On Logon:Specifies whether the task runs on Windows logon
  (Yes/No).
* Run On Event:Specifies whether the task runs on Windows event. If it
  runs on event, the event string is specified.
* Run Daily:Specifies whether the task runs daily.
* Run Weekly:Specifies whether the task runs weekly.
* Run Monthly:Specifies whether the task runs monthly.
* Missed Runs:Specifies the number of missed runs.
* Task Folder:Specifies the full path of task folder.
* Action Types:Specifies the action types of this task: Run EXE, COM
  Handler, Send Email, Show Message.
* Executable File:Specifies the executable filename to run (For 'Run
  EXE' action).
* Executable Arguments:Specifies the executable arguments(For 'Run EXE'
  action).
* COM Handler Filename:Specifies the filename of COM Handler (For 'COM
  Handler' action).
* COM Handler Description:Specifies the description of the COM Handler
  file (For 'COM Handler' action).
* COM Handler Class:Specifies the class ID of the COM Handler file (For
  'COM Handler' action).
* Description:The description of the task.
* Task Owner:Specifies the Windows user that owns the task.
* Running User Account:Specifies the user account that will be used for
  running the task.
* Highest Privileges Run:Displays 'Yes' if the task run with highest
  privileges.
* Priority:Specifies the priority level of the task. Priority level 0
  is the highest priority, and priority level 10 is the lowest priority.
  The default value is 7.



Command-Line Options
====================



/Disable <Task Name>
Disables the specified task.

/Enable <Task Name>
Enables the specified task.

/StopTask <Task Name>
Stops the specified task.

/RunNow <Task Name>
Runs the specified task.

/RunAsAdmin
Runs TaskSchedulerView as administrator.

/LoadFrom <Number>
Load the tasks from... 1 = This computer, 2 = Remote computer

/ComputerName <Computer Name>
Specifies the name of the remote computer (For using with /LoadFrom 2 )

/stext <Filename>
Save the tasks list into a simple text file.

/stab <Filename>
Save the tasks list into a tab-delimited text file.

/scomma <Filename>
Save the tasks list into a comma-delimited text file (csv).

/stabular <Filename>
Save the tasks list into a tabular text file.

/shtml <Filename>
Save the tasks list into HTML file (Horizontal).

/sverhtml <Filename>
Save the tasks list into HTML file (Vertical).

/sxml <Filename>
Save the tasks list into XML file.

/sjson <Filename>
Save the tasks list into JSON file.

/sort <column>
This command-line option can be used with other save options for sorting
by the desired column. The <column> parameter can specify the column
index (0 for the first column, 1 for the second column, and so on) or the
name of the column, like "Task Name" and "Last Run". You can specify the
'~' prefix character (e.g: "~Status") if you want to sort in descending
order. You can put multiple /sort in the command-line if you want to sort
by multiple columns.



/Columns <Comma Delimited Columns List>
Allows you to set the columns to display or the columns to export from
command-line. You have to specify the column names, delimited by comma,
for example:
TaskSchedulerView.exe /shtml c:\temp\tasks.html /Columns "Task
Name,Status,Hidden,Task Folder,Executable File"

You can also specify the column names without space characters, for
example:
TaskSchedulerView.exe /shtml c:\temp\tasks.html /Columns
"TaskName,Status,Hidden,TaskFolder,ExecutableFile"



Translating TaskSchedulerView to other languages
================================================

In order to translate TaskSchedulerView to other language, follow the
instructions below:
1. Run TaskSchedulerView with /savelangfile parameter:
   TaskSchedulerView.exe /savelangfile
   A file named TaskSchedulerView_lng.ini will be created in the folder
   of TaskSchedulerView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run TaskSchedulerView, and all
   translated strings will be loaded from the language file.
   If you want to run TaskSchedulerView without the translation, simply
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

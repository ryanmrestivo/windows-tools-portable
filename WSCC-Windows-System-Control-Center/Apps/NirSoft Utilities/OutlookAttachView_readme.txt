


OutlookAttachView v3.52
Copyright (c) 2009 - 2024 Nir Sofer
Web site: https://www.nirsoft.net



Related Utilities
=================


* NK2Edit - Edit, merge and fix the AutoComplete files (.NK2) of
  Microsoft Outlook.



Description
===========

OutlookAttachView scans all messages stored in your Outlook, and displays
the list of all attached files that it finds. You can easily select one
or more attachments and save all of them into the desired folder, as well
as you can delete unwanted large attachments that take too much disk
space in your mailbox. You can also save the list of attachments into
xml/html/text/csv file.



System Requirements
===================


* Windows 2000/XP/Vista/7/8/2003/2008/10/11.
* Microsoft Outlook 2003, Microsoft Outlook 2007, Microsoft Outlook
  2010, Microsoft Outlook 2013, or Microsoft Outlook 2016. For the 64-bit
  version of Outlook 2010/2013/2016, you should use the x64 version of
  OutlookAttachView. Be aware that OutlookAttachView doesn't work with
  Outlook Express.



Versions History
================


* Version 3.52
  o Added 'Align Numeric Columns To Right' option.

* Version 3.51
  o When you try to use the 'Delete Selected Attachments' and 'Clear
    Selected Attachments' options, OutlookAttachView now displays a
    warning about using these options, and the default answer for the
    question is no.

* Version 3.50
  o Scan only messages with the following 'From' strings - You can
    now also specify email addresses (In previous versions, the filter
    worked only with the sender name).
  o Scan only messages with the following 'To' strings - You can now
    also specify email addresses.

* Version 3.48
  o Added 'Sort By' button to the toolbar.

* Version 3.47
  o Updated to stop the Outlook mailbox scan when you press the Esc
    key.

* Version 3.46
  o The status bar now displays the current scanned Outlook folder.

* Version 3.45
  o Added /Columns command-line option, which allows you to set the
    columns to display or the columns to export from command-line, for
    example:
    OutlookAttachView.exe /Columns "Filename,From,To,Subject,Folder
    Name,Attachment ID"

* Version 3.44
  o Fixed issue: When choosing to scan the attachments of another
    Outlook profile (Instead of default) while Outlook is opened in the
    background, the profile opened in Outlook was used, instead of the
    profile selected in OutlookAttachView.

* Version 3.43
  o Updated to work properly in high DPI mode.
  o Added option to change the sorting column from the menu (View ->
    Sort By). Like the column header click sorting, if you click again
    the same sorting menu item, it'll switch between ascending and
    descending order. Also, if you hold down the shift key while choosing
    the sort menu item, you'll get a secondary sorting.

* Version 3.42
  o Added 'Copy Clicked Cell' option to the right-click context menu,
    which copies to the clipboard the text of cell that you right-clicked
    with the mouse.

* Version 3.41
  o Added 'Preview Copy' option (Ctrl+M), which allows you to easily
    copy the text or image displayed in the preview pane into the
    clipboard.
  o Fixed the /cfg command-line option to load the .cfg file from the
    current directory if full path is not specified.

* Version 3.40
  o Changed to 'Image Preview' option to 'Preview Pane'. The 'Preview
    Pane' option allows you to view images and also the content of
    text-based attachments, like html.

* Version 3.35
  o Added 'Enter Key Action' option, which allows you to choose what
    to do when you press the Enter key: Open Properties Window, Open
    Outlook Message, Open Attachment File, Open Selected Attachment
    With..., Copy Selected Attachment To...

* Version 3.30
  o Added 'Scan only unread messages' option.
  o Added /extractallsetreadflag command-line option to extract
    attachments and then set the read flag.

* Version 3.26
  o Fixed bug: When closing the main window during attachment scan,
    OutlookAttachView remained in memory.

* Version 3.25
  o Added option to search attached documents that contain the
    specified text.
  o This feature uses the search handlers of Windows operating system
    to search inside Office documents and other type of files, depending
    on search filters installed on your system.
  o You can also search attached .pdf files as long as the PDF search
    handler of Microsoft (Windows.Data.pdf.dll) or PDF iFilter of Adobe
    is installed properly on your system.

* Version 3.20
  o Added option to generate MD5/SHA1/SHA256/SHA512 hashes of
    attachments. In order to use this feature, select the attachments you
    want to hash, go to File -> Hash Selected Files -> [Hash Type] and
    the hashes will appear in the 'Hash' column

* Version 3.16
  o You can now select the desired folder to scan or to skip from a
    combo-box ('Mailbox Scan Options' window).

* Version 3.15
  o The last size/position of the properties window is now saved in
    the .cfg file.

* Version 3.13
  o Added more information to the log file to diagnose a problem with
    deleting attachments while using the /extractdeleteall command.
  o Added 'TryAgainOnDeleteFail' entry to the .cfg file. If you set
    it to 1, OutlookAttachView will try to delete attachment again if the
    first delete fails.

* Version 3.12
  o Added %folder_full_path% variable to the attachment filename
    format. You can use it to generate subfolders identical to the
    folders structure in Outlook (e.g: Personal Folders\Inbox )

* Version 3.11
  o Added 'Select All' and 'Deselect All' to the 'Column Settings'
    window.

* Version 3.10
  o Added /extractdeleteall command-line option, which extracts the
    attachments and then deletes them from Outlook.

* Version 3.05
  o Added 'Quick Filter' feature (View -> Use Quick Filter or
    Ctrl+Q). When it's turned on, you can type a string in the text-box
    added under the toolbar and OutlookAttachView will instantly filter
    the attachments table, showing only lines that contain the string you
    typed.

* Version 3.02
  o The properties window is now resizable.

* Version 3.01
  o Fixed bug: 'Copy Selected Items' worked improperly when setting
    the 'Unicode/Ascii Save Mode' to 'Always UTF-8'.

* Version 3.00
  o Added 'Message Delivery Time' column.

* Version 2.98
  o Fixed bug: When pressing Delete key inside the text-box of the
    Find window, OutlookAttachView asked you if you want to delete the
    selected item instead of deleting a character inside the find
    text-box.

* Version 2.97
  o Fixed bug: OutlookAttachView crashed when using /SaveDirect
    command-line option.

* Version 2.96
  o Made another change that hopefully will fix a crash problem
    occurs on some systems.

* Version 2.95
  o Fixed bug: OutlookAttachView crashed when using the find option
    while the last item was selected.

* Version 2.94
  o Made a small change that hopefully will fix a crash problem
    occurs on some systems.

* Version 2.93
  o You can now change the text/background colors for marking inline
    attachment in the .cfg file (InlineAttachmentBackColor and
    InlineAttachmentTextColor values). These colors are stored in the
    .cfg file as Hexadecimal RGB numbers.

* Version 2.92
  o Fixed bug: OutlookAttachView saved the files with incorrect
    encoding and Byte order mark when using /SaveDirect command-line
    option.

* Version 2.91
  o Fixed OutlookAttachView to store the 'Create subfolders
    automatically' option in the .cfg file.

* Version 2.90
  o You can now choose the desired encoding (ANSI, UTF-8, UTF-16) to
    save the csv/xml/text/html files. (Under the Options menu)

* Version 2.87
  o Added option to append log lines to the existing log file instead
    creating a new one. This option was added to 'Copy Selected Files To'
    window and as command-line option - /LogFileAppend

* Version 2.86
  o Added option to generate a log file in the 'Copy Selected Files
    To' window.

* Version 2.85
  o Added /LogFile command-line option for using with /extractall
    command, which allows you to generate a log file while extracting
    attachments from command-line, for example:
    OutlookAttachView.exe /extractall /LogFile "c:\temp\log1.txt"

* Version 2.83
  o Fixed bug: OutlookAttachView failed to extract the attachment if
    the value of one of the special variables (%from% and others)
    contained a character between 0x01 and 0x1f, which is not allowed to
    use in NTFS filenames. OutlookAttachView now replaces these
    characters with a space character.
  o Fixed bug: The 'Select Outlook Folders' window displayed empty
    folders list (The bug appeared on version 2.80)

* Version 2.82
  o When using the 'Open Selected Attachment With' option, the
    'Always use the selected program to open this kind of file' check-box
    is now turned off and disabled.

* Version 2.81
  o You can now specify environment variables in the base folder of
    'Copy Selected Files To...' window (e.g: %temp%\attach ).

* Version 2.80
  o When loading large amount of attachments, OutlookAttachView now
    consumes less memory than in the previous versions.

* Version 2.78
  o Added "Don't copy if filename already exists" option to the "Copy
    Selected Files To..." window.

* Version 2.77
  o Fixed OutlookAttachView to save the size range filter settings
    into the .cfg file.

* Version 2.76
  o Added 'Always On Top' option.

* Version 2.75
  o Fixed bug: OutlookAttachView failed to remember the last
    size/position of the main window and the scan options window if they
    were not located in the primary monitor.

* Version 2.74
  o Fixed to display the profiles list for Outlook 2013 in the
    'Profile Name' combo-box.

* Version 2.73
  o OutlookAttachView now also scans the root folder of the .pst file.

* Version 2.72
  o Added %from_email% and %to_email% variables to the attachment
    filename format.

* Version 2.71
  o Added %localmsgtime% and %localmsgdate% variables to the
    attachment filename format.
  o Fixed a crash problem occurred on some systems after version 2.70
    update.

* Version 2.70
  o Fixed to display date/time values according to daylight saving
    time settings.

* Version 2.69
  o Fixed bug: OutlookAttachView crashed on some systems.

* Version 2.68
  o Added secondary sorting support: You can now get a secondary
    sorting, by holding down the shift key while clicking the column
    header. Be aware that you only have to hold down the shift key when
    clicking the second/third/fourth column. To sort the first column you
    should not hold down the Shift key.

* Version 2.67
  o Fixed bug: when turning on the 'Image Preview' option,
    OutlookAttachView displayed empty image or incorrect image.

* Version 2.66
  o Added more accelerator keys (in the menus).

* Version 2.65
  o Added 'Image Preview' option (Under the View menu). If you turn
    on this option, a preview of selected gif/png/jpg file will be
    displayed in the lower pane. Be aware that this feature is quite
    slow...

* Version 2.63
  o The number of attachments is now displayed in the status bar
    while scanning the mailbox of Outlook.

* Version 2.62
  o Added 'Recent Config Files' menu, which allows you to easily open
    the last 10 configuration files that you used.

* Version 2.61
  o Added GB and Automatic to the 'File Size Unit' option.

* Version 2.60
  o Added option to save and load the entire configuration of
    OutlookAttachView ('Save Configuration' and 'Load Configuration'
    under the File menu).

* Version 2.56
  o OutlookAttachView now remembers the last size and position of the
    'Copy Selected Files To...' window.

* Version 2.55
  o You can now specify wildcards (For example: nir*.doc, abc???.txt)
    in the include/exclude filename option.

* Version 2.51
  o Added option to choose the file size display unit: Bytes, KB, or
    MB.

* Version 2.50
  o OutlookAttachView now remembers that last 20 strings you typed in
    the Extensions List, Excluded Extensions List, Subject contains
    string..., From string, and To string, and you can easily select a
    string again from a Combo-Box.

* Version 2.47
  o Added option to choose another font (font name and size) to
    display the attachments list. (Options -> Select Another Font)

* Version 2.46
  o Fixed the flickering occurred while scrolling the attachments
    list.

* Version 2.45
  o You can now resize the scan options dialog-box. Also, the last
    size and position of this dialog-box is saved to the config file.

* Version 2.43
  o Added %attach_id% variable to the attachment filename format.

* Version 2.42
  o Added option to change the maximum number of characters in every
    variable of formatted filename. (The default is 64 characters)

* Version 2.41
  o Added option to filter by the message direction (incoming or
    outgoing) in the Scan Options window.

* Version 2.40
  o Added %message_direction% and %message_entryid% variables to the
    attachment filename format.

* Version 2.38
  o The 'Show Inline Attachments' option is now turned on by default
    (In previous versions it was turned off). The reason for this
    changed: I found out that many users think that there is a bug in
    OutlookAttachView because they can't find some of the attachments,
    without understanding that they have to turn on the 'Show Inline
    Attachments' option.

* Version 2.37
  o Fixed issue: The properties and the options windows opened in the
    wrong monitor, on multi-monitors system.

* Version 2.36
  o Added 'Auto Size Columns+Headers' option, which allows you to
    automatically resize the columns according to the row values and
    column headers.

* Version 2.35
  o Added 'Message EntryID' column, which displays the ID string of
    the Outlook message.

* Version 2.32
  o Added %domain% variable to the attachment filename format.

* Version 2.31
  o Added /SaveDirect command line option, for using with the other
    save command-line options (/scomma, /stab, /sxml, and so on...)
    When you use the SaveDirect mode, the attachments list is saved
    directly to the disk, without loading them into the memory first.
    This means that you can save a list with large amount of attachment
    lines into your disk without any memory problem, as long as you have
    enough disk space to store the saved file. The drawback of this mode:
    You cannot sort the attachments according to the column you choose
    with /sort command-line option.

* Version 2.30
  o Added 'Domain' column, which displays the domain of the from/to
    email address.

* Version 2.25
  o Added 'Message Direction' column (Incoming or Outgoing).

* Version 2.20
  o Added 'From Email' and 'To Email' columns, which displays the
    From/To email addresses. (The existing To/From columns shows the
    'Display Name')

* Version 2.15
  o Added 'Put Icon On Tray' option.

* Version 2.11
  o When trying to connect to Outlook 2010 with the wrong build of
    OutlookAttachView (OutlookAttachView 32-bit with Outlook x64 or
    OutlookAttachView x64 with Outlook 32-bit), OutlookAttachView now
    displays informative error message about the problem.

* Version 2.10
  o Changed the user interface of the Main Scan Options window, to
    make it useable for lower screen resolutions and to give more space
    to the folders/subjects/from/to include/exclude lists.

* Version 2.05
  o Added 'Skip Exchange public folders' option.

* Version 2.00
  o Added command-line options to change any configuration value.

* Version 1.95
  o Added /extractall command-line option, which allows you to
    extract all Outlook attachments from command-line, according to your
    saved settings.

* Version 1.90
  o Added option to scan only emails in the last xx days (alternative
    to the date/time range).

* Version 1.85
  o Added option to scan only emails with the specified 'From' and
    'To' strings.

* Version 1.82
  o When adding a folder to scan (with the Add button), the folder
    path in now delimited with quotes, to ensure that it'll be scanned
    properly if the folder name contains a comma character.

* Version 1.81
  o Fixed a crash problem when trying to save outlook attachment.

* Version 1.80
  o Added 'Add' buttons, which allows you to easily add folders to
    scan or skip by choosing them from the list of Outlook folders.

* Version 1.75
  o Added the ability to choose the desired Outlook profile inside
    the 'Mailbox Scan Options' window.

* Version 1.72
  o You can now specify a folder with all its subfolders (to include
    or to skip) by adding * character to the folder string, for example:
    Personal Folders\Inbox*

* Version 1.71
  o Fixed OutlookAttachView to be able to scan the public folders of
    Exchange server.

* Version 1.70
  o Added option to specify a custom date/time format for the
    filename in the 'Copy Selected Files To...' option, for example:
    %msgdate:yyyyMMdd% , %msgtime:HHmmss%

* Version 1.67
  o OutlookAttachView now displays (in the status bar) the current
    copied filename while copying the attachments. It also allows you to
    stop the copying process by clicking the stop menu.

* Version 1.66
  o In the 'Copy Selected Files To...' window, you can now specify a
    subfolder in the attach filename format. For example, if the filename
    format is %folder_name%\%subject%_%attach_name%.%extension% - All
    attachments from the inbox will be saved under the Inbox subfolder,
    All attachments from Sent Items will be saved under the Sent Items
    subfolder, and so on...
  o You can also choose the 'Create subfolders automatically' option
    if you want that OutlookAttachView will automatically create the
    subfolders for you.

* Version 1.65
  o Added time fields for the scanning date range.
  o The date range is now saved in the .cfg file.

* Version 1.63
  o Added 2 actions to 'Double-Click Action': 'Open Selected
    Attachment With' and 'Copy Selected Attachment To'

* Version 1.62
  o Fixed bug: OutlookAttachView crashed when trying to extract a
    special type of attachment.

* Version 1.61
  o Added 'Mark Inline Attachments' option. When it's turned on,
    inline attachments are marked with blue background color.

* Version 1.60
  o Added /start command-line option, which instructs
    OutlookAttachView to start the mailbox scan immediately with the
    loaded configuraion, without displaying the Scan Options dialog-box.
  o Decreased the memory consumption when the list of found
    attachments is very large.

* Version 1.57
  o Added new option to specify the list of folders that you wish to
    skip (comma-delimited list).

* Version 1.56
  o Added 'Mark Odd/Even Rows' option, under the View menu. When it's
    turned on, the odd and even rows are displayed in different color, to
    make it easier to read a single line.

* Version 1.55
  o Added new option to specify the list of folders that you wish to
    scan (comma-delimited list), instead of scanning the entire mailbox.

* Version 1.51
  o Added 'Open Selected Attachment With...' option, which allows you
    to quickly view the content of the attachment with another
    application, instead of the default one.

* Version 1.50
  o Added 'Open Selected Attachment' option (F7), which allows you to
    quickly view the content of the attachment, without the need to
    extract the file and then open it from Explorer. Be aware that when
    you use this option, OutlookAttachView extracts the attachment into a
    temporary folder, and then opens it with the default application,
    according to the file extension. When you close OutlookAttachView,
    all temporary attachment files are automatically deleted.
  o Added to option to choose what to do when you double-click on a
    single attachment: Open Properties Window, Open Outlook Message, or
    Open Attachment File.

* Version 1.47
  o The status bar now displays the total size of selected
    attachments in KB/MB.

* Version 1.46
  o You can now send the attachments list to stdout by specifying an
    empty filename ("") in the command-line. (For example:
    OutlookAttachView.exe /stab "" > c:\temp\att.txt)

* Version 1.45
  o Add new filter: Scan only emails that their subject contains the
    specified string.

* Version 1.41
  o Added option to exclude one or more file extensions from the
    attachments list (in comma-delimited list).

* Version 1.40
  o Added Extension column, so now you can easily sort the list by
    the file extension of the attachments.
  o Added option to filter the attachments list by file extension -
    you can now specify the list of file extensions (in comma-delimited
    list) that you want to find. All attachments with file extensions
    that are not in the list won't be displayed.

* Version 1.37
  o Added /cfg command-line option for loading the configuration from
    another .cfg file.

* Version 1.36
  o Added %message_size% and %folder_path% (full folder path)
    variables to the attachment filename format.

* Version 1.35
  o Added an option to control the filename format for extracting the
    attachments. (In the 'Copy Selected Files To...' window)
    You can include the following fields in the created filename:
    Subject, From, To, Attachment Name, Folder Name, Message Date, and
    Message Time.
  o Added 'Set the modified time of the file to the time of the
    message' option. When it's turned on, the extracted attachment file
    will get the same modified time of the message that contains the
    attachment.

* Version 1.30
  o Added 'Email Software' column, which displays the email software
    that was used to send the message. The value is taken from x-mailer
    header line. This column is only relevant for received messages
    (Inbox).
  o Added 'Computer Address' column, which displays the computer name
    or IP addresses that sent the message. This column is only relevant
    for received messages (Inbox).

* Version 1.25
  o Added a new option to 'Mailbox Scan Options', which allows you to
    scan another profile of Outlook, instead of the default one.
  o Added 'Add Header Line To CSV/Tab-Delimited File' option. When
    this option is turned on, the column names are added as the first
    line when you export to csv or tab-delimited file.

* Version 1.21
  o Added support for embedded message attachments (attachments of
    another message). These attachments are saved as .msg files.

* Version 1.20
  o Added option to filter by attachment size.
  o Fixed issue: removed the wrong encoding from the xml string,
    which caused problems to some xml viewers.

* Version 1.15
  o Added 'MailBox Scan Options' window, which allows you to choose
    the dates range to scan.
  o Fixed bug: The 'Created On' column displayed wrong dates in some
    Outlook configurations.

* Version 1.13
  o Added 'Copy Selected Attachments To...' into the right-click
    context menu. Also, changed the 'Save Selected Items' to 'Export
    Attachments Information', to avoid the confusion between saving the
    attachment files and exporting the attachments details.
  o Added separated x64 version - for using only with x64 version of
    Outlook 2010.

* Version 1.12
  o Fixed a crash problem when using this utility with IMAP accounts.

* Version 1.11
  o Added sorting command-line options.

* Version 1.10
  o Added 'Open Message In Outlook' option.

* Version 1.06
  o Added 'Clean Selected Attachments' option - clean the content of
    attachment, but without removing the attachment entry.

* Version 1.05
  o Fixed bug: OutlookAttachView failed to scan sub-folders under
    main Outlook folders.
  o Added 'Folder Path' column.

* Version 1.00 - First release.



Using OutlookAttachView
=======================

OutlookAttachView doesn't require any installation process or additional
dll files. In order to start using it, simply run the executable file -
OutlookAttachView.exe
If you have only one profile in your Outlook, and this profile doesn't
require any password, you can run OutlookAttachView even without starting
Outlook, and it'll automatically scan the mailbox of your current Outlook
profile. Otherwise, it's recommended to open Outlook in the right profile
before starting OutlookAttachView.
After running OutlookAttachView, the 'MailBox Scan Options' window will
be displayed. This window allows to choose to scan your mailbox only in
specific dates range. After choosing 'Ok' in the options window,
OutlookAttachView starts to scan your Outlook messages and display the
found attachments in the main window of OutlookAttachView. If you want to
stop the scan process, simply choose the 'Stop' menu.
After the scanning process is finished, you can select one or more of
your attached files, and copy them into the desired folder, by using the
'Copy Selected Files To' option. If have large attachments that you want
to delete, you can use the 'Delete Selected Attachments' option. Be aware
that when you use the delete option, only the attachment file is deleted.
The message itself remains on your mailbox.
You can also use the 'Clean Selected Attachments' option to clean most of
the attachment content, but without removing the attachment entry. If you
use this option, you'll still see the attachment listed in your email
message with small file size, but saving this attachment to a file will
create a corrupted file.



Inline Attachments
==================

Attachments embedded as a part of the message body are detected as
'Inline Attachments'. By default, OutlookAttachView doesn't displays
these inline attachments.
If you can't find the attachments you're looking for, you should try to
turn on the 'Show Inline Attachments' option, located under the Options
menu.



Control The Filename Format of Extracted Attachment
===================================================

When you extract one or more attachments from your Outlook mailbox, you
can control the way that the attach filename is generated. By default,
OutlookAttachView use the following format: %attach_name%.%extension%,
which means that the generated filename will only contain the original
attachment name and the file extension. However, you can also use the
following special variables to format the filename according to your
needs:
* %attach_name% - The original name of the attachment.
* %extension% - The original file extension of the attachment.
* %subject% - The subject of the email contains this attachment.
* %folder_name% - The folder name of this email (Inbox, Sent Items, and
  so on)
* %from% - The sender of the email.
* %to% - The 'To' field of the email.
* %message_date% - Message creation date in yyyymmdd format.
* %message_time% - Message creation time in HHmmss format.
* %message_size% - Attachment size, in bytes.
* %folder_path% - Full folder path of this email. (For example:
  Personal Folder-Inbox)
* %folder_full_path% - Full folder path of this email, with '\'
  characters (For example: Personal Folder\Inbox). You can use it to
  generate subfolders identical to the folders structure in Outlook. You
  also have to turn on the 'Create subfolders automatically' option.
* %msgdate:[format]% - Message creation date (GMT), in any format you
  need, for example: %msgdate:yyyyMMdd% , %msgdate:ddMMyy%
* %msgtime:[format]% - Message creation time (GMT), in any format you
  need, for example: %msgtime:HHmmss%
* %localmsgdate:[format]% - Message creation date (local time), in any
  format you need, for example: %localmsgdate:yyyyMMdd% ,
  %localmsgdate:ddMMyy%
* %localmsgtime:[format]% - Message creation time (local time), in any
  format you need, for example: %localmsgtime:HHmmss%

For example: If you want to generate the attachment filename with the
subject, folder name, and attach name:
%folder_name%_%subject%_%attach_name%.%extension%

If you want to generate the attachment filename with the subject and
attach name and put the attachment in the same folder structure of
Outlook (You have to turn on the 'Create subfolders automatically'
option):
%folder_full_path%\%subject%_%attach_name%.%extension%

Be aware that some of the values are automatically truncated after 64
characters, in order to avoid from over-sized filenames.



Scanning Outlook Attachments of External PST Files
==================================================

If you want to search an attachment in one or more PST files that are not
loaded in your Outlook profile, you can use the following trick:
1. Go to Control Panel -> Mail and choose 'Show Profiles'
2. Click 'Add' to create a new profile.
3. Fill the email account information with faked details (You can
   delete it afterwards)
4. After the profile is created, double click on the profile, and in
   the profile properties, click 'Data Files' and add the desired PST
   files that you wish to scan.
5. Also, you can click the 'E-mail Accounts' button, and remove the
   faked account that you previously created.
6. In the Mailbox Scan Options of OutlookAttachView, choose 'Allow me
   to choose the profile' in the Outlook Profile option.
7. When you are asked to choose the profile, you should choose the
   profile that you created, and OutlookAttachView will scan the PST
   files that you added into it.



Command-Line Options
====================



/stext <Filename>
Save the list of all Outlook attachments into a regular text file.

/stab <Filename>
Save the list of all Outlook attachments into a tab-delimited text file.

/scomma <Filename>
Save the list of all Outlook attachments into a comma-delimited text file.

/stabular <Filename>
Save the list of all Outlook attachments into a tabular text file.

/shtml <Filename>
Save the list of all Outlook attachments into HTML file (Horizontal).

/sverhtml <Filename>
Save the list of all Outlook attachments into HTML file (Vertical).

/sxml <Filename>
Save the list of all Outlook attachments to XML file.

/Columns <Comma Delimited Columns List>
Allows you to set the columns to display or the columns to export from
command-line. You have to specify the column names, delimited by comma,
for example:
OutlookAttachView.exe /scomma c:\temp\outlook-attachments.csv /Columns
"Filename,From,To,Subject,Folder Name,Attachment ID"

You can also specify the column names without space characters, for
example:
OutlookAttachView.exe /Columns
"Filename,From,To,Subject,FolderName,AttachmentID"

/SaveDirect
Save the Outlook attachments in SaveDirect mode. For using with the other
save command-line options ( /scomma, /stab, /sxml, and so on...)
When you use the SaveDirect mode, the attachments list is saved directly
to the disk, without loading them into the memory first. This means that
you can save a list with large amount of attachment lines into your disk
without any memory problem, as long as you have enough disk space to
store the saved file. The drawback of this mode: You cannot sort the
attachments according to the column you choose with /sort command-line
option.

/sort <column>
This command-line option can be used with other save options for sorting
by the desired column. If you don't specify this option, the list is
sorted according to the last sort that you made from the user interface.
The <column> parameter can specify the column index (0 for the first
column, 1 for the second column, and so on) or the name of the column,
like "Filename" and "Subject". You can specify the '~' prefix character
(e.g: "~Subject") if you want to sort in descending order. You can put
multiple /sort in the command-line if you want to sort by multiple
columns.

Examples:
OutlookAttachView.exe /shtml "f:\temp\attach.html" /sort 2 /sort ~1
OutlookAttachView.exe /shtml "f:\temp\attach.html" /sort "From" /sort
"To" /sort "Subject"

/nosort
When you specify this command-line option, the list will be saved without
any sorting.

/cfg <filename>
Starts OutlookAttachView with the specified configuration file instead of
the default OutlookAttachView.cfg

/start
Starts the mailbox scan immediately with the loaded configuraion, without
displaying the Scan Options dialog-box.

/extractall
Extracts all Outlook attachments from command-line, according to your
last settings saved in the default .cfg file, or according to other
configuration file that you load with /cfg command-line option.

/extractallsetreadflag
Extracts all Outlook attachments from command-line like /extractall
command and also set the read flag. You can use it with the 'Scan only
unread messages' option to extract message attachments only once.

/extractdeleteall
Extracts all Outlook attachments from command-line like /extractall
command and also deletes all extracted attachments from Outlook. Be
careful when using this command, OutlookAttachView cannot restore the
attachments in Outlook after deleting them.

/LogFile <filename>
Generates a log file while extracting attachments, for example:
OutlookAttachView.exe /extractall /LogFile "c:\temp\log1.txt"

/LogFileAppend <filename>
Generates a log file while extracting attachments, for example:
OutlookAttachView.exe /extractall /LogFileAppend "c:\temp\log1.txt"

If the file already exists, the new log lines are added to the existing
file.

You can also use the following command-line options to change any
configuarion value you wish:


/CopyFilesFolder <Folder Path String>
/NewNameIfExist <0 | 1>
/UpdateModifiedTimeMessage <0 | 1>
/FilenameFormat <Filename Format String>
/ScanOptions.TimeZone <1 | 2>
/ScanOptions.OutlookProfile <1 | 2 | 3>
/ScanOptions.UseExtensionsList <0 | 1>
/ScanOptions.ExtensionsList <Extensions To Include>
/ScanOptions.UseExcludeExtensionsList <0 | 1>
/ScanOptions.ExcludeExtensionsList <Extensions To Exclude>
/ScanOptions.UseSubjectContains <0 | 1>
/ScanOptions.SubjectContains <Subject String>
/ScanOptions.ScanOnlyFolders <0 | 1>
/ScanOptions.ScanFoldersList <Folders To Scan>
/ScanOptions.SkipFolders <0 | 1>
/ScanOptions.SkipFoldersList <Folders To Skip>
/ScanOptions.DateFrom <From Date>
/ScanOptions.DateTo <To Date>
/ScanOptions.UseDateRange <0 | 1>
/ScanOptions.OutlookProfileString <Profile Name>
/ScanOptions.UseFromList <0 | 1>
/ScanOptions.FromList <From Emails List>
/ScanOptions.UseToList <0 | 1>
/ScanOptions.ToList <To Emails List>
/ScanOptions.UseOnlyLastDays <0 | 1>
/ScanOptions.OnlyLastDays <Last num of days to scan>

For example, if you want to extract all attachments into c:\myattach
instead of using the folder specified in the config file:
OutlookAttachView.exe /CopyFilesFolder "c:\myattach" /extractall



Translating OutlookAttachView to other languages
================================================

In order to translate OutlookAttachView to other language, follow the
instructions below:
1. Run OutlookAttachView with /savelangfile parameter:
   OutlookAttachView.exe /savelangfile
   A file named OutlookAttachView_lng.ini will be created in the folder
   of OutlookAttachView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run OutlookAttachView, and all
   translated strings will be loaded from the language file.
   If you want to run OutlookAttachView without the translation, simply
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




SearchMyFiles v3.30
Copyright (c) 2009 - 2024 Nir Sofer
Web site: https://www.nirsoft.net



Description
===========

SearchMyFiles is an alternative to the standard "Search For Files And
Folders" module of Windows. It allows you to easily search files in your
system by wildcard, by last modified/created/last accessed time, by file
attributes, by file content (text or binary search), and by the file
size. SearchMyFiles allows you to make a very accurate search that cannot
be done with Windows search. For Example: You can search all files
created in the last 10 minutes with size between 500 and 700 bytes.
After you made a search, you can select one or more files, and save the
list into text/html/csv/xml file, or copy the list to the clipboard.

SearchMyFiles is portable, and you can use it from a USB flash drive
without leaving traces in the Registry of the scanned computer.



System Requirements
===================

This utility works on any version of Windows starting from Windows 2000
and up to Windows 11. Both 32-bit and 64-bit systems are supported.



Versions History
================


* Version 3.30:
  o Added option to find files according the file owner. You can
    specify multiple owner names to include or exclude (comma-delimited
    list). You can also use wildcard (e.g: admin*)
  o You can access this feature from the 'More Options' button.

* Version 3.25:
  o Fixed to save the configuration file (SearchMyFiles.cfg) as
    Unicode, so it'll save and load any non-English character correctly.

* Version 3.24:
  o Fixed bug: Under some conditions, SearchMyFiles displayed
    incorrect result when searching text inside files.
  o Fixed issue: When copying data to the clipboard or exporting to
    tab-delimited file, every line contained an empty field in the end of
    the line.

* Version 3.23:
  o Fixed the problem with the 'Choose Columns' window in high DPI
    mode.
  o Fixed to display folders with empty values in the Size column
    (Instead of '0').

* Version 3.22:
  o Fixed bug: SearchMyFiles displayed incorrect result when
    searching binary data that contained only zeros (e.g: 00 00 00 00).
  o Fixed the 'Copy Full Filenames Path' option to work in the
    correct order.

* Version 3.21:
  o Fixed a few high DPI mode issues (Status Bar, Default Columns
    Size)
  o When the main window of SearchMyFiles is large, the status bar
    section that shows the path while searching is also enlarged.

* Version 3.20:
  o Added filename length filter: You can find all files that their
    filename length or path length is longer than the specified number of
    characters.

* Version 3.17:
  o Added 'Explorer Context Menu - Folder Background' option. If you
    turn on this option, SearchMyFiles menu item will be added to the
    directory background context menu of Windows Explorer.

* Version 3.16:
  o Added option to choose another font (name and size) to display in
    the main window (In the View menu).

* Version 3.15:
  o Added new options to 'Summary Mode': 'Only folders with zero
    files and subfolders' and 'Only folders with zero files'
  o You can use the new options to search empty folders on your
    system: First, click the 'Reset To Default' button to ensure that all
    files are scanned. Type the base folder to search, choose 'Summary
    Mode' in the Search Mode combo-box and then choose one of the new
    options: 'Only folders with zero files and subfolders' or 'Only
    folders with zero files'. If you choose the first option, only
    completely empty folders without files or folders will be displayed.
    If you choose the second option, SearchMyFiles will also display
    folders with subfolders, as long as the folder and all its subfolders
    are empty from files.
  o Added 'Delete Selected Empty Folders' option to delete the empty
    folders found in the empty folders search. This delete option works
    only if the folder is completely empty, without files or subfolders.

* Version 3.11:
  o Added option to change the sorting column from the menu (View ->
    Sort By). Like the column header click sorting, if you click again
    the same sorting menu item, it'll switch between ascending and
    descending order. Also, if you hold down the shift key while choosing
    the sort menu item, you'll get a secondary sorting.
  o Updated to work properly in high DPI mode.

* Version 3.10:
  o Added 'Enter Key Action' option (Under the Options menu), which
    allows you to choose what to do when you press the Enter key: No
    Action, Open Properties Window, Open Selected File, Open With...,
    Open Folder, Select File In Explorer.
  o Added 'Double-Click Action' option, which which allows you to
    choose what to do when you double-click a file - No Action, Open
    Properties Window, Open Selected File, Open With..., Open Folder,
    Select File In Explorer. This option replaces the previous 'Open File
    On Double-Click' option.

* Version 3.07:
  o Fixed issue: When the 'Search Options' window was opened,
    multiple fields were selected (with blue color).

* Version 3.06:
  o Fixed bug from 3.05: The 'Time Range (Local Time)' option failed
    to work properly.

* Version 3.05:
  o Added option to specify time range in GMT.

* Version 3.01:
  o Added "Don't Save Search Options Window". If you turn on this
    option, SearchMyFiles will not save the settings of 'Search Options'
    in the .cfg file and the next time you run SearchMyFiles - this
    window will be loaded with the default settings.

* Version 3.00:
  o Added new option: 'Use Windows search handlers to find text
    inside Microsoft Office documents and other file types'.
  o When this option is turned on, you can also search text in pdf
    files as long as the PDF search handler of Microsoft
    (Windows.Data.pdf.dll) or PDF iFilter of Adobe is installed properly
    on your system.
  o When choosing the 'Find Folders' option, SearchMyFiles now
    displays only the folders that match the specified wildcard in the
    'Files Wildcard' field.

* Version 2.92:
  o Fixed the file size filter to work properly in bytes unit with
    size larger than 2 GB.
  o Added SearchMyFiles icon to the Explorer context menu.

* Version 2.91:
  o Added 'Duplicate Mark Color Set' (under the Options menu). You
    can choose 'Color Set 2' to mark the duplicate files with darker
    colors.

* Version 2.90:
  o Added 'Include Only Folders' field. You can use it if you want to
    only include specific folders in the search.
  o Wildcards are allowed here. You can specify multiple folders
    (comma-delimited list).
  o For example, if the base folder is c:\Shared and you want to
    search only subfolders with the name 'Images', you can specify the
    following wildcard in the 'Include Only Folders' field:
    c:\Shared\*\Images

* Version 2.85:
  o Added 'Compare Mode' for the 'Duplicate Names Search' option. You
    can choose to compare full name (the default) or to compare the name
    without the extension.

* Version 2.83:
  o Fixed issue: If you specify a search string in quotes that
    contain space characters (e.g: "Hello ") SearchMyFiles won't trim the
    space characters like it did in the previous versions.

* Version 2.82:
  o You can now specify in the 'Excluded Folders' field a folder name
    without path.

* Version 2.81:
  o Fixed to find files without extension when specifying '*.'
    wildcard.
  o Fixed bug: when specifying subfolder wildcard other than '*',
    SearchMyFiles scanned all subfolders ignoring the subfolders depth
    settings.

* Version 2.80:
  o Added 'Time Range And Date Range Separately' option. For
    example... You can search all files that their modified date is
    between 01/01/2015 - 01/01/2017 and their modified time is between
    08:00 - 10:00.
  o Fixed bug: SearchMyFiles created a csv file without header when
    using /SaveDirect command-line option with 'Add Header Line To
    CSV/Tab-Delimited File' option turned on.

* Version 2.78:
  o Added 'Entry Modified Time' column (Available only on Windows
    Vista or later with NTFS file system). SearchMyFiles retrieves this
    value only when 'Retrieve Entry Modified Time' option is turned on.

* Version 2.77:
  o When SearchMyFiles fails to delete a file it now displays the
    Windows error code and error description.

* Version 2.76:
  o Fixed SearchMyFiles to find UTF-8 string in a file.

* Version 2.75:
  o Fixed bug: SearchMyFiles failed to find text in a file if the
    text was located in certain positions inside the file.

* Version 2.74:
  o Fixed bug: When specifying the same folder to scan twice in
    Duplicate Search mode, SearchMyFiles displayed all files inside this
    folder as duplicate of themselves...

* Version 2.73:
  o Fixed issue: When specifying multiple wildcards, SearchMyFiles
    displayed a file multiple times if it was found by more than one
    wildcard.

* Version 2.72:
  o Added secondary sorting support: You can now get a secondary
    sorting, by holding down the shift key while clicking the column
    header. Be aware that you only have to hold down the shift key when
    clicking the second/third/fourth column. To sort the first column you
    should not hold down the Shift key.
  o Added new information to 'Attributes' column: 'T' for 'Temporary
    File', 'I' for 'Not Content Indexed', 'X' for 'No Scrub File', and
    'V' for 'Integrity Attribute'.

* Version 2.71:
  o Fixed bug: When using 'Duplicate Names Search' SearchMyFiles
    displayed only duplicate names of files that have the same size.

* Version 2.70:
  o The 'Duplicate Names Search' mode now has 4 sub-modes:
    - Show all duplicate names (Files and Folders)
    - Show all duplicate names - only files, no folders
    - Show only duplicate names with identical content
    - Show only duplicate names with non-identical content

  o Fixed bug: SearchMyFiles displayed an error message when
    searching in a volume shadow copy (e.g:
    \\?\GLOBALROOT\Device\HarddiskVolumeShadowCopy1 )

* Version 2.68:
  o You can now use wildcard in the 'Excluded Folders' field.

* Version 2.67:
  o The base folder and current search mode are now displayed in the
    window title.

* Version 2.66:
  o Added 'Wasted Space' column to the summary mode. This column
    shows the total wasted space on the specified folder, according to
    the cluster size of your disk. For example: if you have a file
    containing 1000 bytes and the cluster size is 4096 bytes, then the
    wasted space will be 4096 - 1000 = 3096 bytes. For files/folders that
    are not compressed, the 'Wasted Space' value will be the difference
    between the 'Size On Disk' and 'Total Files Size' values.
  o When you double-click on item in summary mode, SearchMyFiles now
    opens the properties window.

* Version 2.65:
  o Added 'Duplicate Names Search' mode, which allows you to find all
    files that have the same name, on different folders.

* Version 2.62:
  o When using the 'Open With...' option (F7), the 'Always use the
    selected program to open this kind of file' check-box is now turned
    off and disabled.

* Version 2.61:
  o Fixed bug: The Explorer context menu inside SearchMyFiles was
    empty on Windows 8 and Windows 10.

* Version 2.60:
  o Added 'Auto Size Columns On Search End' option.
  o Explorer context menu inside SearchMyFiles: When you right-click
    on a single item while holding down the shift key, SearchMyFiles now
    displays the context menu of Windows Explorer, instead of the
    SearchMyFiles context menu.
  o SearchMyFiles now displays a warning if you try to delete all
    copies of file in Duplicate Search mode.

* Version 2.56:
  o Fixed issue: When the search result contained a large amount of
    items, some actions, like selecting items and copying selected items
    to the clipboard were very slow.

* Version 2.55:
  o Added 'Duplicate Search Options' menu (Under the Options menu)
    with the following options: 'Show All Files' and 'Show Only Duplicate
    Files'.
  o SearchMyFiles now checks the base folders list, and if one or
    more folders cannot be found, it displays a warning message.
  o Added 'Run As Administrator' option (Ctrl+F11), which allows you
    to easily run SearchMyFiles as administrator on Windows
    Vista/7/8/2008, in order to scan folders that are not accessable to
    non-admin user.

* Version 2.52:
  o Fixed bug: SearchMyFiles failed to remember the last
    size/position of the main window and the search options window if
    they were not located in the primary monitor.

* Version 2.51:
  o Added 'Size on Disk' column to the standard search mode.

* Version 2.50:
  o Added 'Hide Empty Summary Folders' option. When it's turned on,
    all folders with 0 files are hidden in summary mode.

* Version 2.48:
  o Fixed bug from v2.46: SearchMyFiles stopped working on Windows
    2000.

* Version 2.47:
  o Added support for searching text inside a file using wildcard,
    for example: Nir?oft, NirSoft*Utilities.

* Version 2.46:
  o Fixed SearchMyFiles to handle daylight saving time properly, like
    Explorer on Windows 7.

* Version 2.45:
  o Added 'Clear Recent Files List' option to the 'Recent Config
    Files' menu.
  o You can now specify the search options from command-line using
    single-quote characters (instead of double-quotes). When
    single-quotes are used, you can specify double-quotes inside the
    search option value, for example:
    SearchMyFiles.exe /BaseFolder '"c:\temp\folder1", "c:\temp\folder2"'
  o Increased the width of the drop-down list for some fields in the
    'Search Options' window.
  o Added 'File Size Unit' option to change the size unit (Bytes, KB,
    MB, GB, or Automatic) on non-summary mode.
  o Added 'Automatic' to the 'Summary File Size Unit' option.

* Version 2.40:
  o SearchMyFiles now uses an internal wildcard parser instead of
    basing the search result on the wildcard parser of Windows. This
    change solves an annoying bug caused by Windows wildcard parser: In
    previous versions, SearchMyFiles sometimes returned incorrect
    results, because Windows also matches the wildcard with the short
    filename (8.3 DOS format).
  o Notice: The new wildcard parser may cause some compatibility
    issues, for example: When you scanned using *.* wildcard with Windows
    parser, it returned all files, including files without extension.
    With the new SearchMyFiles wildcard parser, *.* returns only files
    with extension. In order to return all files, you should use *
    instead of *.*
  o When loading old config files, SearchMyFiles automatically
    converts all *.* wildcards to *
  o The new wildcard parser has some advantages, for example: if you
    search for *.*.*.*, you'll get all files with 3 dot characters or
    more. With Windows wildcard parser in previous versions, you simply
    got the list of all files.
  o You can now exclude files by using wildcards list. You have to
    select this option from the combo-box, because the default option is
    to exclude files by extension.
  o You can now specify environment strings in the 'Base Folders' and
    'Excluded Folders' fields (For example: %AppData% )

* Version 2.35:
  o Added 'File Owner' column, which displays the owner of the found
    files, if the 'Retrieve File Owner' option is turned on.

* Version 2.30:
  o When choosing the 'Delete Selected Files' option, SearchMyFiles
    now shows a warning with red icon and the default answer is No, in
    order to prevent files deletion by mistake.
  o Added 'Auto Size Columns+Headers' option, which allows you to
    automatically resize the columns according to the row values and
    column headers.
  o Fixed issue: The properties and the other windows opened in the
    wrong monitor, on multi-monitors system.

* Version 2.26:
  o Fixed bug: SearchMyFiles displayed incorrect size/dates
    information for filename beginning with dot character (In duplicates
    search mode).
  o Fixed bug: SearchMyFiles missed the last non-duplicate file in
    non-duplicates search mode.

* Version 2.25:
  o Added 'Recent Config Files' menu, which allows you to easily open
    the last 10 configuration files that you used.

* Version 2.20:
  o Added support for finding text inside .xlsx files.

* Version 2.15:
  o Added support for finding text inside .docx and .docm files.

* Version 2.10:
  o Added /SaveDirect command line option, for using with the other
    save command-line options (/scomma, /stab, /sxml, and so on...)
    When you use the SaveDirect mode, the details of found files are
    saved directly to the disk, without loading them into the memory
    first. This means that you can save a list with large amount of files
    into your disk without any memory problem, as long as you have enough
    disk space to store the saved file. The drawback of this mode: You
    cannot sort the files list according to the name or any other column.
    The details of files are simply saved in the order that SearchMyFiles
    found them.
  o SearchMyFiles now allows you to use the save command-line options
    (/scomma, /stab, /sxml, and so on...) in summary mode.

* Version 2.06:
  o Fixed the Explorer context menu to work properly with folder
    names containing comma character. (You have to remove the context
    menu and then add it again in order to update the context menu with
    this fix)

* Version 2.05:
  o Added 'Close Options Window On Search Start' option. If it's
    turned on, the Search Options window is closed when you press the
    'Start Search' button.

* Version 2.00:
  o Added 'Summary Mode' which displays a general summary of all
    scanned folders, instead of files list. For every folder, the
    following summary information is displayed: Total size of all files,
    total size on disk, total files count, and number of
    hidden/read-only/system/compressed files. You can watch the summary
    information for the specified folder only or for the specified folder
    and all its subfolders.
  o Added 'Summary File Size Unit' and 'Include Subfolders in Summary
    Totals' options (under the Options menu), for using with the new
    Summary Mode.

* Version 1.82:
  o The 'Open Selected File' option now allows you to open multiple
    files. (The number of files that you can open at once is limited to
    20, because opening many files at once may hang your entire system)

* Version 1.81:
  o Added 'Short Filename' column, which displays the classic 8.3
    filename of every long filename.

* Version 1.80:
  o Drag & Drop support: You can now drag one or more files from
    SearchMyFiles into a folder of Windows Explorer or any other software
    that supports Drag & Drop of files.

* Version 1.76:
  o Added 'Duplicate Group' column for duplicate search mode. You can
    use this column to easily delete duplicate files found by the
    duplicate search mode: Simply click the 'Duplicate Group' header to
    sort the files list by duplicate groups, and then you can leave the
    first group (group number 1) and delete the other groups (2 and
    above).

* Version 1.75:
  o On multiple values search - added option to choose 'Or' (Find one
    of the values) or 'And' (Find all values).

* Version 1.72:
  o The size and position of the 'Search Options' window are now
    saved in the .cfg file and loaded in the next time that you run the
    SearchMyFiles utility.

* Version 1.71:
  o Added /ExplorerCopy command-line option, which allows you to
    automatically copy the search result into the clipboard in Windows
    Explorer format, and then paste the found files into another folder
    in Windows Explorer.
  o Added x64 version, for making proper search under system32
    directory of Windows. (On the 32-bit version of SearchMyFiles, the
    search is redirected to WOW64 folder).

* Version 1.70:
  o Added 'Scan NTFS symbolic links/junction points' option.
  o The date/time values are now saved/loaded in the .cfg file.
  o Added command-line options to set date/time range to scan:
    /FileTimeAccessed1, /FileTimeAccessed2 , /FileTimeModified1,
    /FileTimeModified2, /FileTimeCreated1, /FileTimeCreated2

* Version 1.66:
  o Fixed bug: SearchMyFiles failed to find any file when 'File
    Contains' option is set to none and you previously set SearchMyFiles
    to search only in alternate streams.

* Version 1.65:
  o Added option to search text inside alternate streams of NTFS file
    system. This feature can be useful if your want to locate a file by
    its summary information, like Title, Subject, Author, Keywords, and
    so on... because this information is stored inside alternate stream.

* Version 1.62:
  o Fixed bug: SearchMyFiles failed to load properly the
    configuration with 'Load From Config File' option.

* Version 1.61:
  o Added "File Doesn't Contain..." option, which allows you to find
    all files that doesn't contain the specified text/data.

* Version 1.60:
  o Added new search mode - 'Non-Duplicates Search' which allows you
    to find all files in the specified folders that are not duplicated.

* Version 1.56:
  o Added option to search multiple text/binary values, delimited by
    comma (in 'File Contains...' option)

* Version 1.55:
  o Added 'Minimize/Restore Both Windows At Once' option. When this
    option is turned on, minimizing/restoring the main window also
    automatically minimizes/restores the 'Search Options' window.

* Version 1.53:
  o Added 'Add Header Line To CSV/Tab-Delimited File' option. When
    this option is turned on, the column names are added as the first
    line when you export to csv or tab-delimited file.

* Version 1.52:
  o Fixed bug: When running SearchMyFiles with /BaseFolder
    command-line option or by using the Explorer context menu,
    SearchMyFiles sometimes started with the wrong folder.

* Version 1.51:
  o Added 'Explorer Context Menu' option. When it's turned on,
    'SearchMyFiles' menu item is added to the context menu of any folder
    in Windows Explorer. Choosing this menu item opens SearchMyFiles with
    selected folder as the base folder of the search.

* Version 1.50:
  o Added 'Exclude Extensions' option, which allows you to exclude
    one or more extensions from the search result. For example, if you
    specify 'exe dll ocx' in this field, exe/dll/ocx files won't be
    displayed in the search result.
  o When saving the search result to html, the files are now
    displayed as links that open the specified file.

* Version 1.48:
  o Fixed issue: Removed the wrong encoding from the xml string,
    which caused problems to some xml viewers.

* Version 1.47:
  o You can now send the search result to stdout by specifying an
    empty filename ("") in the command-line. (For example:
    SearchMyFiles.exe /stab "" >> c:\temp\search.txt)
  o Fixed bug: SearchMyFiles continued to search infinitely if the
    subfolder wildcard was empty.

* Version 1.46:
  o Fixed bug: pressing the Delete key in the 'Search Options' or in
    the find window activated the 'Move To Recycle Bin' option in the
    main window.

* Version 1.45:
  o The 'Search Options' window is now a Modeless dialog-box, which
    means that it won't be closed when you start the search and you can
    leave it open during the search and after the search is finished.
  o Added 'Set Focus On Search Start' and 'Set Focus On Search End'
    options to determine whether the focus is moved to the main window
    when the search is started and finished.

* Version 1.40:
  o Added /StartSearch command-line option, which allows you to start
    a search without displaying the Search Options window.
  o The 'Browse' button of 'Base Folders' and 'Excluded Folders' in
    the 'Search Options' window now allows you to add more than one
    folder, when one or more folders are already listed in the text-box.
  o Added 'File Position' and 'File Content' columns for file content
    search. When the 'File Contains' field is not 'None' (text or
    binary), the 'File Position' column displays the position (in bytes)
    that the data was found, and the 'File Content' column displays the
    characters around the found text/binary data.

* Version 1.37:
  o Fixed bug: On duplicate search, SearchMyFiles displayed zero size
    files.

* Version 1.36:
  o Fixed the location of 'Read Only' and 'System' labels, which was
    mistakenly changed in v1.35 release.

* Version 1.35:
  o New search mode: Duplicate Search - allows you to easily find
    duplicate files on your system. (See below)
  o Changed the delete accelerator key to Shift+Delete, like Explorer.

* Version 1.30:
  o Added 'Reset To Default' button that allows you to easily reset
    the 'Search Options' dialog-box.
  o Added 'Open File On Double-Click' option. When this option is
    checked, double-clicking a file will open it with the default
    program, like double-click in Explorer.
  o Added new actions that you can make on the selected files of the
    search result: Explorer Cut, Delete, Move To Recycle Bin, and Rename.
  o In the search option of file times, added 'Today' and 'Since Last
    Reboot'.
  o Added most-recently-used (MRU) list in combo-boxes of the search
    dialog-box. SearchMyFiles automatically remembers the last 10 strings
    that you used for every field, and allows you to easily select them
    from the Combo-Box. If you don't want that your last search strings
    will be saved in the .cfg file (from privacy reasons), you can select
    the "Don't Save MRU Lists" option in the Options menu.
  o Fixed the 'Subfolders Wildcard' issue according to users request.
    Just for example: In previous version, if you tried to search in c:\
    with abc*.* as subfolders wildcard, and you had a folder in
    c:\hello\bbbbb\abc123, SearchMyFiles utility didn't search in this
    folder even when abc123 folder matched the folder name, and that's
    because the folder below, bbbbb, wasn't match the subfolders
    wildcard. Starting from this version, SearchMyFiles scan all
    subfolders, even if they don't match the wildcard, but the actual
    file search is only made for subfolders that match the subfolders
    wildcard.

* Version 1.20:
  o Added /sort command-line option for sorting the search result you
    save from command-line.

* Version 1.16:
  o Added 'Copy Full Filenames Path' - Allows you to copy the list of
    selected filenames as a full path filenames list, delimited by enter
    (CRLF).

* Version 1.15:
  o Added command-line support.
  o Added 'Select File In Explorer' option.

* Version 1.10:
  o Fixed bug: Base folder combo-box limited the number of characters
    that you could type.
  o Added option to save/load all search option to .cfg file.
  o Added 'Explorer Copy' option - Allows you to copy the selected
    files and then paste them inside a folder of Windows Explorer.
  o Added 'Open With' option.
  o Added option to choose the subfolders depth to scan.

* Version 1.00 - First release.




Future Versions
===============

The following features might be added in future versions, according to
user requests and my own ideas:
* Add Explorer-like context-menu that will allow to do some actions on
  the files appeared in the search result.
* Search files by alternate stream data.
* Search the content of files by regular expressions.
* An option to search file names by regular expression, as alternative
  for wildcard search.



Using SearchMyFiles
===================

SearchMyFiles doesn't require any installation process or additional DLL
files. In order to start using it, simply run the executable file -
SearchMyFiles.exe
After running it, the 'Search Options' dialog-box is displayed. Select
the base folders or drives that you want to search, the wildcard, and
other search option that you need. After choosing the right search
option, click 'Ok' in order to start the search. While in search process,
the found files will be displayed in the main window. If you want to stop
the search, you can simply click the 'Stop' menu.

After the search is finished, you can select one or more files, and then
save the list into text/csv/html/xml file by using the 'Save Selected
Items' option. You can also select a single file and open it with the
default program by using the 'Open Selected File' option.



Search Options
==============

Here's a small explanation about all available search options:
* Base Folder: Specifies the folder that you want to scan. if 'Scan
  Subfolders' option is also checked, all subfolders under this folder
  will also be scanned. You can also specify multiple folders, delimited
  by semicolon. For example: c:\temp;d:\myfolder;d:\nirsoft
* Excluded Folders: Allows you to specify one or more folders
  (delimited by semicolon) that you want to exclude from the scan. For
  example: If you want to scan you entire C: drive, but without
  C:\Windows and C:\Documents and Settings, you should type 'C:\' in the
  Base Folder, and 'C:\Windows;C:\Documents and Settings' in the Excluded
  Folders field.
  You can also specify wildcard in this field, as well as folder name
  without path, for example:
  Release - Exclude all folders that their name is 'Release'.
  Documents* - Exclude all folders that their name begins with
  'Documents'.
* Include Only Folders: Allows you to restrict the search to specific
  folders. You can specify one or more folders (delimited by semicolon or
  comma) and wildcards are allowed.
  For example, if the base folder is c:\Shared and you want to search
  only subfolders with the name 'Images', you can specify the following
  wildcard in this field: c:\Shared\*\Images
  You can also specify wildcard without path, for example - for searching
  only in folders that their name begins with nirsoft , you can specify
  the following wildcard: nirsoft*
* Files Wildcard: Specifies the wildcard for scanning the files. You
  can specify multiple wildcards delimited by semicolon or by comma, for
  example: *.exe;*.dll;*.ocx or *.exe,*.dll,*.ocx. Be aware that if you
  want to search a filename containing semicolon or comma, you must put
  it in quotes. For example: "Hello, World.txt". If you don't put it in
  quotes, SearchMyFiles will consider it as 2 separated files.
* Subfolders Wildcard: Specifies the wildcard for scanning the
  subfolders. For example, If you want to only scan the subfolders
  beginning with 'a' letter, you can specify a*.* in this field.
* Exclude Files: Specifies one or more file extensions or wildcards to
  exclude from the search. You can specify multiple extensions or
  wildcards delimited by semicolon, by comma, or by space character, for
  example: exe, dll, ocx
* File Contains: Allows you to search by the content of the files. You
  can make a text search or binary search. On binary search, you should
  specify the binary sequence that you want to search in Hex dump format,
  for example: 'A2 C5 2F 8A 9E AC'.
* Search multiple values (comma delimited): When this option is
  selected, you can specify multiple values to search in the 'File
  Contains' field. The multiple values are delimited by comma, and
  optionally also with quotes.
  For example:
  NirSoft, Nir Sofer, Search, 123, "abc,123"
  A1 82 A7 AC, 27 9A CC FF, A1 B2 71 22
* File Size: Specifies that you want to search files in specified size
  range (For example: search all files with size between 238 and 741
  bytes).
* Attributes: Specifies that you want to search files with specific
  attributes. For example: if you want to find all files that are
  read-only but are not hidden, you should select 'Yes' for Read Only
  attribute and 'No' for Hidden attribute.
* File Time: Allows you to search files that have been created,
  modified, or accessed in the specified time range. You can specify an
  accurate time range (For example: 10/12/2008 12:32:11 - 12/12/2008
  13:32:56) or you can specify the last number of
  seconds/minutes/hours/days. For example, you can search all files that
  have been modified in the last 10 minutes.
* Search Subfolders: If this option is checked, SearchMyFiles will scan
  all subfolders under the specified base folders.
* Find Folders: If this option is checked, SearchMyFiles will search
  for folders according to the other search options. If this options is
  not selected, SearchMyFiles will only search for files.



Searching inside OneDrive folder
================================

In order to search inside OneDrive folder, you have to turn on the
following option: Scan NTFS symbolic links/junction points



Getting MD5/SHA hashes of the found files
=========================================

If you want to get the MD5/SHA hashes of the files that you found with
SearchMyFiles, you can easily do it with HashMyFiles utility.
First, in the SearchMyFiles window, select the desired files and press
Ctrl+E (Explorer Copy). In the HashMyFiles window, press Ctrl+V (Paste)
to add the files that you previously selected in SearchMyFiles.



Duplicate Search Mode
=====================

Starting from version 1.35, SearchMyFiles also allows you to search
duplicate files on your system. In order to use this feature, simply
change the search mode in the 'Search Options' window to 'Duplicates
Search'.
When you switch to 'Duplicates Search' mode, all other search options are
still relevant, and SearchMyFiles will scan your files according to these
settings. For example: if you choose to search for files larger than
500KB, SearchMyFiles will only search for duplicate files that their size
is larger than 500KB. In fact, it's highly recommended to narrow your
duplicate search by using date/size restrictions, because if you don't do
it, the duplicate search will be very slow, and it'll consume a large
amount of memory.

When you are in 'Duplicates Search' mode, SearchMyFiles will first scan
all files and folders according to your settings, and only after the scan
is finished, it'll locate the duplicate files and add them to the files
list on the main window. SearchMyFiles automatically mark the duplicate
files with identical colors (up to 64 different colors). There is also a
'Duplicate Number' column, which displays identical number for each chunk
of duplicate files. You can click the 'Duplicate Number' column header in
order to sort by this column and to easily view the chunks of duplicate
files.

Be aware that the duplicate search is done by making a binary comparison
of the files with the same size, byte by byte.



Non-Duplicates Search Mode
==========================

This mode is the opposite of Duplicate Search Mode, which means that it
displays all files in the specified folders that are not duplicated.



Duplicate Names Search Mode
===========================

In this mode, SearchMyFiles displays all files that have the same name.
The 'Duplicate Names Search' mode has 4 sub-modes:
* Show all duplicate names (Files and Folders)
* Show all duplicate names - only files, no folders
* Show only duplicate names with identical content: In this mode,
  SearchMyFiles first finds files with the same name, and then compares
  the content of these files, byte by byte. The files are displayed only
  if they are completely identical.
* Show only duplicate names with non-identical content: In this mode,
  SearchMyFiles first finds files with the same name, and then compares
  the content of these files, byte by byte. The files are displayed only
  if their content is not identical.



Summary Mode
============

In this mode, SearchMyFiles displays a general summary of all scanned
folders, instead of files list. For every folder, the following summary
information is displayed: Total size of all files, total size on disk,
total files count, and number of hidden/read-only/system/compressed
files. You can watch the summary information for the specified folder
only or for the specified folder and all its subfolders.



Search Empty Folders
====================

If you want to search empty folders on your system, follow the
instructions below:

1. Click the 'Reset To Default' button to ensure that all files are
   scanned.
2. Type the base folder to search.
3. Choose 'Summary Mode' in the Search Mode combo-box, and then in the
   nearby combo-box choose one of the following options: 'Only folders
   with zero files and subfolders' or 'Only folders with zero files'. If
   you choose the first option, only completely empty folders without
   files or folders will be displayed. If you choose the second option,
   SearchMyFiles will also display folders with subfolders, as long as
   the folder and all its subfolders are empty from files.

After the search of empty folders is completed, you can optionally delete
these empty folders by using the 'Delete Selected Empty Folders' option.
But before you do it, read this warning: Although deleting an empty
folder is relatively a safe action, it's possible that delete of empty
folders will cause a problem (For example: a software that expects a
specific directory structure, and doesn't work properly without it).
So when you choose to delete empty folders, it's your responsibility to
check every empty folder you want to delete and ensure it's ok to delete.
It's also recommended to export the empty directories list to a file, so
if there is a problem after the empty folders deletion, you'll be able to
easily create again the deleted empty folders.

Be aware that the 'Delete Selected Empty Folders' option will fail if
there are files or subfolders inside this folder or if you don't have
permission to delete the folder.



Command-Line Options
====================

You can use the following command-line option in order to execute a
search without displaying any user interface and save the result into a
file. Be aware that when you do that, the only way to stop the search is
by terminating the process of SearchMyFiles (SearchMyFiles.exe).

/config <Filename>
Loads the configuration from the specified .cfg file. Can be used in
conjunction with the save options, like /stext, /scomma and so on.

/StartSearch
Tells SearchMyFiles utility to start the search immediately, without
displaying the 'Search Options' dialog-box, according to the last
configuration or according to the config file specified in /config
parameter.

/ExplorerCopy
Search files without user interface according to the configuration file,
and then copy the found files list to the clipboard in Windows Explorer
format (Like 'Explorer Copy' option)

/SaveDirect
Save the files list in SaveDirect mode. For using with the other save
command-line options ( /scomma, /stab, /sxml, and so on...)
When you use the SaveDirect mode, the details of found files are saved
directly to the disk, without loading them into the memory first. This
means that you can save a list with large amount of files into your disk
without any memory problem, as long as you have enough disk space to
store the saved file. The drawback of this mode: You cannot sort the
files list according to the name or any other column. The details of
files are simply saved in the order that SearchMyFiles found them.

/stext <Filename>
Search and save the result into a regular text file.

/stab <Filename>
Search and save the result into a tab-delimited text file.

/scomma <Filename>
Search and save the result into a comma-delimited text file (csv).

/stabular <Filename>
Search and save the result into a tabular text file.

/shtml <Filename>
Search and save the result into HTML file (Horizontal).

/sverhtml <Filename>
Search and save the result into HTML file (Vertical).

/sxml <Filename>
Search and save the result to XML file.

/sort <column>
This command-line option can be used with other save options for sorting
by the desired column. If you don't specify this option, the list is
sorted according to the last sort that you made from the user interface.
The <column> parameter can specify the column index (0 for the first
column, 1 for the second column, and so on) or the name of the column,
like "Filename" and "Created Time". You can specify the '~' prefix
character (e.g: "~Created Time") if you want to sort in descending order.
You can put multiple /sort in the command-line if you want to sort by
multiple columns.

Examples:
SearchMyFiles.exe /shtml "f:\temp\1.html" /sort 2 /sort ~1
SearchMyFiles.exe /shtml "f:\temp\1.html" /sort "~Extension" /sort
"Filename"

/nosort
When you specify this command-line option, the list will be saved without
any sorting.

You can also use the following command-line option to override the
configuration loaded from the .cfg file:



/FilesWildcard <Wildcard>
Specifies the files wildcard.

/SubfoldersWildcard <Wildcard>
Specifies the subfolders wildcard.

/BaseFolder <Folder>
Specifies the base folders to search.

/ExcludedFolder <Folder>
Specifies the folders to exclude in the search.

/ScanSubfolders <0 | 1>
Specifies whether to search in subfolders. 1 = Yes, 0 = No.

/ExcludeExtensions <Extensions>
Specifies one or more extensions to exclude.

/FindFiles <0 | 1>
Specifies whether to find files. 1 = Yes, 0 = No.

/FindFolders <0 | 1>
Specifies whether to find folders. 1 = Yes, 0 = No.

/UseFileSizeAtLeast <0 | 1>
/UseFileSizeAtMost <0 | 1>
Specifies whether to use the "At Least" and "At Most" file size filter. 1
= Yes, 0 = No.


/FileSizeAtLeast <Value>
/FileSizeAtMost <Value>
Specifies the values of file size filters.


/FileSizeAtLeastUnit <Value>
/FileSizeAtMostUnit <Value>
Specifies the units of file size filters. 1 = Bytes, 2 = KB, 3 = MB, 4 =
GB


/FileAttrReadOnly <Value>
/FileAttrSystem <Value>
/FileAttrHidden <Value>
/FileAttrArchive <Value>
/FileAttrCompressed <Value>
/FileAttrEncrypted <Value>
Specifies the file attributes filter. 1 = Both, 2 = No, 3 = Yes.

/FileContains <Value>
Specifies the 'File Contains' option. 0 = None, 1 = Text, 2 = Binary, 3 =
Wildcard.

/FileContainsText <String>
Specifies the 'File Contains' text.

/FileContainsCaseSensitive <0 | 1>
Specifies whether the 'File Contains' string is case sensitive. 1 = Yes,
0 = No.


/FileTimeCreated <Value>
/FileTimeModified <Value>
/FileTimeAccessed <Value>
Specifies the filter option by file time. 0 = All Times, 1 = Time Range,
2 = Last XX Seconds, 3 = Last XX Minutes, 4 = Last XX Hours, 5 = Last XX
Days.


/FileTimeCreatedLastXX <Value>
/FileTimeModifiedLastXX <Value>
/FileTimeAccessedLastXX <Value>
Specifies the last xx seconds/minutes/hours/days values.


/FileTimeAccessed1 <Value>
/FileTimeAccessed2 <Value>
/FileTimeModified1 <Value>
/FileTimeModified2 <Value>
/FileTimeCreated1 <Value>
/FileTimeCreated2 <Value>
Specifies date/time range values. The date/time value must be in the
following format: dd-mm-yyyy hh:nn:ss

For example:
SearchMyFiles.exe /FileTimeModified1 "10-01-2010 12:00:00"
/FileTimeModified2 "18-01-2010 08:00:00"

/SubFolderDepth <Value>
Specifies the subfolders depth. 0 = Unlimited.

/UseMaxNumOfFiles <0 | 1>
Specifies whether to limit the number of files to find. 1 = Yes, 0 = No.

/MaxNumOfFiles <Value>
Specifies the maximum number of files to find.

/SearchMode <1 | 2>
Specifies the search mode. 1 = Standard Search, 2 = Duplicate Search.

Examples:
SearchMyFiles.exe /scomma c:\temp\bfiles1.csv /FilesWildcard b*.*
SearchMyFiles.exe /config c:\temp\myconfig.cfg /BaseFolder "c:\Program
Files" /shtml c:\temp\result.html
SearchMyFiles.exe /stab c:\temp\searchfiles.txt



Translating SearchMyFiles to other languages
============================================

In order to translate SearchMyFiles to other language, follow the
instructions below:
1. Run SearchMyFiles with /savelangfile parameter:
   SearchMyFiles.exe /savelangfile
   A file named SearchMyFiles_lng.ini will be created in the folder of
   SearchMyFiles utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run SearchMyFiles, and all
   translated strings will be loaded from the language file.
   If you want to run SearchMyFiles without the translation, simply
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

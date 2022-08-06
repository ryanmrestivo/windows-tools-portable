


FoldersReport v1.21
Copyright (c) 2003 - 2005 Nir Sofer



Description
===========

The FoldersReport utility scans a drive or a base folder that you select,
and displays essential information for each folder that it finds: The
size of all files inside the folder, The real files size on the disk,
number of files inside the folder, number of hidden files, number of
compressed files, and number of subfolders. You can use this utility to
easily find out which folders use the most space in your drive. You can
scan the folders of your local drives, CD-ROM drives, and network
resources on a remote computer.



Versions History
================




24/09/2005
1.21

* Fixed bug in properties window.
* Added Modified Date column.


13/06/2005
1.20

* Choose Columns dialog-box.
* Added more accelerator keys.
* New columns: counter for read-only and system files.
* Added support for Windows XP style.
* Copy selected items - now copies as tab delimited text, so you can
  paste it into Excel.


22/07/2003
1.10

* Fixed a small memory leak from the previous version
* Save as - vertical HTML file.
* HTML Reports (View menu)
* All numbers are now displayed according to the digit grouping
  character in your regional settings.


29/06/2003
1.00
First Release.



System Requirements
===================

This utility can work in all 32-bit Windows operating systems: Windows
9x/ME, Windows NT, Windows 2000, and Windows XP.



Know Problems
=============


* If you scan a remote network NTFS drive of Windows NT/2000 from a
  Windows 9x/ME machine, the "Size On Disk" field may contain wrong
  values, and you should not rely on it.
* On Windows NT/2000: If a folder is compressed, the "Size On Disk"
  field may contain a value that a little different from the "Size On
  Disk" value in the Properties window of the operating system. It's
  possibly caused by a bug in Windows operating system...



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



Using FoldersReport
===================

This utility is a standalone executable, and it's doesn't require any
installation process or additional DLLs. Just run the executable
(folrep.exe), and start using it. After you run it, select a drive or
folder that you want to scan, and press the "scan" button. The scanning
process might take between a few seconds and a few minutes, depending on
the size of the folder and the subfolders inside it, and on the speed of
your hardware. After the scanning is finished, the information about all
subfolders is displayed on the main window of FoldersReport. You can
select the desired folders, and save the information into text or html
file, or copy it to the clipboard.
here's a little explanation about each column in the main window:



Folder
The full path name of the folder. If the "Tree Mode" option is checked,
only the folder name is displayed, without the entire path.

Size Of Files
The total size of all files in the specified folder. if "Include
Subfolders In Totals" is checked, this value includes the size of all
files inside the subfolders of this folder.

Size On Disk
The total size on the disk of all files in the specified folder. if
"Include Subfolders In Totals" is checked, this value includes the 'size
on disk' of all files inside the subfolders of this folder.
The value shown at this column is similar to the "Size On Disk" value in
the properties window of a folder. It's adjusted according to the cluster
size of the drive and the compression of the files in it (in NTFS drives
only). On FAT drives, this value might be much greater than the "Size Of
Files" value, especially if the files are very small.
Be aware that this column may show wrong values if you scan a remote NTFS
drive from Windows 98/ME machine, especially if the files are compressed.

Files
The number of files inside the folder. if "Include Subfolders In Totals"
is checked, this value includes the number of files in all subfolders
inside this folder.

Hidden
The number of hidden files inside the folder.

Compressed
The number of compressed files inside the folder. (Only relevant to NTFS
drives)

Read Only
The number of read only files inside the folder.

System
The number of system files inside the folder.

Folders
The number of subfolders inside the folder. if "Include Subfolders In
Totals" is checked, all subfolders in the hierarchy are counted.
Otherwise, only the subfolders in the first level of the hierarchy are
counted.

Created Date
The time and date that the folder was created.

Modified Date
Last modified time/date of the folder.

Be aware that the "Include Subfolders In Totals" option under the View
menu determines the way that most column values are calculated. If this
option is checked, the values are calculated for the specified folder and
all its subfolders. If this option is not checked, the values are
calculated only for the specified folder, without counting the files
inside its subfolders.
For example: Let's say that the root folder of your C:\ drive contains 25
files. If the above option is not checked, the "files" column for 'C:\'
will display '25' files. If this option is checked, the "files" column
for 'C:\' will display the number of files in the entire drive.



Feedback
========

If you have any problem, suggestion, comment, or you found a bug in my
utility, you can send a message to nirsofer@yahoo.com



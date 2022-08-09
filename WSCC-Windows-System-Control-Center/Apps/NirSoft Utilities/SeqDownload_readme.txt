


SeqDownload v1.26
Copyright (c) 2003 - 2010 Nir Sofer



Introduction
============

Many Web sites provides "live" images that are automatically updated
every few seconds or minutes. When you browse to a Web page with live
image, you always get the latest image from the last few minutes. But
what about viewing some historical images from a few days ago, or
watching the animation of the images from the last few hours ?? Some Web
sites provides limited options to do that, but most Web sites only allows
you to watch the latest image.

This utility allows you to automatically download an image file in every
few seconds or minutes (according to your selection), and save it to your
local drive. After collecting a fair amount of downloaded images in your
local drive, you can easily create beautiful animation from the
downloaded images or simply watch the historical images on your local
download folder. You can also use this utility to frequently download
non-image files, and store them on your local drive, so we'll always have
in your computer the latest file from the remote Web site.
This utility is especially useful for live cams Web sites, weather radar
images, and satellite images.




System Requirements
===================

This utility can work in all 32-bit Windows operating systems: Windows
9x/ME, Windows NT, Windows 2000, Windows XP, and Windows Vista. On very
old systems (Windows 95 or Windows NT), version 4.0 (or newer) of
Internet Explorer must be installed.

Versions History
================


* Version 1.26:
  o Added 'Accept' line to the header of the HTTP requests, because
    some servers returns 'Not Acceptable' error if this line doesn't
    exist.

* Version 1.25:
  o The configuration is now saved to .cfg file instead of the
    Registry

* Version 1.20:
  o Fixed the crash problems under Windows XP and Vista.
  o Added support for FTP.
  o A tooltip is displayed when a string in a column is longer than
    the column length.
  o New option: Save Only On Exit. Turn on this option if you have a
    lots of download items and SeqDownload works too slowly.

* Version 1.12:
  o Rolling Mode: Allows you to keep only the latest XX images. (XX =
    specified number of images).
  o Ability to load the image from your local drive instead of
    downloading it from the Internet. (Assuming that another program or
    another entry in SeqDownload update this file frequently)

* Version 1.11: Added support for Windows XP visual styles.
* Version 1.10:
  o Animation Delay: Allows you to set a delay after the entire
    animation sequence is completed.
  o HTML Template (For advanced users): allows you to edit the html
    code of the animation page.
  o New accelerator keys added.

* Version 1.01:
  o Fixed bug: the tray icon disappeared after restarting Explorer.
  o Embeded date in download folder. For example:
    D:\download\|ddmmyyyy|
  o User/Password fields for password-protected Web sites.

* Version 1.00 - First release.



Using SeqDownload
=================

The SeqDownload utility is a standalone executable, and it doesn't
require any installation process or additional DLLs. In order to start
using it, simply extract the files to any folder you want, and run the
executable file (seqdownload.exe). If you want, you can also install
SeqDownload on your computer with full uninstall support, by downloading
and running the self-install executable file.
If you want, you can also install SeqDownload with full uninstall
support, by using the self-install executable file.

After you run the utility, follow the instructions below in order to
start downloading the sequence of files:
1. First, you have to find out the HTTP address of the file or image
   that you want to download: Browse to the Web site that contains the
   image you wish to download, and then right-click on the image that you
   want to download. From the popup menu, select "Properties", and you'll
   get the properties page of the image that also contains the URL
   address. You can select the URL address, copy it to the clipboard for
   using it in the next step. Alternatively, You can use the 'Run From
   Internet Explorer Context Menu' option In order to automatically
   obtain the URL from the image and copy it to the download window of
   SeqDownload.
2. In SeqDownload utility: From the File menu, select "New Download
   Item" (or press Ctrl+N). Paste or type the URL address into the URL
   field. Modify the other fields according to your needs, and press the
   "Create New Item" button. For explanation about each field in the
   Download Properties window, read below.
3. After you create the download item, the file is automatically
   downloaded every xxx time (according to what you have selected in the
   download window.) Also, a new line is added to the main screen, in
   order to show you the current status of this download item.
   If you want to run SeqDownload in the background without viewing the
   main window, You can select the "Run In System Tray" option from the
   Options menu. After that, you can close the main window of
   SeqDownload, and it'll continue to download your files in the
   background. Whenever you want to view the main window again,
   double-click the SeqDownload icon in the system tray.



The 'Download Properties' window
================================

In the Download Properties window, you determine the configuration of the
download item. When you create a new item, you get this window with the
defaults values, and you can change them according to your needs. Also,
you can always return later to this window and change the configuration
of the download item, even while it's active.

Here's a little description for each option in this window:


Download Name
The name or the description of the download. This field is only for using
by you. The SeqDownload utility doesn't use the value at this field, it
only displays on the screen. So you can type here whatever you want.

URL / Filename
The URL address of the resource that you want to download. If you want to
download image files, you must type here the URL of the image itself, not
the URL of the HTML page that contains the image.

Starting from version 1.12, you can also type a path of filename of you
local drive. You can update this file by using another program, or by
adding another download entry in SeqDownload that will update the
specified file from a Web site.

Download Folder
All the downloads of this item will be saved to this folder. If you want
to scatter the downloaded files into multiple subfolders, you can add
special embedded date format to the folder name. For Example: If you set
the download folder to 'c:\MyFiles\|yyyymmdd|', a new sub folder folder
will be create every day by using the date format you type. In the above
sample, if the current date is 25/08/2003, the downloaded files will be
saved into c:\MyFiles\20030825

Download Every
The time interval between the downloads. For example: If you want to
collect a sequence of weather radar images that are updated every 5
minutes, you should set this value to 5 minutes.

Save to the same filename every time
If you select this option, the downloaded filename is always saved to the
filename you specify, and overwrites the previous download. If you select
this option, you won't be able to create animation, because only the last
download is stored on your local drive.

Format the filename according to download date/time
If you select this option, the downloaded filename is the combination of
the prefix and the format of the current date/time.
For example: If the filename prefix is "MyFile", the file extension is
"GIF", the date/time format is "yyyymmdd-hhnn", and the filename is
downloaded on 10/10/2003 at 12:21, the final filename will be
"MyFile20031010-1221.gif"

Format the filename with counter
If you select this option, the downloaded filename is the combination of
the prefix and a counter, which increases by one in each download. The
"Leading Zeros" field determines the minimum number of digits in the
counter.
For example: If the filename prefix is "MyFile", the file extension is
"GIF", the "Leading Zeros" value is 3, and the current counter value is
5, the final filename will be "MyFile005.gif"

Format
The date format string. You can select one of the predefined formats, or
create your own format, by using the combinations of the following
symbols:
dd for day in month (01 - 31)
mm for month (01 - 12)
yy for 2-digit year
yyyy for 4-digit year
hh for hour of day (00 - 23)
nn for minutes in hour (00 - 59)
ss for seconds (00 - 59)

Leading Zeros
The number of leading zeros in the counter (If you choose to format the
filename with counter)

Rolling Mode
If this option is selected, SeqDownload will only keep the latest XX
images, accoring to the number of images specified in the combo-box.

Filename Prefix
The sequence of characters that appears in the beginning of the
downloaded filename.

Extension
The file extension of the downloaded files, like GIF, JPG, and so on...

Save to a new filename only if the file has been modified since last
download
Let's say that you download a file from a Web site for every 60 seconds,
but the file is updated on the Web site only every 5 minutes. If this
option is checked, SeqDownload will create a new file every 5 minutes,
and all other files will be deleted.

Disabled
If the item is disabled, SeqDownload won't download anything... until you
switch it to enabled status.

Start Download From
The time range that the download item will be active. You can use these
fields to schedule your downloads. For example: you can schedule to
download files only tomorrow between 08:00 and 11:00.

Continue Until

User / Password
You can use these 2 fields for password-protected Web sites. Be aware
that the password is not secured, and it's saved as plain text in the
downloads ini file.



The Options Menu
================

The following options are available under the Options menu:



Show Grid Lines
If this option is selected, grid lines are displayed around the download
items list.

Run In System Tray
If this option is selected, the icon of SeqDownload is added to the
system tray. In this state, you can close the main window , and
SeqDownload will continue to run in the background. Whenever you want to
return to the main window, you should double-click the icon.

Run At Startup
If this option is selected, SeqDownload will be automatically loaded
after you restart Windows.

Hide The Main Window At Startup
If this option is selected, and SeqDownload is configured to
automatically run at startup, the main window won't be displayed when it
loaded at Windows startup.

Ask Before Any Action
If this option is selected, SeqDownload will ask for your permission
before doing any action. For example: If you click the "Disable" button,
SeqDownload will ask you if you want to disable the selected items.

Run From Internet Explorer Context Menu
If this option is selected, a new menu item is added to the context menu
of Internet Explorer. If you click with the right mouse button on a
picture inside a Web page, you'll see a menu item named "Download With
SeqDownload". If you click this menu item, the Download Properties will
be appeared with the URL of the image file - to allow you to easily add
an image to the download list.
Notice: This options works properly in most Web sites, but not in all of
them. In some cases, you might get the wrong URL.



Creating Animation
==================

After you collect a fair amount of downloaded images, you can easily
create nice animation from these images. In order to do that, select
"JavaScript Animation" from the File menu (or click the Animate button).
In the animation window, you should select the files that will be added
to the animation. You can also change the order of the images in the
animation, by moving the files up or down. In most cases, you won't need
to use this option, because the files are automatically sorted by the
modification date.
The animation is activated by creating HTML page with JavaScript, and
running it in your default browser. This animation can be displayed in
all advanced versions of Internet Explorer, Netscape, and Opera. However,
if you want to run the animation on older browser, you should uncheck the
'Allow to pack all animation files in mht file' option.



Packing animation into one file
===============================

Internet Explorer allows you to pack the entire Web page into single mht
file, including the files and images in it. You can also apply this
feature on the animation page created by SeqDownload as long as the
'Allow to pack all animation files in mht file' option is checked. The
mht file created in this way contains all images need for the animation.



Using HTML Template (For advanced users)
========================================

When you choose to create Javascipt animation, SeqDownload uses the
default html template to create the animation page. Starting from version
1.10, you can modify the default HTML template in order to customize the
animation page that SeqDownload utility creates.
If you want to create the animation from your own HTML template, follow
the instructions below:
1. Load template.html into a text/html editor.
2. Modify the file according to your needs. You can change/add style
   sheetes, add background image, add more images/text to the page, and
   so on. However, you should not change the variable names in the
   Javascript code, and you should not remove the
   "<!--***NIRSOFT_CODE***-->" string. If you do so, the animation may
   not work. After you make the desired changes, save them into a new
   filename.
3. In the animation dialog-box, check the "HTML Template" option, and
   select the html filename that you saved earlier.
4. When you click the "Create Animation" button, SeqDownload uses your
   HTML file to create the animation page. The
   "<!--***NIRSOFT_CODE***-->" string is replaces by additional code
   needed for loading the images.



Command-Line Options
====================




/ini ["Downloads Filename"]
By default, the list of download items is loaded from downloads.ini in
the same folder of SeqDownload. By using this option, you can start
SeqDownload with another downloads list (instead of using the default
file). If you sepcify a downloads filename that doesn't exist, it'll be
automatically created for you.
Example:
SeqDownload /ini "c:\temp\mydownloads.ini"

/url ["URL Address"]
Open a new download properties window with the specified URL.
Example:
SeqDownload /url "http://192.168.0.10/test.gif"

/NoLoadSettings
Load SeqDownload without your last settings.



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



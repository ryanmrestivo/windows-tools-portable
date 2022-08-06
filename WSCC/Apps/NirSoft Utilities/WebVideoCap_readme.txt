


WebVideoCap v1.41
Copyright (c) 2007 - 2011 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

While watching a video in a Web site, you may sometimes want to save the
video into your local drive, and then play it offline later. This utility
allows you to capture .flv (Flash Video) files and RTSP/MMS video streams
while the Web browser download and play them inside a Web page. After the
entire video file is downloaded and played by the Web browser, the video
file is saved in the folder that you selected, and you can play it
offline later with any Video player.
WebVideoCap can capture the video files of most popular video-sharing
sites, including YouTube, Google Video, Yahoo Video, iFilm, Metacafe,
Putfile, and more...



System Requirements
===================

This utility works on Windows 2000/XP/2003/Vista. Older versions of
Windows are not supported. Be aware that under Windows 2000/XP,
WebVideoCap can only capture the video files if you log on as a user with
admin rights.
In order to use WebVideoCap under Windows Vista with SP1, you must
download and install the WinPcap driver, and select the WinPcap driver as
the capture method.



Versions History
================


* Version 1.41:
  o Fixed WebVideoCap to capture the .mp4 files of dailymotion.com
    and probably other Web sites.

* Version 1.40:
  o Fixed issue: WebVideoCap failed to capture .flv files in YouTube
    and probably other video sites, due to small change in the video
    servers.

* Version 1.38:
  o Added Promiscuous Mode option for WinPCap capture in Advanced
    Options window, which is disabled by default. In previous versions,
    WebVideoCap always worked in Promiscuous Mode, but in some wireless
    cards, the network packets cannot be captured at all in this mode.

* Version 1.37:
  o Fixed bug: WebVideoCap crashed on some mms/RTSP streams.

* Version 1.36:
  o Fixed small bug: The .MP4 capture option was enabled during
    capture.

* Version 1.35:
  o Added support for capturing .MP4 files played by Flash.

* Version 1.33:
  o Fixed bug: WebVideoCap failed to capture Silverlight mms streams.

* Version 1.32:
  o Fixed bug: WebVideoCap failed to capture MMS streams in
    non-chunked mode.

* Version 1.31:
  o Fixed bug: WebVideoCap failed to capture some RTSP streams.

* Version 1.30:
  o Added support for capturing with WinPcap driver (for using with
    Vista/SP1)

* Version 1.27:
  o Main dialog-box is now resizable.

* Version 1.26:
  o Fixed bug: WebVideoCap failed to capture .flv files properly if
    there was more than one .flv file in the same http connection. (like
    in ABC News site)

* Version 1.25:
  o Added support for .swf files.

* Version 1.20:
  o Added in 'Advanced Options': 'Keep the captured files opened
    until the capture is finished'.

* Version 1.19:
  o Added error messages when the starting the capture process fails.

* Version 1.18:
  o Added new option: Automatically delete captured files smaller
    than...

* Version 1.17:
  o Added 'Advanced Options' window, that allows you to control the
    capture buffer size.
  o Fixed the tab order in the main window of WebVideoCap.

* Version 1.16 - Added support for another type of .wmv stream.
* Version 1.15 - Added support for capturing MMS streams.
* Version 1.10 - Added support for capturing .wmv files and RTSP
  streams.
* Version 1.01 - Fixed bug: WebVideoCap failed to capture files if
  computer name was 'localhost'.
* Version 1.00 - First release.



Known Limitations
=================


* Currently, WebVideoCap can only capture the following types of video
  streams:
  o Flash video files (with .flv extension).
  o Microsoft Windows media files (with .wmv extension).
  o RTSP streams. (RTSP protocol is used by many news and live
    TV/radio Web sites)
  o MMS streams. (MMS protocol is used by many news and live TV/radio
    Web sites)

  Support for more types of video or audio streams may be added in future
  versions.
* While capturing RTSP/MMS streams, WebVideoCap save the video raw data
  into the file in a format that you won't be able to play it. Only after
  you press the 'Stop Capture' button, the captured .wmv file is
  converted into a format that will allow you to play it with a Video
  player.
* If you use the Windows Media Player to play a video file captured
  from RTSP/MMS stream, you won't be able to move it forward or backward.
* If the video file is already saved in your browser's cache,
  WebVideoCap won't be able to capture it. However, in that case, you can
  retrieve the cached video file by using the VideoCacheView utility.
  Alternatively, you can simply clear the cache of your Web browser, and
  then reload the video Web page.



Using WebVideoCap
=================

WebVideoCap doesn't require any installation process or additional DLL
files. In order to start using it, simply run the executable file -
WebVideoCap.exe
(However, if you have Vista with SP1, you have to download and install
the WinPcap driver)
After you run it, the main window of WebVideoCap is displayed. First, you
have to select the folder that you want to save the captured video files.
By default, the save folder is located in the 'files' folder under the
folder of the executable file. If you have more than one network or
dialup adapter, you should also select the right adapter.
After that, you can click the 'Start Capture' button. While WebVideoCap
is in capture mode, open your browser in a video Web page. If everything
goes right, you should see a new video file created and grown inside the
folder that you have selected. You can continue watching more Web site
videos while WebVideoCap capture the video files in the background. After
you finish, click the 'Stop Capture' button.




Playing The Video Files
=======================

Most Web sites today use Flash video files (.flv extension) for playing
video inside the Web page.
WebVideoCap doesn't provide a build-in video player, but you can use any
flv player to play the video files that you captured with WebVideoCap.

If you don't have a video player that can play .flv files, you may try
one of the following freeware solutions:
* Applian FLV Player (Free)
* GOM Player



Capture Buffer Size
===================

Starting from version 1.17, WebVideoCap allows you to control the capture
buffer size, in the 'Advanced' options window. In most cases, you should
not change this value. However, if the files that you capture are
corrupted, increasing this 'Buffer Size' value may solve the problem.



Keep the captured files opened until the capture is finished
============================================================

If you have a very fast Internet connection, and the files that you
capture are corrupted even after increasing the buffer size, selecting
this option should increase the performances of saving the video files to
disk, and thus it may solve corrupted files problems.
However, be aware that when you choose this option, the capture files
will be remained open until you stop the capture process by clicking the
"Stop Capture" button.



Translating WebVideoCap to other languages
==========================================

In order to translate WebVideoCap to other language, follow the
instructions below:
1. Run WebVideoCap with /savelangfile parameter:
   WebVideoCap.exe /savelangfile
   A file named WebVideoCap_lng.ini will be created in the folder of
   WebVideoCap utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run WebVideoCap, and all
   translated strings will be loaded from the language file.
   If you want to run WebVideoCap without the translation, simply rename
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

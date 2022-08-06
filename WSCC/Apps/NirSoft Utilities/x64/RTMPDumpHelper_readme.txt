


RTMPDumpHelper v1.22
Copyright (c) 2012 - 2018 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

RTMPDumpHelper is a small utility that can help you to easily download
RTMP video/audio streams. By combining this utility and the proxy server
of RTMPDump toolkit, you can simply open a Web page containing RTMP video
stream in your favorite Web browser, and while watching the video, it'll
be saved to your disk automatically as .flv or .mp4 file.
RTMP is a streaming protocol used by Hulu, justin.tv, and by many live
streaming Web sites.



How it works
============


* When you run RTMPDumpHelper utility, it automatically detects your
  Web browser and attaches to it a small dll file - RTMPDumpHelper.dll
* When the attached dll of RTMPDumpHelper detects that RTMP connection
  (TCP Port 1935) is initiated by your Web browser, it automatically
  redirects the connection to your own computer (connection to 127.0.0.1)
* The proxy of RTMPDump toolkit (rtmpsuck.exe) receives the redirected
  connection and downloads the RTMP stream to your hard drive. It also
  sends the downloaded RTMP stream back to your Web browser, so you can
  continue watching the RTMP video stream while it's downloaded by
  RTMPDump toolkit.
* Be aware that effect of RTMPDumpHelper is only temporary. Once you
  exit from RTMPDumpHelper, the dll will be detached from your Web
  browser, and you'll be able to use your Web browser normally (Without
  the RTMP redirection).



System Requirements
===================


* This utility cannot download RTMP streams by itself. You have to
  download the RTMPDump toolkit separately from
  http://rtmpdump.mplayerhq.hu Web site and put it in the same folder
  that you extracted the files of RTMPDumpHelper.
* All versions of Windows are supported, starting from Windows XP and
  up to Windows 8. You can also use this tool on x64 systems, but the Web
  browser itself must be a 32-bit application. In the future, I'll
  probably release x64 version of RTMPDumpHelper to work with 64-bit Web
  browsers.
* Web Browser - Generally, RTMPDumpHelper should be able to work with
  all Web browsers. If you use a portable Web browser (without
  installation), you have to manually add it to the Web browsers list, by
  using the 'Add Support For Web Browser' option (F8).



Known Issues
============


* Be aware that RTMP is a dying technology, many Web sites top using
  it, and the most popular Web browsers (Chrome and Firefox) don't enable
  it by default.
* New versions of Web browsers added security features to prevent other
  programs from loading DLL into their process, which also causes
  RTMPDumpHelper to stop working.
* Overwriting issue: Some people complains that RTMPDump overwrites
  existing streams that it downloaded previously. If you have this
  Overwriting problem too, there is a patch of RTMPDump toolkit that
  should solve this problem. You can download it from the following link:
  https://github.com/K-S-V/Scripts/releases
* When the proxy of RTMPDump toolkit (rtmpsuck.exe) saves .flv file
  into your hard drive, the filename is created without .flv file
  extension. This means that you may need to manually change the file
  extension to .flv in order to play the file in your default video
  player.
* When using Chrome Web browser, you'll see some 'Failed to attach to
  Web browser' messages, but the RTMP downloading will work properly.



Using rtmpsrv.exe instead of rtmpsuck.exe
=========================================

In some Web sites, rtmpsuck fails to capture and download the RTMP stream
properly. In order to solve the problem, you can go to the RTMPDump
Options Window (By pressing F9) and choose to run the RTMP Server
(rtmpsrv.exe) instead of rtmpsuck.exe
Be aware that when using rtmpsrv.exe, you'll not be able to watch the
video stream inside your browser, and rtmpsrv.exe will download the
stream separately.



Versions History
================


* Version 1.22:
  o RTMPDumpHelper now temporary disables the DLL protection
    mechanism of Firefox in order to load RTMPDumpHelper.dll into
    Firefox. (Also, be aware that Firefox is now installed as 64-bit Web
    browser by default, so you have to use the 64-bit version of
    RTMPDumpHelper if you have 64-bit system.)

* Version 1.21:
  o Added 'Scroll Down On New Line' option.

* Version 1.20:
  o Added support for specifying TCP ports range in the 'RTMPDump
    Options' window, for example: 1930-1940

* Version 1.16:
  o Fixed a crash occurred when RTMPDumpHelper fails to locate a
    child process of Web browser.
  o Added 64-bit build - for using with 64-bit Web browsers.

* Version 1.15:
  o Added option to capture other TCP ports instead of the default
    port of RTMP protocol (port number 1935). You can specify up to 16
    different TCP port numbers. This option is available in the 'RTMPDump
    Options' window.
  o Added 'Capture New RTMP Connections' option. If you uncheck this
    option, RTMPDumpHelper will not capture new RTMP connections until
    you activate this option again.
  o Fixed issue: The properties and the other windows opened in the
    wrong monitor, on multi-monitors system.

* Version 1.11:
  o Fixed bug: The browse button to choose the download folder failed
    to work properly.
  o Added AutoComplete suppport to the download folder text-box.

* Version 1.10:
  o Added option to run the RTMP server (rtmpsrv.exe) instead of
    rtmpsuck.exe (In 'RTMPDump Options' window - F9)
    In some Web sites, the proxy server (rtmpsuck.exe) cannot download
    the RTMP streams properly, so you can use rtmpsrv.exe instead to
    solve the problem.
  o Added option to choose another folder for saving the downloaded
    RTMP streams. (In 'RTMPDump Options' window - F9)

* Version 1.05:
  o Add support for the latest update of Firefox (Version 13.0) and
    Flash (Version 11.3.300.257), by attaching the dll of RTMPDumpHelper
    to the executable of Flash (FlashUtil64_11_3_300_257_Plugin.exe)

* Version 1.00 - First release.



Start Using RTMPDumpHelper
==========================

In order to start using RTMPDumpHelper, follow the instructions below:
* Download RTMPDumpHelper, and extract all files into a new folder. You
  must have write permission in this folder, so RTMPDump toolkit will be
  able to save the RTMP streams into your disk.
* Download the Windows build of RTMPDump toolkit, and extract all files
  into the same folder you created for RTMPDumpHelper. You can also
  download a patch of RTMPDump toolkit from here, which solves some of
  the problems exist on the original build of RTMPDump toolkit.



* Run the RTMPDumpHelper.exe executable. RTMPDumpHelper will also
  execute rtmpsuck.exe or rtmpsrv.exe executables, and you'll see it as
  black console window.
* Run your Web browser (if it's not already running). If RTMPDumpHelper
  detects your Web browser, you should see 'Attached To Web Browser'
  message in the main window of RTMPDumpHelper. If your Web browser is
  not detected by RTMPDumpHelper, you should press F8 and manually choose
  your Web browser.



* Browse into a Web page containing RTMP stream. At the moment your Web
  browser start playing the video/audio stream, you should see "Captured
  RTMP connection" message inside the main window of RTMPDumpHelper and
  the proxy server of RTMPDump toolkit will start downloading the stream
  into your disk.



* The video/audio file will be downloaded into the same folder where
  rtmpsuck.exe is located. You can choose to store the downloaded RTMP
  streams in another folder from the 'RTMPDump Options' window (F9).






Translating RTMPDumpHelper to other languages
=============================================

In order to translate RTMPDumpHelper to other language, follow the
instructions below:
1. Run RTMPDumpHelper with /savelangfile parameter:
   RTMPDumpHelper.exe /savelangfile
   A file named RTMPDumpHelper_lng.ini will be created in the folder of
   RTMPDumpHelper utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run RTMPDumpHelper, and all
   translated strings will be loaded from the language file.
   If you want to run RTMPDumpHelper without the translation, simply
   rename the language file, or move it to another folder.



License
=======

This utility is released as freeware. You are allowed to freely
distribute this utility via floppy disk, CD-ROM, Internet, or in any
other way. If you distribute this utility, you must include all files in
the distribution package, without any modification !



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

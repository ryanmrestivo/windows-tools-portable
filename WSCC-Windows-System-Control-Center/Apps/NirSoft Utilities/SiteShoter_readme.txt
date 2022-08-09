


SiteShoter v1.42
Copyright (c) 2008 - 2011 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

SiteShoter is a small utility that allows you to save a screenshot of any
Web page into a file. It automatically creates hidden window of Internet
Explorer, loads the desired Web page, and than save the entire content of
the Web page into an image file (.png, .jpg, .tiff, .bmp or .gif). You
can also use SiteShoter to convert .html file on your local drive into
image file.
You can use SiteShoter in user interface mode, or alternatively, you can
run SiteShoter in command-line mode without displaying any user interface.



System Requirements
===================

This utility works on Windows XP, Window 2003 Server, Window 2008 Server,
Windows Vista, and Windows 7. You can also use this utility in Windows
2000, if GDI+ is installed.



Versions History
================


* Version 1.42
  o Fixed bug: SiteShoter failed to save the file with %url% variable
    if the Web site URL specified a port number (For example:
    http://mywebsite.com:8080 )

* Version 1.41
  o Added /start command-line option, which allows you to run
    SiteShoter with user interface, and automatically press the Start
    button to start to Web site capture procrss.

* Version 1.40
  o New feature for 'Multiple URLs' mode - You can now execute every
    URL in a separated SiteShoter child process.

* Version 1.38
  o Added Drag & Drop support. When you drag .html file, it'll be set
    as source file to capture as screenshot. When you drag gif/png/jpg
    file, it'll be set as image file to save.

* Version 1.37
  o When using SiteShoter from command-line, it now returns error
    code when there is an error during navigation. (See error codes below)

* Version 1.36
  o Added support for %name% variable to take only the name of
    domain. For example, from http://www.google.com, you'll get 'google'
    string.

* Version 1.35
  o SiteShoter now saves the image in a new method, so all Java
    applets and other 3-party components are now saved properly.
  o Added 'Browse...' button to URL field in order to easily choose
    html file for converting it to image.

* Version 1.31
  o Fixed bug: SiteShoter failed to create screenshots of very large
    Web pages when there was not enough memory in the video card.
    SiteShoter now uses the computer memory instead of the video card
    memory.

* Version 1.30
  o Added new options: 'Save Config' and 'Load Config'
  o Added new command-line option: /LoadConfig - Start SiteShoter
    with the specified config file.
  o Added new command-line option: /RunConfig - Take a screenshot
    according to the specified config file, without displaying any UI.

* Version 1.21
  o Added %count% variable. (For example: if you set the filename to
    nirsoft%count%.png, the created filenames will be nirsoft1.png,
    nirsoft2.png, nirsoft3.png, and so on...)

* Version 1.20
  o Added new option: 'Take a screenshot of this Web page every...'

* Version 1.18
  o Fixed bug with dialog-box resizing.
  o Added %host% variable.

* Version 1.17
  o The main dialog-box is now resizable.

* Version 1.16
  o When cut width/height are negative numbers, the cut width/height
    values will be subtract from the total width/height of the page. This
    feature can be useful if you want to cut a footer of a Web page. For
    example, if the number of pixels in footer of the Web page is 100,
    put -100 in the Cut Height field.

* Version 1.15
  o Added support for handling a sequence of URLs, saved in a text
    file. (The URLs should be delimited by CRLF)

* Version 1.10
  o Added support for automatically saving the URL in filename (%url%)
  o Added AutoComplete for filename field.

* Version 1.09
  o Added support for current date/time Formatting in the save
    filename.

* Version 1.08
  o Added new option: Cut Web page in the specified location.

* Version 1.07
  o Added AutoComplete support for the URL text-box.
  o Fixed bug: Accelerator keys didn't work...

* Version 1.06
  o Fixed a GDI resources leak.

* Version 1.05
  o New option: Automatically extend browser size according to Web
    page

* Version 1.00 - First release.



Using SiteShoter
================

SiteShoter doesn't require any installation process or additional DLL
files. In order to start using it, simply run the executable file
(SiteShoter.exe)
After you run it, type the URL of the Web page that you want to capture,
and select the image filename that you want to save. You can also modify
the other options, like browser width/height, disable Flash, and so on.
Click the 'Start' button and wait a few seconds until the Web site is
loaded and saved into a file. (The default timeout value is 10 seconds,
you may change it according to your needs)



Automatically extend browser size according to Web page
=======================================================

Starting from version 1.05, SiteShoter allows you to extend the Web
browser size according to the size of the Web page, so the entire Web
page will be captured. However, be aware that this feature won't work on
Web pages with multiple frames.
Also, when this feature is turned on, you can limit the maximum allowed
browser size by using the 'Maximum Width' and 'Maximum Height' fields.



Using The URL In The Saved Filename
===================================

If you want to use the URL of the Web site as the saved filename, simply
use the %url% variable in the filename field. You can also use the %host%
variable to get only the host name, without the other parts of the URL or
%name%, to get only the name inside the domain (%name% of www.yahoo.com
will be 'yahoo').
For example: c:\temp\%url%.png



Formatting Save Filename With Current Date/Time
===============================================

Starting from version 1.09, you can use the following special SiteShoter
variables for formatting the filename according to the current date or
time:
* %time:[format]%
* %date:[format]%

The time format string may contain the following elements: (The format
string is case sensitive !)

h
Hours with no leading zero for single-digit hours; 12-hour clock.

hh
Hours with leading zero for single-digit hours; 12-hour clock.

H
Hours with no leading zero for single-digit hours; 24-hour clock.

HH
Hours with leading zero for single-digit hours; 24-hour clock.

m
Minutes with no leading zero for single-digit minutes.

mm
Minutes with leading zero for single-digit minutes.

s
Seconds with no leading zero for single-digit seconds.

ss
Seconds with leading zero for single-digit seconds.

t
One character time-marker string, such as A or P.

tt
Multicharacter time-marker string, such as AM or PM.

The date format string may contain the following elements: (The format
string is case sensitive !)

d
Day of month as digits with no leading zero for single-digit days.

dd
Day of month as digits with leading zero for single-digit days.

ddd
Day of week as a three-letter abbreviation.

dddd
Day of week as its full name.

M
Month as digits with no leading zero for single-digit months.

MM
Month as digits with leading zero for single-digit months.

MMM
Month as a three-letter abbreviation.

MMMM
Month as its full name.

y
Year as last two digits, but with no leading zero for years less than 10.

yy
Year as last two digits, but with leading zero for years less than 10.

yyyy
Year represented by full four digits.

Here's some examples for filename strings with date/time format:
c:\temp\%date:MMddyyyy%\g%time:HHmmss%.png
c:\temp\mysite%time:HHmm%.jpg
c:\temp\site%date:MMyyyy%\nirsoft.png

Be aware that if a folder formated with date/time doesn't exist,
SiteShoter will automatically create it for you.



Using SiteShoter From Command-Line
==================================

In order to take a screenshot of a Web page from command-line, you can
use one or more from the following command-line parameters. Any parameter
that you don't specify in the command-line is automatically loaded from
the configuration file of SiteShoter (SiteShoter.cfg).

/LoadConfig <Config Filename>
Start SiteShoter with the specified config file.

/RunConfig <Config Filename>
Take a screenshot according to the specified config file, without
displaying any UI. If you also specify other config parameters (like /URL
or /Filename), they'll override the values stored in the config file.

/Start
Simply run SiteShoter with the user interface, and then automatically
press the start button, for starting the Web site capture process
automatically.

/URL <http://...>
Specifies the address of the Web page or HTML file on your local drive.

/Filename <Filename>
Specifies the filename that you want to save

/BrowserWidth <Width in pixels>
Specifies the width of browser window, in pixels.

/BrowserHeight <Height in pixels>
Specifies the height of browser window, in pixels.

/BrowserAutoSize <0 | 1>
Automatically extend the Web browser size according to the size of the
Web page. Specify 1 to enable this feature, 0 to disable

/MaxBrowserWidth <Width in pixels>
Specifies the maximum allowed width of browser window, in pixels. Only
relevant when BrowserAutoSize is enabled.

/MaxBrowserHeight <Height in pixels>
Specifies the maximum allowed height of browser window, in pixels. Only
relevant when BrowserAutoSize is enabled.

/BrowserTimeout <Timeout in milliseconds>
Specifies the number of milliseconds to wait for the Web page to load.

/JpegQuality <Jpeg Quality [0 - 100]>
Specifies the quality of Jpeg file. 100 - the best quality. On relevant
when you save into a .jpg file.

/ImageSizePerCent <Image size in %>
Specifies the size of the saved image, in percent of the browser window.
For example: if you specify that the browser window is 640x480, and the
image percent value is 50%, the saved image will be 320x240

/DisableScrollBars <0 | 1>
Specifies whether you want to disable the scrollbars of the main browser
window. Specify 1 to disable or 0 to enable.

/DisableJavaScript <0 | 1>
Specifies whether you want to disable the JavaScript component of the Web
browser.

/DisableFlash <0 | 1>
Specifies whether you want to disable the Flash components appears on the
Web page.

/OpenImageAfterSave <0 | 1>
Specifies if you want to open the saved image file with the default image
viewer.

/CutWebPage <0 | 1>
Specifies if you want to cut the Web page in the location specified in
CutLeft, CutTop, CutWidth, and CutHeight parameters.

/CutLeft <Left in pixels>
/CutTop <Top in pixels>
/CutWidth <Width in pixels>
/CutHeight <Height in pixels>

Specifies the location the you want to cut the Web page. (Only when
CutWebPage = 1)

/URLMode <1 | 2>
Specifies the URL mode.
1 = Single URL, the URL is taken from /URL parameter. 2 = Multiple URLs.
The URL list is taken from a text file specified in /URLsFilename

/URLsFilename <URL Text Filename>
/URLsFilename
Specifies the URL filename when URLMode = 2.

Here's some examples:
SiteShoter.exe /URL http://www.nirsoft.net /Filename
"c:\temp\nirsoft.png" /DisableScrollBars 1 /BrowserWidth 800
/BrowserHeight 2000 /ImageSizePerCent 50
SiteShoter.exe /URL http://www.microsoft.com/ /Filename
"c:\temp\microsoft.png" /DisableScrollBars 1 /BrowserWidth 1024
/BrowserHeight 1500 /ImageSizePerCent 100 /DisableJavaScript 1
SiteShoter.exe /URL http://www.accuweather.com/ /Filename
"c:\temp\weather.tiff" /DisableScrollBars 1 /BrowserWidth 1024
/BrowserHeight 2000 /ImageSizePerCent 100 /DisableFlash 1
SiteShoter.exe /URL http://www.yahoo.com /Filename "f:\temp\yahoo.jpg"
/DisableScrollBars 1 /BrowserWidth 1024 /BrowserHeight 768
/ImageSizePerCent 100 /JpegQuality 50
SiteShoter.exe /URL http://www.cnet.com /Filename "c:\temp\cnet.png"
/DisableScrollBars 1 /BrowserAutoSize 1
SiteShoter.exe /URL "c:\temp\mypage.html" "c:\temp\mypage.png"
SiteShoter.exe /RunConfig "c:\temp\site1.cfg"
SiteShoter.exe /RunConfig "c:\temp\site1.cfg" /URL http://www.cnet.com



Error Codes
===========

The following error codes are returned when using SiteShoter from
command-line. If there was no error, the return value is 0.




INET_E_INVALID_URL
(0x800C0002L)
-2,146,697,214
URL string is not valid.

INET_E_NO_SESSION
(0x800C0003L)
-2,146,697,213
No session found.

INET_E_CANNOT_CONNECT
(0x800C0004L)
-2,146,697,212
Unable to connect to server.

INET_E_RESOURCE_NOT_FOUND
(0x800C0005L)
-2,146,697,211
Requested resource is not found.

INET_E_OBJECT_NOT_FOUND
(0x800C0006L)
-2,146,697,210
Requested object is not found.

INET_E_DATA_NOT_AVAILABLE
(0x800C0007L)
-2,146,697,209
Requested data is not available.

INET_E_DOWNLOAD_FAILURE
(0x800C0008L)
-2,146,697,208
Failure occurred during download.

INET_E_AUTHENTICATION_REQUIRED
(0x800C0009L)
-2,146,697,207
Requested navigation requires authentication.

INET_E_NO_VALID_MEDIA
(0x800C000AL)
-2,146,697,206
Required media not available or valid.

INET_E_CONNECTION_TIMEOUT
(0x800C000BL)
-2,146,697,205
Connection timed out.

INET_E_INVALID_REQUEST
(0x800C000CL)
-2,146,697,204
Request is invalid.

INET_E_UNKNOWN_PROTOCOL
(0x800C000DL)
-2,146,697,203
Protocol is not recognized.

INET_E_SECURITY_PROBLEM
(0x800C000EL)
-2,146,697,202
Navigation request has encountered a security issue.

INET_E_CANNOT_LOAD_DATA
(0x800C000FL)
-2,146,697,201
Unable to load data from the server.

INET_E_CANNOT_INSTANTIATE_OBJECT
(0x800C0010L)
-2,146,697,200
Unable to create an instance of the object.

INET_E_REDIRECT_FAILED
(0x800C0014L)
-2,146,697,196
Attempt to redirect the navigation failed.

INET_E_REDIRECT_TO_DIR
(0x800C0015L)
-2,146,697,195
Navigation redirected to a directory.

INET_E_CANNOT_LOCK_REQUEST
(0x800C0016L)
-2,146,697,194
Unable to lock request with the server.

INET_E_USE_EXTEND_BINDING
(0x800C0017L)
-2,146,697,193
Reissue request with extended binding.

INET_E_TERMINATED_BIND
(0x800C0018L)
-2,146,697,192
Binding is terminated.

INET_E_CODE_DOWNLOAD_DECLINED
(0x800C0100L)
-2,146,697,960
Permission to download is declined.

INET_E_RESULT_DISPATCHED
(0x800C0200L)
-2,146,696,704
Result is dispatched.

INET_E_CANNOT_REPLACE_SFP_FILE
(0x800C0300L)
-2,146,696,448
Cannot replace a protected System File Protection (SFP) file.



Translating SiteShoter to other languages
=========================================

In order to translate SiteShoter to other language, follow the
instructions below:
1. Run SiteShoter with /savelangfile parameter:
   SiteShoter.exe /savelangfile
   A file named SiteShoter_lng.ini will be created in the folder of
   SiteShoter utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run SiteShoter, and all
   translated strings will be loaded from the language file.
   If you want to run SiteShoter without the translation, simply rename
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

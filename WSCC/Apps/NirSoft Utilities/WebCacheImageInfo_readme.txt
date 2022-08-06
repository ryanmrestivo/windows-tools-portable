


WebCacheImageInfo v1.34
Copyright (c) 2013 - 2022 Nir Sofer
Web site: https://www.nirsoft.net



Description
===========

WebCacheImageInfo is a simple tool that searches for JPEG images with
EXIF information stored inside the cache of your Web browser (Internet
Explorer, Firefox, or Chrome), and then it displays the list of all
images found in the cache with the interesting information stored in
them, like the software that was used to create the image, the camera
model that was used to photograph the image, and the date/time that the
image was created.



System Requirements And Limitations
===================================


* This utility works in any version of Windows, starting from Windows
  XP and up to Windows 11. Both 32-bit and 64-bit systems are supported.
* The following Web browsers are supported: Internet Explorer, Mozilla
  Firefox, SeaMonkey, and Google Chrome. Opera is not supported because
  it stores the JPEG images in Webp format.
* WebCacheImageInfo won't work if you configure your Web browser to
  clear the cache after closing it.
* It's recommended to close all windows of your Web browser before
  using WebCacheImageInfo, to ensure that all cache files are saved to
  the disk.
* Be aware that WebCacheImageInfo only displays JPEG images with EXIF
  information stored in them. It doesn't display other images stored in
  the cache of your Web browsers.



Versions History
================


* Version 1.34:
  o Updated to read the Cache_Data subfolder in the new version of
    Chrome Web browser.

* Version 1.33:
  o Updated to work properly with the cache partitioning string on
    the latest versions of Chrome.
  o Fixed to extract the URLs correctly from the latest versions of
    Firefox.

* Version 1.32:
  o Updated to work properly with the new cache partitioning of
    Chrome. (In previous versions, URL was displayed with _dk_ prefix).

* Version 1.31:
  o Fixed to read .jpg files that their EXIF information is not in
    the beginning of the file.

* Version 1.30:
  o Added support for the new 'Simple Cache for HTTP' cache format of
    Chrome Web browser.

* Version 1.25:
  o WebCacheImageInfo now automatically detects the cache folder of
    Pale Moon Web browser.

* Version 1.22:
  o WebCacheImageInfo now automatically detects the cache folder of
    Vivaldi Web browser.

* Version 1.21:
  o Fixed bug: WebCacheImageInfo failed to read the cache of IE11 on
    some systems.

* Version 1.20:
  o WebCacheImageInfo now automatically detects the cache folders of
    Chromium and Yandex.

* Version 1.18:
  o Fixed to work with the latest build of Windows 10/IE11.

* Version 1.17:
  o WebCacheImageInfo now automatically detects the cache folder of
    Opera 15 or later (Which has the same cache structure of Google
    Chrome...)

* Version 1.16:
  o Fixed bug: Unicode Byte order mark (FF FE) was added to xml/html
    files.

* Version 1.15:
  o Added support for the new cache structure of Firefox 32.

* Version 1.11:
  o Added 'Explorer Copy' option (Ctrl+P), which allows you to copy
    one or more files and then paste them into opened folder in Windows
    Explorer.
  o Fixed bug: image with specific EXIF structure caused
    WebCacheImageInfo to hang or to crash.

* Version 1.10:
  o Added 'GPS Location' column.

* Version 1.07:
  o Fixed to display date/time values according to daylight saving
    time settings.

* Version 1.06:
  o Fixed bug: WebCacheImageInfo failed to display the images of
    Internet Explorer stored in the 'Low' cache folder.

* Version 1.05:
  o The 'Copy URL' option now allows you to copy multiple URLs.
  o Fixed bug: WebCacheImageInfo failed to show an image compressed
    with gzip (On Firefox and Chrome Web browsers)

* Version 1.00 - First release.



Start Using WebCacheImageInfo
=============================

WebCacheImageInfo doesn't require any installation process or additional
DLL files. In order to start using it, simply run the executable file -
WebCacheImageInfo.exe

After running it, WebCacheImageInfo begins to scan the cache of your Web
browser and displays every JPEG image with EXIF information found inside
the cache. You may need to wait up to a few minutes until the scanning
process is finished. After the scanning process is finished, you can also
watch the image in the lower pane of WebCacheImageInfo, by selecting the
desired item in the upper pane.

If from some reason WebCacheImageInfo fails to detect the cache of your
Web browser properly, you can go to 'Advanced Options' window (F9), and
choose the desired cache folders to scan for each Web browser.



Columns Description
===================


* URL: The URL of the image.
* Web Browser: The Web browser that stores the specified image file in
  the cache.
* Image Software: The software that was used to create or to modify the
  specified image.
* Camera Manufacturer: The manufacturer of the camera that was used to
  photograph the image.
* Camera Model: The model of the camera that was used to photograph the
  image.
* Generated Time: The time that the image was generated by the camera.
* Stored Time: The time that the image was stored by the camera.
* Modified Time: The time that the image was modified by the camera.
* File Size: The size of the image file.
* Filename: The full path of the filename in the cache of your Web
  browser.
* Browsing Time: The time that the image was loaded by your Web browser.
* Server Last Modified: The last-modified time of the image, as
  returned by the Web server. This time usually represents the time that
  the image was uploaded to the server.



Command-Line Options
====================



/stext <Filename>
Save the cached images information into a simple text file.

/stab <Filename>
Save the cached images information into a tab-delimited text file.

/scomma <Filename>
Save the cached images information into a comma-delimited text file (csv).

/stabular <Filename>
Save the cached images information into a tabular text file.

/shtml <Filename>
Save the cached images information into HTML file (Horizontal).

/sverhtml <Filename>
Save the cached images information into HTML file (Vertical).

/sxml <Filename>
Save the cached images information into XML file.



Translating WebCacheImageInfo to other languages
================================================

In order to translate WebCacheImageInfo to other language, follow the
instructions below:
1. Run WebCacheImageInfo with /savelangfile parameter:
   WebCacheImageInfo.exe /savelangfile
   A file named WebCacheImageInfo_lng.ini will be created in the folder
   of WebCacheImageInfo utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run WebCacheImageInfo, and all
   translated strings will be loaded from the language file.
   If you want to run WebCacheImageInfo without the translation, simply
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

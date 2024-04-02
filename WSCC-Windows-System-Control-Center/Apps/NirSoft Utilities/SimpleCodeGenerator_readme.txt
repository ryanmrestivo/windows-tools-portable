


SimpleCodeGenerator v1.13
Copyright (c) 2021 - 2024 Nir Sofer
Web site: https://www.nirsoft.net/utils/qr_code_generator.html



Description
===========

SimpleCodeGenerator is a simple tool for Windows that allows you to
quickly generate QR Code for scanning with App on your Smartphone. You
can display the QR Code on the screen, copy it to the clipboard and then
paste it to another program (as image), or save it image file - .png ,
.gif , .jpg , .tiff, or .bmp

SimpleCodeGenerator also allows you to generate QR Code from command line
and save it as image file ( .png , .gif , .jpg , .tiff, or .bmp) without
displaying any user interface.



System Requirements
===================


* This tool works on any version of Windows, starting from Windows XP
  and up to Windows 11. Both 32-bit and 64-bit systems are supported.
* This tool is just a small standalone .exe file (Less than 100KB !)
  that you can run on any system without installing anything.



Versions History
================


* Version 1.13
  o Added CopyImageScaling and SaveImageScaling entries to the
    configuration file (SimpleCodeGenerator.cfg), which control the size
    of the generated image when you use the 'Save QR Code To Image File'
    and 'Copy Image' options. The default value is 5. You can increase
    this value if you want to generate larger images.

* Version 1.12
  o Added 'Save Image With White Border' option (Under the Options
    menu). When it's turned on, white space is added around the QR Code
    in all saved images.

* Version 1.11
  o Added /Clipboard command line option, which allows you to
    generate QR Code into the clipboard, for example:
    SimpleCodeGenerator.exe /Clipboard
    "https://www.nirsoft.net/utils/qr_code_generator.html"

* Version 1.10
  o You can now choose the desired error correction level (Low,
    Medium, Quartile, High) and QR Code versions range (between 1 and 40).
  o Added new command-line options to set the error correction and QR
    Code version - /ErrorCorrection , /MinVersion , /MaxVersion
    For example: SimpleCodeGenerator.exe /ErrorCorrection 2 /MinVersion
    10 /MaxVersion 40

* Version 1.00 - First release.



What you can do with QR Codes
=============================

With this tool, you can create QR Codes that open a URL on the Web
browser of your Smartphone, add a new contact to your Smartphone, add new
Wi-Fi network to your Smartphone, open map in the specified
latitude/longitude, and more.
You simply have to type the correct QR Code string in
SimpleCodeGenerator, generate the QR Code, and then scan it with QR Code
reader App on your Smartphone.

You can read this article to learn how to compose the QR Code string that
will do what you need.



Start Using SimpleCodeGenerator
===============================

SimpleCodeGenerator doesn't require any installation process or
additional DLL files. In order to start using it, simply run the
executable file - SimpleCodeGenerator.exe

After running SimpleCodeGenerator, you can type the URL or other QR
string in the text-box just below the toolbar, and then press the
'Generate QR Code' button or press the F5 key. The QR Code will be
displayed instantly in the main window of SimpleCodeGenerator.
Optionally, you can press F2 to copy the QR Code to the clipboard, and
then paste it into another application, like MS-Word. You can also export
the generated QR Code to png / gif / jpg / tiff / bmp file, by using the
'Save QR Code To Image File' option (Ctrl+S).



Multiple Lines Mode
===================

If your QR Code string contains multiple lines (like a vCard QR Code), Go
to the Options menu, select the 'Multiple Lines Mode' option (or simply
press F7), and then SimpleCodeGenerator will allow you to type a string
with multiple lines.



Command-Line Options
====================



/ErrorCorrection <1 - 4>
Set the error correction from command-line:
1 - Level L (Low)
2 - Level M (Medium)
3 - Level Q (Quartile)
4 - Level H (High)

/MinVersion <1 - 40>
Set the minimum version of the QR Code (between 1 and 40)

/MaxVersion <1 - 40>
Set the maximum version of the QR Code (between 1 and 40)

/Show <QR Code String>
This command generates the QR Code for the specified string, and displays
it on the main window of SimpleCodeGenerator.

If your QR Code string contains multiple lines, you should use the '\r\n'
escape sequence to specify the CR-LF characters. If your QR Code string
contains the '\' character, you should specify this character twice
('\\').

Examples:
SimpleCodeGenerator.exe /Show
"https://www.nirsoft.net/utils/qr_code_generator.html"
SimpleCodeGenerator.exe /ErrorCorrection 2 /MinVersion 10 /MaxVersion 40
/Show "https://www.nirsoft.net/utils/qr_code_generator.html"
SimpleCodeGenerator.exe /Show
"BEGIN:VCARD\r\nVERSION:3.0\r\nN:Sofer;Nir;;;\r\nFN:Nir
Sofer\r\nTITLE:Programmer\r\nEMAIL;TYPE=INTERNET;TYPE=WORK;TYPE=PREF:suppor
t@nirsoft.net\r\nURL;TYPE=Homepage:https://www.nirsoft.net\r\nEND:VCARD"

/Save <QR Code String> <Image Filename> {Image Scaling}
This command generates the QR Code for the specified string, and then
exports it to the specified image filename (.png , .gif , .jpg , .tiff,
or .bmp file).
{Image Scaling} is an optional parameter that specifies the number of
pixels to create in the image file for every pixel in the QR Code. For
example: if you specify "10" - for every pixel in the QR Code, you will
get 10x10 pixels in the image file. If you don't specify the {Image
Scaling} value, the default scaling is 5.

If your QR Code string contains multiple lines, you should use the '\r\n'
escape sequence to specify the CR-LF characters. If your QR Code string
contains the '\' character, you should specify this character twice
('\\').


Examples:
SimpleCodeGenerator.exe /Save
"https://www.nirsoft.net/utils/qr_code_generator.html"
"c:\temp\qrcode1.png" 10
SimpleCodeGenerator.exe /ErrorCorrection 2 /MinVersion 10 /MaxVersion 40
/Save "https://www.nirsoft.net/utils/qr_code_generator.html"
"c:\temp\qrcode1.png" 10
SimpleCodeGenerator.exe /Save "WIFI:T:WPA;S:MyWifi;P:WifiPass1234;;"
"c:\temp\qrcode2.gif"

/Clipboard <QR Code String> {Image Scaling}
This command generates the QR Code for the specified string, and then put
in the clipboard.
{Image Scaling} is an optional parameter that specifies the number of
pixels to create in the image file for every pixel in the QR Code. For
example: if you specify "10" - for every pixel in the QR Code, you will
get 10x10 pixels in the image file. If you don't specify the {Image
Scaling} value, the default scaling is 5.

Example:
SimpleCodeGenerator.exe /Clipboard
"https://www.nirsoft.net/utils/qr_code_generator.html" 10



Translating SimpleCodeGenerator to other languages
==================================================

In order to translate SimpleCodeGenerator to other language, follow the
instructions below:
1. Run SimpleCodeGenerator with /savelangfile parameter:
   SimpleCodeGenerator.exe /savelangfile
   A file named SimpleCodeGenerator_lng.ini will be created in the folder
   of SimpleCodeGenerator utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run SimpleCodeGenerator, and all
   translated strings will be loaded from the language file.
   If you want to run SimpleCodeGenerator without the translation, simply
   rename the language file, or move it to another folder.



License
=======

This utility is released as freeware. You are allowed to freely
distribute this utility via CD-ROM, DVD, Internet, or in any other way,
as long as you don't charge anything for this and you don't sell it or
distribute it as a part of commercial product. If you distribute this
utility, you must include all files in the distribution package, without
any modification !



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
utility, you can send a message to support@nirsoft.net




WinFontsView v1.10
Copyright (c) 2009 - 2011 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

WinFontsView is a small utility that enumerates all fonts installed on
your system, and displays them in one simple table. For each font,
WinFontsView draws 5 samples of the font in different sizes, in order to
allow you to easily find and choose the desired font that you need.
WinFontsView also allows you to view the fonts as Bold, as Italic or with
underline, as well as it allows you to export the fonts list into html
file.
If you need to find a font in non-English character set, WinFontsView
also allows you to choose the right characters set of the fonts and to
type the characters displayed in the sample text of each font.



System Requirements
===================

WinFontsView works with the following versions of Windows: Windows 2000,
Windows XP, Windows Server 2003, Windows Server 2008, Winodws Vista, and
Windows 7.



Versions History
================


* Version 1.10 - Added 'All Character Sets' option, which allows you to
  view all fonts of all character sets.
* Version 1.05 - Added command-line support.
* Version 1.00 - First release.



Using WinFontsView
==================

WinFontsView doesn't require any installation process or additional DLL
files. In order to start using it, simply run the executable file -
WinFontsView.exe
After running WinFontsView, the main window displays all ANSI fonts
installed on your system. If you want to view fonts in non-English
language, Go to Options->Advanced Options (or press F8), choose the
desired character set and type the characters of your language to view in
the sample text.
You can also choose to view the fonts as Bold (Ctrl+B), as Italic
(Ctrl+I) or with underline (Ctrl+U).

If you want to view the font samples in HTML, you can use the save option
(Ctrl+S) or the HTML report options under the View menu. However, be
aware that you cannot view the HTML file in another computer that these
fonts are not installed.



Command-Line Options
====================



/SampleText <Text>
Specifies the sample text to display

/CharSet <Character Set Code>
Specifies the character set to use, according to the following CharSet
codes:
0 - ANSI
186 - Baltic
136 - Chinese Big 5
238 - East Europe
134 - GB2312
161 - Greek
129 - Hangul
255 - OEM
204 - Russian
128 - Shiftjis
2 - Symbol
162 - Turkish
163 - Vietnamese
130 - Johab
178 - Arabic
0 - Hebrew
222 - Thai

Examples:
WinFontsView.exe /SampleText "abcdefg123456789" /CharSet 0
WinFontsView.exe /SampleText "123456789!@#$%^" /CharSet 2



Translating WinFontsView to other languages
===========================================

In order to translate WinFontsView to other language, follow the
instructions below:
1. Run WinFontsView with /savelangfile parameter:
   WinFontsView.exe /savelangfile
   A file named WinFontsView_lng.ini will be created in the folder of
   WinFontsView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run WinFontsView, and all
   translated strings will be loaded from the language file.
   If you want to run WinFontsView without the translation, simply rename
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

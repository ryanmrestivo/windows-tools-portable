


HTMLAsText v1.11
Copyright (c) 2004 - 2009 Nir Sofer
Web Site: http://www.nirsoft.net



Description
===========

HTMLAsText utility converts HTML documents to simple text files, by
removing all HTML tags and formatting the text according to your
preferences.



Features
========


* HTMLAsText automatically removes all tags and scripts from the
  document.
* The remained text is formatted according to the number of characters
  per line that you select.
* All HTML entities (e.g.: &amp, &lt) are converted into the
  corresponding ASCII characters.
* Unordered lists (<ul> tag) and ordered lists (<ol> tag) are formatted
  accordingly. The bullets beside the items of unordered lists are
  replaced by ASCII characters according to your selection.
* Definition lists are formatted by adding spaces in the left side of
  the definition lines.
* Optionally, centered and right-aligned paragraphs are formatted
  accordingly by adding space characters in the left side of the lines.
* Optionally, HTMLAsText allows you to add a line under each heading
  (<h1> - <h6> tags)
* Simple tables can be delimited by spaces, tab characters, commas, or
  CRLF.
* Preformatted text blocks (<pre> tag) are copied "as is", without
  formatting the text.
* You can convert multiple HTML files in the same folder at once, by
  using wildcard. (e.g.: c:\files\*.html)
* You can run the conversion process without displaying any user
  interface, by using the /run command-line option.



Versions History
================


* Version 1.11:
  o The configuration is now saved to a file instead of the Registry.

* Version 1.10:
  o Fixed bug: String preceding a remark HTML section (<!-- -->) was
    missing in the converted text file.

* Version 1.06:
  o Added support for additional 30 escape codes (&xxxx;)
  o When using /run command-line, if a full path is not specified in
    source/destination files, the path of the cfg file is used.

* Version 1.05:
  o Fixed bug with <a> tag out of a <tr> tag in table

* Version 1.04:
  o New option: Scan Subfolders.
  o If you don't specify a folder in the wildcard fields, the current
    folder is used.

* Version 1.03:
  o Fixed problems with unclosed <a> tag.

* Version 1.02:
  o New formating option: Enclose bold text (<b> tag) with the
    characters that you select.
  o New formating option: Links Display Format.

* Version 1.01:
  o Fixed bug: convert filenames with more than one dot (e.g:
    aaa.bbb.html) in multiple files mode.
  o Fixed bug: Convert unicode characters correctly (

* Version 1.00: First Release.



Using HTMLAsText
================

HTMLAsText is a small and standalone executable. You don't need to
install anything, and additional DLLs are not required for using this
utility. Just copy the executable to any folder you like, and run it.

In the main screen of HTMLAsText utility, you are allowed to set the
configuration required for converting your HTML files to text files. The
following options are available:
* Single/Multiple: In this option you should specify whether you want
  to convert a single file or multiple files:
  o Convert Single File: If you choose this option, the HTML file
    specified in 'HTML File' field will converted into the text file
    specified in the 'Text File' field.
  o Convert Multiple Files: If you choose this option, the 'HTML
    Wildcard' field should contain wildcard for the HTML files you want
    to convert, with full path. for example:
    C:\MyFiles\HTML\*.html
    F:\Projects\HTML\Test1\*.htm
    The 'Text Wildcard' field should contain wildcard for the text files
    you want to save, for example:
    C:\MyFiles\text\*.txt

* Scan Subfolders: If your select this option, HtmlAsText search for
  html files in all subfolders under the specified folder of 'HTML
  Wildcard' field.
  Available only if 'Convert Multiple Files' is selected.
* Characters Per Line: Maximum number of characters per line in the
  converted text file.
* Unordered List Characters: The characters specified in this field
  will be used for replacing the bullets of unordered lists. You can
  specify here up to 5 characters (for nested lists).
* Add line under headings: If this option is checked, a line will be
  added under each heading. The line will be created by using the 6
  characters that you specify - first character for <h1> tag, second
  character for <h2> tag, and so on.
* Skip the text stored inside <title> tag: Just like it sounds - if
  this option is checked, the text inside the <title> won't be added to
  the converted text file.
* Horizontal rule character: The character that will be used for
  displaying horizontal rule in the text file.
* Definition List spaces: Number of spaces to add to definition line.
  (<dd> tag)
* Allow centered text: If this option is checked, the text of centered
  paragraphs is centered by adding spaces in the left side of the lines.
* Allow right-aligned text: If this option is checked, the text of
  right-aligned paragraphs is aligned to the right by adding space
  characters.
* separate table cells by... : Determines how the cells of tables are
  separate: by space, by comma, by tab or CRLF (Enter).
* Enclose bold text with the following characters: If this option is
  checked, bold text (<b> tag) is enclosed with the start/end characters
  that you select.
* Links Display Format: Determines how to represent a link (<a> tag) in
  your text file. You can select one of the predefined formats, or create
  your own. the '%T' represents the text of the link, the '%L' represents
  the URL address.

After setting the conversion options according to your needs, press the
'Convert' button in order to convert your HTML file(s) to text. You can
also use the 'Save Config' option to save the current configuration, and
then use it later by loading it again with 'Load Config'.



Converting HTML files from command-line
=======================================

In order to convert HTML files from command-line, you have to save the
desired conversion options to configuration file (by using 'Save Config'
option), and then run the HTMLAsText utility with /run option, followed
by the configuration filename.
For example:
htmlastext.exe /run "c:\temp\convert.cfg"



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



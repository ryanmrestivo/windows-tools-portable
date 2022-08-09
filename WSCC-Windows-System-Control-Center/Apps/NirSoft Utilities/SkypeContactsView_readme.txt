


SkypeContactsView v1.05
Copyright (c) 2014 - 2015 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

SkypeContactsView is a simple tool that displays the list of all Skype
contacts stored in the local database file of Skype.
For each contact, one or more of the following fields are displayed:
Skype Name, Full Name, Display Name, Gender, ID, Birthday, Profile Time,
Last Online Time, Last Used Time, Phone, Emails, and more...
SkypeContactsView also allows you to export the contacts list into
text/tab-delimited/comma-delimited/xml/html file, or copy them to the
clipboard and then paste them into Excel or other spreadsheet application.



Versions History
================


* Version 1.05:
  o Added option to export the contacts to JSON file.

* Version 1.01:
  o Added 'Remember this folder' check-box in the 'Advanced Options'
    window.

* Version 1.00 - First release.



Start Using SkypeContactsView
=============================

SkypeContactsView doesn't require any installation process or additional
dll files. In order to start using it, simply run the executable file -
SkypeContactsView.exe

After running SkypeContactsView, the main window displays the list of all
contacts found in your Skype profile. If you want to view the contacts of
another Skype account, you can press F9 and type the desired Skype
account folder.
You can select one or more contacts in the main window or select all of
them (Ctrl+A) and then export them into
text/tab-delimited/comma-delimited/xml/html file using the 'Save Selected
Items' option (Ctrl+S).



Command-Line Options
====================



/stext <Filename>
Save the list of contacts into a regular text file.

/stab <Filename>
Save the list of contacts into a tab-delimited text file.

/scomma <Filename>
Save the list of contacts into a comma-delimited text file (csv).

/stabular <Filename>
Save the list of contacts into a tabular text file.

/shtml <Filename>
Save the list of contacts into HTML file (Horizontal).

/sverhtml <Filename>
Save the list of contacts into HTML file (Vertical).

/sxml <Filename>
Save the list of contacts into XML file.

/sjson <Filename>
Save the list of contacts into JSON file.



Translating SkypeContactsView to other languages
================================================

In order to translate SkypeContactsView to other language, follow the
instructions below:
1. Run SkypeContactsView with /savelangfile parameter:
   SkypeContactsView.exe /savelangfile
   A file named SkypeContactsView_lng.ini will be created in the folder
   of SkypeContactsView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run SkypeContactsView, and all
   translated strings will be loaded from the language file.
   If you want to run SkypeContactsView without the translation, simply
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




DownTester v1.30
Copyright (c) 2009 - 2013 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

DownTester allows you to easily test your Internet download speed in
multiple locations around the world. It automatically test the download
speed of the URLs that you choose, one after another. It moves to the
next download URL after the specified number of seconds has been elapsed
or after it downloads the specified amount of KB - just according to your
preferences.
After the download test is finished, you can easily save the result into
text/html/xml/csv file, or copy it to the clipboard and paste it into
Excel and other applications.



System Requirements
===================

This utility works with Windows 98,Me,2000,XP,2003,2008,Vista, Windows 7,
and Windows 8.



Versions History
================


* Version 1.30:
  o Automatic Report: You can now add the report to the end of the
    file instead of overwriting the file (Only for text-file reports).

* Version 1.29:
  o Fixed the flickering problem occurred on Windows 7, while
    download information is updated.
  o Added 'Auto Size Columns+Headers' option, which allows you to
    automatically resize the columns according to the row values and
    column headers.

* Version 1.28:
  o You can now send the speed test result to stdout by specifying an
    empty filename ("") in the command-line of all save parameters.
    For example: DownTester.exe /hidden /stab "" >> c:\temp\speedtests.txt

* Version 1.27:
  o Fixed the Mbps values calculation which was based on 1024 X 1024
    bytes instead of 1000 X 1000 bytes. (This means that in previous
    versions, the Mbps column displayed a lower value than the real Mbps
    speed)

* Version 1.26:
  o Added 'Add Header Line To CSV/Tab-Delimited File' option. When
    this option is turned on, the column names are added as the first
    line when you export to csv or tab-delimited file.

* Version 1.25:
  o Added command-line options to override the settings loaded from
    the config file.

* Version 1.20:
  o Added support for changing the order of the download tests. (See
    below)

* Version 1.14:
  o The NSIS installation script now automatically add the
    translation file (DownTester_lng.ini), if it's exist.

* Version 1.13:
  o Fixed bug in NSIS script: error occurred when the path contained
    spaces.

* Version 1.12:
  o DownTester now allows you to fix the URL inside the properties
    window. (In previous versions, you had to delete it and then add a
    new URL)

* Version 1.11:
  o Added option to create custom NSIS installer to install
    DownTester with your current configuration, including all your
    download URLs and other settings (see below).

* Version 1.10:
  o Added support for testing the speed of network shares and even
    USB flash drives...
  o Fixed the URL order on delete.
  o Added support for automatically creating text/html report in each
    test (In 'Advanced Options')
  o Added option: Don't Add Disabled Items To Reports.
  o Added option: 'Automatically finish when the speed change is less
    than...' - You can use this option to automatically finish the speed
    test when the speed value is stable enough.
  o Added option to display text report.
  o Fixed problems in the latest Windows 7 Release Candidate.
  o Fixed bug: DownTester created the downloaded files as dwn*.tmp in
    the temporary folder of Windows.

* Version 1.05:
  o Added 'Move To Next Download' option.

* Version 1.00: First release.



Start using downTester
======================

DownTester is a portable application that can be used without any
installation process. Simply extract downTester.zip into any folder you
want, and run the executable - DownTester.exe
If you want, you can also download DownTester with full install/uninstall
support. In this case, you should run the downloaded
DownTester_Setup.exe, and the installer will automatically copy the files
and will create for you the shortcuts to DownTester utility.



Choosing the download URLs list
===============================

DownTester doesn't provide an official list of URLs for the speed test.
If DownTester provide a URL list, all users of DownTester will use the
same servers, and will eventually overload them.

Here's some instructions about how to choose your download URLs for your
speed tests:
1. First, go to the Web site of your internet service provider, and
   try to locate the download URL provided for speed test, and if you
   find it, add this download URL into the list. Many ISP companies
   provide a download URL for speed test. However, this speed test only
   shows the download speed between your computer and your ISP. It
   doesn't mean that you'll get the same speed when downloading a file
   from the other side of the world.
2. Go to the Web sites of large companies and locate some files to
   download. It's recommended to find files larger than 5 MB in order to
   insure that the speed result will be accurate. Some Web sites also
   provide mirrors across many countries, so you can use it to easily add
   download URLs of other countries.

After collecting the URLs for the downloads test, use the "Add URLs List"
or "Add URLs From File" options to insert your URLs into DownTester. You
can also use "Add File" option if you want to test the speed of your
network share or USB flash drive.
The URLs list should be in the following format:
http://www.mytesturl1.com/myfile.zip Speed Test 1
http://www.mytesturl2.com/myfile.zip Speed Test 2
ftp://ftp.mytestftp.com/ftptest.exe FTP Test
"I:\Test Files\mytest.zip" Network Share Test 1
"\\MyComp\\test.zip" Network Share Test 2

The name following the URL is optional, and if you use it, it'll be
displayed in the 'Name' column. If you want to add filenames that
contains space characters, instead of URLs, you must put the filename in
quotes.
The URLs that you add are automatically saved into the .cfg file, so
DownTester will remember them in the next time that you use it.




Changing the order of the download tests
========================================

By default, the order of the downloads during the speed test is
determined according to the order that you added the URLs.
If you want to change the download order, you have click the 'Download
Order' column header first. After you do that, the list will be sorted by
the current download order, and the 'Move Selected Items Up' and 'Move
Selected items Down' options will be enabled. You can select one or more
of the download items, and then move them up or down according to the
download order that you want to set.



Before you start your download speed test...
============================================


* Go to Options->Advanced Options and choose the right settings for
  you. By default, DownTester automatically stops every download after 20
  seconds, which is usually enough to get an accurate speed result, but
  you can change this setting if you wish.
* Verify that all download managers, torrent applications, and others
  are closed. Otherwise, the download speed test won't be accurate.

In order to start the download test, simply press F2.



Download Speed Columns
======================

DownTester displays the download speed in 2 different units:
* KB/Sec: (Kilobytes Per Second) - This column displays the same
  download speed that you usually see when you download a file with
  Internet Explorer, Firefox or other Web browser.
* Mbps: (Megabits Per Second) - When you get an Internet account from
  your Internet company, the download speed is usually specified in Mbps.
  By looking in this column, you can easily find out whether you really
  get the download speed that your Internet provider promised to you.



Analyzing the results of your speed test
========================================

The most important data in the test result table is the Mbps speed
column. If both of your Internet provider and the remote download server
works properly, the Mbps speed value that you get in this column should
be very close to the download speed of your Internet account.
If the Mbps speed of your test is much lower than Mbps speed of your
Internet account (For example: You have Internet account with download
speed of 3 Mbps, but you get only 2 Mbps in the download test), It's
possible that you have a problem with your Internet account. However, the
problem might also be in the remote download server, so it's recommended
to always make a test with multiple URLs.

If you are not sure whether the problem is in your ISP or in the remote
servers, you can ask your friends or other people on a forum to make a
test with the same URLs list, and compare their results with yours.



FTP: Passive Mode vs Active Mode
================================

DownTester also allows you to test the speed of FTP downloads (Addresses
begin with ftp://). FTP downloads can work in 2 modes, which in some
cases might give completely different results:
* Active Mode: When downloading a file in Active Mode, the FTP server
  connects from port 20 into your computer in a random port number.
  Sometimes firewalls are configured to disallow any incoming connection.
  If your firewall is configured in this way, you won't be able to make a
  download test in Active Mode.
* Passive Mode: When downloading a file in Passive Mode, your computer
  connects the FTP server in a random port number.
  Some Internet providers gives high priority for regular Web sites (port
  80) and other popular Internet applications, while giving very low
  priority for connection in random port number. This technique is known
  as "Traffic shaping". If your Internet provider uses this technique,
  you may get much lower speed results with Passive Mode FTP, because the
  FTP clicnt connects in random port number which may get much lower
  priority than the regular http downloads.
In order to change the FTP mode in DownTester, go to Options->Advanced
Option.



Testing the speed of network shares and other drives
====================================================

Starting from version 1.10, DownTester also allows you to test the speed
of network shares on your LAN. (For example: \\MyComp\f$\temp\myfile.zip)
However, be aware that this test calculates the speed by using the number
of bytes read from the file, instead of counting the number of bytes
transferred over the network.
Moreover, you can use this feature to test the speed of any drive in your
system, including your local drive, your CD/DVD, your USB flash drive,
and so on...
In order to use this feature, simply use the 'Add File' option (Ctrl+F9)
and choose the desired file to test.



Creating NSIS installer
=======================

DownTester allows you to easily create an installer that will install
DownTester with your current configuration, including all your download
URLs and the advanced options that you choose.

In the help menu, you can find 2 option for creating your custom
installer:
* Create NSIS Installation: Create regular installation that by
  default, installs DownTester in C:\Program files\NirSoft\DownTester
* Create Non-Admin NSIS Installation: Create installer that doesn't
  require administrator privilege. The files of DownTester will be
  installed in the user profile folder.

In order to use the above options successfully:
* Download and install the latest version of NSIS installer
* Verify that all files of DownTester - DownTester.exe, DownTester.chm,
  readme.txt, and DownTester.cfg are in the same folder.
* If you create the installation in Windows Vista, you should run
  DownTester.exe as admin.
When you use these option, downtester_setup.exe should be created in the
same folder of DownTester.exe



Command-Line Options
====================



/config <.cfg filename>
Run DownTester with the specified .cfg file.

/hidden
Use in conjunction with other save parameters (/stext, /stab, and so on).
When /hidden is specified, the main window of DownTester will be hidden.

/stext <Filename>
Execute a speed test, and then save the result into a regular text file.

/stab <Filename>
Execute a speed test, and then save the result into a tab-delimited text
file.

/scomma <Filename>
Execute a speed test, and then save the result into a comma-delimited
text file.

/stabular <Filename>
Execute a speed test, and then save the result into a tabular text file.

/shtml <Filename>
Execute a speed test, and then save the result into HTML file
(Horizontal).

/sverhtml <Filename>
Execute a speed test, and then save the result into HTML file (Vertical).

/sxml <Filename>
Execute a speed test, and then save the result into XML file.

/DontAddDisabled <0 | 1>
Don't Add Disabled Items To Reports. 0 = No, 1 = Yes

/UseAutoStopTime <0 | 1>
Automatically finish the download after xx seconds. 0 = No, 1 = Yes

/AutoStopTime <Time Value>
Specifies the time in seconds when UseAutoStopTime is enabled.

/UseAutoStopSize <0 | 1>
Automatically finish after downloading xx KB/MB. 0 = No, 1 = Yes

/AutoStopSize <Size Value>
Specifies the size for UseAutoStopSize.

/AutoStopSizeUnit <Unit>
2 = KB, 3 = MB

/UseAutoStopStable <0 | 1>
Automatically finish when the speed change is less than... 0 = No, 1 = Yes

/AutoStopStableUnit <Unit>
1 = Per Cent, 2 = KB Per Second

/FtpMode <Mode>
1 = Active, 2 = Passive.

/ConnectTimeout <Timeout Value>
Connecting Timeout, in seconds.

/TryAgainOnFail <0 | 1>
When a download fails, retry. 0 = No, 1 = Yes

/NumOfRetries <Number>
Number of retries.

/AutoReport <0 | 1>
Automatically save the test results into a file. 0 = No, 1 = Yes

/AutoReportOpenInViewer <0 | 1>
Automatically open the report file with default viewer. 0 = No, 1 = Yes

/AutoReportType <Report Type>
1 = Normal, 2 = Tab-Delimited, 3 = Tabular, 4 = HTML (Horizontal), 5 =
HTML (Vertical), 6 = XML, 7 = Comma-Delimited

/AutoReportFilename <Filename>
Specifies the filename for the auto-report.



Translating DownTester to other languages
=========================================

In order to translate DownTester to other language, follow the
instructions below:
1. Run DownTester with /savelangfile parameter:
   DownTester.exe /savelangfile
   A file named DownTester_lng.ini will be created in the folder of
   DownTester utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run DownTester, and all
   translated strings will be loaded from the language file.
   If you want to run DownTester without the translation, simply rename
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




CountryTraceRoute v1.32
Copyright (c) 2012 - 2021 Nir Sofer
Web site: https://www.nirsoft.net



Description
===========

CountryTraceRoute is a Traceroute utility, similar to the tracert tool of
Windows, but with graphical user interface, and it's also much faster
than tracert of Windows. CountryTraceRoute also displays the country of
the owner of every IP address found in the Traceroute.
After the Traceroute is completed, you can select all items (Ctrl+A) and
then save them into csv/tab-delimited/html/xml file with 'Save Selected
Items' option (Ctrl+S) or copy them to the clipboard (Ctrl+C) and then
paste the result into Excel or other spreadsheet application.




System Requirements
===================

This utility works on any version of Windows, starting from Windows 2000
and up to Windows 10. Both 32-bit and x64 systems are supported.



Known Limitations
=================


* Currently, IPv6 is not supported by this tool.
* This tool displays the country name of the owner of every IP address
  found in the Traceroute. Be aware that the actual country where the IP
  address is located might be different from the country of the IP
  address owner.



Versions History
================


* Version 1.32:
  o Added 'New CountryTraceRoute Instance' under the File menu, for
    opening a new window of CountryTraceRoute.
  o Updated to work properly in high DPI mode.

* Version 1.31:
  o Added 'TTL' column.

* Version 1.30:
  o Added support for GeoLite2 City and GeoLite2 Country database in
    CSV format.
  o In order to use it, you have to extract the following files into
    the folder of CountryTraceRoute.exe: GeoLite2-City-Blocks-IPv4.csv ,
    GeoLite2-City-Locations-en.csv
  o Be aware that the loading process of the GeoLite2 City database
    is quite slow.
  o Added support for GeoLite2 ASN database in CSV format. In order
    to use it, copy GeoLite2-ASN-Blocks-IPv4.csv into the folder of
    CountryTraceRoute.exe and CountryTraceRoute will load it
    automatically and display the information of every IP address in the
    'ASN' and 'Company Name' columns.

* Version 1.28:
  o The hosted name/ip address is now displayed in the window title.

* Version 1.27:
  o Fixed bug: CountryTraceRoute crashed when it failed to resolve
    the specified host name.
  o Updated the internal IP to country database.

* Version 1.26:
  o Updated the internal IP to country database.

* Version 1.25:
  o Updated the internal IP to country database.
  o Added option to select the font of the main List-View.

* Version 1.23:
  o Fixed bug: CountryTraceRoute failed to remember the last
    size/position of the main window if it was not located in the primary
    monitor.

* Version 1.22:
  o Fixed to display the main window properly when using large fonts
    settings.

* Version 1.21:
  o Fixed bug: CountryTraceRoute crashed when specifying a large
    maximum hops number.

* Version 1.20:
  o Added command-line options to start the Traceroute instantly with
    the specified host name.

* Version 1.16:
  o Fixed the flickering appeared while updating the Traceroute
    information.

* Version 1.15:
  o CountryTraceRoute now remembers the last 20 host-names/IP
    addresses that you previously queried and you can select them from a
    combo-box.
  o The host-name combo-box is now focused on start.

* Version 1.10:
  o Added 'Put Icon On Tray' option.
  o You now copy & paste full URL into the host name text-box, and
    CountryTraceRoute will automatically extract the host name from the
    URL.

* Version 1.06:
  o Added 'Stop' button.
  o Added 'Mark Odd/Even Rows' option, under the View menu. When it's
    turned on, the odd and even rows are displayed in different color, to
    make it easier to read a single line.

* Version 1.05:
  o Added support for GeoLite City database. You can now download the
    GeoLite City database (GeoLiteCity.dat.gz), put it in the same folder
    of CountryTraceRoute.exe, and CountryTraceRoute will automatically
    use it to get the country/city information for every IP address.

* Version 1.00 - First release.



Start Using CountryTraceRoute
=============================

CountryTraceRoute doesn't require any installation process or additional
dll files. In order to start using it, simply run the executable file -
CountryTraceRoute.exe

In the main window of CountryTraceRoute, type the desired host name or IP
address, the maximum number of hops, the timeout value in milliseconds,
and then press the 'Go' button (or press the Enter key) to start the
traceroute.



Using GeoLite2 City database
============================

The GeoLite City database is much larger than the internal IP-Country
database and for many IP addresses, it also contains city information.
You can download the database from this Web site. You should download the
GeoLite2 City database in CSV format because CountryTraceRoute can only
read this file format.

In order to starting using this database, simply extract the IPv4 file
(GeoLite2-City-Blocks-IPv4.csv) and the location file
(GeoLite2-City-Locations-en.csv) into the folder where
CountryTraceRoute.exe is located, and it'll automatically be loaded when
you run the CountryTraceRoute tool.

CountryTraceRoute also supports the GeoLite2 ASN Database in CSV format.
In order to use it, extract the files into the folder of
CountryTraceRoute.exe and CountryTraceRoute will automatically fill the
'ASN' and 'Company Name' columns.



Command-Line Options
====================



/Start <HostName>
Starts the Traceroute with the specified host name, for example:
CountryTraceRoute.exe /Start www.google.com

/MaxHops <Number>
Specifies the maximum number of hops.

/Timeout <Number>
Specifies the timeout value in milliseconds.



Translating CountryTraceRoute to other languages
================================================

In order to translate CountryTraceRoute to other language, follow the
instructions below:
1. Run CountryTraceRoute with /savelangfile parameter:
   CountryTraceRoute.exe /savelangfile
   A file named CountryTraceRoute_lng.ini will be created in the folder
   of CountryTraceRoute utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run CountryTraceRoute, and all
   translated strings will be loaded from the language file.
   If you want to run CountryTraceRoute without the translation, simply
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

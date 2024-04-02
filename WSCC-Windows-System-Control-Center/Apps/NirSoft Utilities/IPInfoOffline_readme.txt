


IPInfoOffline v1.70
Copyright (c) 2008 - 2023 Nir Sofer
Web site: https://www.nirsoft.net



Description
===========

IPInfoOffline Allows you to view information about IP addresses, without
connecting any external server. It uses a compressed IP addresses
database that is stored inside the exe file.
For each IP address, the following information is displayed: IP block
range, Organization (RIPE, ARIN, APNIC, LACNIC or AFRINIC), Assigned
Date, Country Name, and Country Code. After retrieving the information
about the desired IP addresses, You can copy the information to the
clipboard, or save it into text/html/xml/csv file.



System Requirements
===================

This utility works with any version of Windows from Windows 98 to Windows
11.



Versions History
================


* Version 1.70:
  o Added support for using the IP-Location files from
    https://github.com/sapics/ip-location-db.
  o You can use all 3 types of CSV files: Country, City, and ASN.
  o Both IPv4 and IPv6 files are supported.
  o In order to use these files, simply download the desired files
    and put them in the same folder of IPInfoOffline.exe with their
    original filename (For example: asn-country-ipv4.csv , asn-ipv4.csv,
    asn-ipv6.csv)

* Version 1.61:
  o Fixed bug: IPInfoOffline randomly crashed when using the GeoLite2
    City database.

* Version 1.60:
  o Added 'CIDR' column.
  o Added 'Duplicate Count' column, which displays the number of
    duplicate IP addresses when the "Don't add duplicate IP addresses" or
    "Don't add duplicate IP blocks" options are turned on.
  o Updated the internal IP to country database.

* Version 1.55:
  o Added support for IPv6 addresses, when using the GeoLite2
    City/Country/ASN database.

* Version 1.50:
  o Added support for GeoLite2 City and GeoLite2 Country database in
    CSV format.
  o In order to use it, you have to extract the following files into
    the folder of IPInfoOffline.exe: GeoLite2-City-Blocks-IPv4.csv ,
    GeoLite2-City-Locations-en.csv
  o Be aware that the loading process of the GeoLite2 City database
    is quite slow.
  o Added support for GeoLite2 ASN database in CSV format. In order
    to use it, copy GeoLite2-ASN-Blocks-IPv4.csv into the folder of
    IPInfoOffline.exe and IPInfoOffline will load it automatically and
    display the information of every IP address in the 'ASN' and 'Company
    Name' columns.

* Version 1.47:
  o Updated the internal IP to country database.

* Version 1.46:
  o Fixed IPInfoOffline to parse IP address with port number (e.g:
    8.8.8.8:80 ).

* Version 1.45:
  o Updated the internal IP to country database.
  o Added 'Auto Size Columns+Headers' option.

* Version 1.44:
  o Updated the internal IP to country database.

* Version 1.43:
  o Fixed the 'Select IP Addresses' window to support Ctrl+A (Select
    All).
  o Updated the internal IP to country database.

* Version 1.42:
  o Updated the internal IP to country database.

* Version 1.41:
  o Fixed IPInfoOffline to detect IP address when it's enclosed with
    brackets.

* Version 1.40:
  o Added support for GeoLite City database. You can now download the
    GeoLite City database (GeoLiteCity.dat.gz), put it in the same folder
    of IPInfoOffline.exe, and IPInfoOffline will automatically use it to
    get the country/city information for every IP address.

* Version 1.35:
  o Updated the internal IP to country database.

* Version 1.34:
  o Updated the internal IP to country database.

* Version 1.33:
  o Updated the internal IP to country database.

* Version 1.32:
  o Updated the internal IP to country database.

* Version 1.31:
  o When IPInfoOffline loads an external IP-Country file
    (IpToCountry.csv), information about that is displayed in the status
    bar.

* Version 1.30:
  o IPInfoOffline now remembers that last size and position of the
    'Select IP Addresses' window.
  o Fixed bug: The Organization column displayed empty string.
  o Updated the internal IP to country database.

* Version 1.26:
  o Updated the internal IP to country database.

* Version 1.25:
  o Updated the internal IP to country database.

* Version 1.23:
  o Updated the internal country names list.

* Version 1.22:
  o Updated the internal country names list.

* Version 1.21:
  o Updated the internal IP to country database.

* Version 1.20:
  o Added command-line support for saving IP addresses information
    into a file without any user interface. For example:
    IPInfoOffline.exe /iplist "88.64.10.10 89.64.20.20 12.10.20.30"
    /shtml c:\temp\ip.html
  o Fixed the IP addresses sorting
  o Updated the internal IP to country database.

* Version 1.18:
  o Added 'Add Header Line To CSV/Tab-Delimited File' option. When
    this option is turned on, the column names are added as the first
    line when you export to csv or tab-delimited file.
  o Updated the internal IP to country database.

* Version 1.17:
  o Updated the internal IP to country database.

* Version 1.16:
  o Added F9 accelerator key for opening the 'Choose IP Addresses'
    window.
  o Updated the internal IP blocks list.

* Version 1.15:
  o Added /AddCountry command-line option that allows you to inject
    country name for each IP address inside a text file. You can use this
    feature for adding country data into the Output of other tools like
    tracert and ping.

* Version 1.10:
  o Added 'European Union' string for .eu IP addresses and 'Reserved'
    string for Reserved addresses (e.g: 192.168.x.x)
  o Added 'Index' column that displays the order of the IP addresses
    in your list.
  o Updated the internal IP blocks list.

* Version 1.05:
  o Added new option: Don't add duplicate IP addresses.
  o Added new option: Don't add duplicate IP blocks.

* Version 1.00 - First release.



Using IPInfoOffline
===================

IPInfoOffline doesn't require any installation process or additional DLL
files. In order to start using it, simply run the executable file -
IPInfoOffline.exe
After running IPInfoOffline, you can type the IP addresses that you want
to inspect, and then click 'Ok'.



Using External IP Location Files
================================

Starting from version 1.70, you can view the country/city/ASN information
of IP addresses by using the IP-Location files from
https://github.com/sapics/ip-location-db.

You can use all 3 types of CSV files: Country, City, and ASN. Both IPv4
and IPv6 files are supported. In order to use these files, simply
download the desired files and put them in the same folder of
IPInfoOffline.exe with their original filename (For example:
asn-country-ipv4.csv , asn-ipv4.csv, asn-ipv6.csv)

Starting from version 1.50, you can use the CSV format of the GeoLite2
City database. You should download the GeoLite2 City in CSV format
(GeoLite2-City-CSV.zip) and then extract the following files into the
folder of IPInfoOffline.exe: GeoLite2-City-Blocks-IPv4.csv ,
GeoLite2-City-Locations-en.csv, and GeoLite2-City-Blocks-IPv6.csv (If you
need IPv6 support)
Be aware that the loading process of this database is quite slow.



/AddCountry Command-Line Option
===============================

/AddCountry is a unique command-line option that allows you to inject
country name for each IP address found inside the text file that you
specify. This command-line option can be useful for adding country
information for the output tracert and other network related tools.
The usage of /AddCountry is very simple:
/AddCountry [Source Filename] [Destination Filename]

If you don't specify the second parameter, the result will be saved into
the source filename.

Example for using /AddCountry:
tracert -d www.nirsoft.net > c:\temp\trace1.txt
IPInfoOffline.exe /AddCountry "c:\temp\trace1.txt"



Translating IPInfoOffline to other languages
============================================

In order to translate IPInfoOffline to other language, follow the
instructions below:
1. Run IPInfoOffline with /savelangfile parameter:
   IPInfoOffline.exe /savelangfile
   A file named IPInfoOffline_lng.ini will be created in the folder of
   IPInfoOffline utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run IPInfoOffline, and all
   translated strings will be loaded from the language file.
   If you want to run IPInfoOffline without the translation, simply
   rename the language file, or move it to another folder.



Command-Line Options
====================



/iplist <IP Addresses List>
Specifies a list of IP addresses to load. For example:
IPInfoOffline.exe /iplist "88.64.10.10 89.64.20.20 12.10.20.30"

/stext <Filename>
Save the IP addresses information into a regular text file.

/stab <Filename>
Save the IP addresses information into a tab-delimited text file.

/scomma <Filename>
Save the IP addresses information into a comma-delimited text file (csv).

/stabular <Filename>
Save the IP addresses information into a tabular text file.

/shtml <Filename>
Save the IP addresses information into HTML file (Horizontal).

/sverhtml <Filename>
Save the IP addresses information into HTML file (Vertical).

/sxml <Filename>
Save the IP addresses information into XML file.



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

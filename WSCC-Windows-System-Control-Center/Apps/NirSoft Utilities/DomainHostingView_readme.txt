


DomainHostingView v1.82
Copyright (c) 2011 - 2019 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

DomainHostingView is a utility for Windows that collects extensive
information about a domain by using a series of DNS and WHOIS queries,
and generates HTML report that can be displayed in any Web browser.
The information displayed by the report of DomainHostingView includes:
the hosting company or data center that hosts the Web server, mail
server, and domain name server (DNS) of the specified domain, the
created/changed/expire date of the domain, domain owner, domain registrar
that registered the domain, list of all DNS records, and more...



System Requirements And Limitations
===================================


* This utility works on any version of Windows, starting from Windows
  XP and up to Windows 10, including x64 versions of Windows. This
  utility also works on Windows 2000, but without the IDN support.
* Firewall/router requirements: You should allow DomainHostingView to
  connect the following outgoing TCP/UDP ports: 43 (WHOIS), 53 (DNS), 80
  (HTTP), and 25 (SMTP).
* The report created by DomainHostingView is based on the information
  provided by public WHOIS servers. If WHOIS server is temporary down,
  some information won't be displayed in the report. Also, some WHOIS
  servers may block your IP address if you use DomainHostingView to get
  reports about many domains in short perion of time.



DomainHostingView Features
==========================


* DomainHostingView is a Unicode application and this it can display
  properly WHOIS records containing non-English characters.
* DomainHostingView supports Internationalized domain names (IDN). When
  you type a domain with non-English characters, DomainHostingView
  automatically converts it into a format that can be used in the WHOIS
  and DNS servers.
* DomainHostingView parses the text returned by the WHOIS servers,
  extracts the important data, and displays it in easy-to-read summary.
* DomainHostingView also displays the raw text returned by the WHOIS
  servers, with a small enhancement - every http link is displayed as
  clickable link that opens the Web page in a new window.



Versions History
================


* Version 1.82
  o Updated the WHOIS server of .in domains.

* Version 1.81
  o Fixed to work properly with domains that contain German umlauts.

* Version 1.80
  o Added support for whois-server-list.xml - You can now download
    the whois servers list xml (whois-server-list.xml) from
    https://github.com/whois-server-list/whois-server-list , put it in
    the same folder of DomainHostingView.exe (as whois-server-list.xml
    file) and DomainHostingView will automatically extract the right
    whois server from this file for retrieving the domain information.

* Version 1.76
  o Added support for .swiss domains.

* Version 1.75
  o Added support for .global and .website domains.

* Version 1.74
  o Added support for .ky domains.

* Version 1.73
  o DomainHostingView now adds the -B flag to AFRINIC queries, for
    extracting email addresses.

* Version 1.72
  o Added the WHOIS servers of .top, .wang , .swiss , .cloud domains.

* Version 1.71
  o You can now specify https URL in the domain text-box.
  o You can now start to generate a report by specifying only the URL
    in the command-line string, for example:
    DomainHostingView.exe http://www.nirsoft.net

* Version 1.70
  o Added the WHOIS servers of .ai, .aw, .gi, .gg, .mo, .ml, .cf,
    .mz, .ec, .bo, .na, .nc, .rs domains, and more...

* Version 1.68
  o Added the whois servers of .hiphop, .pics, and .community domains.

* Version 1.67
  o Fixed bug: DomainHostingView failed to retrieve properly the
    WHOIS information of centralnic.com domains (gb.com and others).

* Version 1.66
  o The current domain is now displayed in the window title.

* Version 1.65
  o Fixed DomainHostingView to detect RIPE IP addresses blocks
    reassigned back to ARIN.
  o Fixed bug: DomainHostingView failed to remember the last
    size/position of the main window if it was not located in the primary
    monitor.

* Version 1.64
  o Added support for .im domains.

* Version 1.63
  o Added support for .london and .eus domains.

* Version 1.62
  o Fixed to display full WHOIS information for .name domains.

* Version 1.61
  o Fixed to display the main window properly when using large fonts
    settings

* Version 1.60
  o Added support for Donuts domains ( .email, .company, .support ,
    and many others...)

* Version 1.59
  o Added the WHOIS server of .ac.uk domains.

* Version 1.58
  o Added FTP server string (if it exists on the same address that
    the Web site is hosted).

* Version 1.57
  o Added the WHOIS server of .id domains.

* Version 1.56
  o DomainHostingView now detects more domain privacy services.

* Version 1.55
  o You can now choose the most recent 20 domains that you previously
    used, from a drop-down list.
  o Added 'CIDR' column to the 'IP Addresses Information' section.

* Version 1.51
  o Fixed the WHOIS server of .cl domains.

* Version 1.50
  o Updated the WHOIS servers of .hr, .es, .by, and .tn domains.

* Version 1.48
  o When using the 'Save HTML Report' option (Ctrl+S),
    DomainHostingView now automatically offers a default filename -
    [domain].html

* Version 1.47
  o Added the WHOIS server of .pw and .so domains.

* Version 1.46
  o Added 'Automatically Extract Domain Name' option. It allows you
    to turn off the 'full URL address' feature added on v1.40
  o Added the WHOIS server of .ax domains.

* Version 1.45
  o Fixed bug: When typing a domain like something.uk.com,
    DomainHostingView changed it to uk.com
  o Added the WHOIS servers for br.com, cn.com, eu.com, hu.com,
    no.com, gb.com, gb.net, qc.com, sa.com, se.com, se.net, us.com,
    uy.com, za.com, uk.com, and uk.net domains.

* Version 1.40
  o You can now copy and paste full URL address (http://...) into the
    domain text-box, and DomainHostingView will try to extract the domain
    for you.

* Version 1.38
  o Fixed bug: DomainHostingView failed to get the correct registrar
    whois server for .ws domains.

* Version 1.37:
  o Updated DomainHostingView to parse the dates of .fi domains.

* Version 1.36:
  o Fixed bug: The domain text-box disappeared if you pressed the ESC
    key.

* Version 1.35:
  o Add support for expire/last update dates on .co.nz domains.
  o Added --show-handles parameter for .dk domains to show handle
    information in the raw domain information text.
  o Fixed issue: The 'Advanced Options' window opened in the wrong
    monitor, on multi-monitors system.

* Version 1.32:
  o Added the WHOIS servers of .ke and .io domains.

* Version 1.31:
  o Updated DomainHostingView to parse the dates of
    Whois.domainsatcost.ca and Whois.Namescout.com servers.

* Version 1.30:
  o Added option to use your own CSS file in the HTML report instead
    of the default one (In the 'Advanced Options' window).

* Version 1.28:
  o Fixed bug: .be domains displayed as not registered even if the
    domain was registered

* Version 1.27:
  o Fixed the WHOIS server of .ru and .su domains.
  o Fixed issue: When the WHOIS server of the domain was slow,
    DomainHostingView generated the report without the WHOIS domain
    information.

* Version 1.26:
  o DomainHostingView now detects the dates of .ca , co.uk , and .hk
    domains.

* Version 1.25:
  o Added /GenerateReport command-line option, which allows you to
    generate html report of a domain directly into a file, without
    displaying any user interface.

* Version 1.21:
  o DomainHostingView now detects the dates of .ee domains.

* Version 1.20:
  o Added 'Put Icon On Tray' option.

* Version 1.15:
  o Added /StartDomain command-line option, which allows you to start
    DomainHostingView with the specified domain.

* Version 1.13:
  o DomainHostingView now detects the 'Expires On' date of .ie
    domains, the last update date of .ir domains and the update/expire
    dates of .it domains.

* Version 1.12:
  o Added 'Copy All' option. (Copy the entire report to the clipboard)

* Version 1.11:
  o Updated the WHOIS servers list.

* Version 1.10:
  o Added option to choose another DNS server instead of the default
    one (In 'Advanced Options' - F8)
  o Updated the internal WHOIS servers list.

* Version 1.05:
  o The country of the IP addresses is now displayed on the 'Summary
    Information' section.
  o When you click on a link, DomainHostingView now opens the URL
    with the default Web browser. (In previous versions, window of
    Internet Explorer was opened)

* Version 1.01:
  o Fixed bug: The Raw Domain Information section displayed garbage
    text from other queries.

* Version 1.00 - First release.



Start Using DomainHostingView
=============================

DomainHostingView doesn't require any installation process or additional
dll files. In order to start using it, simple run the executable file -
DomainHostingView.exe
Below the menu and the toolbar of DomainHostingView, you should type the
domain that you want to inspect, and then click the 'Go' button or press
F9. Be aware that you should type only the domain name, without the www
prefix of the Web site.
After you pressed F9, you should wait 2 - 15 seconds to collect the
information about the specified domain. When DomainHostingView finishes
to collect the domain information, the report is displayed on the main
window, and you can use the 'Save HTML Report' to save the report into a
file.



About The Domain Report of DomainHostingView
============================================

Here's the description of every section in the report of
DomainHostingView:
* Summary Information: In this section, you get a summary of the
  information extracted from the DNS and WHOIS queries:
  o Domain is registered with... Specifies the domain registrar that
    registered the domain (Like GoDaddy, NetworkSolutions, and others)
  o Domain is registered to...The owner of the domain. If the domain
    is protected by privacy service, DomainHostingView specifies that the
    name you see is not the real domain owner.
  o Web site is hosted by... Specifies the name of the hosting
    company or data center that hosts the Web site of this domain.
  o Mail Server is hosted by... Specifies the name of the hosting
    company or data center that hosts the mail server of this domain. For
    some domains, Web site and mail services are hosted in the same
    server, while others use different hosting companies for Web site and
    email services.
    For example, there are many companies that use the Gmail service of
    Google to send and receive all their emails, while their Web site is
    hosted in another hosting company.
  o Domain Name Server (DNS) is hosted by... Specifies the name of
    the hosting company or data center that hosts the DNS server of this
    domain. For some domains, the Web site and DNS server are hosted in
    the same company, while others use a separated DNS hosting service
  o Domain was created on... Specifies the date that the domain was
    created.
  o Domain was last updated on... Specifies the date that the domain
    was updated.
  o Domain expires on... Specifies the date that the domain expires.
  o Web site is hosted on... Specifies whether the Web site is hosted
    on Linux/Unix or Windows server. (In order to get this information,
    DomainHostingView sends a simple HTTP query to the server, and parses
    the server response)

  Be aware that some of the above fields will be displayed only for some
  of the domains.
* DNS Records: In this section, you get a table with all major DNS
  records (MX, A, NS, SOA) that can be extracted from the specified
  domain. For every IP address found in the other DNS records,
  DomainHostingView also extract the PTR record (Reverse DNS lookup)
* Subdomains: This section won't be displayed for most of the domains,
  because most DNS servers block the ability to extract the Subdomains of
  a domain. If DomainHostingView manages to extract the Subdomains list
  from the DNS server, it'll be displayed in a simple table with the IP
  address and Subdomain string.
* IP Addresses Information: This section provides a table with IP
  addresses information of the hosting company or data center that hosts
  the Web site, the mail server, and the domain name server.
* Raw Domain Information: This section provides the raw text returned
  from the WHOIS query of the domain.
* Web Server IP Address Information: This section provides the raw text
  returned from the WHOIS query of the Web server IP address.
* Mail Server IP Address Information: This section provides the raw
  text returned from the WHOIS query of the mail server IP address.
* Name Server IP Address Information: This section provides the raw
  text returned from the WHOIS query of the domain name server IP address.



Use another CSS file for the HTML report
========================================

Starting from version 1.30, you can use your own CSS file to generate the
HTML report. You can choose the desired CSS file in the Advanced Options
window (F8)

Here's the internal default CSS file of DomainHostingView:


BODY {font-family: Arial, Helvetica, sans-serif; background-color: #F8F8F8; color: #000000;}
H3 {color: #4040A0; font-size: 14pt; padding-top: 30px;}
H2 {color: #208080;} 
PRE {background-color:#F0F0F0;width:100%}
TH {background-color: #E0E0F8;text-align :left}


You can copy and paste the above CSS text into any text editor, make your
changes, save it into css file, and then choose the saved file from the
Advanced Options window.



Command-Line Options
====================



/StartDomain <Domain>
Starts DomainHostingView with the specified domain.

/GenerateReport <Domain> <Filename>
Generates a report of a domain directly into html file, without
displaying any user interface. For example:
DomainHostingView.exe /GenerateReport nirsoft.net
"f:\temp\nirsoft.net.html"



Translating DomainHostingView to other languages
================================================

In order to translate DomainHostingView to other language, follow the
instructions below:
1. Run DomainHostingView with /savelangfile parameter:
   DomainHostingView.exe /savelangfile
   A file named DomainHostingView_lng.ini will be created in the folder
   of DomainHostingView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run DomainHostingView, and all
   translated strings will be loaded from the language file.
   If you want to run DomainHostingView without the translation, simply
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



WhosIP v1.18
Copyright (c) 2004 - 2016 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

WhosIP is a simple command-line utility that allows you to easily find
all available information about an IP address: The owner of the IP
address, the country/state name, IP addresses range, contact information
(address, phone, fax, and email), and more.



Versions History
================


* Version 1.18:
  o Fixed WhosIP to show the IP addresses range ('From IP' and 'To
    IP' columns) of ARIN IPv6 addresses (taken from NetRange field).
  o Added 'CIDR' field.

* Version 1.17:
  o Fixed to detect the country of whois.registro.br records as
    Brazil.

* Version 1.16:
  o Fixed bug: WhosIP failed to get information of non-ARIN IPv6
    addresses.

* Version 1.15:
  o Added support for IPv6 addresses.
  o WhosIP now adds the -B flag to AFRINIC queries, for extracting
    email addresses.

* Version 1.11:
  o Fixed WhosIP to detect RIPE IP addresses blocks reassigned back
    to ARIN.

* Version 1.10:
  o Added support for SOCKS4 and SOCKS5 proxy. (Be aware that
    user/password authentication is currently not supported.)

* Version 1.08:
  o Updated the internal countries file (The original countries file
    was generated on 2004, and some countries were missing...)

* Version 1.07:
  o Updated the internal IANA IP assignment table, for using the
    correct WHOIS server, according to the first byte of the IP address.
  o Fixed issue with ARIN queries: For query result containing more
    than one IP range, IPNetInfo displayed the wrong network details in
    the upper table.

* Version 1.06: Fixed WhosIP to work with the changes made in ARIN
  WHOIS server.
* Version 1.05: Fixed bug: WhosIP displayed an empty owner name when
  the first 'desc' line of the WHOIS record was empty.
* Version 1.04: Fixed a problem with 151.*.*.* addresses.
* Version 1.03: WhosIP now automatically use the right server according
  to IP address.
* Version 1.02: Added -B option in ripe.net queries, to avoid the
  default data filtering.
* Version 1.01: Added support for AfriNIC IP Addresses.
* Version 1.00: First release



Usage
=====

WhosIP [-r] [-socks4] [-socks5] host-name



[-r]
If you specify this option, the original WHOIS record is displayed.
Otherwise, only a summary of the WHOIS record is displayed.

[-socks4]
Specifies SOCKS4 proxy to use, in IPAddress:Port format

[-socks5]
Specifies SOCKS5 proxy to use, in IPAddress:Port format

host-name
Host name or IP address.

Examples:
WhosIP -r www.nirsoft.net
WhosIP www.yahoo.com
WhosIP 216.239.59.147
WhosIP -socks5 192.168.0.55:1080 12.13.14.15

Example for WhosIP output:

WHOIS Source: ARIN
IP Address:   64.233.167.104
Country:      USA - California
Network Name: GOOGLE
Owner Name:   Google Inc.
From IP:      64.233.160.0
To IP:        64.233.191.255
Allocated:    Yes
Contact Name: Google Inc.
Address:      2400 E. Bayshore Parkway, Mountain View
Email:        arin-contact@google.com
Abuse Email:
Phone:        +1-650-318-0200
Fax:          


WHOIS Record:


OrgName:    Google Inc. 
OrgID:      GOGL
Address:    2400 E. Bayshore Parkway
City:       Mountain View
StateProv:  CA
PostalCode: 94043
Country:    US

NetRange:   64.233.160.0 - 64.233.191.255 
CIDR:       64.233.160.0/19 
NetName:    GOOGLE
NetHandle:  NET-64-233-160-0-1
Parent:     NET-64-0-0-0-0
NetType:    Direct Allocation
NameServer: NS1.GOOGLE.COM
NameServer: NS2.GOOGLE.COM
Comment:    
RegDate:    2003-08-18
Updated:    2004-03-05

TechHandle: ZG39-ARIN
TechName:   Google Inc. 
TechPhone:  +1-650-318-0200
TechEmail:  arin-contact@google.com 

OrgTechHandle: ZG39-ARIN
OrgTechName:   Google Inc. 
OrgTechPhone:  +1-650-318-0200
OrgTechEmail:  arin-contact@google.com

# ARIN WHOIS database, last updated 2004-09-22 19:10
# Enter ? for additional hints on searching ARIN's WHOIS database.




System Requirements
===================


* Any Windows operating system - from Windows 95 and up to Windows 8.
* Internet connection.


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

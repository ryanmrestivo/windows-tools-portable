/////////////////////////////////
pcANYWHERE Hosts Scanner v1.01
Copyright (c) 2002 Nir Sofer

Web site: http://nirsoft.mirrorz.com
/////////////////////////////////

Description
===========
This small utility can scan any range of 2 IP addresses and show the list of pcANYWHERE
hosts within that range. It finds the pcANYWHERE hosts by sending a specific UDP packet
to all hosts in the specified range. 
You can use this scanner for checking if there are pcANYWHERE hosts running on your TCP/IP network.  
Be aware that this utility can only detect pcANYWHERE hosts that listens on TCP/IP network.
It cannot detect pcANYWHERE hosts on other networks.

Warning
========
You should use this utility only for scanning your own network. Scanning other networks
without asking a permission from the system administrator might be considered as 
illegal activity.

License
=======
This utility is released as freeware. You can freely use and distribute it.
If you distribute this utility, you must include all files in the distribution package including the source code, without any modification !


Disclaimer
==========
The software is provided "AS IS" without any warranty, either expressed or implied,
including, but not limited to, the implied warranties of merchantability and fitness
for a particular purpose. The author will not be liable for any special, incidental,
consequential or indirect damages due to loss of data or any other reason. 


Installing this utility
========================
pcANYWHERE Hosts Scanner was written in Visual Basic language and requires the 
Visual Basic runtime files in order to run properly. 
If Visual Basic (Version 6.0) is installed on your computer, you'll probably be able to
run this utility without any problem. You can also run this utility from Visual Basic 
environment, because the source code is included within this package.

If you don't have Visual Basic on your system, follow the instructions below:
1. copy the mswinsck.ocx into your system directory and register it with regsvr32 utility.
   If this file is already exists on your system, you should not overwrite it, unless you have
   an obsolete version.
2. Try to run the executable: pcanyscan.exe
3. If the executable is running properly without any error messages about missing files, 
   you can use it without any further installations. If you receive any error message 
   when you try to run this utility, continue to the next instruction.
4. Download the VB6 runtime files. you can find them in the following web sites:
   A. At Microsoft Web site: http://www.microsoft.com/downloads/release.asp?releaseid=28337&area=top&ordinal=23
   B. At Simtel.Net Web site: http://www.simtel.net/vbrun.php  

5. Install the VB6 Runtime files on your computer. 
6. After the installation is completed, you'll be able run and use the "pcANYWHERE Hosts Scanner" utility. 

Using the pcANYWHERE Hosts Scanner
==================================
In order to search for pcANYWHERE hosts, type the start address, the end address, and 
click the "scan" button. During the scan, the current scanned IP address will be shown
on the label near the Scan and Stop buttons. You can always click the "stop" button if
you want to stop the scanning process. If a pcANYWHERE host is detected during the scan,
The IP address and host name will be add to the multiline text-box.


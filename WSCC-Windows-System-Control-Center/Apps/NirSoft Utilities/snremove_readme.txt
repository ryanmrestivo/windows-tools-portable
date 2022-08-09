


SNRemove v1.00
Copyright (c) 2005 Nir Sofer
Web Site: http://www.nirsoft.net



Description
===========

When a dll or exe file is signed with strong name keys, .NET doesn't
allow you to modify it. If you try to use a signed assembly, after you
have made some changes with Hex editor or any other tool, you'll get the
following exception:
An unhandled exception of type 'System.IO.FileLoadException' occurred in
system.windows.forms.dll Additional information: Strong name validation
failed for assembly 'MyAssembly.Test'.

If you try to run a signed executable file after you have made some
changes in it, you'll get the following error message:
String name validation failed for assembly... The file may have been
tampered with or it was partially signed but not fully signed with the
correct private key.


This utility removes the reference to strong name signature from .NET exe
and dll files. After removing the strong name reference, you can make any
change you want in dll/exe file, without getting any exception or error
message. However, be aware that assemblies with no strong name reference
cannot be added into the Global Assembly Cache (GAC).



Using SNRemove
==============

Using SNRemove is very simple - just extract the snremove.exe to any
folder you like, and run it from Command Prompt with the desired
command-line parameters.



SNRemove Usage
==============

SNRemove [options] <filename>

Options:

-r
Remove the reference to Strong Name signature from the specified file.

-d
Display the Strong Name signature of the specified file.

The <filename> parameter may also contain wildcards.

Examples:
SNRemove -r c:\myfiles\dll1.dll
SNRemove -d "c:\my files\*.dll"



System Requirements
===================

Although this utility is designed to work with exe and dll files created
for .NET environment, the utility by itself wasn't written in .NET, which
means that it can work in all versions of Windows, even if .NET Framework
is not installed.

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

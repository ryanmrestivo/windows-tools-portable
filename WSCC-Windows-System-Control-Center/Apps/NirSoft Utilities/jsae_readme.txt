


JavaScript Animator Express v1.10
Copyright (c) 2003 - 2004 Nir Sofer



Description
===========

This utility allows you to easily create animation from image files (GIFs
and JPGs) on your local drive. The animation is achieved by creating a
simple HTML page with JavaScript animation, and running it on your
default browser.



System Requirements
===================


* 32-bit Windows operating system: Windows 9x/ME, Windows NT, Windows
  2000, or Windows XP.
* Web browser with JavaScript support. (All Web browsers today supports
  JavaScript, unless you explicitly disable it)


Versions History
================


* Version 1.10:
  o Animation Delay: Allows you to set a delay after the entire
    animation sequence is completed.
  o HTML Template (For advanced users): allows you to edit the html
    code of the animation page.
  o Save/load your last settings.

* Version 1.00 - First release.



Installing JavaScript Animator Express
======================================

This utility is a standalone executable, so it doesn't require any
installation process or additional DLLs. In order to start using it, just
copy the executable (jsae.exe) to any folder you want and run it. You can
also use ZipInstaller to install this utility. If you do that, shortcuts
to the program will be automatically be added to Start Menu and to your
desktop, and a new entry will be added to the "Add/Remove Programs"
module in order to allow you to easily remove this utility in the future.



Using JavaScript Animator Express
=================================

In order to create animation with this utility, follow the instructions
below:
1. Type or select the folder that contains the images file you want to
   animate.
2. Optionally, you can type a file prefix if you want that only files
   starting with specific prefix will be displayed.
3. Select the image files that you want to add to the animation. You
   can also change the order of the files by using the "Move Up" and
   "Move Down" buttons.
4. Click the "Create Animation" button. The HTML page with your
   animation will be displayed in your default browser.



Packing animation into one file
===============================

Internet Explorer allows you to pack the entire Web page into single mht
file, including the files and images in it. You can also apply this
feature on the animation page created by this utility as long as the
'Allow to pack all animation files in mht file' option is checked. The
mht file created in this way contains all images need for the animation.



Using HTML Template (For advanced users)
========================================

When you choose to create Javascipt animation, jsae uses the default html
template to create the animation page. Starting from version 1.10, you
can modify the default HTML template in order to customize the animation
page that jsae utility creates.
If you want to create the animation from your own HTML template, follow
the instructions below:
1. Load template.html into a text/html editor.
2. Modify the file according to your needs. You can change/add style
   sheetes, add background image, add more images/text to the page, and
   so on. However, you should not change the variable names in the
   Javascript code, and you should not remove the
   "<!--***NIRSOFT_CODE***-->" string. If you do so, the animation may
   not work. After you make the desired changes, save them into a new
   filename.
3. In the animation dialog-box, check the "HTML Template" option, and
   select the html filename that you saved earlier.
4. When you click the "Create Animation" button, jsae uses your HTML
   file to create the animation page. The "<!--***NIRSOFT_CODE***-->"
   string is replaces by additional code needed for loading the images.



License
=======

This utility is released as freeware for personal and non-commercial use.
You are allowed to freely distribute this utility via floppy disk,
CD-ROM, Internet, or in any other way, as long as you don't charge
anything for this. If you distribute this utility, you must include all
files in the distribution package, without any modification !



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



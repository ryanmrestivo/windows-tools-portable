.\qpdf --decrypt in.pdf --password=onlyenterthisifyouknowit output.pdf

This file is README-windows-install.txt in the source distribution and
README.txt in the Windows binary distribution.

QPDF is completely relocatable. To use qpdf.exe or the qpdf DLL, just
have the bin directory in your path. To compile with qpdf, just add
the lib directory to your library path and the include directory to
your include path. If you are going to use Pl_DCT in your code, you
will also need to have jpeg library development files in your build
environment. Detailed documentation may be found in the doc directory.

Enjoy!


Download msys2 (64-bit) from msys2.org
Run the installer.
Run msys2_shell.cmd by allowing the installer to start it.
From the prompt:
Run pacman -Syuu and follow the instructions, which may tell you to close the window and rerun the command multiple times.
pacman -S make base-devel git zip unzip
pacman -S mingw-w64-x86_64-toolchain mingw-w64-i686-toolchain
Libra for Windows
Release Notes

January 29, 1993

This document contains information about installing Libra for Windows,
configuring your system, the use of memory and swap files and the most
recent corrections and/or additions to the manual.

I. Installing Libra for Windows

The Libra for Windows distribution set consists of two 3.5 inch,
high-density floppy disks, plus a software key distribution disk, which
may be supplied separately.

In addition, a hardware key must be installed or the program will
launch in Demo mode, providing limited functions and able to only
read encrypted .ckx files.

To install the hardware key:
   1.  Plug the hardware key into the LPT1 parallel port.

To install Libra for Windows from the MS-DOS prompt:
   1.  With the computer on, insert Disk 1, the Install Disk, in the
       appropriate drive.
   2.  At the MS-DOS prompt, type the drive letter that contains the
       Install Disk, followed by a colon (:); then press Return.
       For example: C> a:
   3.  Type "win install libra" and press Return.
   4.  Follow the on-screen prompts to install the additional program disks.

To install Libra for Windows from the Windows Program Manager:
   1.  Choose Run from the File menu.
   2.  Enter "a:\install libra" in the Command Line box.
   3.  Choose the OK button.

To install the software key from the MS-DOS prompt:
   1.  With the computer on, insert the software key disk in the
       appropriate drive.
   2.  At the MS-DOS prompt, type the drive letter that contains the disk,
       followed by a colon (:); then press Return.
       For example: C> a:
   3.  Type "win eesofkey libra" and press Return.

To install the software key from the Windows Program Manager:
   1.  Choose Run from the File menu.
   2.  Enter "a:\eesofkey libra" in the Command Line dialog box.
   3.  Choose the OK button.

Note: Verify that the serial number on the hardware key matches
      the serial number indicated on the software key distribution disk.
      If the serial numbers of the two keys do not match, the program will
      launch in Demo mode.

II. Configuring Your System.

At an absolute minimum, your CONFIG.SYS file should contain the
following command lines:

1. A command line for an extended-memory manager such as HIMEM.

	Examples: DEVICE=C:\WINDOWS\HIMEM.SYS

EEsof Windows based product will not run using expanded memory.

To use extended memory, all EEsof Windows based products require HIMEM
or a compatible memory manager.  When you installed Windows, the
Microsoft Setup program installed HIMEM and added the HIMEM command
line to your CONFIG.SYS file.  So, unless you deleted it, this necessary
command line is probable already there.

2.  A files command line setting files to at least 60; i.e., FILES=60.

Libra for Windows requires a large number of file handles for such
things as buffers, pens, brushes, fonts, storage files and data arrays.
If you do not allocate enough file handles using the files command,
the program will not operate properly and may crash!

Keep in mind that each grid and each Performance and/or Sensitivity
Histogram bin defined in the CKT file requires a handle.  If you intend
to use a lot of grids and/or histogram bins, the files number should be
increased accordingly.

3.  The buffers command line should be set to BUFFERS=30.

4. A shell command line specifying which command interpreter is to be
used when you switch to the MS-DOS prompt.  For example, if your
MS-DOS files are located in the DOS directory on drive C, the shell
command line should read:

	SHELL=C:\DOS\COMMAND.COM /P /E:2048

5. A stacks command line setting 9 stacks of 512 bytes each.  For example:

	STACKS=9,512

When you installed Windows, the Microsoft Setup program added this
stacks command line to your CONFIG.SYS file.  So, unless you deleted it,
this necessary command line is probable already there.

An Example CONFIG.SYS file follows:
	DEVICE=C:\DOS\SETVER.EXE
	DOS=HIGH 
	DEVICE=C:\WINDOWS\HIMEM.SYS 
	FILES=60
	BUFFERS=30
	BREAK=ON
	SHELL=C:\DOS\COMMAND.COM /P /E:2048
	STACKS=9,512

III.  Memory and Swap Files

Libra for Windows is written using 32-bit code and is
compiled into a single huge segment containing both code and data.  When
Libra for Windows is first launched, this segment occupies about 4 Mbytes.

As it runs simulations, arrays are created in the code/data segment which
cause it to grow.  How much depends on the circuit being simulated, the
number of frequency points and measurements being made, and the number of
variables being optimized or varied in a yield analysis.  10 Mbytes, 
12 Mbytes and more is not unusual.

The segment will grow up to all the available memory in your machine.

Windows will keep giving Libra space by moving the code segments and
resources of other programs (including Windows itself) to Swap Files
(if you have defined them) until it can't do it any more.  At that point,
Libra will probably crash.

If you experience system crashes when running large simulations,
optimizations, or yield analysis, close all other applications except 
Libra for Windows and the Microsoft Windows Program Manager.

If you still crash, your only solution is to add more RAM memory

It is recommended you review the chapter in the Windows Manual concerning
Swap Files.  A permanent Swap File on your hard disk of at least 8 Mbytes
is recommended.

Keep in mind that the memory indication presented in the About Box of
the Program Manager includes the virtual memory in the Swap File.

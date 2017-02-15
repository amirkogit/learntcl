This directory contains all the examples from the book,
"Practical Programming in Tcl and Tk."  The files that are
named with the example number are all automatically extracted
from the book (e.g., 1_1.tcl).

The "browse.tcl" script is built from a collection of examples.
On UNIX you may want to edit the first line
of the script to run the best version of wish.

These files have UNIX-style end-of-line characters (\n).
If you need to convert these because your editor cannot handle
it, use the FixNewline tcl proc in the native.tcl file.
Note that Tcl doesn't care what the end-of-line character is.

To fix the end-of-line character, start wish or tclsh, then

cd (whereever the CDROM exsource directory is)
source native.tcl
FixNewline * . /some/other/directory

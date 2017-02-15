#
# Example 3-9
# The newguest.cgi script.
#

#!/bin/sh
# \
exec tclsh "$0" ${1+"$@"}

# Use the ncgi package from tcllib to process form data

package require ncgi
ncgi::parse

# Load our data file and supporting procedures 

set dir [file dirname [info script]]
set datafile [file join $dir guestbook.data]
source [file join $dir cgihacks.tcl]

# Open the datafile in append mode

if {[catch {open $datafile a} out]} {
	Cgi_Header "Guestbook Registration Error" \
		{BGCOLOR=black TEXT=red}
	P
	puts "Cannot open the data file"
	P
	puts $out	;# the error message
	exit 0
}

# Append a Tcl set command that defines the guest's entry

puts $out ""
puts $out [list set Guestbook([ncgi::value name]) \
	[list [ncgi::value url] [ncgi::value html]]]
close $out

# Return a page to the browser

Cgi_Header "Guestbook Registration Confirmed" \
	{BGCOLOR=white TEXT=black}

puts "
<TABLE BORDER=1>
<TR><TD>Name</TD>
<TD>[ncgi::value name]</TD></TR>
<TR><TD>URL</TD>
<TD><A HREF=\" [ncgi::value url]\" >[ncgi::value url]</A></TD></TR>
<TR><TD>Extra HTML</TD>
<TD>[ncgi::value html]</TD></TR>
</TABLE>
"

puts </BODY></HTML>



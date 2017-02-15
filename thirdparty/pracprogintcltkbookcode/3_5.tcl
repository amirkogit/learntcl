#
# Example 3-5
# The guestbook.cgi script, version 2.
#

#!/bin/sh
# guestbook.cgi
# Implement a simple guestbook page.
# The set of visitors is kept in a simple database.
# The newguest.cgi script will update the database.
# \
exec tclsh "$0" ${1+"$@"}

# The guestbook.data file has the database
# The datafile is in the same directory as the script

set dir [file dirname [info script]]
set datafile [file join $dir guestbook.data]

# Load our supporting Tcl procedures to define Cgi_Header

source [file join $dir cgihacks.tcl]
Cgi_Header "Brent\" s Guestbook"

if {![file exists $datafile]} {
	puts "No registered guests, yet.
		<P>
		Be the first 
		<A href=\" newguest.html\" >registered guest!</A>"
} else {
	puts "The following folks have registered in my GuestBook.
		<P>
		<A href=\" newguest.html\" >Register</A>
		<h2>Guests</h2>"
	catch {source $datafile}
	foreach name [lsort [array names Guestbook]] {
		set item $Guestbook($name)
		set homepage [lindex $item 0]
		set markup [lindex $item 1]
		puts "<H3><A href=$homepage>$name</A></H3>"
		puts $markup
	}
}
puts "</BODY></HTML>"



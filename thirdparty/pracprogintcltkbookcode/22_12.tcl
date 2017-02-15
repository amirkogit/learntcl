#
# Example 22-12
# The main program for TclHttpd Starkit, version 3.
#

package require starkit
starkit::startup
set my_topdir $starkit::topdir
set path [file join [file dirname $my_topdir] tcllib.kit]
if {![file exists $path]} {
	puts stderr "Please install tcllib.kit in \
		[file dirname $my_topdir]"
	exit 1
}
source $path
source [file join $my_topdir tclhttpd3.4/bin/httpd.tcl]



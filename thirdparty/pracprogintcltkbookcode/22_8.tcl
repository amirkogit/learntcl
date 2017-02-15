#
# Example 22-8
# The main program for the TclHttpd Starkit, version 1.
#

package require starkit
starkit::startup
starkit::autoextend [file join $starkit::topdir tcllib1.3]
source [file join $starkit::topdir tclhttpd3.4.2/bin/httpd.tcl]



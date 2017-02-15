#
# Example 22-11
# The Standard Tcl Library Starkit main.tcl file.
#

package require starkit
if {[starkit::startup] eq "starkit"} {
	# Do application startup
    package require app-tcllib
} else {
	# Set up to be used as a library
    lappend auto_path [file join $starkit::topdir tcllib]
}



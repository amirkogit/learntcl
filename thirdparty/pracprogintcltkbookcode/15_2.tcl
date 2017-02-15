#
# Example 15-2
# Using scripts in nonstandard encodings.
#

proc Source {args} {
	set file [lindex $args end]
	if {[llength $args] == 3 && 
			[string equal -encoding [lindex $args 0]]} {
		set encoding [lindex $args 1]
		set in [open $file]
		fconfigure $in -encoding $encoding
		set script [read $in]
		close $in
		return [uplevel 1 $script]
	} elseif {[llength $args] == 1} {
		return [uplevel 1 [list source $file]]
	} else {
		return -code error \
			"Usage: Source ?-encoding encoding? file?"
	}
}



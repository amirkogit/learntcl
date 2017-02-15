#
# Example 13-12
# A Debug procedure.
#

proc Debug { args } {
	global debug
	if {![info exists debug(enabled)]} {
		# Default is to do nothing
		return
	}
	puts $debug(file) [join $args " "]
}
proc DebugOn {{file {}}} {
	global debug
	set debug(enabled) 1
	if {[string length $file] == 0} {
		set debug(file) stderr
	} else {
		if [catch {open $file w} fileID] {
			puts stderr "Cannot open $file: $fileID"
			set debug(file) stderr
		} else {
			puts stderr "Debug info to $file"
			set debug(file) $fileID
		}
	}
}
proc DebugOff {} {
	global debug
	if {[info exists debug(enabled)]} {
		unset debug(enabled)
		flush $debug(file)
		if {$debug(file) != "stderr" &&
			 $debug(file) != "stdout"} {
			close $debug(file)
			unset debug(file)
		}
	}
}



#
# Example 6-15
# A longer catch phrase.
#

if {[catch {
	command1
	command2
	command3
} result]} {
	global errorInfo
	puts stderr $result
	puts stderr "*** Tcl TRACE ***"
	puts stderr $errorInfo
} else {
	# command body ok, result of last command is in result
}



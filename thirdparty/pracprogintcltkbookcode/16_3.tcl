#
# Example 16-3
# A read event file handler for a nonblocking channel.
#

set pipe [open "|some command"]
fileevent $pipe readable [list Reader $pipe]
fconfigure $pipe -blocking 0
proc Reader { pipe } {
	global done
	if {[eof $pipe]} {
		catch {close $pipe}
		set done 1
		return
	}
	if {[gets $pipe line] < 0} {
		# We blocked anyway because only part of a line
		# was available for input
	} else {
		# Process one line
	}
}
vwait done



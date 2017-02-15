#
# Example 43-5
# Reading commands from a socket.
#

proc EvalRead {sock interp} {
	global eval errorInfo errorCode
	if [eof $sock] {
		close $sock
	} else {
		gets $sock line
		append eval(cmdbuf,$sock) $line\n
		if {[string length $eval(cmdbuf,$sock)] && \
				[info complete $eval(cmdbuf,$sock)]} {
			set code [catch {
				if {[string length $interp] == 0} {
					uplevel #0 $eval(cmdbuf,$sock)
				} else {
					interp eval $interp $eval(cmdbuf,$sock)
				}
			} result]
			set reply [list $code $result $errorInfo \
				$errorCode]\n
			# Use regsub to count newlines
			set lines [regsub -all \n $reply {} junk]
			# The reply is a line count followed
			# by a Tcl list that occupies that number of lines
			puts $sock $lines
			puts -nonewline $sock $reply
			flush $sock
			set eval(cmdbuf,$sock) {}
		}
	}
}



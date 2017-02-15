#
# Example 43-6
# The client side of remote evaluation.
#

proc Eval_Open {server port} {
	global eval
	set sock [socket $server $port]
	# Save this info for error reporting
	set eval(server,$sock) $server:$port
	return $sock
}
proc Eval_Remote {sock args} {
	global eval
	# Preserve the concat semantics of eval
	if {[llength $args] > 1} {
		set cmd [concat $args]
	} else {
		set cmd [lindex $args 0]
	}
	puts $sock $cmd
	flush $sock
	# Read return line count and the result.
	gets $sock lines
	set result {}
	while {$lines > 0} {
		gets $sock x
		append result $x\n
		incr lines -1
	}
	set code [lindex $result 0]
	set x [lindex $result 1]
	# Cleanup the end of the stack
	regsub "\[^\n]+$" [lindex $result 2] \
		"*Remote Server $eval(server,$sock)*" stack
	set ec [lindex $result 3]
	return -code $code -errorinfo $stack -errorcode $ec $x
}
proc Eval_Close {sock} {
	close $sock
}



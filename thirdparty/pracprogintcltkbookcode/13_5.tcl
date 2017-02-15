#
# Example 13-5
# Getting a trace of the Tcl call stack.
#

proc Call_Trace {{file stdout}} {
	puts $file "Tcl Call Trace"
	for {set x [expr [info level]-1]} {$x > 0} {incr x -1} {
		puts $file "$x: [info level $x]"
	}
}



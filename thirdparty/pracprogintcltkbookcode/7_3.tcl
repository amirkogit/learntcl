#
# Example 7-3
# Variable scope and Tcl procedures.
#

set a 5
set b -8
proc P1 {a} {
	set b 42
	if {$a < 0} {
		return $b
	} else {
		return $a
	}
}
P1 $b
#=> 42
P1 [expr $a*2]
#=> 10



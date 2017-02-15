#
# Example 1-14
# A recursive definition of factorial.
#

proc Factorial {x} {
	if {$x <= 1} {
		return 1
	} else {
		return [expr {$x * [Factorial [expr {$x - 1}]]}]
	}
}



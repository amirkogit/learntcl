#
# Example 7-6
# Improved incr procedure.
#

proc incr { varName {amount 1}} {
	upvar 1 $varName var
	if {[info exists var]} {
		set var [expr $var + $amount]
	} else {
		set var $amount
	}
	return $var
}



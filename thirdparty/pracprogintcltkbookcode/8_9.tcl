#
# Example 8-9
# Using an array to implement a stack.
#

proc Push { stack value } {
	upvar $stack S
	if {![info exists S(top)]} {
		set S(top) 0
	}
	set S($S(top)) $value
	incr S(top)
}
proc Pop { stack } {
	upvar $stack S
	if {![info exists S(top)]} {
		return {}
	}
	if {$S(top) == 0} {
		return {}
	} else {
		incr S(top) -1
		set x $S($S(top))
		unset S($S(top))
		return $x
	}
}



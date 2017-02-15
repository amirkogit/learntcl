#
# Example 13-9
# Creating array elements with array traces.
#

# make sure variable is an array
set dynamic() {}
trace variable dynamic r FixupDynamic
proc FixupDynamic {name index op} {
	upvar 1 $name dynArray
	if {![info exists dynArray($index)]} {
		set dynArray($index) 0
	}
}



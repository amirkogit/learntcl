#
# Example 10-4
# lassign: list assignment with foreach.
#

# Assign a set of variables from a list of values.
# If there are more values than variables, they are returned.
# If there are fewer values than variables, 
# the variables get the empty string.

proc lassign {valueList args} {
	if {[llength $args] == 0} {
		error "wrong # args: lassign list varname ?varname..?"
	}
	if {[llength $valueList] == 0} {
		# Ensure one trip through the foreach loop
		set valueList [list {}]
	}
	uplevel 1 [list foreach $args $valueList {break}]
	return [lrange $valueList [llength $args] end]
}



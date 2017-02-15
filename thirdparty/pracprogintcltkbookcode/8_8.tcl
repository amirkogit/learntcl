#
# Example 8-8
# Using a list to implement a stack.
#

proc Push { stack value } {
	upvar $stack list
	lappend list $value
}
proc Pop { stack } {
	upvar $stack list
	set value [lindex $list end]
	set list [lrange $list 0 [expr [llength $list]-2]]
	return $value
}



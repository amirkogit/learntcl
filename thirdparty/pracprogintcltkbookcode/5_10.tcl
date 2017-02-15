#
# Example 5-10
# Implementing join in Tcl.
#

proc join {list sep} {
	set s {}			;# s is the current separator
	set result {}
	foreach x $list {
		append result $s $x
		set s $sep
	}
	return $result
}



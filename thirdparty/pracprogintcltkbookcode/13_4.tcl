#
# Example 13-4
# Finding built-in commands.
#

proc Command_Info {{pattern *}} {
	# Create a table of procedures for quick lookup

	foreach p [info procs $pattern] {
		set isproc($p) 1
	}

	# Look for command not in the procedure table
	set result {}
	foreach c [info commands $pattern] {
		if {![info exists isproc($c)]} {
			lappend result $c
		}
	}
	return [lsort $result]
}



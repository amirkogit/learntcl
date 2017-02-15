#
# Example 13-2
# Printing a procedure definition.
#

proc Proc_Show {{namepat *} {file stdout}} {
	foreach proc [info procs $namepat] {
		set space ""
		puts -nonewline $file "proc $proc {"
		foreach arg [info args $proc] {
			if [info default $proc $arg value] {
				puts -nonewline $file "$space{$arg $value}"
			} else {
				puts -nonewline $file $space$arg
			}
			set space " "
		}

		# Double quotes allow substitution
		# of [info body $proc]

		puts $file "} {[info body $proc]}"
	}
}



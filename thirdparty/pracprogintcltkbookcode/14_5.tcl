#
# Example 14-5
# Listing commands defined by a namespace.
#

proc Namespace_List {{namespace {}}} {
	if {[string length $namespace] == 0} {
		# Determine the namespace of our caller
		set namespace [uplevel {namespace current}]
	}
	set result {}
	foreach cmd [info commands ${namespace}::*] {
		if {[namespace origin $cmd] == $cmd} {
			lappend result $cmd
		}
	}
	return [lsort $result]
}



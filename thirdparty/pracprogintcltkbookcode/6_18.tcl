#
# Example 6-18
# Preserving errorInfo when calling error.
#

if {[catch {foo} result]} {
	global errorInfo
	set savedInfo $errorInfo
	# Attempt to handle the error here, but cannot...
	error $result $savedInfo
}



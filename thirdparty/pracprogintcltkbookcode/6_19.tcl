#
# Example 6-19
# Raising an error with return.
#

proc bar {} {
	return -code error bogus
}
catch {bar} result
#=> 1
set result
#=> bogus
set errorInfo
#=> bogus
	while executing
"bar"



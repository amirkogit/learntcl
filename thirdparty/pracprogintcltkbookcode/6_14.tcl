#
# Example 6-14
# A standard catch phrase.
#

if {[catch { command arg1 arg2 ... } result]} {
	puts stderr $result
} else {
	# command was ok, result contains the return value
}



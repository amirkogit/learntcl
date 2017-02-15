#
# Example 6-13
# A for loop.
#

for {set i 0} {$i < 10} {incr i 3} {
	lappend aList $i
}
set aList
#=> 0 3 6 9



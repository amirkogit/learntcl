#
# Example 6-8
# Looping with foreach.
#

set i 1
foreach value {1 3 5 7 11 13 17 19 23} {
	set i [expr $i*$value]
}
set i
#=> 111546435



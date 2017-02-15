#
# Example 8-1
# Using arrays.
#

set arr(0) 1
for {set i 1} {$i <= 10} {incr i} {
	set arr($i) [expr {$i * $arr([expr {$i-1}])}]
}



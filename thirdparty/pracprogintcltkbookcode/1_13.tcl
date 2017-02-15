#
# Example 1-13
# A while loop to compute factorial.
#

proc Factorial {x} {
	set i 1; set product 1
	while {$i <= $x} {
		set product [expr {$product * $i}]
		incr i
	}
	return $product
}
Factorial 10
#=> 3628800



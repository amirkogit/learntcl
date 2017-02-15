#
# Example 7-1
# Default parameter values.
#

proc P2 {a {b 7} {c -2} } {
	expr $a / $b + $c
}
P2 6 3
#=> 0



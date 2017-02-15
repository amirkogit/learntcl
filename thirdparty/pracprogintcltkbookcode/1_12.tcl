#
# Example 1-12
# Defining a procedure.
#

proc Diag {a b} {
	set c [expr {sqrt($a * $a + $b * $b)}]
	return $c
}
puts "The diagonal of a 3, 4 right triangle is [Diag 3 4]"
#=> The diagonal of a 3, 4 right triangle is 5.0



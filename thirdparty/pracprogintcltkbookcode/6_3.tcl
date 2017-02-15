#
# Example 6-3
# Using switch for an exact match.
#

switch -exact -- $value {
	foo { doFoo; incr count(foo) }
	bar { doBar; return $count(foo)}
	default { incr count(other) }
}



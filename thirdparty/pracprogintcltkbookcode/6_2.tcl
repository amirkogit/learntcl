#
# Example 6-2
# Chained conditional with elseif.
#

if {$key < 0} {
	incr range 1
} elseif {$key == 0} {
	return $range
} else {
	incr range -1
}



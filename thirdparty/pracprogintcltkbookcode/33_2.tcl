#
# Example 33-2
# Scroll_Set manages optional scrollbars.
#

proc Scroll_Set {scrollbar geoCmd offset size} {
	if {$offset != 0.0 || $size != 1.0} {
		eval $geoCmd					;# Make sure it is visible
	}
	$scrollbar set $offset $size
}



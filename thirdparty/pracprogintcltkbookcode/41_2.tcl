#
# Example 41-2
# Computing a darker color.
#

proc ColorDarken { win color } {
	set rgb [winfo rgb $win $color]
	return [format "#%03x%03x%03x" \
		[expr round([lindex $rgb 0] * 0.95)] \
		[expr round([lindex $rgb 1] * 0.95)] \
		[expr round([lindex $rgb 2] * 0.95)]]
}



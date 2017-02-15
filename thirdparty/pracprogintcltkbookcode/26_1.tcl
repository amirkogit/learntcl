#
# Example 26-1
# A basic grid.
#

foreach color {red orange yellow green blue purple} {
	label .l$color -text $color -bg white
	frame .f$color -background $color -width 100 -height 2
	grid .l$color .f$color
}



#
# Example 26-2
# A grid with sticky settings.
#

foreach color {red orange yellow green blue purple} {
	label .l$color -text $color -bg white
	frame .f$color -background $color -width 100 -height 2
	grid .l$color .f$color
	grid .l$color -sticky w
	grid .f$color -sticky ns
}



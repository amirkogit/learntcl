#
# Example 26-3
# A grid with row and column specifications.
#

set row 0
foreach color {red orange yellow green blue purple} {
	label .l$color -text $color -bg white
	frame .f$color -background $color -width 100
	grid .l$color -row $row -column 0 -sticky w
	grid .f$color -row $row -column 1 -sticky ns
	incr row
}



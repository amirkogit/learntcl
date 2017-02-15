#
# Example 26-5
# A grid with internal padding.
#

foreach color {red orange yellow green blue purple} {
	label .l$color -text $color -bg white
	frame .f$color -background $color -width 100 -height 2
	grid .l$color .f$color
	grid .l$color -sticky w -padx 3 -ipady 5
	grid .f$color -sticky ns -pady 1
}



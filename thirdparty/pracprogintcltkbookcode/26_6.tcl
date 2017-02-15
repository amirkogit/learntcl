#
# Example 26-6
# All combinations of -sticky settings.
#

set index 0
foreach x {news ns ew  " " new sew wsn esn nw ne sw se n s w e} {
	frame .f$x -borderwidth 2 -relief ridge -width 40 -height 40
	grid .f$x -sticky news \
		-row [expr $index/4] -column [expr $index%4]
	label .l$x -text $x -background white 
	grid .l$x -sticky $x -padx 2 -pady 2 \
		-row [expr $index/4] -column [expr $index%4]
	incr index
}




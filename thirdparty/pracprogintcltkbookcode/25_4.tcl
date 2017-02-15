#
# Example 25-4
# Even more nesting of horizontal and vertical stacks.
#

frame .one -bg white
frame .two -width 100 -height 50 -bg grey50
foreach b {alpha beta} {
	button .one.$b -text $b
	pack .one.$b -side left
}
# Create a frame for two more buttons
frame .one.right
foreach b {delta epsilon} {
	button .one.right.$b -text $b
	pack .one.right.$b -side bottom
}
pack .one.right -side right
pack .one .two -side top



#
# Example 25-18
# Packing into other relatives.
#

# Create and pack two frames
frame .one -bg white
frame .two -width 100 -height 50 -bg grey50
# Create a row of buttons
foreach b {alpha beta} {
	button .$b -text $b
	pack .$b -in .one -side left
}
# Create a frame for two more buttons
frame .one.right
foreach b {delta epsilon} {
	button .$b -text $b
	pack .$b -in .one.right -side bottom
}
pack .one.right -side right
pack .one .two -side top



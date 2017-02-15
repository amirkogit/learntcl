#
# Example 25-3
# A horizontal stack inside a vertical stack.
#

frame .one -bg white
frame .two -width 100 -height 50 -bg grey50
# Create a row of buttons
foreach b {alpha beta gamma} {
	button .one.$b -text $b
	pack .one.$b -side left
}
pack .one .two -side top



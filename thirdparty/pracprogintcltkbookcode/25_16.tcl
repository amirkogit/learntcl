#
# Example 25-16
# Animating the packing anchors.
#

foreach anchor {center n ne e se s sw w nw center} {
	pack .foo .prop -anchor $anchor 
	# Update the display
	update idletasks
	# Wait half a second
	after 500 
}



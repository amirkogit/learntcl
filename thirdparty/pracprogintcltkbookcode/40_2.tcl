#
# Example 40-2
# 3D relief sampler.
#

frame .f -borderwidth 10
pack .f
foreach relief {raised sunken flat ridge groove solid} {
	label .f.$relief -text $relief -relief $relief \
		-bd 2 -padx 3
	pack .f.$relief -side left -padx 4
}



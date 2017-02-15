#
# Example 37-4
# Moving the markers for the min max scale.
#

proc Scale2Mark { w x what } {
	global scale2
	# Remember the anchor point for the drag
	set scale2($w,$what) $x
}
proc Scale2Drag { w x what } {
	global scale2

	# Compute delta and update anchor point
	set x1 $scale2($w,$what)
	set scale2($w,$what) $x
	set dx [expr $x - $x1]

	# Find out where the boxes are currently
	set rx [lindex [$w coords rbox] 0]
	set lx [lindex [$w coords lbox] 0]

	if {$what == "lbox"} {
		# Constrain the movement to be between the
		# left edge and the right marker.
		if {$lx + $dx > $rx} {
			set dx [expr $rx - $lx]
			set scale2($w,$what) $rx
		} elseif {$lx + $dx < $scale2($w,L)} {
			set dx [expr $scale2($w,L) - $lx]
			set scale2($w,$what) $scale2($w,L)
		}
		$w move left $dx 0

		# Update the minimum value and the hanging text
		set lx [lindex [$w coords lbox] 0]
		set scale2($w,min) [expr int($scale2($w,Min) + \
			($lx-$scale2($w,L)) * $scale2($w,scale))]
		$w itemconfigure lnum -text $scale2($w,min)
	} else {
		# Constrain the movement to be between the
		# right edge and the left marker
		if {$rx + $dx < $lx} {
			set dx [expr $lx - $rx]
			set scale2($w,$what) $lx
		} elseif {$rx + $dx > $scale2($w,R)} {
			set dx [expr $scale2($w,R) - $rx]
			set scale2($w,$what) $scale2($w,R)
		}
		$w move right $dx 0

		# Update the maximum value and the hanging text
		set rx [lindex [$w coords right] 0]
		set scale2($w,max) [expr int($scale2($w,Min) + \
			($rx-$scale2($w,L)) * $scale2($w,scale))]
		$w itemconfigure rnum -text $scale2($w,max)
	}
}
proc Scale2Value {w} {
	global scale2
	# Return the current values of the double slider
	return [list $scale2($w,min) $scale2($w,max)]
}



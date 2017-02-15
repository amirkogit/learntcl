#
# Example 38-4
# Selecting objects.
#

proc CanvasSelect { w x y } {
	# Select an item on the canvas.
	global canvas
	set id [$w find closest $x $y]
	set canvas(select,$w) $id
	CanvasHighlight $w $id
	# Claim ownership of the PRIMARY selection
	selection own -command [list CanvasSelectLose $w] $w
	focus $w
}
proc CanvasHighlight {w id {clear clear}} {
	if {$clear == "clear"} {
		$w delete highlight
	}
	foreach {x1 y1 x2 y2} [$w bbox $id] { # lassign }
	foreach x [list $x1 $x2] {
		foreach y [list $y1 $y2] {
			$w create rectangle [expr $x-2] [expr $y-2] \
				[expr $x+2] [expr $y+2] -fill black \
				-tag highlight
		}
	}
}
proc CanvasSelectLose { w } {
	# Some other app has claimed the selection
	global canvas
	$w delete highlight
	unset canvas(select,$w)
}



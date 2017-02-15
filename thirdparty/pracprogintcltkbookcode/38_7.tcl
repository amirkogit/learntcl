#
# Example 38-7
# Pasting onto the canvas.
#

proc CanvasPaste { w {x {}} {y {}}} {
	# Paste the selection from the CLIPBOARD
	if [catch {selection get -selection CLIPBOARD} sel] {
		# no clipboard data
		return
	}
	if {[string length $x] == 0} {
		# <<Paste>>, get the current mouse coordinates
		set x [expr [winfo pointerx $w] - [winfo rootx $w]]
		set y [expr [winfo pointery $w] - [winfo rooty $w]]
		if {$x < 0 || $y < 0 ||
				$x > [winfo width $w] ||
				$y > [winfo height $w]} {
			# Mouse outside the window - center object
			set x [expr [winfo width $w]/2]
			set y [expr [winfo height $w]/2]
		}
	}
	if [regexp {^CanvasObject} $sel] {
		if [catch {eval {$w create} [lrange $sel 1 end]} id] {
			return;
		}
		# look at the first coordinate to see where to
		# move the object. Element 1 is the type, the
		# next two are the first coordinate
		set x1 [lindex $sel 2]
		set y1 [lindex $sel 3]
		$w move $id [expr $x-$x1] [expr $y-$y1]
	}
}



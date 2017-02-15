#
# Example 37-11
# Dragging out a box.
#

proc BoxInit {} {
	canvas .c -bg white ; pack .c
	bind .c <Button-1> {BoxBegin %W %x %y}
	bind .c <B1-Motion> {BoxDrag %W %x %y}
}
proc BoxBegin { w x y } {
	global box
	set box($w,anchor) [list $x $y]
	catch {unset box($w,last)}
}
proc BoxDrag { w x y } {
	global box
	catch {$w delete $box($w,last)}
	set box($w,last) [eval {$w create rect} $box($w,anchor) \
		{$x $y -tag box}]
}



#
# Example 37-8
# A canvas stroke drawing example.
#

proc StrokeInit {} {
	canvas .c ; pack .c
	bind .c <Button-1> {StrokeBegin %W %x %y}
	bind .c <B1-Motion> {Stroke %W %x %y}
	bind .c <ButtonRelease-1> {StrokeEnd %W %x %y}
}
proc StrokeBegin { w x y } {
	global stroke
	catch {unset stroke}
	set stroke(N) 0
	set stroke(0) [list $x $y]
}
proc Stroke { w x y } {
	global stroke
	set coords $stroke($stroke(N))
	lappend coords $x $y
	incr stroke(N)
	set stroke($stroke(N)) [list $x $y]
	# eval gets the coordinates into individual arguments
	eval {$w create line} $coords {-tag segments}
}
proc StrokeEnd { w x y } {
	global stroke
	set coords {}
	for {set i 0} {$i <= $stroke(N)} {incr i} {
		append coords $stroke($i) " "
	}
	$w delete segments
	eval {$w create line} $coords \
		{-tag line -joinstyle round -smooth true -arrow last}
}




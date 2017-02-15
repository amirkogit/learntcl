#
# Example 37-2
# The canvas "Hello, World!" example.
#

proc CanvasHello {} {
	set can [Scrolled_Canvas .c -width 400 -height 100 \
		-scrollregion {0 0 800 400}]
	pack .c -fill both -expand true
	# Create a text object on the canvas
	$can create text 50 50 -text "Hello, World!" -tag movable
	# Bind actions to objects with the movable tag
	$can bind movable <Button-1> {CanvasMark %x %y %W}
	$can bind movable <B1-Motion> {CanvasDrag %x %y %W}
}
proc CanvasMark { x y can} {
	global canvas
	# Map from view coordinates to canvas coordinates
	set x [$can canvasx $x]
	set y [$can canvasy $y]
	# Remember the object and its location
	set canvas($can,obj) [$can find closest $x $y]
	set canvas($can,x) $x
	set canvas($can,y) $y
}
proc CanvasDrag { x y can} {
	global canvas
	# Map from view coordinates to canvas coordinates
	set x [$can canvasx $x]
	set y [$can canvasy $y]
	# Move the current object
	set dx [expr $x - $canvas($can,x)]
	set dy [expr $y - $canvas($can,y)]
	$can move $canvas($can,obj) $dx $dy
	set canvas($can,x) $x
	set canvas($can,y) $y 
}



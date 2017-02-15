#
# Example 38-3
# Bindings for canvas selection.
#

proc CanvasSelect_Demo { c } {
	# Create a canvas with a couple of objects
	canvas $c
	pack $c
	$c create rect 10 10 50 50 -fill red -tag object
	$c create poly 100 100 100 30 140 50 -fill orange \
		-tag object
	# Set up cut and paste bindings
	$c bind object <Button-1> [list CanvasSelect $c %x %y]
	bind $c <Key-Delete> [list CanvasDelete $c]
	bind $c <<Cut>> [list CanvasCut $c]
	bind $c <<Copy>> [list CanvasCopy $c]
	bind $c <<Paste>> [list CanvasPaste $c]
	bind $c <Button-2> [list CanvasPaste $c %x %y]
	# Register the handler for selection requests
	selection handle $c [list CanvasSelectHandle $c]
}



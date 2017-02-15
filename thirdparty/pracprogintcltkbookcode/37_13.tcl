#
# Example 37-13
# Using a canvas to scroll a set of widgets.
#

proc Example35-13 { top title labels } {
	# Create a resizable toplevel window
	toplevel $top
	wm minsize $top 200 100
	wm title $top $title

	# Create a frame for buttons,
	# Only Dismiss does anything useful
	set f [frame $top.buttons -bd 4]
	button $f.quit -text Dismiss -command "destroy $top"
	button $f.save -text Save
	button $f.reset -text Reset
	pack $f.quit $f.save $f.reset -side right
	pack $f -side top -fill x

	# Create a scrolling canvas
	frame $top.c
	canvas $top.c.canvas -width 10 -height 10 \
		-yscrollcommand [list $top.c.yscroll set]
	scrollbar $top.c.yscroll -orient vertical \
		-command [list $top.c.canvas yview]
	pack $top.c.yscroll -side right -fill y
	pack $top.c.canvas -side left -fill both -expand true
	pack $top.c -side top -fill both -expand true

	Scrolled_EntrySet $top.c.canvas $labels
}
proc Scrolled_EntrySet { canvas labels } {
	# Create one frame to hold everything
	# and position it on the canvas
	set f [frame $canvas.f -bd 0]
	$canvas create window 0 0 -anchor nw -window $f

	# Create and grid the labeled entries
	set i 0
	foreach label $labels {
		label $f.label$i -text $label
		entry $f.entry$i
		grid $f.label$i $f.entry$i
		grid $f.label$i -sticky w
		grid $f.entry$i -sticky we
		incr i
	}
	set child $f.entry0

	# Wait for the window to become visible and then
	# set up the scroll region based on
	# the requested size of the frame, and set 
	# the scroll increment based on the
	# requested height of the widgets

	tkwait visibility $child
	set bbox [grid bbox $f 0 0]
	set incr [lindex $bbox 3]
	set width [winfo reqwidth $f]
	set height [winfo reqheight $f]
	$canvas config -scrollregion "0 0 $width $height"
	$canvas config -yscrollincrement $incr
	set max [llength $labels]
	if {$max > 10} {
		set max 10
	}
	set height [expr $incr * $max]
	$canvas config -width $width -height $height
}
Example35-13 .ex "An example" {
	alpha beta gamma delta epsilon zeta eta theta iota kappa
	lambda mu nu xi omicron pi rho sigma tau upsilon
	phi chi psi omega}



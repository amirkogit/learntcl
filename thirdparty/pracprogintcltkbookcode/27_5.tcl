#
# Example 27-5
# Pane_Create sets up vertical or horizontal panes.
#

proc Pane_Create {f1 f2 args} {

	# Map optional arguments into array values
	set t(-orient) vertical
	set t(-percent) 0.5
	set t(-in) [winfo parent $f1]
	array set t $args

	# Keep state in an array associated with the master frame
	set master $t(-in)
	upvar #0 Pane$master pane
	array set pane [array get t]

	# Create the grip and set placement attributes that
	# will not change. A thin divider line is achieved by
	# making the two frames one pixel smaller in the
	# adjustable dimension and making the main frame black.

	set pane(1) $f1
	set pane(2) $f2
	set pane(grip) [frame $master.grip -background gray50 \
		-width 10 -height 10 -bd 1 -relief raised \
		-cursor crosshair]
	if {[string match vert* $pane(-orient)]} {
		set pane(D) Y		;# Adjust boundary in Y direction
		place $pane(1) -in $master -x 0 -rely 0.0 -anchor nw \
			-relwidth 1.0 -height -1
		place $pane(2) -in $master -x 0 -rely 1.0 -anchor sw \
			-relwidth 1.0 -height -1
		place $pane(grip) -in $master -anchor c -relx 0.8
	} else {
		set pane(D) X 		;# Adjust boundary in X direction
		place $pane(1) -in $master -relx 0.0 -y 0 -anchor nw \
			-relheight 1.0 -width -1
		place $pane(2) -in $master -relx 1.0 -y 0 -anchor ne \
			-relheight 1.0 -width -1
		place $pane(grip) -in $master -anchor c -rely 0.8
	}
	$master configure -background black

	# Set up bindings for resize, <Configure>, and 
	# for dragging the grip.

	bind $master <Configure> [list PaneGeometry $master]
	bind $pane(grip) <ButtonPress-1> \
		[list PaneDrag $master %$pane(D)]
	bind $pane(grip) <B1-Motion> \
		[list PaneDrag $master %$pane(D)]
	bind $pane(grip) <ButtonRelease-1> \
		[list PaneStop $master]

	# Do the initial layout

	PaneGeometry $master
}



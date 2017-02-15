#
# Example 37-3
# A min max scale canvas example.
#

proc Scale2 {w min max {width {}} } {
	global scale2
	if {$width == {}} {
		# Set the long dimension, in pixels
		set width [expr $max - $min]
	}
	# Save parameters
	set scale2($w,scale) [expr ($max-$min)/$width.0]
	set scale2($w,min) $min						;# Current minimum
	set scale2($w,max) $max
	set scale2($w,Min) $min							;# Lower bound to the scale
	set scale2($w,Max) $max
	set scale2($w,L) 10	
	set scale2($w,R) [expr $width+10]

	# Build from 0 to 100, then scale and move it later.
	# Distance between left edges of boxes is 100.
	# The box is 10 wide, therefore the slider is 110 long.
	# The left box sticks up, and the right one hangs down.

	canvas $w
	$w create rect 0 0 110 10 -fill grey -tag slider
	$w create rect 0 -4 10 10 -fill black -tag {left lbox}
	$w create rect 100 0 110 14 -fill red -tag {right rbox}
	$w create text 5 16 -anchor n -text $min -tag {left lnum}
	$w create text 105 16 -anchor n -text $max \
		-tag {right rnum} -fill red

	# Stretch/shrink the slider to the right length
	set scale [expr ($width+10) / 110.0]
	$w scale slider 0 0 $scale 1.0

	# move the right box and text to match new length
	set nx [lindex [$w coords slider] 2]
	$w move right [expr $nx-110] 0
	# Move everything into view
	$w move all 10 10

	# Make the canvas fit comfortably around the image
	set bbox [$w bbox all]
	set height [expr [lindex $bbox 3]+4]
	$w config -height $height -width [expr $width+30]

	# Bind drag actions
	$w bind left <Button-1> {Scale2Mark %W %x lbox}
	$w bind right <Button-1> {Scale2Mark %W %x rbox}
	$w bind left <B1-Motion> {Scale2Drag %W %x lbox}
	$w bind right <B1-Motion> {Scale2Drag %W %x rbox}
}



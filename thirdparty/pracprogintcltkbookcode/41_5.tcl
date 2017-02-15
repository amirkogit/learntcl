#
# Example 41-5
# The built-in bitmaps.
#

frame .f -bd 4; frame .g -bd 4 ; pack .f .g -side left
set parent .f ; set next .g
foreach name {error gray12 gray50 hourglass \
				info questhead question warning} {
	frame $parent.$name
	label $parent.$name.l -text $name -width 9 -anchor w
	label $parent.$name.b -bitmap $name
	pack $parent.$name.l -side right
	pack $parent.$name.b -side top
	pack $parent.$name -side top -expand true -fill x
	set tmp $parent ; set parent $next ; set next $tmp
}



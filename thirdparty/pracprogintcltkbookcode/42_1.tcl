#
# Example 42-1
# The FontWidget procedure handles missing fonts.
#

proc FontWidget { args } {
	# args is a Tcl command
	if {[catch $args w]} {
		# Delete the font specified in args, if any
		set ix [lsearch $args -font]
		if {$ix >= 0} {
			set args [lreplace $args $ix [expr $ix+1]]
		}
		# This font overrides the resource database
		# The "fixed" font is UNIX-specific
		set w [eval $args {-font fixed}]
	}
	return $w
}



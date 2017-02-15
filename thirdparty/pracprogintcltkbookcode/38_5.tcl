#
# Example 38-5
# A canvas selection handler.
#

proc CanvasSelectHandle { w offset maxbytes } {
	# Handle a selection request
	global canvas
	if ![info exists canvas(select,$w)] {
		error "No selected item"
	}
	set id $canvas(select,$w)
	# Return the requested chunk of data.
	return [string range [CanvasDescription $w $id] \
		$offset [expr $offset+$maxbytes]]
}
proc CanvasDescription { w id } {
	# Generate a description of the object that can
	# be used to recreate it later.
	set type [$w type $id]
	set coords [$w coords $id]
	set config {}
	# Bundle up non-default configuration settings
	foreach conf [$w itemconfigure $id] {
		# itemconfigure returns a list like
		# -fill {} {} {} red
		set default [lindex $conf 3]
		set value [lindex $conf 4]
		if {[string compare $default $value] != 0} {
			lappend config [lindex $conf 0] $value
		}
	}
	return [concat CanvasObject $type $coords $config]
}



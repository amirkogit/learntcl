#
# Example 31-4
# Resource_ButtonFrame defines buttons based on resources.
#

proc Resource_ButtonFrame { f class } {
	frame $f -class $class -borderwidth 2
	pack $f -side top -fill x
	foreach b [option get $f buttonlist {}] {
		if [catch {button $f.$b}] {
			button $f.$b -font fixed
		}
		pack $f.$b -side right
	}
}



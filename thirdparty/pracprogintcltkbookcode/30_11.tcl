#
# Example 30-11
# MenuGet maps from name to menu.
#

proc MenuGet {menuName} {
	global menu
	if [catch {set menu(menu,$menuName)} m] {
		return -code error "No such menu: $menuName"
	}
	return $m
}



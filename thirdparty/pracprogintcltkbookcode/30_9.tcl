#
# Example 30-9
# A simple menu by name package.
#

proc Menu_Setup { menubar } {
	global menu
	frame $menubar
	pack $menubar -side top -fill x
	set menu(menubar) $menubar
	set menu(uid) 0
}
proc Menu { label } {
	global menu
	if [info exists menu(menu,$label)] {
		error "Menu $label already defined"
	}
	# Create the menubutton and its menu
	set name $menu(menubar).mb$menu(uid)
	set menuName $name.menu
	incr menu(uid)
	set mb [menubutton $name -text $label -menu $menuName]
	pack $mb -side left
	menu $menuName -tearoff 1
	# Remember the name to menu mapping
	set menu(menu,$label) $menuName
}



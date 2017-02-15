#
# Example 30-10
# Using the Tk 8.0 menu bar facility.
#

proc Menu_Setup { menubar } {
	global menu
	menu $menubar
	# Associated menu with its main window
	set top [winfo parent $menubar]
	$top config -menu $menubar
	set menu(menubar) $menubar
	set menu(uid) 0
}
proc Menu { label } {
	global menu
	if [info exists menu(menu,$label)] {
		error "Menu $label already defined"
	}
	# Create the cascade menu
	set menuName $menu(menubar).mb$menu(uid)
	incr menu(uid)
	menu $menuName -tearoff 1
	$menu(menubar) add cascade -label $label -menu $menuName
	# Remember the name to menu mapping
	set menu(menu,$label) $menuName
}



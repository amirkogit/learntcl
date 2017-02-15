#
# Example 30-13
# A wrapper for cascade entries.
#

proc Menu_Cascade { menuName label } {
	global menu
	set m [MenuGet $menuName]
	if [info exists menu(menu,$label)] {
		error "Menu $label already defined"
	}
	set sub $m.sub$menu(uid)
	incr menu(uid)
	menu $sub -tearoff 0
	$m add cascade -label $label -menu $sub
	set menu(menu,$label) $sub
}



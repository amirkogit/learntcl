#
# Example 31-7
# Defining menus from resource specifications.
#

proc Resource_Menubar { f class } {
	set f [frame $f -class $class]
	pack $f -side top
	foreach b [option get $f menulist {}] {
		set cmd [list menubutton $f.$b -menu $f.$b.m \
						-relief raised]
		if [catch $cmd t] {
			eval $cmd {-font fixed}
		}
		if [catch {menu $f.$b.m}] {
			menu $f.$b.m -font fixed
		}
		pack $f.$b -side left
		ResourceMenu $f.$b.m
	}
}
proc ResourceMenu { menu } {
	foreach e [option get $menu entrylist {}] {
		set l [option get $menu l_$e {}]
		set c [option get $menu c_$e {}]
		set v [option get $menu v_$e {}]
		switch -- [option get $menu t_$e {}] {
			check {
				$menu add checkbutton -label $l -command $c \
					-variable $v
			}
			radio {
				$menu add radiobutton -label $l -command $c \
					-variable $v -value $l
			}
			separator {
				$menu add separator
			}
			cascade {
				set sub [option get $menu m_$e {}]
				if {[string length $sub] != 0} {
					set submenu [menu $menu.$sub]
					$menu add cascade -label $l -command $c \
							 -menu $submenu
					ResourceMenu $submenu
				}
			}
			default {
				$menu add command -label $l -command $c
			}
		}
	}
}



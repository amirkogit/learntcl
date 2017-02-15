#
# Example 30-12
# Adding menu entries.
#

proc Menu_Command { menuName label command } {
	set m [MenuGet $menuName]
	$m add command -label $label -command $command
}

proc Menu_Check { menuName label var { command {} } } {
	set m [MenuGet $menuName]
	$m add check -label $label -command $command \
		-variable $var
}

proc Menu_Radio { menuName label var {val {}} {command {}} } {
	set m [MenuGet $menuName]
	if {[string length $val] == 0} {
		set val $label
	}
	$m add radio -label $label -command $command \
		-value $val -variable $var
}

proc Menu_Separator { menuName } {
	[MenuGet $menuName] add separator
}



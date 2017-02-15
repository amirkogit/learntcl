#
# Example 34-3
# Reestablishing validation using an idle task.
#

proc Upper {w validation action new} {
	if {$action == 1} {
		$w insert insert [string toupper $new]
		after idle [list $w configure -validate $validation]
	}
	return 1
}

entry .e -validate all -vcmd {Upper %W %v %d %S}
pack .e



#
# Example 5-7
# Deleting a list element by value.
#

proc ldelete { list value } {
	set ix [lsearch -exact $list $value]
	if {$ix >= 0} {
		return [lreplace $list $ix $ix]
	} else {
		return $list
	}
}



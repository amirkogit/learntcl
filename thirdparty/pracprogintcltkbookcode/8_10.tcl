#
# Example 8-10
# A list of arrays.
#

proc RecordAppend {listName arrayName} {
	upvar $listName list
	lappend list $arrayName
}
proc RecordIterate {listName script} {
	upvar $listName list
	foreach arrayName $list {
		upvar #0 $arrayName data
		eval $script
	}
}



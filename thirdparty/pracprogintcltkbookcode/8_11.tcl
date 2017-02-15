#
# Example 8-11
# A list of arrays.
#

proc RecordInsert {recName afterThis} {
	upvar $recName record $afterThis after
	set record(next) $after(next)
	set after(next) $recName
}
proc RecordIterate {firstRecord body} {
	upvar #0 $firstRecord data
	while {[info exists data]} {
		eval $body
		upvar #0 $data(next) data
	}
}



#
# Example 36-6
# Finding the current range of a text tag.
#

proc Text_CurrentRange { t tag mark } {
	set range [$t tag prevrange $tag $mark]
	set end [lindex $range 1]
	if {[llength $range] == 0 || [$t compare $end < $mark]} {
		# This occurs when the mark is at the
		# very beginning of the node
		set range [$t tag nextrange $tag $mark]
		if {[llength $range] == 0 ||
				[$t compare $mark < [lindex $range 0]]} {
			return {}
		}
	}
	return $range
}



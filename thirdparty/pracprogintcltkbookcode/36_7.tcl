#
# Example 36-7
# Dumping the text widget.
#

proc Text_Dump {t {start 1.0} {end end}} {
	foreach {key value index} [$t dump $start $end] {
		if {$key == "text"} {
			puts "$index \"$value\""
		} else {
			puts "$index $key $value"
		}
	}
}



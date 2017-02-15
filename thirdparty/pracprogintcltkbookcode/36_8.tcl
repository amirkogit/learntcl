#
# Example 36-8
# Dumping the text widget with a command callback.
#

proc Text_Dump {t {start 1.0} {end end}} {
	$t dump -command TextDump $start $end
}
proc TextDump {key value index} {
	if {$key == "text"} {
		puts "$index \"$value\""
	} else {
		puts "$index $key $value"
	}
}



#
# Example 8-4
# ArrayInvert inverts an array.
#

proc ArrayInvert {arrName inverseName {pattern *}} {
	upvar $arrName array $inverseName inverse
	foreach {index value} [array get array $pattern] {
		set inverse($value) $index
	}
}



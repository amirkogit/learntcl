#
# Example 23-2
# Looking at all widget attributes.
#

proc Widget_Attributes {w {out stdout}} {
	puts $out [format "%-20s %-10s %s" Attribute Default Value]
	foreach item [$w configure] {
		puts $out [format "%-20s %-10s %s" \
			[lindex $item 0] [lindex $item 3] \
			[lindex $item 4]]
	}
}



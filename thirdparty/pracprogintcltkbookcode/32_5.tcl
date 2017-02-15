#
# Example 32-5
# A label that displays different strings.
#

proc FixedWidthLabel { name values } {
	# name is a widget name to be created
	# values is a list of strings
	set maxWidth 0
	foreach value $values {
		if {[string length $value] > $maxWidth} {
			set maxWidth [string length $value]
		}
	}
	# Use -anchor w to left-justify short strings
	label $name -width $maxWidth -anchor w \
		-text [lindex $values 0]
	return $name
}



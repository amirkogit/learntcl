#
# Example 1-17
# Using info to determine if a variable exists.
#

if {![info exists foobar]} {
	set foobar 0
} else {
	incr foobar
}



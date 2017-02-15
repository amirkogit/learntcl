#
# Example 34-2
# Restricting entry text to integer values.
#

proc ValidInt {val} {
	return [ expr {[string is integer $val]
		|| [string match {[-+]} $val]} ]
}

entry .e -validate all -vcmd {ValidInt %P}
pack .e



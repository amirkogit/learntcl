#
# Example 45-3
# Setting preference variables.
#

# PrefValue returns the value of the variable if it exists,
# otherwise it returns the resource database value
proc PrefValue { varName res } {
	upvar #0 $varName var
	if [info exists var] {
		return $var
	}
	set var [option get . $res {}]
}
# PrefValueSet defines a variable in the global scope.
proc PrefValueSet { varName value } {
	upvar #0 $varName var
	set var $value
}



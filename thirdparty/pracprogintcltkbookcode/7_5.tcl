#
# Example 7-5
# Print variable by name.
#

proc PrintByName { varName } {
	upvar 1 $varName var
	puts stdout "$varName = $var"
}



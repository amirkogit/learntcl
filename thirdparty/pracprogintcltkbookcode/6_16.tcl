#
# Example 6-16
# There are several possible return values from catch.
#

switch [catch {
	command1
	command2
	...
} result] {
	0 { 						 # Normal completion }
	1 { 						 # Error case }
	2 { return $result						;# return from procedure}
	3 { break						;# break out of the loop}
	4 { continue						;# continue loop}
	default { 						 # User-defined error codes }
}



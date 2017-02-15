#
# Example 6-5
# A switch with "fall through" cases.
#

switch -glob -- $value {
	X* -
	Y* { takeXorYaction $value }
}



#
# Example 6-4
# Using switch with substitutions in the patterns.
#

switch -regexp -- $value \
	^$key { body1 }\
	\t### { body2 }\
	{[0-9]*} { body3 }



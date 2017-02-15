#
# Example 9-8
# A read loop using gets.
#

while {[gets $channel line] >= 0} {
	# Process line
}
close $channel



#
# Example 9-9
# A read loop using read and split.
#

foreach line [split [read $channel] \n] {
	# Process line
}
close $channel



#
# Example 6-6
# Comments in switch commands.
#

switch -- $value {
	# this comment confuses switch
	pattern { # this comment is ok }
}



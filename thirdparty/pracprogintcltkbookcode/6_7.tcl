#
# Example 6-7
# A while loop to read standard input.
#

set numLines 0 ; set numChars 0
while {[gets stdin line] >= 0} {
	incr numLines
	incr numChars [string length $line]
}



#
# Example 6-1
# A conditional if then else command.
#

if {$x == 0} {
	puts stderr "Divide by zero!"
} else {
	set slope [expr $y/$x]
}



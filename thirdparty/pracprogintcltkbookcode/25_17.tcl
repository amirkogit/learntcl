#
# Example 25-17
# Controlling the packing order.
#

# Create five labels in order
foreach label {one two three four five} {
	label .$label -text $label
	pack .$label -side left -padx 5
}
# ShuffleUp moves a widget to the beginning of the order
proc ShuffleUp { parent child } {
	set first [lindex [pack slaves $parent] 0]
	pack $child -in $parent -before $first
}
# ShuffleDown moves a widget to the end of the order
proc ShuffleDown { parent child } {
	pack $child -in $parent
}
ShuffleUp . .five
ShuffleDown . .three



#
# Example 5-9
# Use split to turn input data into Tcl lists.
#

set line {this is "not a tcl list}
lindex $line 1
#=> unmatched open quote in list
lindex [split $line] 2
#=> "not



#
# Example 5-2
# Using lappend to add elements to a list.
#

lappend new 1 2
#=> 1 2
lappend new 3 "4 5"
#=> 1 2 3 {4 5}
set new
#=> 1 2 3 {4 5}



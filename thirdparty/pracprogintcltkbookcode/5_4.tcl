#
# Example 5-4
# Using concat to splice lists together.
#

set x {4 5 6}
set y {2 3}
set z 1
concat $z $y $x
#=> 1 2 3 4 5 6



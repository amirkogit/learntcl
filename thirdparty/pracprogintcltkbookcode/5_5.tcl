#
# Example 5-5
# Double quotes compared to the concat and list commands.
#

set x {1 2}
#=> 1 2
set y "$x 3"
#=> 1 2 3
set y [concat $x 3]
#=> 1 2 3
set s { 2 }
#=> 2
set y "1 $s 3"
#=> 123
set y [concat 1 $s 3]
#=> 1 2 3
set z [list $x $s 3]
#=> {1 2} { 2 } 3



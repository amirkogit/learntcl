#
# Example 5-1
# Constructing a list with the list command.
#

set x {1 2}
#=> 1 2
set y \$foo
#=> $foo
set l1 [list $x "a b" $y]
#=> {1 2} {a b} {$foo}
set l2 [list $l1 $x]
#=> {{1 2} {a b} {$foo}}} {1 2}



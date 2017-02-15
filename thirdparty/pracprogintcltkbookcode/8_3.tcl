#
# Example 8-3
# Referencing an array indirectly using upvar.
#

set name TheArray
#=> TheArray
upvar 0 $name a
set a(xyz) {some value}
#=> some value
set x $TheArray(xyz)
#=> some value



#
# Example 8-2
# Referencing an array indirectly.
#

set name TheArray
#=> TheArray
set ${name}(xyz) {some value}
#=> some value
set x $TheArray(xyz)
#=> some value
set x ${name}(xyz)
#=> TheArray(xyz)
set x [set ${name}(xyz)]
#=> some value



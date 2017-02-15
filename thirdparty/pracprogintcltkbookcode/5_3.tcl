#
# Example 5-3
# Using lset to set an element of a list.
#

lset new "a b c"
#=> a b c
lset new 1 "d e"
#=> a {d e} c
lset new 1 0 "g h"
#=> a {{g h} e} c



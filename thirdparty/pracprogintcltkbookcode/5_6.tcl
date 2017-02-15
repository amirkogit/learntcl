#
# Example 5-6
# Modifying lists with lreplace.
#

set x [list a {b c} e d]
#=> a {b c} e d
lreplace $x 1 2 B C
#=> a B C d
lreplace $x 0 0
#=> {b c} e d



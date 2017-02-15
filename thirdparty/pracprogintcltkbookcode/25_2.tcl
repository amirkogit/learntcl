#
# Example 25-2
# Turning off geometry propagation.
#

frame .one -width 40 -height 40 -bg white
frame .two -width 100 -height 50 -bg grey50
pack propagate . false
pack .one .two -side top



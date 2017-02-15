#
# Example 25-5
# Mixing bottom and right packing sides.
#

# pack two frames on the bottom.
frame .one -width 100 -height 50 -bg grey50
frame .two -width 40 -height 40 -bg white
pack .one .two -side bottom
# pack another frame to the right
frame .three -width 20 -height 20 -bg grey75
pack .three -side right



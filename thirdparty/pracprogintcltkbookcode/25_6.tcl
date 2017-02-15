#
# Example 25-6
# Filling the display into extra packing space. 
#

frame .one -width 100 -height 50 -bg grey50
frame .two -width 40 -height 40 -bg white
# Pack with fill enabled
pack .one .two -side bottom -fill x
frame .three -width 20 -height 20 -bg red
pack .three -side right -fill x



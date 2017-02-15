#
# Example 44-1
# Gridded geometry for a canvas.
#

canvas .c -width 300 -height 150
pack .c -fill both -expand true
wm geometry .
#=> 300x200+678+477
wm grid . 30 15 10 10
wm geometry .
#=> 30x20+678+477



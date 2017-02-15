#
# Example 25-1
# Two frames packed inside the main frame.
#

# Make the main window black
. config -bg black
# Create and pack two frames
frame .one -width 40 -height 40 -bg white
frame .two -width 100 -height 50 -bg grey50
pack .one .two -side top



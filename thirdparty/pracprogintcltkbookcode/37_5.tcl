#
# Example 37-5
# Canvas arc items.
#

# $c is a canvas
$c create arc 10 10 100 100 -start 45 -extent -90 \
	-style pieslice -fill orange -outline black
$c create arc 10 10 100 100 -start 135 -extent 90 \
	-style chord -fill blue -outline white -width 4
$c create arc 10 10 100 100 -start 255 -extent 45 \
	-style arc -outline black -width 3



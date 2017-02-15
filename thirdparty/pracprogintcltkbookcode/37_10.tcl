#
# Example 37-10
# Canvas polygon items.
#

$c create poly 20 -40 40 -20 40 20 20 40 -20 40 \
	-40 20 -40 -20 -20 -40 -fill red \
	-outline white -width 5
$c create text 0 0 -text STOP -fill white \
	-font {helvetica 18 bold}
$c move all 50 50



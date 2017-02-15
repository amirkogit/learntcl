#
# Example 26-7
# Explicit row and column span.
#

. config -bg white
foreach color {888 999 aaa bbb ccc fff} {
	frame .$color -bg #$color -width 40 -height 40
}
grid .888 -row 0 -column 0 -columnspan 3 -sticky news
grid .999 -row 1 -column 0 -rowspan 2 -sticky news
grid .aaa -row 1 -column 1 -columnspan 2 -sticky news
grid .bbb -row 2 -column 2 -rowspan 2 -sticky news
grid .ccc -row 3 -column 0 -columnspan 2 -sticky news
grid .fff -row 2 -column 1 -sticky news



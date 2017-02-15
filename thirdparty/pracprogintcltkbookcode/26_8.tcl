#
# Example 26-8
# Grid syntax row and column span.
#

. config -bg white
foreach color {888 999 aaa bbb ccc ddd fff} {
	frame .$color -bg #$color -width 40 -height 40
}
grid .888			-		- 		-sticky news
grid .999			.aaa		-		-sticky news
grid ^			.fff		.bbb		-sticky news
grid .ccc			-		^		-sticky news



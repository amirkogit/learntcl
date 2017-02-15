#
# Example 46-3
# Related listboxes are configured to select items together.
#

foreach l [list $frame.key $frame.cmd] {
	bind $l <Button-1> \
		[list BindSelect %y $frame.key $frame.cmd]
	bind $l <B1-Motion> \
		[list BindSelect %y $frame.key $frame.cmd]
}
proc BindSelect { y args } {
	foreach w $args {
		$w select clear 0 end
		$w select anchor [$w nearest $y]
		$w select set anchor [$w nearest $y]
	}
}



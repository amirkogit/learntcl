#
# Example 46-5
# Drag-scrolling a pair of listboxes together.
#

bind $l <B2-Motion>	\
	[list BindDragto %x %y $frame.key $frame.cmd]
bind $l <Button-2> \
	[list BindMark %x %y $frame.key $frame.cmd]

proc BindDragto { x y args } {
	foreach w $args {
		$w scan dragto $x $y
	}
}
proc BindMark { x y args } {
	foreach w $args {
		$w scan mark $x $y
	}
}



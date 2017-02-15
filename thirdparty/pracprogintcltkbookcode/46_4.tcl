#
# Example 46-4
# Controlling a pair of listboxes with one scrollbar.
#

scrollbar $frame.s -orient vertical \
	-command [list BindYview [list $frame.key $frame.cmd]]

proc BindYview { lists args } {
	foreach l $lists {
		eval {$l yview} $args
	}
}



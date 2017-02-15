#
# Example 46-2
# Bind_Display presents the bindings for a widget or class.
#

proc Bind_Display { frame } {
	global bind
	$frame.key delete 0 end
	$frame.cmd delete 0 end
	foreach seq [bind $bind(class)] {
		$frame.key insert end $seq
		$frame.cmd insert end [bind $bind(class) $seq]
	}
}



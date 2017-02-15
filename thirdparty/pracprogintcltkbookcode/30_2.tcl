#
# Example 30-2
# Fixing the troublesome situation.
#

proc LessTrouble { args } {
	set b 0
	label .label -textvariable x
	set f [frame .buttons -borderwidth 10]
	foreach val $args {
		button $f.$b -text $val \
			-command "UpdateX $val"
		pack $f.$b -side left
		incr b
	}
	pack .label $f
}
proc UpdateX { val } {
	global x
	set x [expr $x * $val]
}
set x 1
LessTrouble -1 4 7 36



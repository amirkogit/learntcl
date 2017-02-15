#
# Example 36-3
# An active text button.
#

proc TextButton { t start end command } {
	global textbutton
	if ![info exists textbutton(uid)] {
		set textbutton(uid) 0
	} else {
		incr textbutton(uid)
	}
	set tag button$textbutton(uid)
	$t tag configure $tag -relief raised -borderwidth 2
	if {[regexp color [winfo visual $t]]} {
		$t tag configure $tag -background thistle
	} else {
		$t tag configure $tag -background [$t cget -fg]
		$t tag configure $tag -foreground [$t cget -bg]
	}
	# Bind the command to the tag
	$t tag bind $tag <Button-1> $command
	$t tag add $tag $start $end
	# use another tag to remember the cursor
	$t tag bind $tag <Enter> \
		[list TextButtonChangeCursor %W $start $end tcross]
	$t tag bind $tag <Leave> {TextButtonRestoreCursor %W}
}
proc TextButtonChangeCursor {t start end cursor} {
	$t tag add cursor=[$t cget -cursor] $start $end
	$t config -cursor $cursor
}
proc TextButtonRestoreCursor {t} {
	regexp {cursor=([^ ]*)} [$t tag names] x cursor
	$t config -cursor $cursor
}



#
# Example 45-10
# Tracing a Tcl variable in a preference item.
#

Pref_Add {
	{win(scrollside) scrollbarSide {CHOICE left right} 
		"Scrollbar placement"
"Scrollbars can be positioned on either the left or
right side of the text and canvas widgets."}
}
global win
set win(lastscrollside) $win(scrollside)
trace variable win(scrollside) w ScrollFixup
# Assume win(scrollbar) identifies the scrollbar widget
proc ScrollFixup { name1 name2 op } {
	global win
	if {$win(scrollside) != $win(lastscrollside)} {
		set parent [lindex [pack info $win(scrollbar)] 1]
		pack forget $win(scrollbar)
		set firstchild [lindex [pack slaves $parent] 0]
		pack $win(scrollbar) -in $parent -before $firstchild \
			-side $win(scrollside) -fill y
		set win(lastscrollside) $win(scrollside)
	}
}



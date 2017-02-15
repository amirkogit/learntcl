#
# Example 45-4
# Using the preferences package.
#

Pref_Add {
	{win(scrollside) scrollbarSide {CHOICE left right} 
		"Scrollbar placement"
"Scrollbars can be positioned on either the left or
right side of the text and canvas widgets."}
	{win(typeinkills) typeinKills OFF 
		"Type-in kills selection"
"This setting determines whether or not the selection
is deleted when new text is typed in."}
	{win(scrollspeed) scrollSpeed 15 "Scrolling speed"
"This parameter affects the scrolling rate when a selection
is dragged off the edge of the window. Smaller numbers
scroll faster, but can consume more CPU."}
}



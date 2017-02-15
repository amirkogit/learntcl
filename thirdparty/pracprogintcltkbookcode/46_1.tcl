#
# Example 46-1
# A user interface to widget bindings.
#

proc Bind_Interface { w } {
	# Our state
	global bind
	set bind(class) $w

	# Set a class used for resource specifications
	set frame [toplevel .bindui -class Bindui]
	# Default relief
	option add *Bindui*Entry.relief sunken startup
	option add *Bindui*Listbox.relief raised startup
	# Default Listbox sizes
	option add *Bindui*key.width 18 startup
	option add *Bindui*cmd.width 25 startup
	option add *Bindui*Listbox.height 5 startup

	# A labeled entry at the top to hold the current
	# widget name or class.
	set t [frame $frame.top -bd 2]
	label $t.l -text "Bindings for" -width 11
	entry $t.e -textvariable bind(class)
	pack $t.l -side left
	pack $t.e -side left -fill x -expand true
	pack $t -side top -fill x
	bind $t.e <Return> [list Bind_Display $frame]

	# Command buttons
	button $t.quit -text Dismiss \
		-command [list destroy $frame]
	button $t.save -text Save \
		-command [list Bind_Save $frame]
	button $t.edit -text Edit \
		-command [list Bind_Edit $frame]
	button $t.new -text New \
		-command [list Bind_New $frame]
	pack $t.quit $t.save $t.edit $t.new -side right

	# A pair of listboxes and a scrollbar
	scrollbar $frame.s -orient vertical \
		-command [list BindYview \
			[list $frame.key $frame.cmd]]
	listbox $frame.key \
		-yscrollcommand [list $frame.s set] \
		-exportselection false
	listbox $frame.cmd \
		-yscrollcommand [list $frame.s set]
	pack $frame.s -side left -fill y
	pack $frame.key $frame.cmd -side left \
		-fill both -expand true

	foreach l [list $frame.key $frame.cmd] {
		bind $l <B2-Motion>	\
			[list BindDragto %x %y $frame.key $frame.cmd]
		bind $l <Button-2> \
			[list BindMark %x %y $frame.key $frame.cmd]
		bind $l <Button-1> \
			[list BindSelect %y $frame.key $frame.cmd]
		bind $l <B1-Motion> \
			[list BindSelect %y $frame.key $frame.cmd]
		bind $l <Shift-B1-Motion> {}
		bind $l <Shift-Button-1> {}
	}
	# Initialize the display
	Bind_Display $frame
}



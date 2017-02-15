#!/bin/sh
# \
exec wish8.4 "$0" ${1+"$@"}


#
# Example 44-1
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


#
# Example 44-2
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


#
# Example 44-3
# Related listboxes are configured to select items together.
#

proc BindSelect { y args } {
	foreach w $args {
		$w select clear 0 end
		$w select anchor [$w nearest $y]
		$w select set anchor [$w nearest $y]
	}
}


#
# Example 44-4
# Controlling a pair of listboxes with one scrollbar.
#

proc BindYview { lists args } {
	foreach l $lists {
		eval {$l yview} $args
	}
}


#
# Example 44-5
# Drag-scrolling a pair of listboxes together.
#

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


#
# Example 44-6
# An interface to define bindings.
#

proc Bind_New { frame } {
	if [catch {frame $frame.edit} f] {
		# Frame already created
		set f $frame.edit
	} else {
		foreach x {key cmd} {
			set f2 [frame $f.$x]
			pack $f2 -fill x -padx 2
			label $f2.l -width 11 -anchor e
			pack $f2.l -side left
			entry $f2.e
			pack $f2.e -side left -fill x -expand true
			bind $f2.e <Return> [list BindDefine $f]
		}
		$f.key.l config -text Event:
		$f.cmd.l config -text Command:
	}
	pack $frame.edit -after $frame.top -fill x
}
proc Bind_Edit { frame } {
	Bind_New $frame
	set line [$frame.key curselection]
	if {$line == {}} {
		return
	}
	$frame.edit.key.e delete 0 end
	$frame.edit.key.e insert 0 [$frame.key get $line]
	$frame.edit.cmd.e delete 0 end
	$frame.edit.cmd.e insert 0 [$frame.cmd get $line]
}


#
# Example 44-7
# Defining and saving bindings.
#

proc BindDefine { f } {
	if [catch {
		bind [$f.top.e get] [$f.edit.key.e get] \
			[$f.edit.cmd.e get]
	} err] {
		Status $err
	} else {
		# Remove the edit window
		pack forget $f.edit
	}
}
proc Bind_Save { dotfile args } {
	set out [open $dotfile.new w]
	foreach w $args {
		foreach seq [bind $w] {
			# Output a Tcl command
			puts $out [list bind $w $seq [bind $w $seq]]
		}
	}
	close $out
	file rename -force $dotfile.new $dotfile
}
proc Bind_Read { dotfile } {
	if [catch {
		if [file exists $dotfile] {
			# Read the saved Tcl commands
			source $dotfile
		}
	} err] {
		Status "Bind_Read $dotfile failed: $err"
	}
}


Bind_Interface Text

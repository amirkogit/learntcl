#
# Example 45-6
# Interface objects for different preference types.
#

proc PrefDialogItem { frame item width } {
	global pref
	incr pref(uid)
	set f [frame $frame.p$pref(uid) -borderwidth 2]
	pack $f -fill x
	label $f.label -text [PrefComment $item] -width $width
	bind $f.label <1> \
		[list PrefItemHelp %X %Y [PrefHelp $item]]
	pack $f.label -side left
	set default [PrefDefault $item]
	if {[regexp "^CHOICE " $default]} {
		foreach choice [lreplace $default 0 0] {
			incr pref(uid)
			radiobutton $f.c$pref(uid) -text $choice \
				-variable [PrefVar $item] -value $choice
			pack $f.c$pref(uid) -side left
		}
	} else {
		if {$default == "OFF" || $default == "ON"} {
			# This is a boolean
			set varName [PrefVar $item]
			checkbutton $f.check -variable $varName \
				-command [list PrefFixupBoolean $f.check $varName]
			PrefFixupBoolean $f.check $varName
			pack $f.check -side left
		} else {
			# This is a string or numeric
			entry $f.entry -width 10 -relief sunken
			pack $f.entry -side left -fill x -expand true
			set pref(entry,[PrefVar $item]) $f.entry
			set varName [PrefVar $item]
			$f.entry insert 0 [uplevel #0 [list set $varName]]
			bind $f.entry <Return> "PrefEntrySet %W $varName"
		}
	}
}
proc PrefFixupBoolean {check varname} {
	upvar #0 $varname var
	# Update the checkbutton text each time it changes
	if {$var} {
		$check config -text On
	} else {
		$check config -text Off
	}
}
proc PrefEntrySet { entry varName } {
	PrefValueSet $varName [$entry get]
}



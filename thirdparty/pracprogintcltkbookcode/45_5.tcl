#
# Example 45-5
# A user interface to the preference items.
#

proc Pref_Dialog {} {
	global pref
	if [catch {toplevel .pref}] {
		raise .pref
	} else {
		wm title .pref "Preferences"
		set buttons [frame .pref.but -bd 5]
		pack .pref.but -side top -fill x
		button $buttons.quit -text Dismiss \
			-command {PrefDismiss}
		button $buttons.save -text Save \
			-command {PrefSave}
		button $buttons.reset -text Reset \
			-command {PrefReset ; PrefDismiss}
		label $buttons.label \
			 -text "Click labels for info on each item"
		pack $buttons.label -side left -fill x
		pack $buttons.quit $buttons.save $buttons.reset \
			-side right -padx 4

		frame .pref.b -borderwidth 2 -relief raised
		pack .pref.b -fill both
		set body [frame .pref.b.b -bd 10]
		pack .pref.b.b -fill both

		set maxWidth 0
		foreach item $pref(items) {
			set len [string length [PrefComment $item]]
			if {$len > $maxWidth} {
				set maxWidth $len
			}
		}
		set pref(uid) 0
		foreach item $pref(items) {
			PrefDialogItem $body $item $maxWidth
		}
	}
}



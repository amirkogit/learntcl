#
# Example 39-2
# A simple dialog.
#

proc Dialog_Prompt { string } {
	global prompt
	set f .prompt
	if [Dialog_Create $f "Prompt" -borderwidth 10] {
		message $f.msg -text $string -aspect 1000
		entry $f.entry -textvariable prompt(result)
		set b [frame $f.buttons]
		pack $f.msg $f.entry $f.buttons -side top -fill x
		pack $f.entry -pady 5
		button $b.ok -text OK -command {set prompt(ok) 1}
		button $b.cancel -text Cancel \
			-command {set prompt(ok) 0}
		pack $b.ok -side left
		pack $b.cancel -side right
		bind $f.entry <Return> {set prompt(ok) 1 ; break}
		bind $f.entry <Control-c> {set prompt(ok) 0 ; break}
	}
	set prompt(ok) 0
	Dialog_Wait $f prompt(ok) $f.entry
	Dialog_Dismiss $f
	if {$prompt(ok)} {
		return $prompt(result)
	} else {
		return {}
	}
}
Dialog_Prompt "Please enter a name"



#
# Example 45-7
# Displaying the help text for an item.
#

proc PrefItemHelp { x y text } {
	catch {destroy .prefitemhelp}
	if {$text == {}} {
		return
	}
	set self [toplevel .prefitemhelp -class Itemhelp]
	wm title $self "Item help" 
	wm geometry $self +[expr $x+10]+[expr $y+10]
	wm transient $self .pref
	message $self.msg -text $text -aspect 1500
	pack $self.msg
	bind $self.msg <1> {PrefNukeItemHelp .prefitemhelp}
	.pref.but.label configure -text \
		"Click on pop-up or another label"
}
proc PrefNukeItemHelp { t } {
	.pref.but.label configure -text \
		"Click labels for info on each item"
	destroy $t
}



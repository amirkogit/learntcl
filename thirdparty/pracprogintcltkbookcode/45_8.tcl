#
# Example 45-8
# Saving preferences settings to a file.
#

# PrefSave writes the resource specifications to the
# end of the per-user resource file,
proc PrefSave {} {
	global pref
	if [catch {
		set old [open $pref(userDefaults) r]
		set oldValues [split [read $old] \n]
		close $old
	}] {
		set oldValues {}
	}
	if [catch {open $pref(userDefaults).new w} out] {
		.pref.but.label configure -text \
		"Cannot save in $pref(userDefaults).new: $out"
		return
	}
	foreach line $oldValues {
		if {$line == \
				"!!! Lines below here automatically added"} {
			break
		} else {
			puts $out $line
		}
	}
	puts $out "!!! Lines below here automatically added"
	puts $out "!!! [exec date]"
	puts $out "!!! Do not edit below here"
	foreach item $preferences {
		set varName [PrefVar $item]
		set resName [PrefRes $item]
		if [info exists pref(entry,$varName)] {
			PrefEntrySet $pref(entry,$varName) $varName
		}
		set value [PrefValue $varName $resName]
		puts $out [format "%s\t%s" *${resName}: $value]
	}
	close $out
	set new [glob $pref(userDefaults).new]
	set old [file root $new]
	if [catch {file rename -force $new $old} err] {
		Status "Cannot install $new: $err"
		return
	}
	PrefDismiss
}



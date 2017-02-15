#
# Example 45-9
# Read settings from the preferences file.
#

proc PrefReset {} {
	global pref
	# Re-read user defaults
	option clear
	PrefReadFile $pref(appDefaults) startup
	PrefReadFile $pref(userDefaults) user
	# Clear variables
	set items $pref(items)
	set pref(items) {}
	foreach item $items {
		uplevel #0 [list unset [PrefVar $item]]
	}
	# Restore values
	Pref_Add $items
}
proc PrefDismiss {} {
	destroy .pref
	catch {destroy .prefitemhelp}
}



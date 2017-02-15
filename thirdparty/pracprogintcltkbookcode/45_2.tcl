#
# Example 45-2
# Adding preference items.
#

proc PrefVar { item } { lindex $item 0 }
proc PrefRes { item } { lindex $item 1 }
proc PrefDefault { item } { lindex $item 2 }
proc PrefComment { item } { lindex $item 3 }
proc PrefHelp { item } { lindex $item 4 }

proc Pref_Add { prefs } {
	global pref
	append pref(items) $prefs " "
	foreach item $prefs {
		set varName [PrefVar $item]
		set resName [PrefRes $item]
		set value [PrefValue $varName $resName]
		if {$value == {}} {
			# Set variables that are still not set
			set default [PrefDefault $item]
			switch -regexp -- $default {
				^CHOICE {
					PrefValueSet $varName [lindex $default 1]
				}
				^OFF {
					PrefValueSet $varName 0
				}
				^ON {
					PrefValueSet $varName 1
				}
				default {
					# This is a string or numeric
					PrefValueSet $varName $default
				}
			}
		}
	}
}



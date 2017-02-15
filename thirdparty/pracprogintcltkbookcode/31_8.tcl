#
# Example 31-8
# Resource_GetFamily merges user and application resources.
#

proc Resource_GetFamily { w resname } {
	set res			[option get $w $resname {}]
	set lres			[option get $w l$resname {}]
	set ures			[option get $w u$resname {}]
	set l-res			[option get $w l-$resname {}]
	set u-res			[option get $w u-$resname {}]
	# Site-local deletions from application resources
	set list [lsubtract $res ${l-res}]
	# Site-local additions
	set list [concat $list $lres]
	# Per-user deletions
	set list [lsubtract $list ${u-res}]
	# Per-user additions
	return [concat $list $ures]
}
proc lsubtract { orig nuke } {
	# Remove elements in $nuke from $orig
	foreach x $nuke {
		set ix [lsearch $orig $x]
		if {$ix >= 0} {
			set orig [lreplace $orig $ix $ix]
		}
	}
	return $orig
}



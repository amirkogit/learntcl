#
# Example 22-15
# Selecting data with mk::select.
#

proc KitWalk {tag dir {indent 0}} {
	set prefix [string repeat " " $indent]
	puts "$prefix[mk::get $tag.dirs!$dir name]/"
	incr indent 2

	# List the plain files in the directory, if any

	foreach j [mk::select $tag.dirs!$dir.files] {
		puts "$prefix  [mk::get $tag.dirs!$dir.files!$j name]"
	} 

	# Recursively process directories where $dir is the par-ent

	foreach i [mk::select $tag.dirs parent $dir] {
		KitWalk $tag $i $indent
	}
}
proc KitInit {starkit} {
	mk::file open starkit $starkit
	if {[mk::file views starkit] != "dirs"} {
		mk::file close $starkit
		error "This database is not a starkit"
	}
	return starkit        ;# db tag
}
proc KitTest {} {
	set tag [KitInit tclhttpd.kit]
	KitWalk $tag 0
}



#
# Example 12-2
# Loading a tclIndex file.
#

# This is a simplified part of the auto_load_index procedure.
# Go through auto_path from back to front.
set i [expr [llength $auto_path]-1]
for {} {$i >= 0} {incr i -1} {
	set dir [lindex $auto_path $i]
	if [catch {open [file join $dir tclIndex]} f] {
		# No index
		continue
	}
	# eval the file as a script. Because eval is
	# used instead of source, an extra round of
	# substitutions is performed and $dir gets expanded
	# The real code checks for errors here.
	eval [read $f]
	close $f
}



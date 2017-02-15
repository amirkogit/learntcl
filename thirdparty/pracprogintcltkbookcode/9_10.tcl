#
# Example 9-10
# Copy a file and translate to native format.
#

proc File_Copy {src dest} {
	if {[file isdirectory $src]} {
		file mkdir $dest
		foreach f [glob -nocomplain [file join $src *]] {
			File_Copy $f [file join $dest [file tail $f]]
		}
		return
	}
	if {[file isdirectory $dest]} {
		set dest [file join $dest [file tail $src]]
    }
	set in [open $src]
	set out [open $dest w]
	puts -nonewline $out [read $in]
	close $out ; close $in
}



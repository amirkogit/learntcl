#
# Example 9-2
# Comparing file modify times.
#

proc newer { file1 file2 } {
	if {![file exists $file2]} {
		return 1
	} else {
		# Assume file1 exists
		expr {[file mtime $file1] > [file mtime $file2]}
	}
}



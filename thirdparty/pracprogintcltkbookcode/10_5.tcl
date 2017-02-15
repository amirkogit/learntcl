#
# Example 10-5
# The File_Process procedure applies a command to each line of a file.
#

proc File_Process {file callback} {
	set in [open $file]
	while {[gets $in line] >= 0} {
		uplevel 1 $callback [list $line]
	}
	close $in
}



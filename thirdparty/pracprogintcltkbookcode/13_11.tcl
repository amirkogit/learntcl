#
# Example 13-11
# Implementing special history syntax.
#

# Excerpts from the standard unknown command
# uplevel is used to run the command in the right context
if {$name == "!!"} {
	set newcmd [history event]
} elseif {[regexp {^!(.+)$} $name dummy event]} {
	set newcmd [history event $event]
} elseif {[regexp {^\^([^^]*)\^([^^]*)\^?$} $name x old new]} {
	set newcmd [history event -1]
	catch {regsub -all -- $old $newcmd $new newcmd}
}
if {[info exists newcmd]} {
	history change $newcmd 0
	return [uplevel $newcmd]
}



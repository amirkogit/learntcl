#
# Example 30-3
# A button associated with a Tcl procedure.
#

proc MaxLineLength { file } {
	set max 0
	if [catch {open $file} in] {
		return $in
	}
	foreach line [split [read $in] \n] {
		set len [string length $line]
		if {$len > $max} {
			set max $len
		}
	}
	return "Longest line is $max characters"
}
# Create an entry to accept the file name,
# a label to display the result
# and a button to invoke the action
. config -borderwidth 10
entry .e -width 30 -bg white -relief sunken
button .doit -text "Max Line Length" \
	-command {.label config -text [MaxLineLength [.e get]]}
label .label -text "Enter file name"
pack .e .doit .label -side top -pady 5



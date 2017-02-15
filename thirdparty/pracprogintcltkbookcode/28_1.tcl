#
# Example 28-1
# A panedwindow with complex managed widgets.
#

# Create the panedwindow to manage the entire display

panedwindow .p -orient vertical -showhandle 1
pack .p -expand yes -fill both

# Create 2 labelframe widgets, each containing a
# gridded text and scrollbar assembly.

foreach {w label} {code "Code:" notes "Notes:"} {
	set f [labelframe .p.$w -text $label]
	text $f.t -height 10 -width 40 \
		-wrap none -font {courier 12} \
		-xscrollcommand [list $f.xbar set] \
		-yscrollcommand [list $f.ybar set]
	scrollbar $f.xbar -orient horizontal \
		-command [list $f.t xview]
	scrollbar $f.ybar -orient vertical \
		-command [list $f.t yview]

	grid $f.t -row 0 -column 0 -sticky news -padx 2 -pady 2
	grid $f.ybar -row 0 -column 1 -sticky ns -padx 2 -pady 2
	grid $f.xbar -row 1 -column 0 -sticky ew -padx 2 -pady 2
	grid columnconfigure $f 0 -weight 1
	grid rowconfigure $f 0 -weight 1

	# Add the frame assembly to the panedwindow

	.p add $f -minsize 1i -padx 4 -pady 6
}



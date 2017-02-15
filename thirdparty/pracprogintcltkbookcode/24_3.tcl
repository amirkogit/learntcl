#
# Example 24-3
# A browser for the code examples in the book.
#

#!/usr/local/bin/wish
#	Browser for the Tcl and Tk examples in the book.

# browse(dir) is the directory containing all the tcl files
# Please edit to match your system configuration.

switch $tcl_platform(platform) {
	"unix" {set browse(dir) /cdrom/tclbook2/exsource}
	"windows" {set browse(dir) D:/exsource}
	"macintosh" {set browse(dir) /tclbook2/exsource}
}

wm minsize . 30 5
wm title . "Tcl Example Browser"

# Create a row of buttons along the top

set f [frame .menubar]
pack $f -fill x
button $f.quit -text Quit -command exit
button $f.next -text Next -command Next
button $f.prev -text Previous -command Previous

# The Run and Reset buttons use EvalEcho that
# is defined by the Tcl shell in Example 23-4 on page 359

button $f.load -text Run -command Run
button $f.reset -text Reset -command Reset
pack $f.quit $f.reset $f.load $f.next $f.prev -side right

# A label identifies the current example

label $f.label -textvariable browse(current)
pack $f.label -side right -fill x -expand true

# Create the menubutton and menu

menubutton $f.ex -text Examples -menu $f.ex.m
pack $f.ex -side left
set m [menu $f.ex.m]

# Create the text to display the example
# Scrolled_Text is defined in Example 31-1 on page 464

set browse(text) [Scrolled_Text .body \
	-width 80 -height 10\
	-setgrid true]
pack .body -fill both -expand true

# Look through the example files for their ID number.

foreach f [lsort -dictionary [glob [file join $browse(dir) *]]] {
	if [catch {open $f} in] {
		puts stderr "Cannot open $f: $in"
		continue
	}
	while {[gets $in line] >= 0} {
		if [regexp {^# Example ([0-9]+)-([0-9]+)} $line \
				x chap ex] {
			lappend examples($chap) $ex
			lappend browse(list) $f
			# Read example title
			gets $in line
			set title($chap-$ex) [string trim $line "# "]
			set file($chap-$ex) $f
			close $in
			break
		}
	}
}

# Create two levels of cascaded menus.
# The first level divides up the chapters into chunks.
# The second level has an entry for each example.

option add *Menu.tearOff 0
set limit 8
set c 0; set i 0
foreach chap [lsort -integer [array names examples]] {
	if {$i == 0} {
		$m add cascade -label "Chapter $chap..." \
			-menu $m.$c
		set sub1 [menu $m.$c]
		incr c
	}
	set i [expr ($i +1) % $limit]
	$sub1 add cascade -label "Chapter $chap" -menu $sub1.sub$i
	set sub2 [menu $sub1.sub$i ]
	foreach ex [lsort -integer $examples($chap)] {
		$sub2 add command -label "$chap-$ex $title($chap-$ex)" \
			-command [list Browse $file($chap-$ex)]
	}
}

# Display a specified file. The label is updated to
# reflect what is displayed, and the text is left
# in a read-only mode after the example is inserted.

proc Browse { file } {
	global browse
	set browse(current) [file tail $file]
	set browse(curix) [lsearch $browse(list) $file]
	set t $browse(text)
	$t config -state normal
	$t delete 1.0 end
	if [catch {open $file} in] {
		$t insert end $in
	} else {
		$t insert end [read $in]
		close $in
	}
	$t config -state disabled
}

# Browse the next and previous files in the list

set browse(curix) -1
proc Next {} {
	global browse
	if {$browse(curix) < [llength $browse(list)] - 1} {
		incr browse(curix)
	}
	Browse [lindex $browse(list) $browse(curix)]
}
proc Previous {} {
	global browse
	if {$browse(curix) > 0} {
		incr browse(curix) -1
	}
	Browse [lindex $browse(list) $browse(curix)]
}

# Run the example in the shell

proc Run {} {
	global browse
	EvalEcho [list source \
		[file join $browse(dir) $browse(current)]]
}

# Reset the slave in the eval server

proc Reset {} {
	EvalEcho reset
}



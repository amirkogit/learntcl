#!/bin/sh
# \
exec wish8.4 "$0" ${1+"$@"}


#
# Example 30-1
# A text widget and two scrollbars.
#

proc Scrolled_Text { f args } {
	frame $f
	eval {text $f.text -wrap none \
		-xscrollcommand [list $f.xscroll set] \
		-yscrollcommand [list $f.yscroll set]} $args
	scrollbar $f.xscroll -orient horizontal \
		-command [list $f.text xview]
	scrollbar $f.yscroll -orient vertical \
		-command [list $f.text yview]
	grid $f.text $f.yscroll -sticky news
	grid $f.xscroll -sticky news
	grid rowconfigure $f 0 -weight 1
	grid columnconfigure $f 0 -weight 1
	return $f.text
}

#
# Example 23-3
# A browser for the code examples in the book.
#

#!/usr/local/bin/wish
#	Browser for the Tcl and Tk examples in the book.

# browse(dir) is the directory containing all the tcl files
set browse(dir) [file dirname [info script]]

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

proc Feedback {string} {
    global browse
    $browse(text) insert insert $string
    $browse(text) see insert
    update
}
Feedback "Browsing directory $browse(dir), please wait...\n"
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
			Feedback "Chapter $chap\n"
			# Read example title
			gets $in line
			set title($chap-$ex) [string trim $line "# "]
			set file($chap-$ex) $f
			close $in
			break
		}
	}
}
Feedback "Creating menus...\n"

# Create two levels of cascaded menus.
# The first level divides up the chapters into chunks.
# The second level has an entry for each example.

option add *Menu.tearOff 0
set limit 8
set c 0; set i 0
foreach chap [lsort -integer [array names examples]] {
	if {$i == 0} {
		Feedback "Chapter $chap..."
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


#
# Example 23-4
# A Tcl shell in a text widget.
#

#!/usr/local/bin/wish
# Simple evaluator. It executes Tcl in a slave interpreter

set t [Scrolled_Text .eval -width 80 -height 10]
pack .eval -fill both -expand true

# Text tags give script output, command errors, command
# results, and the prompt a different appearance

$t tag configure prompt -underline true
$t tag configure result -foreground purple
$t tag configure error -foreground red
$t tag configure output -foreground blue

# Insert the prompt and initialize the limit mark

set eval(prompt) "tcl> "
$t insert insert $eval(prompt) prompt
$t mark set limit insert
$t mark gravity limit left
focus $t
set eval(text) $t

# Key bindings that limit input and eval things. The break in
# the bindings skips the default Text binding for the event.

bind $t <Return> {EvalTypein ; break}
bind $t <BackSpace> {
	if {[%W tag nextrange sel 1.0 end] != ""} {
		%W delete sel.first sel.last
	} elseif {[%W compare insert > limit]} {
		%W delete insert-1c
		%W see insert
	}
	break
}
bind $t <Key> {
	if [%W compare insert < limit] {
		%W mark set insert end
	}
}

# Evaluate everything between limit and end as a Tcl command

proc EvalTypein {} {
	global eval
	$eval(text) insert insert \n
	set command [$eval(text) get limit end]
	if [info complete $command] {
		$eval(text) mark set limit insert
		Eval $command
	}
}

# Echo the command and evaluate it

proc EvalEcho {command} {
	global eval
	$eval(text) mark set insert end
	$eval(text) insert insert $command\n
	Eval $command
}

# Evaluate a command and display its result

proc Eval {command} {
	global eval
	$eval(text) mark set insert end
	if [catch {$eval(slave) eval $command} result] {
		$eval(text) insert insert $result error
	} else {
		$eval(text) insert insert $result result
	}
	if {[$eval(text) compare insert != "insert linestart"]} {
		$eval(text) insert insert \n
	}
	$eval(text) insert insert $eval(prompt) prompt
	$eval(text) see insert
	$eval(text) mark set limit insert
	return
}
# Create and initialize the slave interpreter

proc SlaveInit {slave} {
	interp create $slave
	load {} Tk $slave
	interp alias $slave reset {} ResetAlias $slave
	interp alias $slave puts {} PutsAlias $slave
	return $slave
}

# The reset alias deletes the slave and starts a new one

proc ResetAlias {slave} {
	interp delete $slave
	SlaveInit $slave
}

# The puts alias puts stdout and stderr into the text widget

proc PutsAlias {slave args} {
	if {[llength $args] > 3} {
		error "invalid arguments"
	}
	set newline "\n"
	if {[string match "-nonewline" [lindex $args 0]]} {
		set newline ""
		set args [lreplace $args 0 0]
	}
	if {[llength $args] == 1} {
		set chan stdout
		set string [lindex $args 0]$newline
	} else {
		set chan [lindex $args 0]
		set string [lindex $args 1]$newline
	}
	if [regexp (stdout|stderr) $chan] {
		global eval
		$eval(text) mark gravity limit right
		$eval(text) insert limit $string output
		$eval(text) see limit
		$eval(text) mark gravity limit left
	} else {
		puts -nonewline $chan $string
	}
}
set eval(slave) [SlaveInit shell]



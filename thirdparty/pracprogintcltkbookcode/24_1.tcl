#
# Example 24-1
# Logging the output of a program run with exec.
#

#!/usr/local/bin/wish
# execlog - run a program with exec and log the output
# Set window title
wm title . ExecLog

# Create a frame for buttons and entry.

frame .top -borderwidth 10
pack .top -side top -fill x

# Create the command buttons.

button .top.quit -text Quit -command exit
set but [button .top.run -text "Run it" -command Run]
pack .top.quit .top.run -side right

# Create a labeled entry for the command

label .top.l -text Command: -padx 0
entry .top.cmd -width 20 -relief sunken \
	-textvariable command
pack .top.l -side left
pack .top.cmd -side left -fill x -expand true

# Set up key binding equivalents to the buttons

bind .top.cmd <Return> Run
bind .top.cmd <Control-c> Stop
focus .top.cmd

# Create a text widget to log the output

frame .t
set log [text .t.log -width 80 -height 10 \
	-borderwidth 2 -relief raised -setgrid true \
	-yscrollcommand {.t.scroll set}]
scrollbar .t.scroll -command {.t.log yview}
pack .t.scroll -side right -fill y
pack .t.log -side left -fill both -expand true
pack .t -side top -fill both -expand true

# Run the program and arrange to read its input

proc Run {} {
	global command input log but
	if [catch {open "|$command |& cat"} input] {
		$log insert end $input\n
	} else {
		fileevent $input readable Log
		$log insert end $command\n
		$but config -text Stop -command Stop
	}
}

# Read and log output from the program

proc Log {} {
	global input log
	if [eof $input] {
		Stop
	} else {
		gets $input line
		$log insert end $line\n
		$log see end
	}
}

# Stop the program and fix up the button

proc Stop {} {
	global input but
	catch {close $input}
	$but config -text "Run it" -command Run
}



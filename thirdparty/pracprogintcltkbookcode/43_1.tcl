#
# Example 43-1
# The sender application.
#

#!/usr/local/bin/wish
# sender takes up to four arguments:
# 1) the name of the application to send to.
# 2) a command prefix.
# 3) the name of another application to notify
# after the end of the data.
# 4) the command to use in the notification.

# Hide the unneeded window
wm withdraw .
# Process command line arguments
if {$argc == 0} {
	puts stderr "Usage: send name ?cmd? ?uiName? ?uiCmd?"
	exit 1
} else {
	set app [lindex $argv 0]
}
if {$argc > 1} {
	set cmd [lindex $argv 1]
} else {
	set cmd Send_Insert
}
if {$argc > 2} {
	set ui [lindex $argv 2]
	set uiCmd Send_Done
}
if {$argc > 3} {
	set uiCmd [lindex $argv 3]
}
# Read input and send it to the logger
while {[gets stdin input] >= 0} {
	# Ignore errors with the logger
	catch {send $app [concat $cmd [list $input\n]]}
}
# Notify the controller, if any
if [info exists ui] {
	if [catch {send $ui $uiCmd} msg] {
		puts stderr "send.tcl could not notify $ui\n$msg"
	}
}
# This is necessary to force wish to exit.
exit



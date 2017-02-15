#
# Example 39-3
# A feedback procedure.
#

proc Feedback { message } {
	global feedback
	set e $feedback(entry)
	$e config -state normal
	$e delete 0 end
	$e insert 0 $message
	# Leave the entry in a read-only state
	$e config -state disabled
	# Force a display update
	update idletasks
}



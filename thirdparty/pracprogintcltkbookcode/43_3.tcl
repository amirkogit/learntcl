#
# Example 43-3
# Making the shell into an eval server.
#

# Add this to the shell application shown
# in Example 23-4 on page 359
if {$argc > 0} {
	# Send our application name to the browser
	send [lindex $argv 0] \
		[list set browse(evalInterp) [tk appname]]
}



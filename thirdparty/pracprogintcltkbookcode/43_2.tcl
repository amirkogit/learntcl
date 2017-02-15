#
# Example 43-2
# Hooking the browser to an eval server.
#

# Replace the Run and Reset procedures of the browser in
# Example 23-3 on page 354 with these procedures

# Start up the evalsrv.tcl script.
proc StartEvalServer {} {
	global browse
	# Start the shell and pass it our name.
	exec evalsrv.tcl [tk appname] &
	# Wait for evalsrv.tcl to send us its name
	tkwait variable browse(evalInterp)
}
proc Run {} {
	global browse
	set apps [winfo interps]
	set ix [lsearch -glob $apps evalsrv.tcl*]
	if {$ix < 0} {
		# No evalsrv.tcl application running
		StartEvalServer
	}
	if {![info exists browse(evalInterp)]} {
		# Hook up to already running eval server
		set browse(evalInterp) [lindex $apps $ix]
	}
	if [catch {send $browse(evalInterp) {info vars}} err] {
		# It probably died - restart it.
		StartEvalServer
	}
	# Send the command asynchronously. The two
	# list commands foil the concat done by send and
	# the uplevel in EvalEcho
	send -async $browse(evalInterp) \
		[list EvalEcho [list source $browse(current)]]
}
# Reset the shell interpreter in the eval server
proc Reset {} {
	global browse
	send $browse(evalInterp) {EvalEcho reset}
}



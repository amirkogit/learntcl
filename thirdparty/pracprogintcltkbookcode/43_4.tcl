#
# Example 43-4
# Remote eval using sockets.
#

proc Eval_Server {port {interp {}} {openCmd EvalOpenProc}} {
	socket -server [list EvalAccept $interp $openCmd] $port
}
proc EvalAccept {interp openCmd newsock addr port} {
	global eval
	set eval(cmdbuf,$newsock) {}
	fileevent $newsock readable [list EvalRead $newsock $interp]
	if [catch {
		interp eval $interp $openCmd $newsock $addr $port
	}] {
		close $newsock
	}
}
proc EvalOpenProc {sock addr port} {
	# do authentication here
	# close $sock to deny the connection
}



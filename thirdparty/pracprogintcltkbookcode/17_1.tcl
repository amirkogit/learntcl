#
# Example 17-1
# Opening a client socket with a timeout.
#

proc Socket_Client {host port timeout} {
	global connected
	after $timeout {set connected timeout}
	set sock [socket -async $host $port]
	fileevent $sock w {set connected ok}
	vwait connected
	fileevent $sock w {}
	if {$connected == "timeout"} {
		return -code error timeout
	} else {
		return $sock
	}
}



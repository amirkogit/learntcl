#
# Example 17-4
# A client of the echo service.
#

proc Echo_Client {host port} {
	set s [socket $host $port]
	fconfigure $s -buffering line
	return $s
}
set s [Echo_Client localhost 2540]
puts $s "Hello!"
gets $s
#=> Hello!



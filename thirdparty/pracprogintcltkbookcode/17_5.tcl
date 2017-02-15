#
# Example 17-5
# Opening a connection to an HTTP server.
#

proc Http_Open {url} {
	global http
	if {![regexp -nocase {^(http://)?([^:/]+)(:([0-9]+))?(/.*)} \
			$url x protocol server y port path]} {		error "bogus URL: $url"
	}
	if {[string length $port] == 0} {
		set port 80
	}
	set sock [socket $server $port]
	puts $sock "GET $path HTTP/1.0"
	puts $sock "Host: $server"
	puts $sock "User-Agent: Tcl/Tk Http_Open"
	puts $sock ""
	flush $sock
	return $sock
}



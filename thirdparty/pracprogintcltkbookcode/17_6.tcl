#
# Example 17-6
# Opening a connection to an HTTP server.
#

# Http_Proxy sets or queries the proxy
proc Http_Proxy {{new {}}} {
	global http
	if ![info exists http(proxy)] {
		return {}
	}
	if {[string length $new] == 0} {
		return $http(proxy):$http(proxyPort)
	} else {
		regexp {^([^:]+):([0-9]+)$} $new x \
			http(proxy) http(proxyPort)
	}
}

proc Http_Open {url {cmd GET} {query {}}} {
	global http
	if {![regexp -nocase {^(http://)?([^:/]+)(:([0-9]+))?(/.*)} \
			$url x protocol server y port path]} {		error "bogus URL: $url"
	}
	if {[string length $port] == 0} {
		set port 80
	}
	if {[info exists http(proxy)] &&
			[string length $http(proxy)]} {
		set sock [socket $http(proxy) $http(proxyPort)]
		puts $sock "$cmd http://$server:$port$path HTTP/1.0"
	} else {
		set sock [socket $server $port]
		puts $sock "$cmd $path HTTP/1.0"
	}
	puts $sock "User-Agent: Tcl/Tk Http_Open"
	puts $sock "Host: $server"
	if {[string length $query] > 0} {
		puts $sock "Content-Length: [string length $query]"
		puts $sock ""
		puts $sock $query
	}
	puts $sock ""
	flush $sock
	fconfigure $sock -blocking 0
	return $sock
}



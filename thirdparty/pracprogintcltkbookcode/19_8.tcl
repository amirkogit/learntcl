#
# Example 19-8
# The Safesock security policy.
#

# The index is a host name, and the
# value is a list of port specifications, which can be
# an exact port number
# a lower bound on port number: N-
# a range of port numbers, inclusive: N-M
array set safesock {
	sage.eng				3000-4000
	www.sun.com				80
	webcache.eng				{80 8080}
	bisque.eng				{80 1025-}
}
proc Safesock_PolicyInit {slave} {
	interp alias $slave socket {} SafesockAlias $slave
}
proc SafesockAlias {slave host port} {
	global safesock
	if ![info exists safesock($host)] {
		error "unknown host: $host"
	}

	foreach portspec $safesock($host) {
		set low [set high ""]
		if {[regexp {^([0-9]+)-([0-9]*)$} $portspec x low high]} {
			if {($low <= $port && $high == "") ||
					($low <= $port && $high >= $port)} {
				set good $port
				break
			}
		} elseif {$port == $portspec} {
			set good $port
		}
	}

	if [info exists good] {
		set sock [interp invokehidden $slave socket $host $good]
		interp invokehidden $slave fconfigure $sock \
			-blocking 0
		return $sock
	}
	error "bad port: $port"
}



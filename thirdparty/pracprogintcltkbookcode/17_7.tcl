#
# Example 17-7
# Http_Head validates a URL.
#

proc Http_Head {url} {
	upvar #0 $url state
	catch {unset state}
	set state(sock) [Http_Open $url HEAD]
	fileevent $state(sock) readable [list HttpHeader $url]
	# Specify the real name, not the upvar alias, to vwait
	vwait $url\(status)
	catch {close $state(sock)}
	return $state(status)
}
proc HttpHeader {url} {
	upvar #0 $url state
	if {[eof $state(sock)]} {
		set state(status) eof
		close $state(sock)
		return
	}
	if {[catch {gets $state(sock) line} nbytes]} {
		set state(status) error
		lappend state(headers) [list error $nbytes]
		close $state(sock)
		return
	}
	if {$nbytes < 0} {
		# Read would block
		return
	} elseif {$nbytes == 0} {
		# Header complete
		set state(status) head
	} elseif {![info exists state(headers)]} {
		# Initial status reply from the server
		set state(headers) [list http $line]
	} else {
		# Process key-value pairs
		regexp {^([^:]+): *(.*)$} $line x key value
		lappend state(headers) [string tolower $key] $value
	}
}



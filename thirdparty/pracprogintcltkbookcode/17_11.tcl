#
# Example 17-11
# HttpCopyDone is used with fcopy.
#

proc HttpCopyDone {url bytes {error {}}} {
	upvar #0 $url state
	if {[string length $error]} {
		set state(status) error
		lappend state(headers) [list error $error]
	} else {
		set state(status) ok
	}
	close $state(sock)
	close $state(fd)
}



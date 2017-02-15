#
# Example 17-10
# HttpGetText reads text URLs.
#

proc HttpGetText {url} {
	upvar #0 $url state
	if {[eof $state(sock)]} {
		# Content complete
		set state(status) done
		close $state(sock)
	} elseif {[catch {read $state(sock)} block]} {
		set state(status) error
		lappend state(headers) [list error $block]
		close $state(sock)
	} else {
		append state(body) $block
	}
}



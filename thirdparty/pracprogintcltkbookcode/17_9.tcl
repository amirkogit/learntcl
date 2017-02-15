#
# Example 17-9
# Http_Get fetches the contents of a URL.
#

proc Http_Get {url {query {}}} {
	upvar #0 $url state								;# Alias to global array
	catch {unset state}								;# Aliases still valid.
	if {[string length $query] > 0} {
		set state(sock) [Http_Open $url POST $query]
	} else {
		set state(sock) [Http_Open $url GET]
	}
	set sock $state(sock)
	fileevent $sock readable [list HttpHeader $url]

	# Specify the real name, not the upvar alias, to vwait
	vwait $url\(status)
	set header(content-type) {}
	set header(http) "500 unknown error"
	array set header $state(headers)

	# Check return status.
	# 200 is OK, other codes indicate a problem.
	regsub "HTTP/1.. " $header(http) {} header(http)
	if {![string match 2* $header(http)]} {
		catch {close $sock}
		if {[info exists header(location)] &&
				[string match 3* $header(http)]} {
			# 3xx is a redirection to another URL
			set state(link) $header(location)
			return [Http_Get $header(location) $query]
		}
		return -code error $header(http)
	}
	# Set up to read the content data
	switch -glob -- $header(content-type) {
		text/*			{
			# Read HTML into memory
			fileevent $sock readable [list HttpGetText $url]
		}
		default			{
			# Copy content data to a file
			fconfigure $sock -translation binary
			set state(filename) [File_TempName http]
			if [catch {open $state(filename) w} out] {
				set state(status) error
				set state(error) $out
				close $sock
				return $header(content-type)
			}
			set state(fd) $out
			fcopy $sock $out -command [list HttpCopyDone $url]
		}
	}
	vwait $url\(status)
	return $header(content-type)
}



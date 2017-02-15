#
# Example 17-12
# Downloading files with http::geturl.
#

#!/usr/local/bin/tclsh8.4
if {$argc < 2} {
	puts stderr "Usage: $argv0 url file"
	exit 1
}
package require http
set url [lindex $argv 0]
set file [lindex $argv 1]
set out [open $file w]
proc progress {token total current} {
	puts -nonewline "."
}
http::config -proxyhost webcache.eng -proxyport 8080
set token [http::geturl $url -progress progress \
	-headers {Pragma no-cache} -channel $out]
close $out
# Print out the return header information
puts ""
upvar #0 $token state
puts $state(http)
foreach {key value} $state(meta) {
	puts "$key: $value"
}
exit 0



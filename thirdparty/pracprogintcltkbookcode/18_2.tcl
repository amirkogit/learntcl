#
# Example 18-2
# A simple URL domain.
#

Url_PrefixInstall /simple [list SimpleDomain /simple]

proc SimpleDomain {prefix sock suffix} {
	upvar #0 Httpd$sock data

	# Generate page header

	set html "<title>A simple page</title>\n"
	append html "<h1>$prefix$suffix</h1>\n"
	append html "<h1>Date and Time</h1>\n"
	append html [clock format [clock seconds]]

	# Display connection state

	append html "<h1>Connection State</h1>"
	append html [html::tableFromArray data border=1]

	# Display query data

	if {[info exist data(query)]} {
		append html "<h1>Query Data</h1>\n"
		append html [html::tableFromList [ncgi::nvlist] border=1]
	}
	Httpd_ReturnData $sock text/html $html
}



#
# Example 11-1
# Expanded regular expressions allow comments.
#

regexp {(?x) 						# A pattern to match URLS
		([^:]+):				# The protocol before the initial colon
		//([^:/]+)				# The server name
		(:([0-9]+))?				# The optional port number
		(/.*)				# The trailing pathname
} $input



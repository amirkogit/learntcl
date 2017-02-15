#
# Example 11-3
# A pattern to match URLs.
#

set url http://www.beedub.com:80/index.html
regexp {([^:]+)://([^:/]+)(:([0-9]+))?(/.*)} $url \
	match protocol server x port path
#=> 1
set match
#=> http://www.beedub.com:80/index.html
set protocol
#=> http
set server
#=> www.beedub.com
set x
#=> :80
set port
#=> 80
set path
#=> /index.html



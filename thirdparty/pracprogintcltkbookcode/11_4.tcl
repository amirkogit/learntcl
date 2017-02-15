#
# Example 11-4
# An advanced regular expression to match URLs.
#

set url http://www.beedub.com:80/book/
regexp {(.+?)://(.+?)(?::([0-9]+))?(/.*)$} $url \
	match protocol server port path
#=> 1
set match
#=> http://www.beedub.com:80/book/
set protocol
#=> http
set server
#=> www.beedub.com
set port
#=> 80
set path
#=> /book/



#
# Example 17-8
# Using Http_Head.
#

set url http://www.sun.com/
set status [Http_Head $url]
#=> eof
upvar #0 $url state
array set info $state(headers)
parray info
info(http)						HTTP/1.0 200 OK
info(server)						Apache/1.1.1
info(last-modified)						Nov ...
info(content-type)						text/html



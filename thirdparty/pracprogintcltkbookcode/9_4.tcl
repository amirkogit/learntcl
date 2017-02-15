#
# Example 9-4
# Opening a file for writing.
#

set fileId [open /tmp/foo w 0600]
puts $fileId "Hello, foo!"
close $fileId



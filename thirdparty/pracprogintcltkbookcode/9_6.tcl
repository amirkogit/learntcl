#
# Example 9-6
# Opening a process pipeline.
#

set input [open "|sort /etc/passwd" r]
set contents [split [read $input] \n]
close $input



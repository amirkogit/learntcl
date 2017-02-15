#
# Example 23-1
# "Hello, World!" Tk program.
#

#!/usr/local/bin/wish
button .hello -text Hello \
	-command {puts stdout "Hello, World!"}
pack .hello -padx 20 -pady 10



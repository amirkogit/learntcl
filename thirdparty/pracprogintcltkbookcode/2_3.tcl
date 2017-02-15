#
# Example 2-3
# Using /bin/sh to run a Tcl script.
#

#!/bin/sh
# The backslash makes the next line a comment in Tcl \
exec /some/very/long/path/to/wish "$0" ${1+"$@"}
#	... Tcl script goes here ...



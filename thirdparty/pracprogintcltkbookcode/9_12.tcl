#
# Example 9-12
# Printing environment variable values.
#

proc printenv { args } {
	global env
	set maxl 0
	if {[llength $args] == 0} {
		set args [lsort [array names env]]
	}
	foreach x $args {
		if {[string length $x] > $maxl} {
			set maxl [string length $x]
		}
	}
	incr maxl 2
	foreach x $args {
		puts stdout [format "%*s = %s" $maxl $x $env($x)]
	}
}
printenv USER SHELL TERM
#=>
USER		= welch
SHELL		= /bin/csh
TERM		= tx



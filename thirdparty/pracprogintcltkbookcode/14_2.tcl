#
# Example 14-2
# Random number generator using qualified names.
#

namespace eval random {
	# Create a variable inside the namespace
	variable seed [clock seconds]
}
# Create procedures inside the namespace
proc random::init { seed } {
	set ::random::seed $seed
}
proc random::random {} {
	variable seed
	set seed [expr {($seed*9301 + 49297) % 233280}]
	return [expr {$seed/double(233280)}]
}
proc random::range { range } {
	expr {int([random]*$range)}
}



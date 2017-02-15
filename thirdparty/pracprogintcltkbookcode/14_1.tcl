#
# Example 14-1
# Random number generator using namespaces.
#

package provide random 1.0

namespace eval random {
	# Create a variable inside the namespace
	variable seed [clock seconds]

	# Make the procedures visible to namespace import
	namespace export init random range

	# Create procedures inside the namespace
	proc init { value } {
		variable seed
		set seed $value
	}
	proc random {} {
		variable seed
		set seed [expr {($seed*9301 + 49297) % 233280}]
		return [expr {$seed/double(233280)}]
	}
	proc range { range } {
		expr {int([random]*$range)}
	}
}



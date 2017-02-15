#
# Example 14-4
# The code procedure to wrap callbacks.
#

proc code {args} {
	set namespace [uplevel {namespace current}]
	return [list namespace inscope $namespace $args]
}
namespace eval foo {
	variable y "y value" x {}
	set callback [code set x $y]
	#=> namespace inscope ::foo {set x {y value}}
}



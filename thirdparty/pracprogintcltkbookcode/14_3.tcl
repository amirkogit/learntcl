#
# Example 14-3
# Nested namespaces.
#

namespace eval foo {
	variable x 1					;# ::foo::x
}
namespace eval bar {
	variable x 2					;# ::bar::x
	namespace eval foo {
		variable x 3				;# ::bar::foo::x
	}
	puts $foo::x					;# prints 3
}
puts $foo::x						;# prints 1



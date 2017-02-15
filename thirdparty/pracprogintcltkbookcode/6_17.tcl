#
# Example 6-17
# Raising an error.
#

proc foo {} {
	error bogus
}
foo
#=> bogus
set errorInfo
#=> bogus
	while executing
"error bogus"
	(procedure "foo" line 2)
	invoked from within
"foo"



#
# Example 19-1
# Creating and deleting an interpreter.
#

interp create foo
#=> foo
interp eval foo {set a 5}
#=> 5
set sum [interp eval foo {expr {$a + $a}}]
#=> 10
interp delete foo



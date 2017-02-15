#
# Example 19-2
# Creating a hierarchy of interpreters.
#

interp create foo
#=> foo
interp eval foo {interp create bar}
#=> bar
interp create {foo bar2}
#=> foo bar2
interp slaves
#=> foo
interp slaves foo
#=> bar bar2
interp delete bar
#=> interpreter named "bar" not found
interp delete {foo bar}



#
# Example 1-15
# Using set to return a variable value.
#

set var {the value of var}
#=> the value of var
set name var
#=> var
set name
#=> var
set $name
#=> the value of var



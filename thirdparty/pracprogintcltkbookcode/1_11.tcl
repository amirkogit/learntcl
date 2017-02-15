#
# Example 1-11
# Embedded command and variable substitution.
#

set x 7; set y 9
puts stdout $x+$y=[expr $x + $y]
#=> 7+9=16



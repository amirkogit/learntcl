#
# Example 1-10
# Grouping with double quotes vs. braces.
#

set s Hello
#=> Hello
puts stdout "The length of $s is [string length $s]."
#=> The length of Hello is 5.
puts stdout {The length of $s is [string length $s].}
#=> The length of $s is [string length $s].


